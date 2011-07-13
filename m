From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 08:50:46 +0200
Subject: [Buildroot] [git commit] toolchain-external: download/show external
	toolchain with make source/external-deps
Message-ID: <20110713065843.74E258A2F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b51b664727458235460ed3c5429b8d44215b9446
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Herv? Fache <h-fache@ti.com>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index db9365b..fd9a530 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -50,8 +50,6 @@
 #  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 
-uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
-
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
@@ -197,6 +195,7 @@ TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8386/
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
@@ -320,3 +319,11 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
 	done ;
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
+
+# 'uclibc' is the target to provide toolchain / staging dir
+uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+# download ext toolchain if so configured
+uclibc-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
+endif
-- 
1.7.3.4
