From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Aug 2015 18:22:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Fix static build
Message-ID: <1440519726-30166-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ec04e6f..e145ded 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -71,6 +71,14 @@ define TVHEADEND_CONFIGURE_CMDS
 	)
 endef
 
+# remove hardcoded -ldl for static builds
+define TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
+	$(SED) 's/-ldl -lpthread -lm/-lpthread -lm/' $(@D)/Makefile
+endef
+ifeq ($(BR2_STATIC_LIBS),y)
+TVHEADEND_POST_CONFIGURE_HOOKS += TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
+endif
+
 define TVHEADEND_BUILD_CMDS
 	$(MAKE) -C $(@D)
 endef
-- 
2.1.4
