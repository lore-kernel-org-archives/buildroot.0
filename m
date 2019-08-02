From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Aug 2019 14:21:09 +0200
Subject: [Buildroot] [PATCHv3] package/mtd: needs zstd
Message-ID: <20190802122109.22928-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

For the target variant, zstd is an optional dependency when ubifs-tools
are enabled. For the host variant, we make it an unconditional dependency.

Fixes:
    http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/ (target)
    http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/ (host)

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Tested-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998 at free.fr: fix the target variant too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v2 -> v3 (Yann):
  - make the target dependency optional  (Julien)

Changes v1 -> v2 (Yann):
  - handle the target variant
---
 package/mtd/mtd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0de14dbcba..3477460200 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -27,6 +27,12 @@ MTD_CONF_OPTS += --with-crypto
 else
 MTD_CONF_OPTS += --without-crypto
 endif
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MTD_DEPENDENCIES += zstd
+MTD_CONF_OPTS += --with-zstd
+else
+MTD_CONF_OPTS += --without-zstd
+endif
 else
 MTD_CONF_OPTS += --without-ubifs
 endif
@@ -46,7 +52,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
+HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
-- 
2.20.1
