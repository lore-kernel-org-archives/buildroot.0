From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Jul 2010 14:55:02 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: cleanup
	softfloat selection
Message-ID: <20100709130908.5A33382575@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ac85536640cdcf3fd0df2f48487b9b02f2f31c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have a BR2_SOFT_FLOAT_FP option, and -mfloat-abi should also
be used for big endian ARM.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Makefile.in |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index 19c97d1..0dcd803 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -19,15 +19,11 @@ endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
-ifeq ($(BR2_SOFT_FLOAT_FP),y)
-TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
-else # no fp at all
-ifeq ($(BR2_arm),y) # only set float-abi for arm
+ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
 TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 else
 TARGET_SOFT_FLOAT:=-msoft-float
 endif
-endif
 ARCH_FPU_SUFFIX:=_nofpu
 else # no softfloat support
 SOFT_FLOAT_CONFIG_OPTION:=
-- 
1.7.1
