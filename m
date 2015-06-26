From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 26 Jun 2015 15:37:36 +0000
Subject: [Buildroot] [PATCH 1/1] monkey: new package
Message-ID: <db63e621-3318-439a-9bbe-6bbc26980f84@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Morgan Delestre <m.delestre@sinters.fr>

Signed-off-by: Morgan Delestre <m.delestre@sinters.fr>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/Config.in                                   |  1 +
 package/monkey/0001-Configure-accept-all-conf.patch | 13 +++++++++++++
 package/monkey/Config.in                            | 11 +++++++++++
 package/monkey/monkey.mk                            | 20 ++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/monkey/0001-Configure-accept-all-conf.patch
 create mode 100644 package/monkey/Config.in
 create mode 100644 package/monkey/monkey.mk

diff --git a/package/Config.in b/package/Config.in
index fac632f..3f5d853 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1224,6 +1224,7 @@ endif
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
+	source "package/monkey/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
diff --git a/package/monkey/0001-Configure-accept-all-conf.patch b/package/monkey/0001-Configure-accept-all-conf.patch
new file mode 100644
index 0000000..471e25b
--- /dev/null
+++ b/package/monkey/0001-Configure-accept-all-conf.patch
@@ -0,0 +1,13 @@
+Index: monkey-1.5.6/configure
+===================================================================
+--- monkey-1.5.6.orig/configure
++++ monkey-1.5.6/configure
+@@ -1204,7 +1204,7 @@ for arg in $*; do
+			;;
+		--with-libtool-sysroot*)
+			;;
+-		*)
++		--help)
+			echo "Usage: ./configure [OPTION]... [VAR=VALUE]..."
+			echo
+			echo -e $bldwht"Optional Commands:" $txtrst
diff --git a/package/monkey/Config.in b/package/monkey/Config.in
new file mode 100644
index 0000000..519fd65
--- /dev/null
+++ b/package/monkey/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MONKEY
+        bool "monkey"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+        help
+          Money Server is a fast and lightweight web server for Linux platforms.
+
+          http://monkey-project.com/
+
+comment "monkey needs an (e)glibc toolchain w/ threads, headers >= 2.6"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
new file mode 100644
index 0000000..20ce048
--- /dev/null
+++ b/package/monkey/monkey.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# monkey
+#
+#############################################################
+MONKEY_VERSION_MAJOR = 1
+MONKEY_VERSION_MINOR = 5
+MONKEY_VERSION_PATCH = 6
+MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).$(MONKEY_VERSION_MINOR).$(MONKEY_VERSION_PATCH)
+MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
+MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR).$(MONKEY_VERSION_MINOR)/
+MONKEY_INSTALL_STAGING = YES
+MONKEY_INSTALL_TARGET = YES
+
+# Monkey default memory allocator should be jemalloc
+# but monkey configure script does not handle
+# cross-compilation in a good way
+MONKEY_CONF_OPTS =--malloc-libc
+
+$(eval $(call autotools-package))
-- 
2.1.0
