From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 May 2018 22:20:34 +0200
Subject: [Buildroot] [PATCH] cifs-utils: unconditionally disable PIE
Message-ID: <20180507202034.28715-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PIE support in Buildroot should be enabled via the global option
BR2_RELRO_FULL option, and not done on a per-package basis, therefore
PIE should unconditionally be disabled in the cifs-utils package.

This has the added side-effect that it works around a binutils bug on
SPARC causing the linker to segfault when PIE is enabled:

sparc-linux-gcc -Wall -Wextra -D_FORTIFY_SOURCE=2 -fpie -pie -Wl,-z,relro,-z,now -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -o mount.cifs mount.cifs.o mtab.o resolve_host.o util.o  -lcap-ng
collect2: fatal error: ld terminated with signal 6 [Aborted], core dumped

This issue will reappear when we start testing BR2_RELRO_FULL in the
autobuilders, but in the mean time it avoids the problem.

Fixes:

  http://autobuild.buildroot.net/results/a5342890f39bdccae1324e7d3dbe0eab1aad28e5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cifs-utils/cifs-utils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9044fdf83c..9343e3ea89 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -13,9 +13,9 @@ CIFS_UTILS_LICENSE_FILES = COPYING
 CIFS_UTILS_AUTORECONF = YES
 CIFS_UTILS_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-CIFS_UTILS_CONF_OPTS += --disable-pie
-endif
+# Let's disable PIE unconditionally. We want PIE to be enabled only by
+# the global BR2_RELRO_FULL option.
+CIFS_UTILS_CONF_OPTS = --disable-pie
 
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 CIFS_UTILS_DEPENDENCIES += keyutils
-- 
2.14.3
