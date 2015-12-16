From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:57:43 +0100
Subject: [Buildroot] [git commit] pangomm: new package
Message-ID: <20151216215822.B514F8220E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ccc5e94338671b7da88c10d7a3ab0251e530197
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename to pangomm.
 - move next to pango in menuconfig.
 - add dependency to libsigc.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/pangomm/Config.in    | 22 ++++++++++++++++++++++
 package/pangomm/pangomm.hash |  2 ++
 package/pangomm/pangomm.mk   | 16 ++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cd1c679..e6ad109 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -862,6 +862,7 @@ menu "Graphics"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
+	source "package/pangomm/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
new file mode 100644
index 0000000..241aa9f
--- /dev/null
+++ b/package/pangomm/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PANGOMM
+	bool "pangomm"
+	select BR2_PACKAGE_CAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBSIGC
+	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/pango -> cairo
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
+	depends on BR2_USE_MMU # *mm/pango -> libglib2
+	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	help
+	  The pangomm package is a set of C++ bindings for Pango.
+
+	  http://www.gtkmm.org/
+
+comment "libpangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
new file mode 100644
index 0000000..39e6a91
--- /dev/null
+++ b/package/pangomm/pangomm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.39/pangomm-2.39.1.sha256sum
+sha256	10c06bbf12a03963ffe9c697887b57c72f1dac1671d09dba45cecd25db5dc6ed	pangomm-2.39.1.tar.xz
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
new file mode 100644
index 0000000..42aa99e
--- /dev/null
+++ b/package/pangomm/pangomm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# pangomm
+#
+################################################################################
+
+PANGOMM_VERSION_MAJOR = 2.39
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
+PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
+PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
+PANGOMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+PANGOMM_LICENSE_FILES = COPYING COPYING.tools
+PANGOMM_INSTALL_STAGING = YES
+PANGOMM_DEPENDENCIES = glibmm cairomm libsigc pango host-pkgconf
+
+$(eval $(autotools-package))
