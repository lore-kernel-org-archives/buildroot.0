From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2011 10:48:57 +0300
Subject: [Buildroot] [PATCHv2] toolchain: fix build with empty
	BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
Message-ID: <0056cd290aa1be1559ccdd6b3877927fe51ecbe0.1317023087.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "" string is not equal to the empty string. This fixes build
errors like:

arm-none-linux-gnueabi-gcc: : No such file or directory

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Changes v1 -> v2:
	* Use qstrip as suggested by Thomas Petazzoni
	* Add build failure example to commit log for future reference

 toolchain/toolchain-external/ext-tool.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a357cb9..bf59983 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -131,7 +131,8 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
-ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
+TOOLCHAIN_EXTERNAL_CUSTOM_ARGS = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS))
+ifneq ($(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
 endif
-- 
1.7.6.3
