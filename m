From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 07:08:03 -0300
Subject: [Buildroot] [PATCH 1/2] audacious: new package
Message-ID: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                |  1 +
 package/audacious/Config.in      | 24 ++++++++++++++++++++++++
 package/audacious/audacious.hash |  2 ++
 package/audacious/audacious.mk   | 15 +++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/audacious/Config.in
 create mode 100644 package/audacious/audacious.hash
 create mode 100644 package/audacious/audacious.mk

diff --git a/package/Config.in b/package/Config.in
index b1fced1..2f2c255 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -5,6 +5,7 @@ menu "Target packages"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
+	source "package/audacious/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvblast/Config.in"
diff --git a/package/audacious/Config.in b/package/audacious/Config.in
new file mode 100644
index 0000000..a7520cf
--- /dev/null
+++ b/package/audacious/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_AUDACIOUS
+	bool "audacious"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	# Lacks sufficient fenv support
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Audacious is an open source audio player. A descendant of
+	  XMMS, Audacious plays your music how you want it, without
+	  stealing away your computer?s resources from other tasks.
+
+	  http://audacious-media-player.org/
+
+comment "audacious needs libgtk3 and a glibc or musl toolchain w/ C++, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3 || \
+		BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/audacious/audacious.hash b/package/audacious/audacious.hash
new file mode 100644
index 0000000..a67d362
--- /dev/null
+++ b/package/audacious/audacious.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	bf9ce9e2f475d14cf6510e14235e858a73afb67826b039c2b6e0f86851ec7edf	audacious-3.7.2-gtk3.tar.bz2
diff --git a/package/audacious/audacious.mk b/package/audacious/audacious.mk
new file mode 100644
index 0000000..a18458b
--- /dev/null
+++ b/package/audacious/audacious.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# audacious
+#
+################################################################################
+
+AUDACIOUS_VERSION = 3.7.2
+AUDACIOUS_SITE = http://distfiles.audacious-media-player.org
+AUDACIOUS_SOURCE = audacious-$(AUDACIOUS_VERSION)-gtk3.tar.bz2
+AUDACIOUS_DEPENDENCIES = dbus libglib2 libgtk3 host-pkgconf
+AUDACIOUS_INSTALL_STAGING = YES
+AUDACIOUS_LICENSE = BSD-2c
+AUDACIOUS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.3
