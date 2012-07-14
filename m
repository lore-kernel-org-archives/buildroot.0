From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 Jul 2012 09:28:37 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain/mips: kill EABI and fix N32
Message-ID: <1342268918-3235-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS EABI is a bare-metal ABI so remove it.
Also fix uClibc to really work with N32 ABI, which used the EABI knob
previously.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 target/Config.in.arch      |    3 ---
 toolchain/uClibc/uclibc.mk |    2 +-
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index c9bbc12..bad0f4c 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -280,9 +280,6 @@ config BR2_MIPS_OABI32
 config BR2_MIPS_ABI32
 	bool "n32"
 	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_EABI
-	bool "eabi"
-	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
 config BR2_MIPS_ABI64
 	bool "n64"
 	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index f40fe36..9d0b6db 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -158,7 +158,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),mips)
 ifeq ($(BR2_MIPS_OABI),y)
 	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_MIPS_EABI),y)
+ifeq ($(BR2_MIPS_ABI32),y)
 	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_MIPS_ABI64),y)
-- 
1.7.8.6
