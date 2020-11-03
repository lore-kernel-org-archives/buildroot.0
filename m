From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Nov 2020 21:57:44 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/util-linux: select BR2_PACKAGE_UTIL_LINUX_LIBS
Message-ID: <20201103205745.123950-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When util-linux is enabled, select BR2_PACKAGE_UTIL_LINUX_LIBS as
suggested by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20201101121536.1089498-1-fontaine.fabrice at gmail.com/

As a result, drop BR2_PACKAGE_UTIL_LINUX_LIBS workaround from libglib2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop eudev and systemd updates
 - Make BR2_PACKAGE_UTIL_LINUX_LIBS a visible option

 package/libglib2/libglib2.mk |  4 ----
 package/util-linux/Config.in | 10 +++++++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6e9dbd7b26..43fcb27fae 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -86,12 +86,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
 LIBGLIB2_DEPENDENCIES += util-linux-libs
 else
-LIBGLIB2_DEPENDENCIES += util-linux
-endif
-else
 LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
 
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1f33eb5514..252de5c91b 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	help
 	  Various useful/essential linux libraries and utilities.
 
@@ -7,10 +8,13 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 
 	  http://www.kernel.org/pub/linux/utils/util-linux/
 
-if BR2_PACKAGE_UTIL_LINUX
-
 config BR2_PACKAGE_UTIL_LINUX_LIBS
-	bool
+	bool "util-linux-libs"
+	help
+	  Only the libraries provided by util-linux; if you need the
+	  tools too, select util-linux.
+
+if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "libblkid"
-- 
2.28.0
