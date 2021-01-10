From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2021 22:24:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/inih: new package
Message-ID: <20210110212451.136365-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

needed for xfsprogs >= 5.10.0:
https://www.spinics.net/lists/linux-xfs/msg47554.html

Added upstream patch to avoid dependency for c++.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-meson-optionally-depend-on-c.patch   | 34 +++++++++++++++++++
 package/inih/Config.in                        |  7 ++++
 package/inih/inih.hash                        |  3 ++
 package/inih/inih.mk                          | 20 +++++++++++
 6 files changed, 66 insertions(+)
 create mode 100644 package/inih/0001-meson-optionally-depend-on-c.patch
 create mode 100644 package/inih/Config.in
 create mode 100644 package/inih/inih.hash
 create mode 100644 package/inih/inih.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05b509c9c4..757294b351 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -329,6 +329,7 @@ F:	package/gli/
 F:	package/glmark2/
 F:	package/gpsd/
 F:	package/hdparm/
+F:	package/inih/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
diff --git a/package/Config.in b/package/Config.in
index 07e923bde1..56f0b118e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1979,6 +1979,7 @@ menu "Text and terminal handling"
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
index 0000000000..4b1616a684
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
+INIH_LICENSE = BSD
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
-- 
2.29.2
