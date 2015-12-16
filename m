From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:41:48 +0100
Subject: [Buildroot] [git commit] cairomm: new package
Message-ID: <20151216214259.C690D81E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a538b0231fa95a5c0e248c3051366fbbd50025
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename package from libcairomm to cairomm in order to match
   upstream name.
 - put the package next to cairo in menuconfig
 - add missing dependency on libsigc
 - add missing depends on BR2_INSTALL_LIBSTDCPP
 - fix license: it's LGPLv2+, not LGPLv2.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/cairomm/Config.in    | 21 +++++++++++++++++++++
 package/cairomm/cairomm.hash |  2 ++
 package/cairomm/cairomm.mk   | 16 ++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2e9554c..cd1c679 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -810,6 +810,7 @@ menu "Graphics"
 	source "package/atk/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
+	source "package/cairomm/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
new file mode 100644
index 0000000..4477b37
--- /dev/null
+++ b/package/cairomm/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CAIROMM
+	bool "cairomm"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The cairomm package is a set of C++ bindings for Cairo.
+
+	  http://www.gtkmm.org/
+
+comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
new file mode 100644
index 0000000..bebd474
--- /dev/null
+++ b/package/cairomm/cairomm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/cairomm/1.12/cairomm-1.12.0.sha256sum
+sha256	a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6	cairomm-1.12.0.tar.xz
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
new file mode 100644
index 0000000..7a56a68
--- /dev/null
+++ b/package/cairomm/cairomm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cairomm
+#
+################################################################################
+
+CAIROMM_VERSION_MAJOR = 1.12
+CAIROMM_VERSION = $(CAIROMM_VERSION_MAJOR).0
+CAIROMM_LICENSE = LGPLv2+
+CAIROMM_LICENSE_FILES = COPYING
+CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
+CAIROMM_SITE = http://ftp.gnome.org/pub/gnome/sources/cairomm/$(CAIROMM_VERSION_MAJOR)
+CAIROMM_INSTALL_STAGING = YES
+CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
+
+$(eval $(autotools-package))
