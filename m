From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:36:49 +0100
Subject: [Buildroot] [git commit] gtkmm3: new package
Message-ID: <20151216223708.550A4822D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95eb146b1770135698ca70873a23ac79375ef9f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rename from libgtkmm30 to gtkmm3.
 - add libsigc dependency.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/gtkmm3/Config.in   | 24 ++++++++++++++++++++++++
 package/gtkmm3/gtkmm3.hash |  2 ++
 package/gtkmm3/gtkmm3.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a3d96cf..b417793 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -821,6 +821,7 @@ menu "Graphics"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/graphite2/Config.in"
+	source "package/gtkmm3/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
new file mode 100644
index 0000000..30d3492
--- /dev/null
+++ b/package/gtkmm3/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GTKMM3
+	bool "gtkmm3"
+	select BR2_PACKAGE_ATKMM
+	select BR2_PACKAGE_CAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBSIGC
+	select BR2_PACKAGE_PANGOMM
+	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/libgtk3/libpangomm -> cairo
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
+	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
+	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	help
+	  The gtkmm3 package is a set of C++ bindings for GTK 3.
+
+	  http://www.gtkmm.org/
+
+comment "gtkmm3 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
new file mode 100644
index 0000000..49e2f76
--- /dev/null
+++ b/package/gtkmm3/gtkmm3.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.14/gtkmm-3.14.0.sha256sum
+sha256	d9f528a62c6ec226fa08287c45c7465b2dce5aae5068e9ac48d30a64a378e48b	gtkmm-3.14.0.tar.xz
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
new file mode 100644
index 0000000..034cdf9
--- /dev/null
+++ b/package/gtkmm3/gtkmm3.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# gtkmm3
+#
+################################################################################
+
+GTKMM3_VERSION_MAJOR = 3.14
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
+GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
+GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
+GTKMM3_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+GTKMM3_LICENSE_FILES = COPYING COPYING.tools
+GTKMM3_INSTALL_STAGING = YES
+GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
+
+# Explicit use of C++11 to build with newer *mm dependencies that require C++11.
+#
+# The most recent release of *mm-related libraries require C++11. This project's
+# dependencies (ex. libpangomm) are updated and enforce the C++11 standard.
+# Since the gtkmm3 must match the libgtk3 version, the useable version of
+# gtkmm3 does not have this enforcement; however, to build with the most
+# recent version of the dependencies, gtkmm3 requires to be built with
+# `-std=c++11`. The following enforces C++11 standard. When libgtk3 is updated,
+# followed by a gtkmm3 update, this flag modification can be removed.
+GTKMM3_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
