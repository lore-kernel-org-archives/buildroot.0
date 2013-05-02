From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:47 +0200
Subject: [Buildroot] [PATCH v3 08/11] toolchain/gcc: Only enable
	--with-float when it makes sense
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367499650-29869-9-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to gcc/config.gcc, only ARM, MIPS and SPARC have the
"--with-float" option when configuring gcc.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 2993697..7b77fb0 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -65,7 +65,10 @@ endif
 
 # Determine soft-float options
 ifeq ($(BR2_SOFT_FLOAT),y)
+# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_sparc)$(BR2_mips64)$(BR2_mips64el),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+endif
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
 TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 else
-- 
1.7.0.4
