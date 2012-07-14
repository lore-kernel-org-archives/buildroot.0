From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 00:57:42 +0200
Subject: [Buildroot] [git commit] toolchain/mips: kill EABI and fix N32
Message-ID: <20120714225924.3124F90E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6ebb7fd1bd778709c3acb10b96a43e6bd863dae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS EABI is a bare-metal ABI so remove it.
Also fix uClibc to really work with N32 ABI, which used the EABI knob
previously.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
