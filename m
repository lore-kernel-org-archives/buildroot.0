From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 20:15:54 +0200
Subject: [Buildroot] [git commit] libarchive: add optional libxml2 support
Message-ID: <20110710181610.6C5098A43B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9eb70889bc7ec28790ac488a8edf5cd4404c2467
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libarchive/libarchive.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 563c9d7..d539047 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -14,8 +14,14 @@ LIBARCHIVE_DEPENDENCIES = zlib
 endif
 
 LIBARCHIVE_CONF_OPT = \
-	--without-xml2 \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBARCHIVE_DEPENDENCIES += libxml2
+LIBARCHIVE_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+else
+LIBARCHIVE_CONF_OPT += --without-xml2
+endif
+
 $(eval $(call AUTOTARGETS,package,libarchive))
-- 
1.7.3.4
