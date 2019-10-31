From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 12:06:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: fix build with SSP
Message-ID: <20191031110655.1189-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set AM_CFLAGS to an empty value to avoid the following redefinition
error when building with our custom _FORTIFY_SOURCE:

/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/bin/mips-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_FORTIFY_SOURCE=1 -Wp,-MMD,3rdparty/hmac_sha/.hmac_sha2.o.d,-MT,3rdparty/hmac_sha/hmac_sha2.o -c 3rdparty/hmac_sha/hmac_sha2.c -o 3rdparty/hmac_sha/hmac_sha2.o
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

Fixes:
 - http://autobuild.buildroot.org/results/cfef9315441b5f4909b58a6dccd8bea8e67ae992

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mmc-utils/mmc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 286e73b242..eed2959a1e 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -10,7 +10,7 @@ MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
 
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-- 
2.23.0
