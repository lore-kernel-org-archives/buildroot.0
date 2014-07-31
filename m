From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 16:36:04 +0200
Subject: [Buildroot] [git commit] Revert "packages: autoreconf non-vanilla
	libtool packages"
Message-ID: <20140731143611.2DC759D357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88f4a56080c667e39069aa1fb42fbb89dddf1836
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've got a cleaner/fuzzier libtool 1.5 static patch we can
discard the temporary workaround.

This reverts commit e573f5d3267e5916c580e499ecd127c60107b8e1.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/faad2/faad2.mk           |    2 --
 package/ipkg/ipkg.mk             |    2 --
 package/jasper/jasper.mk         |    2 --
 package/jpeg-turbo/jpeg-turbo.mk |    2 --
 package/libmhash/libmhash.mk     |    8 --------
 package/librsync/librsync.mk     |    2 --
 package/libsysfs/libsysfs.mk     |    3 ---
 package/libungif/libungif.mk     |    2 --
 package/speex/speex.mk           |    2 --
 9 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 76dd9e9..8c4fc1a 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -11,7 +11,5 @@ FAAD2_LICENSE_FILES = COPYING
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-# libtool 1.5 patch failure
-FAAD2_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 097e15e..10ef207 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -9,7 +9,5 @@ IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
 IPKG_LICENSE = GPLv2+
 IPKG_LICENSE_FILES = COPYING
-# libtool 1.5 patch failure
-IPKG_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 53da53f..7917c6a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -8,8 +8,6 @@ JASPER_VERSION = 1.900.1
 JASPER_SITE = http://sources.openelec.tv/devel
 JASPER_SOURCE = jasper-$(JASPER_VERSION).tar.bz2
 JASPER_INSTALL_STAGING = YES
-# libtool 1.5 patch failure
-JASPER_AUTORECONF = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = MIT
 JASPER_LICENSE_FILES = LICENSE
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 3e09c19..d35c365 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -11,8 +11,6 @@ JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
 JPEG_TURBO_LICENSE_FILES = README README-turbo.txt
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_CONF_OPT = --with-jpeg8
-# libtool 1.5 patch failure
-JPEG_TURBO_AUTORECONF = YES
 
 ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
 JPEG_TURBO_CONF_OPT += --with-simd
diff --git a/package/libmhash/libmhash.mk b/package/libmhash/libmhash.mk
index 00da7c1..f7b8e72 100644
--- a/package/libmhash/libmhash.mk
+++ b/package/libmhash/libmhash.mk
@@ -8,15 +8,7 @@ LIBMHASH_VERSION = 0.9.9.9
 LIBMHASH_SITE = http://downloads.sourceforge.net/project/mhash/mhash/$(LIBMHASH_VERSION)
 LIBMHASH_SOURCE = mhash-$(LIBMHASH_VERSION).tar.bz2
 LIBMHASH_INSTALL_STAGING = YES
-# libtool 1.5 patch failure
-LIBMHASH_AUTORECONF = YES
 LIBMHASH_LICENSE = LGPLv2
 LIBMHASH_LICENSE_FILES = COPYING
 
-# Two trees in the tarball cause autoreconf problems
-define LIBMHASH_REMOVE_DUPLICATE
-	$(RM) -rf $(@D)/mhash-0.9.9
-endef
-LIBMHASH_POST_EXTRACT_HOOKS += LIBMHASH_REMOVE_DUPLICATE
-
 $(eval $(autotools-package))
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 986c23e..d475c73 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -6,8 +6,6 @@
 
 LIBRSYNC_VERSION = 0.9.7
 LIBRSYNC_SITE = http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
-# libtool 1.5 patch failure
-LIBRSYNC_AUTORECONF = YES
 LIBRSYNC_LICENSE = LGPLv2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index accfec5..fb0310f 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -8,9 +8,6 @@ LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
-# libtool 1.5 patch failure
-LIBSYSFS_AUTORECONF = YES
-LIBSYSFS_AUTORECONF_OPT = -Im4/
 LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 1f2cc85..019a489 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -9,8 +9,6 @@ LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
 LIBUNGIF_CONF_OPT = --without-x
-# libtool 1.5 patch failure
-LIBUNGIF_AUTORECONF = YES
 LIBUNGIF_LICENSE = MIT
 LIBUNGIF_LICENSE_FILES = COPYING
 
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index beb8290..6eb7e90 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -11,8 +11,6 @@ SPEEX_LICENSE_FILES = COPYING
 
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
-# libtool 1.5 patch failure
-SPEEX_AUTORECONF = YES
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
 		 --enable-fixed-point
