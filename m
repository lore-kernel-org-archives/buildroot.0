From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:43 -0000
Subject: [Buildroot] [git commit branch/next] ext-tool.mk: fix
	SUPPORT_LIB_DIR calculation for toolchains without libstdc++
Message-ID: <20120802195232.1D7C896AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8e1ecb8557eb223f12d7d0c989fd799723211aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SUPPORT_LIB_DIR would get resolved to the main buildroot directory for
external toolchains without C++ support, as:

 - gcc -print-file-name=<nonexisting-file> returns <nonexisting-file>
 - readlink -f <nonexisting-file> returns $PWD/<nonexisting-file>

So fix it by ensuring output of gcc -print-file-name actually exists
before using it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index b163aee..3f58aad 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -384,11 +384,12 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
 	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
 	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
+	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a)` ; \
-		SUPPORT_LIB_DIR=`echo $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-	else \
-		SUPPORT_LIB_DIR="" ; \
+		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
+			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+		fi ; \
 	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
