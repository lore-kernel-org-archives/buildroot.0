From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:10:34 +0100
Subject: [Buildroot] [git commit] Revert "package/gcc: fix libgcc build for
	xtensa"
Message-ID: <20160320211132.4B505817FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65eec9081e95ce8936f855e1a1e2fae03d0a305e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c44cf2cc97df1729577263d2b0cb5263e8cdc4c1.
Now that xtensa gas don't move literals into .init and .fini this fix is
no longer needed.

See upstream commit
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4111950f363221c4641dc2f33bea61cc94f34906,
which was backported to all supported binutils version, under the name
*-xtensa-fix-.init-.fini-literals-moving.patch.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
[Thomas: add more details in the commit log, as suggested by Yann
E. Morin, and using information provided by Max.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0fb73c9..5646b66 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -97,13 +97,6 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# Xtensa libgcc can't be built with -mauto-litpools
-# because of the trick used to generate .init/.fini sections.
-ifeq ($(BR2_xtensa),y)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
-endif
-
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
