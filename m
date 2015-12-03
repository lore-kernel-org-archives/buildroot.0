From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  3 Dec 2015 16:36:43 -0500
Subject: [Buildroot] [PATCH 2/4] libpangomm: new package
In-Reply-To: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1449178605-8568-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in                  |  1 +
 package/libpangomm/Config.in       | 21 +++++++++++++++++++++
 package/libpangomm/libpangomm.hash |  2 ++
 package/libpangomm/libpangomm.mk   | 16 ++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/libpangomm/Config.in
 create mode 100644 package/libpangomm/libpangomm.hash
 create mode 100644 package/libpangomm/libpangomm.mk

diff --git a/package/Config.in b/package/Config.in
index d4d430c..8e84399 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1119,6 +1119,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libpangomm/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpangomm/Config.in b/package/libpangomm/Config.in
new file mode 100644
index 0000000..e595549
--- /dev/null
+++ b/package/libpangomm/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBPANGOMM
+	bool "libpangomm"
+	select BR2_PACKAGE_LIBCAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_PANGO
+	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/pango -> cairo
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
+	depends on BR2_USE_MMU # *mm/pango -> libglib2
+	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	help
+	  The libpangomm package is a set of C++ bindings for Pango.
+
+	  http://www.gtkmm.org/
+
+comment "libpangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpangomm/libpangomm.hash b/package/libpangomm/libpangomm.hash
new file mode 100644
index 0000000..39e6a91
--- /dev/null
+++ b/package/libpangomm/libpangomm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.39/pangomm-2.39.1.sha256sum
+sha256	10c06bbf12a03963ffe9c697887b57c72f1dac1671d09dba45cecd25db5dc6ed	pangomm-2.39.1.tar.xz
diff --git a/package/libpangomm/libpangomm.mk b/package/libpangomm/libpangomm.mk
new file mode 100644
index 0000000..d3743c1
--- /dev/null
+++ b/package/libpangomm/libpangomm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libpangomm
+#
+################################################################################
+
+LIBPANGOMM_VERSION_MAJOR = 2.39
+LIBPANGOMM_VERSION = $(LIBPANGOMM_VERSION_MAJOR).1
+LIBPANGOMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+LIBPANGOMM_LICENSE_FILES = COPYING COPYING.tools
+LIBPANGOMM_SOURCE = pangomm-$(LIBPANGOMM_VERSION).tar.xz
+LIBPANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(LIBPANGOMM_VERSION_MAJOR)
+LIBPANGOMM_INSTALL_STAGING = YES
+LIBPANGOMM_DEPENDENCIES = glibmm libcairomm pango host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
