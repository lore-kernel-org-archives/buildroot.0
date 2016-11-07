From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:06 +0100
Subject: [Buildroot] [PATCH v4 11/22] toolchain-external-blackfin-uclinux:
	new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Analog Devices external toolchain
for the Blackfin architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.

NOTE busybox build test failed when both FDPIC and FLAT shared libs
are installed, but this also fails on master. So not my problem :-P
---
 toolchain/toolchain-external/Config.in             | 26 ++++-------------
 .../toolchain-external-blackfin-uclinux/Config.in  | 17 +++++++++++
 .../Config.in.options                              | 10 +++++++
 .../toolchain-external-blackfin-uclinux.hash       |  3 ++
 .../toolchain-external-blackfin-uclinux.mk         | 33 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ---
 toolchain/toolchain-external/toolchain-external.mk | 16 -----------
 7 files changed, 69 insertions(+), 40 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a19e41a..f8e04f5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -22,6 +22,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
+# Blackfin
+source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -397,24 +400,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
-	bool "Blackfin.uclinux.org 2014R1"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
-
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
@@ -526,8 +511,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FDPIC
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
 	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
 	default "mips-img-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
@@ -581,6 +564,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
 
+# Blackfin
+source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
new file mode 100644
index 0000000..8b299e8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
@@ -0,0 +1,17 @@
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
+	bool "Blackfin.uclinux.org 2014R1"
+	depends on BR2_bfin
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Toolchain for the Blackfin architecture, from
+	  http://blackfin.uclinux.org.
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
new file mode 100644
index 0000000..3b7f457
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
@@ -0,0 +1,10 @@
+if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "bfin-uclinux" if BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc" if BR2_BINFMT_FDPIC
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-blackfin-uclinux"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
new file mode 100644
index 0000000..b320d94
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
+sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
new file mode 100644
index 0000000..0a48220
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# toolchain-external-blackfin-uclinux
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR = 2014R1
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION = $(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)-RC2
+
+ifeq ($(BR2_BINFMT_FLAT),y)
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-uclinux
+else
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-linux-uclibc
+endif
+
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SITE = http://downloads.sourceforge.net/project/adi-toolchain/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)/i386
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SOURCE = blackfin-toolchain-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
+
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_STRIP_COMPONENTS = 3
+
+# Special handling for Blackfin toolchain, because of the split in two
+# tarballs, and the organization of tarball contents. The tarballs
+# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
+# which themselves contain the toolchain. This is why we strip more
+# components than usual.
+define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS) | \
+		$(TAR) --strip-components=3 -C $(@D) $(TAR_OPTIONS) -
+endef
+TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3740ca4..16c2e19 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,10 +1,6 @@
 ######################################
 # Next hashes are all locally computed
 
-# Blackfin toolchains from Analog Devices
-sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-
 # Mentor's Sourcery CodeBench Lite toolchains
 # NiosII
 sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7dfcac3..4b21b4f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -70,16 +70,6 @@ define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 endef
 endif
 
-# Special handling for Blackfin toolchain, because of the split in two
-# tarballs, and the organization of tarball contents. The tarballs
-# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
-# which themselves contain the toolchain. This is why we strip more
-# components than usual.
-define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
-		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-endef
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
@@ -125,12 +115,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-- 
2.10.2
