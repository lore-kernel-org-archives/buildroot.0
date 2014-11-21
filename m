From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 15:33:10 +0000
Subject: [Buildroot] [PATCH v2 4/4] pcmanfm: bump version to 1.2.3
In-Reply-To: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1416583990-35169-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.2.3
- Remove unnecessary patch
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: nothing

 package/pcmanfm/Config.in                         |   32 +++++++++++---------
 package/pcmanfm/pcmanfm-link-against-libx11.patch |   20 -------------
 package/pcmanfm/pcmanfm.hash                      |    2 +
 package/pcmanfm/pcmanfm.mk                        |   11 +++----
 4 files changed, 25 insertions(+), 40 deletions(-)
 delete mode 100644 package/pcmanfm/pcmanfm-link-against-libx11.patch
 create mode 100644 package/pcmanfm/pcmanfm.hash

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index b3baa4c..6a9f68c 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,20 +1,24 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_GAMIN
-	select BR2_PACKAGE_STARTUP_NOTIFICATION
-	select BR2_PACKAGE_XLIB_LIBX11
-	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBFM
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_XORG7 # libgtk2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
 	help
-	  An extremely fast and lightweight file manager which features
-	  tabbed browsing and a user-friendly interface.
+	  PCMan File Manager (PCManFM) is a file manager application developed
+	  by Hong Jen Yee from Taiwan which is meant to be a replacement for
+	  Nautilus, Konqueror and Thunar.
 
-	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
+	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcmanfm/pcmanfm-link-against-libx11.patch b/package/pcmanfm/pcmanfm-link-against-libx11.patch
deleted file mode 100644
index f571e77..0000000
--- a/package/pcmanfm/pcmanfm-link-against-libx11.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Link against libX11
-
-fm-desktop.c uses XSendEvent, so we should link against libX11.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -12,7 +12,8 @@
- 
- pkg_modules="gtk+-2.0 >= 2.6.0 \
-              gthread-2.0 \
--             libstartup-notification-1.0"
-+             libstartup-notification-1.0 \
-+	     x11"
- 
- AC_FUNC_MMAP
- 
diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
new file mode 100644
index 0000000..a3b7653
--- /dev/null
+++ b/package/pcmanfm/pcmanfm.hash
@@ -0,0 +1,2 @@
+# From http://blog.lxde.org/?p=1280
+sha1  0a195301de31c82f1c169e620be7cea8b91813b5  pcmanfm-1.2.3.tar.xz
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index d372e51..0447095 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 0.3.5.9
-PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
-PCMANFM_CONF_OPTS = --disable-hal
-PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
-PCMANFM_AUTORECONF = YES
-PCMANFM_LICENSE = GPLv2+
+PCMANFM_VERSION = 1.2.3
+PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
+PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
+PCMANFM_DEPENDENCIES = libgtk2 libglib2 menu-cache libfm
+PCMANFM_LICENSE = GPLv2
 PCMANFM_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.1
