From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Oct 2015 22:24:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libdcadec: Add -fPIC to static
	build, enable shared build
Message-ID: <1445199875-28494-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build errors occured due to libdcadec being linked statically.

Fixes
http://autobuild.buildroot.net/results/a19/a19023e094cbed491444665d6839a9e65a8eee6c/
http://autobuild.buildroot.net/results/98d/98dde028d1d6199f05c904b498bc39bbaa112aa6/
http://autobuild.buildroot.net/results/4ff/4ffcae6cae419df35e8ca29d429ee178bcf31882/
http://autobuild.buildroot.net/results/8ce/8ced16874255ace4923f6b8888c3fca07f28b804/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed -fPIC for static build (Thomas, Samuel)

 package/libdcadec/libdcadec.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 76862a6..dff67b5 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -10,19 +10,24 @@ LIBDCADEC_LICENSE = LGPLv2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
 LIBDCADEC_INSTALL_STAGING = YES
 
+ifneq ($(BR2_STATIC_LIBS),y)
+LIBDCADEC_SHARED = CONFIG_SHARED=1
+endif
+
 define LIBDCADEC_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" -C $(@D)
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
+		$(LIBDCADEC_SHARED) -C $(@D)
 endef
 
 define LIBDCADEC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+		$(LIBDCADEC_SHARED) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
 endef
 
 define LIBDCADEC_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+		$(LIBDCADEC_SHARED) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.6.1
