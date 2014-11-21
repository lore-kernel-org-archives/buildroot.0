From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 15:33:09 +0000
Subject: [Buildroot] [PATCH v2 3/4] libfm: new package
In-Reply-To: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1416583990-35169-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: nothing

 package/Config.in        |    1 +
 package/libfm/Config.in  |   27 +++++++++++++++++++++++++++
 package/libfm/libfm.hash |    2 ++
 package/libfm/libfm.mk   |   15 +++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 package/libfm/Config.in
 create mode 100644 package/libfm/libfm.hash
 create mode 100644 package/libfm/libfm.mk

diff --git a/package/Config.in b/package/Config.in
index 56b71e4..fe9cd72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -644,6 +644,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
new file mode 100644
index 0000000..51cdd4e
--- /dev/null
+++ b/package/libfm/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_LIBFM
+	bool "libfm"
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_XORG7 # libgtk2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
+	help
+	  A glib/gio-based library providing some file management utilities and
+	  related-widgets missing in gtk+/glib. This is the core of PCManFM.
+	  The library is desktop independent (not LXDE specific) and has clean
+	  API. It can be used to develop other applications requiring file
+	  management functionality. For example, you can create your own file
+	  manager with facilities provided by libfm.
+
+	  http://wiki.lxde.org/en/Libfm
+
+comment "libfm needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..b498a5d
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
+LIBFM_LICENSE = GPLv2
+LIBFM_LICENSE_FILES = COPYING
+LIBFM_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.1
