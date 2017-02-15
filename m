From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:11:11 +0100
Subject: [Buildroot] [git commit] package: add generic support for lz
	archives
Message-ID: <20170215211147.6DD0280118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f165032e4f01aa46b43cc8136bac1c5b47aa8545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit teaches the generic package handling code how to extract .tar.lz
archives. When lzip is not installed on the host, host-lzip gets built
automatically.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                               |  7 +++++++
 Makefile                                |  1 +
 package/pkg-utils.mk                    |  1 +
 support/dependencies/check-host-lzip.mk |  5 +++++
 support/dependencies/check-host-lzip.sh | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/Config.in b/Config.in
index ccd777e..bd8f0d1 100644
--- a/Config.in
+++ b/Config.in
@@ -158,6 +158,13 @@ config BR2_XZCAT
 	  Command to be used to extract a xz'ed file to stdout.
 	  Default is "xzcat"
 
+config BR2_LZCAT
+	string "lzcat command"
+	default "lzip -d -c"
+	help
+	  Command to be used to extract a lzip'ed file to stdout.
+	  Default is "lzip -d -c"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default ""
diff --git a/Makefile b/Makefile
index 4db971b..9663d15 100644
--- a/Makefile
+++ b/Makefile
@@ -432,6 +432,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
 XZCAT := $(call qstrip,$(BR2_XZCAT))
+LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # packages compiled for the host go here
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 38d00db..c95e779 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -36,6 +36,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
+INFLATE.lz   = $(LZCAT)
 INFLATE.lzma = $(XZCAT)
 INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
new file mode 100644
index 0000000..6acfdc6
--- /dev/null
+++ b/support/dependencies/check-host-lzip.mk
@@ -0,0 +1,5 @@
+ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
+DEPENDENCIES_HOST_PREREQ += host-lzip
+EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
+LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
+endif
diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
new file mode 100755
index 0000000..4f8a2ba
--- /dev/null
+++ b/support/dependencies/check-host-lzip.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+lzip=`which $candidate 2>/dev/null`
+if [ ! -x "$lzip" ]; then
+	lzip=`which lzip 2>/dev/null`
+	if [ ! -x "$lzip" ]; then
+		# echo nothing: no suitable lzip found
+		exit 1
+	fi
+fi
+
+echo $lzip
