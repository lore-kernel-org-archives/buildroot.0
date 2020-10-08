From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu,  8 Oct 2020 11:08:35 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mtd: add host-acl dependency for
 host
Message-ID: <20201008090836.2670553-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling the host version of mtd, --with-jffs and --with-ubifs are
always set, meaning --with-xattr is set by default. The xattr support
only work if 'sys/acl.h' is available, otherwise the feature is silently
dropped (a warning is shown during the configuration step).

This patch adds a dependency on host-acl for host-mtd, so that the xattr
feature is correctly supported. Logic to have xattr support is already
there and working for the non-host flavour.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 1186fa52d552..9f259b35d906 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -53,7 +53,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
-- 
2.26.2
