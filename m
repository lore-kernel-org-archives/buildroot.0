From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jul 2010 18:58:54 +0200
Subject: [Buildroot] [PATCH 01/10] ext-toolchains: take into account other
	Glibc dynamic loader variants
In-Reply-To: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0a3f00ff9d6e41588457320552daa0388433ba02.1278349072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

External toolchains using Glibc have different names for the dynamic
loader. Some of them name it ld-linux.so.*, while some others (such as
the PowerPC and MIPS CodeSourcery toolchains) name it simply ld.so.*.

Therefore, we fix the glibc detection code to handle this case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 8daae15..3943ceb 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -155,7 +155,7 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
@@ -251,11 +251,9 @@ check_cross_compiler_exists = \
 
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
-EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-EXTERNAL_LIBS+=ld-uClibc.so
-else
-EXTERNAL_LIBS+=ld-linux.so libnss_files.so libnss_dns.so
+EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GCLIBC),y)
+EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
1.7.0.4
