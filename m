From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  3 Dec 2015 16:36:42 -0500
Subject: [Buildroot] [PATCH 1/4] libcairomm: new package
Message-ID: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in                  |  1 +
 package/libcairomm/Config.in       | 19 +++++++++++++++++++
 package/libcairomm/libcairomm.hash |  2 ++
 package/libcairomm/libcairomm.mk   | 16 ++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/libcairomm/Config.in
 create mode 100644 package/libcairomm/libcairomm.hash
 create mode 100644 package/libcairomm/libcairomm.mk

diff --git a/package/Config.in b/package/Config.in
index 2bdad01..d4d430c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1105,6 +1105,7 @@ menu "Other"
 	source "package/libbsd/Config.in"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
+	source "package/libcairomm/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcrossguid/Config.in"
diff --git a/package/libcairomm/Config.in b/package/libcairomm/Config.in
new file mode 100644
index 0000000..bdd027a
--- /dev/null
+++ b/package/libcairomm/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBCAIROMM
+	bool "libcairomm"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  The libcairomm package is a set of C++ bindings for Cairo.
+
+	  http://www.gtkmm.org/
+
+comment "libcairomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcairomm/libcairomm.hash b/package/libcairomm/libcairomm.hash
new file mode 100644
index 0000000..bebd474
--- /dev/null
+++ b/package/libcairomm/libcairomm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/cairomm/1.12/cairomm-1.12.0.sha256sum
+sha256	a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6	cairomm-1.12.0.tar.xz
diff --git a/package/libcairomm/libcairomm.mk b/package/libcairomm/libcairomm.mk
new file mode 100644
index 0000000..08b5cd4
--- /dev/null
+++ b/package/libcairomm/libcairomm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libcairomm
+#
+################################################################################
+
+LIBCAIROMM_VERSION_MAJOR = 1.12
+LIBCAIROMM_VERSION = $(LIBCAIROMM_VERSION_MAJOR).0
+LIBCAIROMM_LICENSE = LGPLv2
+LIBCAIROMM_LICENSE_FILES = COPYING
+LIBCAIROMM_SOURCE = cairomm-$(LIBCAIROMM_VERSION).tar.xz
+LIBCAIROMM_SITE = http://ftp.gnome.org/pub/gnome/sources/cairomm/$(LIBCAIROMM_VERSION_MAJOR)
+LIBCAIROMM_INSTALL_STAGING = YES
+LIBCAIROMM_DEPENDENCIES = cairo libglib2 host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
