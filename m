From: H Hartley Sweeten <hsweeten@visionengravers.com>
Date: Fri, 10 Jan 2014 09:35:38 -0700
Subject: [Buildroot] [PATCH 1/2] package: add libsigc++ 1.2 package
Message-ID: <1389371739-4632-1-git-send-email-hsweeten@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the older version of the libsigc++ library.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
---
 package/Config.in            |  1 +
 package/libsigc/Config.in    |  2 +-
 package/libsigc1/Config.in   | 13 +++++++++++++
 package/libsigc1/libsigc1.mk | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/libsigc1/Config.in
 create mode 100644 package/libsigc1/libsigc1.mk

diff --git a/package/Config.in b/package/Config.in
index 8af6a1e..f904a56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ source "package/libpfm4/Config.in"
 source "package/libpthsem/Config.in"
 source "package/libseccomp/Config.in"
 source "package/libsigc/Config.in"
+source "package/libsigc1/Config.in"
 source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index ae984c8..1accbdb 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
+	bool "libsigc++ 2.x.x"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
diff --git a/package/libsigc1/Config.in b/package/libsigc1/Config.in
new file mode 100644
index 0000000..0d81071
--- /dev/null
+++ b/package/libsigc1/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBSIGC1
+	bool "libsigc++ 1.x.x"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libsigc++ implements a typesafe callback system for standard C++.
+	  It allows you to define signals and to connect those signals to
+	  any callback function, either global or a member function,
+	  regardless of whether it is static or virtual.
+
+	  http://libsigc.sourceforge.net/
+
+comment "libsigc++ needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsigc1/libsigc1.mk b/package/libsigc1/libsigc1.mk
new file mode 100644
index 0000000..86a7940
--- /dev/null
+++ b/package/libsigc1/libsigc1.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libsigc1
+#
+################################################################################
+
+LIBSIGC1_VERSION_MAJOR = 1.2
+LIBSIGC1_VERSION = $(LIBSIGC1_VERSION_MAJOR).7
+LIBSIGC1_SOURCE = libsigc++-$(LIBSIGC1_VERSION).tar.gz
+LIBSIGC1_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC1_VERSION_MAJOR)
+LIBSIGC1_DEPENDENCIES = host-m4
+LIBSIGC1_INSTALL_STAGING = YES
+LIBSIGC1_LICENSE = LGPLv2.1+
+LIBSIGC1_LICENSE_FILES = COPYING
+
+define LIBSIGC1_INSTALL_TARGET_FIXUP
+	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*
+endef
+
+LIBSIGC1_POST_INSTALL_TARGET_HOOKS += LIBSIGC1_INSTALL_TARGET_FIXUP
+
+$(eval $(autotools-package))
-- 
1.8.5.2
