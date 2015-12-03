From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  3 Dec 2015 16:36:45 -0500
Subject: [Buildroot] [PATCH 4/4] libgtkmm30: new package
In-Reply-To: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1449178605-8568-4-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in                  |  1 +
 package/libgtkmm30/Config.in       | 23 +++++++++++++++++++++++
 package/libgtkmm30/libgtkmm30.hash |  2 ++
 package/libgtkmm30/libgtkmm30.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/libgtkmm30/Config.in
 create mode 100644 package/libgtkmm30/libgtkmm30.hash
 create mode 100644 package/libgtkmm30/libgtkmm30.mk

diff --git a/package/Config.in b/package/Config.in
index 0520e14..6a060e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1117,6 +1117,7 @@ menu "Other"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
 	source "package/libglib2/Config.in"
+	source "package/libgtkmm30/Config.in"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
diff --git a/package/libgtkmm30/Config.in b/package/libgtkmm30/Config.in
new file mode 100644
index 0000000..5f95447
--- /dev/null
+++ b/package/libgtkmm30/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBGTKMM30
+	bool "libgtkmm30"
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBATKMM
+	select BR2_PACKAGE_LIBCAIROMM
+	select BR2_PACKAGE_LIBPANGOMM
+	select BR2_PACKAGE_LIBGTK3
+	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/libgtk3/libpangomm -> cairo
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
+	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
+	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	help
+	  The libgtkmm30 package is a set of C++ bindings for GTK 3.
+
+	  http://www.gtkmm.org/
+
+comment "libgtkmm30 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtkmm30/libgtkmm30.hash b/package/libgtkmm30/libgtkmm30.hash
new file mode 100644
index 0000000..49e2f76
--- /dev/null
+++ b/package/libgtkmm30/libgtkmm30.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.14/gtkmm-3.14.0.sha256sum
+sha256	d9f528a62c6ec226fa08287c45c7465b2dce5aae5068e9ac48d30a64a378e48b	gtkmm-3.14.0.tar.xz
diff --git a/package/libgtkmm30/libgtkmm30.mk b/package/libgtkmm30/libgtkmm30.mk
new file mode 100644
index 0000000..1cd184d
--- /dev/null
+++ b/package/libgtkmm30/libgtkmm30.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libgtkmm30
+#
+################################################################################
+
+LIBGTKMM30_VERSION_MAJOR = 3.14
+LIBGTKMM30_VERSION = $(LIBGTKMM30_VERSION_MAJOR).0
+LIBGTKMM30_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+LIBGTKMM30_LICENSE_FILES = COPYING COPYING.tools
+LIBGTKMM30_SOURCE = gtkmm-$(LIBGTKMM30_VERSION).tar.xz
+LIBGTKMM30_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(LIBGTKMM30_VERSION_MAJOR)
+LIBGTKMM30_INSTALL_STAGING = YES
+LIBGTKMM30_DEPENDENCIES = glibmm libatkmm libcairomm libgtk3 libpangomm host-pkgconf
+
+# Explicit use of C++11 to build with newer *mm dependencies that require C++11.
+#
+# The most recent release of *mm-related libraries require C++11. This project's
+# dependencies (ex. libpangomm) are updated and enforce the C++11 standard.
+# Since the libgtkmm30 must match the libgtk3 version, the useable version of
+# libgtkmm30 does not have this enforcement; however, to build with the most
+# recent version of the dependencies, libgtkmm30 requires to be built with
+# `-std=c++11`. The following enforces C++11 standard. When libgtk3 is updated,
+# followed by a libgtkmm30 update, this flag modification can be removed.
+LIBGTKMM30_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
