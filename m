From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:47:10 +0100
Subject: [Buildroot] [PATCH] package/netsurf: use TMP_PREFIX inside the
 build directory
Message-ID: <20181217084710.16192-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The netsurf build system creates a stamp file inside TMP_PREFIX to
know if the build was done, and if the stamp file exists, it doesn't
do any build. Therefore, having this stamp file in STAGING_DIR
prevents from rebuilding netsurf, even after removing its entire build
directory: the stamp file exists in STAGING_DIR, and netsurf doesn't
build anything, causing the installation to fail.

We fix this by putting this temporary directory inside the netsurf
build directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/netsurf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index e5a251b9c1..e4ed4fd1a7 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -78,7 +78,7 @@ NETSURF_MAKE_OPTS = \
 	BUILD_CC="$(HOSTCC)" \
 	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
-	TMP_PREFIX=$(STAGING_DIR)/usr \
+	TMP_PREFIX=$(@D)/tmpusr \
 	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
 	PREFIX=/usr
 
-- 
2.19.2
