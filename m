From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 14:30:16 +0100
Subject: [Buildroot] [git commit] package/mmc-utils: fix build with SSP
Message-ID: <20200102132044.867578EBA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05a802f671875d12bfc6282aeaf2b765e4a18962
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set AM_CFLAGS to an empty value to avoid the following redefinition
error when building with our custom _FORTIFY_SOURCE:

/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/bin/mips-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_FORTIFY_SOURCE=1 -Wp,-MMD,3rdparty/hmac_sha/.hmac_sha2.o.d,-MT,3rdparty/hmac_sha/hmac_sha2.o -c 3rdparty/hmac_sha/hmac_sha2.c -o 3rdparty/hmac_sha/hmac_sha2.o
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

Fixes:
 - http://autobuild.buildroot.org/results/cfef9315441b5f4909b58a6dccd8bea8e67ae992

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mmc-utils/mmc-utils.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 286e73b242..8c264a454a 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -9,8 +9,12 @@ MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
 
+# override AM_CFLAGS as the project Makefile uses it to pass
+# -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
+# with the _FORTIFY_SOURCE that we pass when hardening options are
+# enabled.
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
