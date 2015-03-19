From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:07 -0700
Subject: [Buildroot] [PATCH] package: add pacman 4.2.1
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the Arch Linux package manager.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/Config.in        |  1 +
 package/pacman/Config.in | 18 ++++++++++++++++++
 package/pacman/pacman.mk | 14 ++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/pacman/Config.in
 create mode 100644 package/pacman/pacman.mk

diff --git a/package/Config.in b/package/Config.in
index c557010..95ec454 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1261,6 +1261,7 @@ endmenu
 menu "Package managers"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
+	source "package/pacman/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rpm/Config.in"
 endif
diff --git a/package/pacman/Config.in b/package/pacman/Config.in
new file mode 100644
index 0000000..9c4ca66
--- /dev/null
+++ b/package/pacman/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PACMAN
+	bool "pacman"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Pacman is the package manager used by the Arch distribution. It is a
+	  frontend for the ALPM (Arch Linux Package Management) library.
+
+	  Pacman does not strive to "do everything." It will add, remove and
+	  upgrade packages in the system, and it will allow you to query the
+	  package database for installed packages, files and owners. It also
+	  attempts to handle dependencies automatically and can download
+	  packages from a remote server. Arch packages are simple archives, with
+	  .pkg.tar.gz extension for binary packages and .src.tar.gz for source
+	  packages.
diff --git a/package/pacman/pacman.mk b/package/pacman/pacman.mk
new file mode 100644
index 0000000..e979adb
--- /dev/null
+++ b/package/pacman/pacman.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# pacman
+#
+################################################################################
+
+PACMAN_VERSION = 4.2.1
+PACMAN_SITE = https://sources.archlinux.org/other/pacman
+PACMAN_SOURCES = pacman-$(PACMAN_VERSION).tar.gz
+PACMAN_DEPENDENCIES = glibc libarchive libcurl libgpgme openssl
+PACMAN_LICENSE = GPLv2
+PACMAN_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.3.3
