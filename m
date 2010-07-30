From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] xerces: only add -liconv when
	locale are disabled
Message-ID: <20100730082548.826E9836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7584697f24d0bc6fc660703d97a38598cb76690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iconv library can only be present when locale are disabled in the
toolchain. When locale are enabled in the toolchain, iconv is directly
implemented by the C library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index fd0417d..1dcc10a 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -39,6 +39,10 @@ XERCES_APPS:= \
 
 XERCES_INCLUDES:=/usr/include/xercesc
 
+ifneq ($(BR2_ENABLE_LOCALE),y)
+XERCES_MAKE_OPT=LIBS="-liconv"
+endif
+
 $(DL_DIR)/$(XERCES_SOURCE):
 	 $(call DOWNLOAD,$(XERCES_SITE),$(XERCES_SOURCE))
 
@@ -74,7 +78,7 @@ $(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
 	touch $@
 
 $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY): $(XERCES_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBS="-liconv" -C $(XERCES_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(XERCES_MAKE_OPT) -C $(XERCES_DIR)
 
 $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY): $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
-- 
1.7.1
