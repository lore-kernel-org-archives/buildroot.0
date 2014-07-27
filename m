From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 09:57:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: Fix static build
Message-ID: <1406447840-8331-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/04c/04cc4f4878466715d980442bd7114fecbeb51c0b/

Quote from README:

A shared library is now built by default, in addition to the static
library. You can also turn it off if desired

  $ make SHARED=

The rtmpdump programs still link to the static library, regardless.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtmpdump/rtmpdump.mk |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 4a8a1b0..684e0cf 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -31,6 +31,8 @@ RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
     RTMPDUMP_CFLAGS += -fPIC
+else
+    RTMPDUMP_SHARED = "SHARED="
 endif
 
 define RTMPDUMP_BUILD_CMDS
@@ -39,15 +41,16 @@ define RTMPDUMP_BUILD_CMDS
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
 		XLDFLAGS="$(TARGET_CFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(RTMPDUMP_SHARED) \
 		-C $(@D)/librtmp
 endef
 
 define RTMPDUMP_INSTALL_STAGING_CMDS
-	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
+	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_SHARED)
 endef
 
 define RTMPDUMP_INSTALL_TARGET_CMDS
-	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR)
+	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_SHARED)
 endef
 
 $(eval $(generic-package))
-- 
1.7.10.4
