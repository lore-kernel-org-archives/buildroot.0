From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:40 -0000
Subject: [Buildroot] [git commit branch/next] libfm: new package
Message-ID: <20150808105629.804897FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b43e91af36a137940b0ebff62c2d2f54c14103e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - switch from 'select BR2_PACKAGE_XORG7' to 'depends on
    BR2_PACKAGE_XORG7' as suggested by Yann E. Morin.
  - add LGPLv2.1+ in the list of licenses as well as a corresponding
    license file, as suggested by Yann E. Morin.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libfm/Config.in  |   28 ++++++++++++++++++++++++++++
 package/libfm/libfm.hash |    2 ++
 package/libfm/libfm.mk   |   15 +++++++++++++++
 4 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8a204b4..ffa0aec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -786,6 +786,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
new file mode 100644
index 0000000..c6cfcf6
--- /dev/null
+++ b/package/libfm/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_LIBFM
+	bool "libfm"
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_CAIRO
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
+	help
+	  A glib/gio-based library providing some file management
+	  utilities and related-widgets missing in gtk+/glib. This is
+	  the core of PCManFM.  The library is desktop independent
+	  (not LXDE specific) and has clean API. It can be used to
+	  develop other applications requiring file management
+	  functionality. For example, you can create your own file
+	  manager with facilities provided by libfm.
+
+	  http://wiki.lxde.org/en/Libfm
+
+comment "libfm needs X.org and a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
new file mode 100644
index 0000000..5311dec
--- /dev/null
+++ b/package/libfm/libfm.hash
@@ -0,0 +1,2 @@
+# From http://blog.lxde.org/?p=1280
+sha1  c3f2f34086761d89d6aba549883610084ba00750  libfm-1.2.3.tar.xz
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
new file mode 100644
index 0000000..f0888b7
--- /dev/null
+++ b/package/libfm/libfm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libfm
+#
+################################################################################
+
+LIBFM_VERSION = 1.2.3
+LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
+LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
+LIBFM_DEPENDENCIES = menu-cache libgtk2 libglib2 cairo
+LIBFM_LICENSE = GPLv2+, LGPLv2.1+
+LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
+LIBFM_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
