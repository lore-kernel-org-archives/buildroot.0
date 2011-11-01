From: Stany MARCEL <stanypub@gmail.com>
Date: Tue,  1 Nov 2011 13:19:16 +0100
Subject: [Buildroot] [PATCH 2/2 v2] toolchain: Add the possibility to have a
	mcpu option with wrapper
In-Reply-To: <201111011151.35278.yann.morin.1998@anciens.enib.fr>
References: <201111011151.35278.yann.morin.1998@anciens.enib.fr>
Message-ID: <1320149956-3072-1-git-send-email-stanypub@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Permit to define the mcpu of the external toolchain wrapper, based on
BR2_GCC_TARGET_CPU.

Signed-off-by: Stany MARCEL <stanypub@gmail.com>
---

Changes for v2:
 * Spurious empty line removed
 * CPU setting positionned above ABI one

 toolchain/toolchain-external/ext-tool.mk           |    5 +++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 572917f..a52621c 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -127,6 +127,7 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = \
 	-DBR_SYSROOT='"$(STAGING_DIR)"'

 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))

@@ -140,6 +141,10 @@ ifneq ($(CC_TARGET_ARCH_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
 endif
+ifneq ($(CC_TARGET_CPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+endif
 ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 3e23061..cc404f3 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -28,6 +28,9 @@ static char *predef_args[] = {
 #ifdef BR_TUNE
 	"-mtune=" BR_TUNE,
 #endif /* BR_TUNE */
+#ifdef BR_CPU
+	"-mcpu=" BR_CPU,
+#endif
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif
--
1.7.1
