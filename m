From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Fri, 06 May 2011 15:23:04 +0100
Subject: [Buildroot] [PATCH] sh: Add SH2A CodeSourcery external toolchain
Message-ID: <1304691784-29011-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the CodeSourcery uCLinux/uClibc toolchain for the SH2A big
endian devices.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 toolchain/toolchain-external/Config.in   |   13 +++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c95945f..cb489bd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -101,6 +101,18 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
             - SH4A, uClibc, little endian
             - SH4A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
+	bool "CodeSoucery SH 2010.09"
+	depends on BR2_sh2a_nofpueb || BR2_sh2eb
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the SuperH architecture, from CodeSourcery. It
+	  uses gcc 4.5.1, binutils 2.20, uClibc 0.9.30, gdb 7.2.50 and
+	  kernel headers 2.6.35.2. It has support for
+	  the following variants:
+            - SH2A, uClibc, big endian
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
        bool "Custom toolchain"
        help
@@ -138,6 +150,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 328f908..e23af99 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -179,6 +179,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
-- 
1.7.1
