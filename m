From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 22:56:45 +0100
Subject: [Buildroot] [git commit] package/inih: new package
Message-ID: <20210125213804.98190815A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3daffa43f6935575d1cd26ee1c5f4f26234929b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

needed for xfsprogs >= 5.10.0:
https://www.spinics.net/lists/linux-xfs/msg47554.html

Added upstream patch to avoid dependency for c++.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: license is BSD-3-Clause, not BSD]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../inih/0001-meson-optionally-depend-on-c.patch   | 34 ++++++++++++++++++++++
 package/inih/Config.in                             |  7 +++++
 package/inih/inih.hash                             |  3 ++
 package/inih/inih.mk                               | 20 +++++++++++++
 6 files changed, 66 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4142406b02..c750105623 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -332,6 +332,7 @@ F:	package/gli/
 F:	package/glmark2/
 F:	package/gpsd/
 F:	package/hdparm/
+F:	package/inih/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
diff --git a/package/Config.in b/package/Config.in
index 8ff03635b0..06dfc32cc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1982,6 +1982,7 @@ menu "Text and terminal handling"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
+	source "package/inih/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
diff --git a/package/inih/0001-meson-optionally-depend-on-c.patch b/package/inih/0001-meson-optionally-depend-on-c.patch
new file mode 100644
index 0000000000..a039dde1db
--- /dev/null
+++ b/package/inih/0001-meson-optionally-depend-on-c.patch
@@ -0,0 +1,34 @@
+From e192e4762749cfe3bc350e0353aa82b1a849256d Mon Sep 17 00:00:00 2001
+From: bkuhls <bkuhls@users.noreply.github.com>
+Date: Sun, 10 Jan 2021 21:56:56 +0100
+Subject: [PATCH] meson: optionally depend on c++ (#124)
+
+This fix is needed to allow building with toolchains which lack c++.
+
+Downloaded from upstream commit:
+https://github.com/benhoyt/inih/commit/e192e4762749cfe3bc350e0353aa82b1a849256d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4602326..5393af4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project('inih',
+-    ['c','cpp'],
++    ['c'],
+     default_options : ['default_library=static'],
+     license : 'BSD-3-Clause',
+ )
+@@ -83,6 +83,7 @@ inih_dep = declare_dependency(
+ 
+ #### INIReader ####
+ if get_option('with_INIReader')
++    add_languages('cpp')
+     inc_INIReader = include_directories('cpp')
+ 
+     lib_INIReader = library('INIReader',
diff --git a/package/inih/Config.in b/package/inih/Config.in
new file mode 100644
index 0000000000..2c6553a8ce
--- /dev/null
+++ b/package/inih/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_INIH
+	bool "inih"
+	help
+	  inih (INI Not Invented Here) is a simple .INI file parser
+	  written in C.
+
+	  https://github.com/benhoyt/inih/
diff --git a/package/inih/inih.hash b/package/inih/inih.hash
new file mode 100644
index 0000000000..2560a91fed
--- /dev/null
+++ b/package/inih/inih.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  439cff9ce9a8afc52d08772ac3e93b3cecd79c7707f871fb4534fb3a48201880  inih-52.tar.gz
+sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
new file mode 100644
index 0000000000..ccc549b01e
--- /dev/null
+++ b/package/inih/inih.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# INIH
+#
+################################################################################
+
+INIH_VERSION = 52
+INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
+INIH_INSTALL_STAGING = YES
+INIH_LICENSE = BSD-3-Clause
+INIH_LICENSE_FILES = LICENSE.txt
+INIH_CONF_OPTS = -Ddistro_install=true
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+INIH_CONF_OPTS += -Dwith_INIReader=true
+else
+INIH_CONF_OPTS += -Dwith_INIReader=false
+endif
+
+$(eval $(meson-package))
