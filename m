From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 May 2017 21:58:11 +0200
Subject: [Buildroot] [PATCH] package/firejail: remove broken package
Message-ID: <20170529195811.12354-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

firejail has been marked as broken since 3ad100fdcbf6e2bf850b4b2f528c87c74f7c93ff

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Chris Frederick <chrisf@cdf123.net>
---
We don't need legacy handling since this package was added
after the last release (2017.02)
---
 DEVELOPERS                     |  3 ---
 package/Config.in              |  1 -
 package/firejail/Config.in     | 21 ---------------------
 package/firejail/firejail.hash |  3 ---
 package/firejail/firejail.mk   | 28 ----------------------------
 5 files changed, 56 deletions(-)
 delete mode 100644 package/firejail/Config.in
 delete mode 100644 package/firejail/firejail.hash
 delete mode 100644 package/firejail/firejail.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cd1efef..4936b81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -322,9 +322,6 @@ F:	package/libdvbsi/
 F:	package/libsvg/
 F:	package/libsvg-cairo/
 
-N:	Chris Frederick <chrisf@cdf123.net>
-F:	package/firejail/
-
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/eventlog/
 F:	package/micropython/
diff --git a/package/Config.in b/package/Config.in
index 9da2c43..43d75a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1810,7 +1810,6 @@ menu "System tools"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
-	source "package/firejail/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/firejail/Config.in b/package/firejail/Config.in
deleted file mode 100644
index 764217b..0000000
--- a/package/firejail/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_FIREJAIL
-	bool "firejail"
-	depends on BROKEN # does not cross-compile at all
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# uClibc: error: ?EM_ARM? undeclared
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
-	help
-	  Firejail is a SUID program that reduces the risk of security
-	  breaches by restricting the running environment of untrusted
-	  applications using Linux namespaces and seccomp-bpf. It
-	  allows a process and all its descendants to have their own
-	  private view of the globally shared kernel resources, such
-	  as the network stack, process table, mount table.
-
-	  https://firejail.wordpress.com/
-
-comment "firejail needs a glibc or musl toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on BROKEN
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/firejail/firejail.hash b/package/firejail/firejail.hash
deleted file mode 100644
index 0cb86b4..0000000
--- a/package/firejail/firejail.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://sourceforge.net/projects/firejail/files/firejail/
-md5 7e6dca7202b1d70105b39646755cc620 firejail-0.9.44.8.tar.xz
-sha1 019423df0aee84d474f9fcd1f6a871a2fe8aa9a5 firejail-0.9.44.8.tar.xz
diff --git a/package/firejail/firejail.mk b/package/firejail/firejail.mk
deleted file mode 100644
index 858f547..0000000
--- a/package/firejail/firejail.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# firejail
-#
-################################################################################
-
-FIREJAIL_VERSION = 0.9.44.8
-FIREJAIL_SITE = http://download.sourceforge.net/firejail
-FIREJAIL_SOURCE = firejail-$(FIREJAIL_VERSION).tar.xz
-FIREJAIL_LICENSE = GPL-2.0+
-FIREJAIL_LICENSE_FILES = COPYING
-
-FIREJAIL_CONF_OPTS = \
-	--enable-bind \
-	--enable-file-transfer \
-	--enable-network \
-	--enable-seccomp \
-	--enable-userns
-
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-FIREJAIL_CONF_OPTS += --enable-busybox-workaround
-endif
-
-define FIREJAIL_PERMISSIONS
-	/usr/bin/firejail f 4755 0 0 - - - - -
-endef
-
-$(eval $(autotools-package))
-- 
2.9.4
