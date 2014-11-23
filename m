From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:18 +0100
Subject: [Buildroot] [PATCH 46/51] live555: add error handling to for loop
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-47-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index e933faa..a15aca8 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -49,17 +49,17 @@ LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2
 
 define LIVE555_INSTALL_STAGING_CMDS
 	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
-		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
-		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
+		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i` && \
+		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i` || exit 1 \
 	done; \
 	for i in $(LIVE555_LIBS_TO_INSTALL); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i` || exit 1 \
 	done
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
 	done
 endef
 
-- 
2.1.0
