From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:25:25 +0200
Subject: [Buildroot] [PATCH 2/2] arch: remove support for SuperH 2 and
	SuperH 3
In-Reply-To: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SuperH 2 architecture is a noMMU architecture from Renesas, and
its Linux support is really poor. A number of packages fail to build,
the kernel support is almost inexistant, we have never heard of any
user of it.

I was originally the one who introduced support for SuperH 2, but the
project switched to a different architecture due to the poor Linux
support for SuperH 2.

Regarding SuperH 3, I've never heard of Linux support for it that is
used in practice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.sh                        |   18 ++------------
 package/flashbench/flashbench.mk         |    4 +--
 package/kexec/Config.in                  |    2 +-
 package/multimedia/mplayer/Config.in     |    3 +--
 toolchain/toolchain-external/Config.in   |   40 ------------------------------
 toolchain/toolchain-external/ext-tool.mk |    6 -----
 toolchain/uClibc/uclibc.mk               |   20 ---------------
 7 files changed, 6 insertions(+), 87 deletions(-)

diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index cf70fd5..c919e56 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -5,14 +5,6 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_sh2
-	bool "sh2 (SH2 big endian)"
-config BR2_sh2a
-	bool "sh2a (SH2A big endian)"
-config BR2_sh3
-	bool "sh3 (SH3 little endian)"
-config BR2_sh3eb
-	bool "sh3eb (SH3 big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
 config BR2_sh4eb
@@ -24,10 +16,6 @@ config BR2_sh4aeb
 endchoice
 
 config BR2_ARCH
-	default "sh2"		if BR2_sh2
-	default "sh2a"		if BR2_sh2a
-	default "sh3"		if BR2_sh3
-	default "sh3eb"		if BR2_sh3eb
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
@@ -35,7 +23,5 @@ config BR2_ARCH
 	default "sh64"		if BR2_sh64
 
 config BR2_ENDIAN
-	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a || \
-				   BR2_x86_64 || BR2_sh64
-	default "BIG"		if BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
-				   BR2_sh4eb || BR2_sh4aeb
+	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
+	default "BIG"		if BR2_sh4eb || BR2_sh4aeb
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index 45d0540..4ea8f5d 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -11,8 +11,8 @@ FLASHBENCH_LICENSE_FILES = COPYING
 
 FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_microblaze)$(BR2_sh2a),y)
-# microblaze and sh2a toolchains only provide LLONG_MAX when used with gnu99 dialect
+ifeq ($(BR2_microblaze),y)
+# microblaze toolchains only provide LLONG_MAX when used with gnu99 dialect
 FLASHBENCH_CFLAGS += -std=gnu99
 endif
 
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 886144f..d82aa11 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_sh3
+		BR2_powerpc || BR2_sh4 || BR2_sh4a
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index e36fc46..35a1d04 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-			|| BR2_microblaze || BR2_aarch64)
+	depends on !(BR2_sh4a || BR2_sh4aeb || BR2_microblaze || BR2_aarch64)
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2f3926..282c2c8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -471,44 +471,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	    - SH4A, uClibc, big endian
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
-	bool "Sourcery CodeBench SH 2011.03"
-	depends on BR2_sh2a
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_LARGEFILE
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
-	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.38. It has
-	  support for the following variants:
-	    - SH2A, uClibc, big endian
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
-	bool "Sourcery CodeBench SH 2010.09"
-	depends on BR2_sh2a
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_LARGEFILE
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
-	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.35.2. It
-	  has support for the following variants:
-	    - SH2A, uClibc, big endian
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
@@ -779,8 +741,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
-	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
-	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5f467b7..e38ec3e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -225,12 +225,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e8b2bb4..8553451 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -181,26 +181,6 @@ ifeq ($(UCLIBC_TARGET_ARCH),sh)
 	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH3 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH4 is not set" >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_sh2a),y)
-	$(SED) 's,# CONFIG_SH2A is not set,CONFIG_SH2A=y,g' $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh2),y)
-	$(SED) 's,# CONFIG_SH2 is not set,CONFIG_SH2=y,g' $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh3eb),y)
-	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh3),y)
-	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
 ifeq ($(BR2_sh4eb),y)
 	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
-- 
1.7.9.5
