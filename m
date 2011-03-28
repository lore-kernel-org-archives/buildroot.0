From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 28 Mar 2011 03:43:35 -0400
Subject: [Buildroot] [PATCH] add support for common ABI options (for FLAT)
Message-ID: <1301298215-32358-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot atm assumes shared library support everywhere.  This is not the
case with FLAT toolchains where everything is static.  So start common ABI
options to let targets control this behavior.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 target/Config.in.arch                    |   13 +++++++++++++
 toolchain/helpers.mk                     |   12 +++++++++---
 toolchain/toolchain-external/ext-tool.mk |    4 ++++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 7c80945..687efcd 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -40,6 +40,15 @@ config BR2_xtensa
 	bool "xtensa"
 endchoice
 
+config BR2_ABI_FLAT
+	bool
+	default n
+
+config BR2_ABI_ELF
+	bool
+	default y
+	depends on !BR2_ABI_FLAT
+
 #
 # Keep the variants separate, there's no need to clutter everything else.
 # sh is fairly "special" in this regard, as virtually everyone else has
@@ -135,12 +144,16 @@ choice
 	default BR2_BFIN_FLAT
 config BR2_BFIN_FDPIC
 	bool "FDPIC"
+	select BR2_ABI_ELF
 config BR2_BFIN_FLAT
 	bool "FLAT"
+	select BR2_ABI_FLAT
 config BR2_BFIN_FLAT_SEP_DATA
 	bool "FLAT (Separate data)"
+	select BR2_ABI_FLAT
 config BR2_BFIN_SHARED_FLAT
 	bool "Shared FLAT"
+	select BR2_ABI_FLAT
 endchoice
 
 choice
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index db7c7f1..b432713 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -181,12 +181,18 @@ check_uclibc_feature = \
 #
 # $1: sysroot directory
 #
-check_uclibc = \
-	SYSROOT_DIR="$(strip $1)"; \
+ifeq ($(BR2_ABI_FLAT),y)
+check_uclibc_ldso = :
+else
+check_uclibc_ldso = \
 	if ! test -f $${SYSROOT_DIR}/lib/ld*-uClibc.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
-	fi; \
+	fi
+endif
+check_uclibc = \
+	SYSROOT_DIR="$(strip $1)"; \
+	$(check_uclibc_ldso); \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index f6249ef..75a36e7 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -44,7 +44,11 @@
 
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
+ifeq ($(BR2_ABI_FLAT),y)
+LIB_EXTERNAL_LIBS=
+else
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+endif
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
-- 
1.7.4.1
