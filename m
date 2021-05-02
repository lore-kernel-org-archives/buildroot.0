From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 May 2021 23:00:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix build with NLS
Message-ID: <20210502210001.2703609-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure with NLS which is raised since bump to version 0.3.26
in commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9

Fixes:
 - http://autobuild.buildroot.org/results/4ed680dc91519c02db4fbfb396d75c5f74207d9b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-meson-prefer-libintl-on-FreeBSD.patch | 46 +++++++++++++++++++
 package/pipewire/pipewire.mk                  |  2 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch

diff --git a/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch b/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch
new file mode 100644
index 0000000000..b19715b2e8
--- /dev/null
+++ b/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch
@@ -0,0 +1,46 @@
+From 4d064a37183a0bf8198914dd68b063b2c9def17e Mon Sep 17 00:00:00 2001
+From: Evgeniy Khramtsov <evgeniy@khramtsov.org>
+Date: Fri, 23 Apr 2021 22:57:51 +0300
+Subject: [PATCH] meson: prefer libintl on FreeBSD
+
+FreeBSD does not have gettext in libc.
+It is implemented in the third-party library.
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4d064a37183a0bf8198914dd68b063b2c9def17e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build              | 3 +++
+ src/pipewire/meson.build | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 99a4b2d1c..0a9963fbb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -351,6 +351,9 @@ libinotify_dep = (build_machine.system() == 'freebsd'
+     ? dependency('libinotify', required: true)
+     : dependency('', required: false))
+ 
++# On FreeBSD, libintl library is required for gettext
++libintl_dep = cc.find_library('intl', required: false)
++
+ alsa_dep = dependency('alsa', version : '>=1.1.7', required: get_option('pipewire-alsa'))
+ 
+ installed_tests_metadir = pipewire_datadir / 'installed-tests' / pipewire_name
+diff --git a/src/pipewire/meson.build b/src/pipewire/meson.build
+index 7f2d42a7a..d4c271373 100644
+--- a/src/pipewire/meson.build
++++ b/src/pipewire/meson.build
+@@ -101,7 +101,7 @@ libpipewire = shared_library(pipewire_name, pipewire_sources,
+   c_args : libpipewire_c_args,
+   include_directories : [pipewire_inc, configinc, spa_inc],
+   install : true,
+-  dependencies : [dl_lib, mathlib, pthread_lib, ],
++  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, ],
+ )
+ 
+ pipewire_dep = declare_dependency(link_with : libpipewire,
+-- 
+GitLab
+
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 23bfcdb9ec..e5185aeb8c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -9,7 +9,7 @@ PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
 PIPEWIRE_LICENSE = MIT
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
-PIPEWIRE_DEPENDENCIES = host-pkgconf dbus
+PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
-- 
2.30.2
