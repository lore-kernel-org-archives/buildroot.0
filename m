From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Mon, 09 May 2011 14:12:53 +0100
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match gnuconfig
	targets
Message-ID: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sh2eb and sh2a_nofpueb gnuconfig targets are no longer supported
in Buildroot. This patch replaces these Buildroot targets with sh2
and sh2a respectively, and adds sh4a targets as these are widely
used.

To build for devices without an fpu, the relevant toolchain flags
will have to be specified.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 fs/jffs2/Config.in                     |    4 ++--
 target/Config.in.arch                  |   32 +++++++++++++++++++-------------
 toolchain/elf2flt/elf2flt/config.sub   |    8 ++++----
 toolchain/toolchain-external/Config.in |    4 ++--
 toolchain/uClibc/uclibc.mk             |    4 ++--
 5 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index 5748fbb..9a96d7d 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -94,8 +94,8 @@ choice
 	prompt "Endianess"
 	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_armeb || \
 			BR2_avr32 || BR2_m68k || BR2_mips || \
-			BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-			BR2_sh3eb || BR2_sh4eb || BR2_sparc
+			BR2_powerpc || BR2_sh2 || BR2_sh2a || \
+			BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 7c80945..e128034 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -211,18 +211,22 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_sh2a_nofpueb
-	bool "sh2a_nofpueb"
-config BR2_sh2eb
-	bool "sh2eb"
+config BR2_sh2
+	bool "sh2 (SH2 big endian)"
+config BR2_sh2a
+	bool "sh2a (SH2A big endian)"
 config BR2_sh3
-	bool "sh3"
+	bool "sh3 (SH3 little endian)"
 config BR2_sh3eb
-	bool "sh3eb"
+	bool "sh3eb (SH3 big endian)"
 config BR2_sh4
-	bool "sh4"
+	bool "sh4 (SH4 little endian)"
 config BR2_sh4eb
-	bool "sh4eb"
+	bool "sh4eb (SH4 big endian)"
+config BR2_sh4a
+	bool "sh4a (SH4A little endian)"
+config BR2_sh4aeb
+	bool "sh4aeb (SH4A big endian)"
 endchoice
 
 #
@@ -482,12 +486,14 @@ config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
 	default "powerpc"	if BR2_powerpc
-	default "sh2a_nofpueb"	if BR2_sh2a_nofpueb
-	default "sh2eb"		if BR2_sh2eb
+	default "sh2"		if BR2_sh2
+	default "sh2a"		if BR2_sh2a
 	default "sh3"		if BR2_sh3
 	default "sh3eb"		if BR2_sh3eb
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
+	default "sh4a"		if BR2_sh4a
+	default "sh4aeb"	if BR2_sh4aeb
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
 	default "x86_64"	if BR2_x86_64
@@ -503,10 +509,10 @@ config BR2_ARCH
 config BR2_ENDIAN
 	string
 	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
-			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
+			    BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64
 	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
-			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-			    BR2_sh3eb || BR2_sh4eb || BR2_sparc
+			    BR2_powerpc || BR2_sh2 || BR2_sh2a || \
+			    BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
 
 config BR2_GCC_TARGET_TUNE
 	string
diff --git a/toolchain/elf2flt/elf2flt/config.sub b/toolchain/elf2flt/elf2flt/config.sub
index 4279c84..2072457 100755
--- a/toolchain/elf2flt/elf2flt/config.sub
+++ b/toolchain/elf2flt/elf2flt/config.sub
@@ -262,7 +262,7 @@ case $basic_machine in
 	| pdp10 | pdp11 | pj | pjl \
 	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
 	| pyramid \
-	| sh | sh[1234] | sh[23]e | sh[34]eb | shbe | shle | sh[1234]le | sh3ele \
+	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
 	| sh64 | sh64le \
 	| sparc | sparc64 | sparc64b | sparc86x | sparclet | sparclite \
 	| sparcv8 | sparcv9 | sparcv9b \
@@ -342,8 +342,8 @@ case $basic_machine in
 	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
 	| pyramid-* \
 	| romp-* | rs6000-* \
-	| sh-* | sh[1234]-* | sh[23]e-* | sh[34]eb-* | shbe-* \
-	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
+	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]aeb-* | sh[23]e-* | sh[34]eb-* \
+	| sheb-* | shbe-* | shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
 	| sparc-* | sparc64-* | sparc64b-* | sparc86x-* | sparclet-* \
 	| sparclite-* \
 	| sparcv8-* | sparcv9-* | sparcv9b-* | strongarm-* | sv1-* | sx?-* \
@@ -1097,7 +1097,7 @@ case $basic_machine in
 	we32k)
 		basic_machine=we32k-att
 		;;
-	sh3 | sh4 | sh[34]eb | sh[1234]le | sh[23]ele)
+	sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele)
 		basic_machine=sh-unknown
 		;;
 	sh64)
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cb489bd..36118ac 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -88,7 +88,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "CodeSoucery SH 2010.09"
-	depends on BR2_sh4 || BR2_sh4eb
+	depends on BR2_sh4a || BR2_sh4aeb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
@@ -103,7 +103,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	bool "CodeSoucery SH 2010.09"
-	depends on BR2_sh2a_nofpueb || BR2_sh2eb
+	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 19256bb..3173ef4 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -182,14 +182,14 @@ ifeq ($(UCLIBC_TARGET_ARCH),sh)
 	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH3 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH4 is not set" >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_sh2a_nofpueb),y)
+ifeq ($(BR2_sh2a),y)
 	$(SED) 's,# CONFIG_SH2A is not set,CONFIG_SH2A=y,g' $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_sh2eb),y)
+ifeq ($(BR2_sh2),y)
 	$(SED) 's,# CONFIG_SH2 is not set,CONFIG_SH2=y,g' $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-- 
1.7.1
