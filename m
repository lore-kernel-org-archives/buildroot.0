From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 00:21:51 +0200
Subject: [Buildroot] [PATCH 1/3] grub: bump Debian patch version to fix build
Message-ID: <20170701222153.31568-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub currently fails to build with recent versions of binutils (e.g
2.28) on the host, with the following error:

checking whether /usr/bin/objcopy works for absolute addresses... no
configure: error: GRUB requires a working absolute objcopy; upgrade your binutils

This is fixed by a patch available in the set of Debian patches, so we
take this opportunity to bump the Debian patch used for Grub. Since
the Debian patch touches acinclude.m4/Makefile.am, we have to
autoreconf.

However, the Debian patch is now available as a regular tarball, so we
can rely on the common <pkg>_PATCH handling, and we no longer need the
custom patch hook.

We also need the usual MAKEINFO=true trick to not have grub try to
regenerate its documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.hash |  4 ++--
 boot/grub/grub.mk   | 19 +++++++------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/boot/grub/grub.hash b/boot/grub/grub.hash
index 566dec8..1f4b53d 100644
--- a/boot/grub/grub.hash
+++ b/boot/grub/grub.hash
@@ -1,3 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub/grub_0.97-68.dsc
+# From http://snapshot.debian.org/archive/debian/20161009T170015Z/pool/main/g/grub/grub_0.97-72.dsc
 sha256	4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b	grub_0.97.orig.tar.gz
-sha256	a453489cf1fec5d311a0b76dea8c8b2ff67eee1a3eba6c06ab80864494d9773c	grub_0.97-68.diff.gz
+sha256	aeab667105eaaccd7c0a848dd8f97e3232ac3d772344e6b5f96db77c3fd62240	grub_0.97-72.debian.tar.xz
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 21f4462..e868efd 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -6,8 +6,11 @@
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
-GRUB_PATCH = grub_$(GRUB_VERSION)-68.diff.gz
-GRUB_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub
+GRUB_PATCH = grub_$(GRUB_VERSION)-72.debian.tar.xz
+GRUB_SITE = http://snapshot.debian.org/archive/debian/20161009T170015Z/pool/main/g/grub
+
+# Some Debian patches touch acinclude.m4/Makefile.am
+GRUB_AUTORECONF = YES
 
 GRUB_LICENSE = GPL-2.0+
 GRUB_LICENSE_FILES = COPYING
@@ -62,18 +65,10 @@ GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_JFS),jfs)
 GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_REISERFS),reiserfs)
 GRUB_STAGE_1_5_TO_INSTALL += $(if $(BR2_TARGET_GRUB_FS_XFS),xfs)
 
-define GRUB_DEBIAN_PATCHES
-	# Apply the patches from the Debian patch
-	(cd $(@D) ; for f in `cat debian/patches/series | grep -v ^#` ; do \
-		cat debian/patches/$$f | patch -g0 -p1 ; \
-	done)
-endef
-
-GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
-
 GRUB_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32"
+	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32" \
+	MAKEINFO=true
 
 GRUB_CONF_OPTS = \
 	--disable-auto-linux-mem-opt \
-- 
2.9.4
