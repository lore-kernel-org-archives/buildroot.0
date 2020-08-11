From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:37:14 +0200
Subject: [Buildroot] [git commit branch/next] package/mtd: crypto support
 needs headers >= 4.12
Message-ID: <20200812144329.CB71985F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70e6762aa0204fed687eab068157a79a0ec7aad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

crypto support includes <linux/hash_info.h> since version 2.1.2 and
https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a

However, linux/hash_info.h is only exported since kernel 4.12:
https://github.com/torvalds/linux/commit/fcc8487d477a3452a1d0ccbdd4c5e0e1e3cb8bed

Fixes:
 - http://autobuild.buildroot.org/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 8220a5ace8..1186fa52d5 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -21,7 +21,8 @@ endif
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
 MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# crypto needs linux/hash_info.h
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
 MTD_DEPENDENCIES += openssl
 MTD_CONF_OPTS += --with-crypto
 else
