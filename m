From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:08:53 +0100
Subject: [Buildroot] [PATCH 05/19] gperf: convert to autotools infrastructure
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/gperf/gperf.mk |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 0dc6d6e..bb2d4f3 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -9,12 +9,14 @@ GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_AUTORECONF = NO
 GPERF_INSTALL_STAGING = NO
 GPERF_INSTALL_TARGET = YES
-GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+
+# install-strip rule does not exist in gperf's makefiles
 GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,gperf))
+define GPERF_INSTALL_STRIP
+$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
+endef
 
-$(GPERF_HOOK_POST_INSTALL): $(GPERF_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
-	touch $@
+GPERF_POST_INSTALL_HOOKS += GPERF_INSTALL_STRIP
 
+$(eval $(call AUTOTARGETS,package,gperf))
-- 
1.6.6
