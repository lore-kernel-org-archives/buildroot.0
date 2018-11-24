From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:24:59 +0100
Subject: [Buildroot] [git commit] Revert "libkrb5: fix build on riscv"
Message-ID: <20181124104553.AFECC880BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37751a97d9c8a8b35f1942228547a954f7ed9098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e86af4c3961e1f30f2d48a8946a35edd95ab3ec4, which is
no longer needed now that the RISC-V gcc has been patched to define
_REENTRANT when -pthread is passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 6534c069ee..d9d7160ae8 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -52,14 +52,7 @@ else
 LIBKRB5_CONF_OPTS += --without-readline
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
-# it should. Compensate this deficiency here otherwise libkrb5 configure
-# script doesn't find that thread support is enabled.
-ifeq ($(BR2_riscv),y)
-LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
-endif
-else
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBKRB5_CONF_OPTS += --disable-thread-support
 endif
 
