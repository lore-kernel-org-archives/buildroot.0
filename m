From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:18:26 +0200
Subject: [Buildroot] [git commit] package/mtd: disable crypto for host
Message-ID: <20200718131421.9E4438682B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5188d3a6ba876f4fca792c3fe236325aa63eb329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f1d1347bde41d35630d65898d27d87b99a519cb8 added the optional
openssl dependency for mtd however nothing was done for host-mtd

As a result, crypto support on host-mtd depends on the availability of
host-openssl which is not listed in HOST_MTD_DEPENDENCIES

Moreover, crypto support needs host linux-headers as it includes
<linux/hash_info.h> since version 2.1.2 and
https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a

So just disable crypto support for host-mtd

Fixes:
 - http://autobuild.buildroot.org/results/e581bd04e1902476afcdc9d9e34f5fb00fcd31be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 74b19c7e4a..8220a5ace8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -56,6 +56,7 @@ HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
+	--without-crypto \
 	--disable-tests
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
