From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:06:03 +0100
Subject: [Buildroot] [git commit] atkmm: new package
Message-ID: <20151216220708.02FA181FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6b3dc20f5e3c2baad8abcf6836dd5978f4234f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename to atkmm
 - move next to atk in menuconfig
 - add dependency to libsigc]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/atkmm/Config.in  | 20 ++++++++++++++++++++
 package/atkmm/atkmm.hash |  2 ++
 package/atkmm/atkmm.mk   | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e6ad109..a3d96cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -808,6 +808,7 @@ endmenu
 
 menu "Graphics"
 	source "package/atk/Config.in"
+	source "package/atkmm/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
new file mode 100644
index 0000000..2091eab
--- /dev/null
+++ b/package/atkmm/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ATKMM
+	bool "atkmm"
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBSIGC
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
+	depends on BR2_USE_MMU # atk/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+
+	help
+	  The atkmm package is a set of C++ bindings for Atk.
+
+	  http://www.gtkmm.org/
+
+comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
new file mode 100644
index 0000000..4b3577c
--- /dev/null
+++ b/package/atkmm/atkmm.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.sha256sum
+sha256	ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd	atkmm-2.24.2.tar.xz
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
new file mode 100644
index 0000000..2c070f2
--- /dev/null
+++ b/package/atkmm/atkmm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# atkmm
+#
+################################################################################
+
+ATKMM_VERSION_MAJOR = 2.24
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
+ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
+ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
+ATKMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+ATKMM_LICENSE_FILES = COPYING COPYING.tools
+ATKMM_INSTALL_STAGING = YES
+ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
+
+$(eval $(autotools-package))
