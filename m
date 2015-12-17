From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 00:05:07 +0100
Subject: [Buildroot] [git commit] package/efl/libeio: remove package
Message-ID: <20151217230816.A7DC17F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e155c9570013cebb64e9ed46ad2ef0cbbb181372
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libeio is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             |  7 +++++++
 package/efl/Config.in        |  1 -
 package/efl/libeio/Config.in | 22 ----------------------
 package/efl/libeio/libeio.mk | 16 ----------------
 4 files changed, 7 insertions(+), 39 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c161687..4a99c7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_LIBEIO
+	bool "libeio package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.15, libeio is now provided by the libefl package.
+
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 5947de2..58e8f65 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -20,7 +20,6 @@ source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libefl/Config.in"
 source "package/efl/libefreet/Config.in"
-source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
deleted file mode 100644
index 5b1e395..0000000
--- a/package/efl/libeio/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_LIBEIO
-	bool "libeio"
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBECORE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
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
-comment "libeio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
deleted file mode 100644
index e687c32..0000000
--- a/package/efl/libeio/libeio.mk
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
