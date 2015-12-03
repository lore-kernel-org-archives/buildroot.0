From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  3 Dec 2015 16:36:44 -0500
Subject: [Buildroot] [PATCH 3/4] libatkmm: new package
In-Reply-To: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1449178605-8568-3-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in              |  1 +
 package/libatkmm/Config.in     | 19 +++++++++++++++++++
 package/libatkmm/libatkmm.hash |  2 ++
 package/libatkmm/libatkmm.mk   | 16 ++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/libatkmm/Config.in
 create mode 100644 package/libatkmm/libatkmm.hash
 create mode 100644 package/libatkmm/libatkmm.mk

diff --git a/package/Config.in b/package/Config.in
index 8e84399..0520e14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1101,6 +1101,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/libargtable2/Config.in"
+	source "package/libatkmm/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libbsd/Config.in"
 	source "package/libcap/Config.in"
diff --git a/package/libatkmm/Config.in b/package/libatkmm/Config.in
new file mode 100644
index 0000000..3e55fb7
--- /dev/null
+++ b/package/libatkmm/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBATKMM
+	bool "libatkmm"
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
+	depends on BR2_USE_MMU # atk/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+
+	help
+	  The libatkmm package is a set of C++ bindings for Atk.
+
+	  http://www.gtkmm.org/
+
+comment "libatkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libatkmm/libatkmm.hash b/package/libatkmm/libatkmm.hash
new file mode 100644
index 0000000..4b3577c
--- /dev/null
+++ b/package/libatkmm/libatkmm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.sha256sum
+sha256	ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd	atkmm-2.24.2.tar.xz
diff --git a/package/libatkmm/libatkmm.mk b/package/libatkmm/libatkmm.mk
new file mode 100644
index 0000000..26bbcb7
--- /dev/null
+++ b/package/libatkmm/libatkmm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libatkmm
+#
+################################################################################
+
+LIBATKMM_VERSION_MAJOR = 2.24
+LIBATKMM_VERSION = $(LIBATKMM_VERSION_MAJOR).2
+LIBATKMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+LIBATKMM_LICENSE_FILES = COPYING COPYING.tools
+LIBATKMM_SOURCE = atkmm-$(LIBATKMM_VERSION).tar.xz
+LIBATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(LIBATKMM_VERSION_MAJOR)
+LIBATKMM_INSTALL_STAGING = YES
+LIBATKMM_DEPENDENCIES = atk glibmm host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
