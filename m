From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:21:31 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: Only enable --with-float
	when it makes sense
Message-ID: <20130504212451.EC9C899ABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d929f4bb43ab972db9120f8c70fede7c207b85b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to gcc/config.gcc, only ARM, MIPS and SPARC have the
"--with-float" option when configuring gcc.

[Peter: sort list]
Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 4c77c5c..f1803cb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -65,7 +65,10 @@ endif
 
 # Determine soft-float options
 ifeq ($(BR2_SOFT_FLOAT),y)
+# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_sparc),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+endif
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
 TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 else
