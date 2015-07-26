From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:40 +0200
Subject: [Buildroot] [RFC 30/37] package/libeio: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-31-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libeio is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy         |  7 +++++++
 package/Config.in        |  1 -
 package/libeio/Config.in | 24 ------------------------
 package/libeio/libeio.mk | 16 ----------------
 4 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 package/libeio/Config.in
 delete mode 100644 package/libeio/libeio.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f5c012f..f623a5c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEIO
+	bool "libeio package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libeio package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9f98fc7..308c05f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,7 +246,6 @@ endif
 	source "package/libeet/Config.in"
 	source "package/libefreet/Config.in"
 	source "package/libeina/Config.in"
-	source "package/libeio/Config.in"
 	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
 	source "package/libevas/Config.in"
diff --git a/package/libeio/Config.in b/package/libeio/Config.in
deleted file mode 100644
index e2e19a7..0000000
--- a/package/libeio/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_LIBEIO
-	bool "libeio"
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBECORE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  Eio integrates with EFL (Ecore, Eina) to provide efficient
-	  filesystem Input/Output (I/O). It use the best techniques to
-	  achieve such purpose, like using at-variants, splice,
-	  properly handling errors and doing it in an asynchronous
-	  fashion by means of worker threads. It is also ported to
-	  Windows, so multi-platform.
-
-	  Whenever you need to list a directory, copy, move or delete
-	  files, Eio will do that task better than you'd achieve with
-	  naive implementations, and it is easy to use.
-
-	  http://trac.enlightenment.org/e/wiki/Eio
-
-comment "libeio needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libeio/libeio.mk b/package/libeio/libeio.mk
deleted file mode 100644
index e687c32..0000000
--- a/package/libeio/libeio.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libeio
-#
-################################################################################
-
-LIBEIO_VERSION = 1.7.10
-LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
-LIBEIO_SITE = http://download.enlightenment.org/releases
-LIBEIO_LICENSE = LGPLv2.1
-LIBEIO_LICENSE_FILES = COPYING
-
-LIBEIO_INSTALL_STAGING = YES
-LIBEIO_DEPENDENCIES = libeina libeet libecore
-
-$(eval $(autotools-package))
-- 
2.4.3
