From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:41 -0300
Subject: [Buildroot] [PATCH 34/51] jack2: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-35-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

In this case in particular it's $(TARGET_CONFIGURE_OPTS), which includes
$(TARGET_MAKE_ENV).

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/jack2/jack2.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index f6ab974..fa9e451 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -53,16 +53,22 @@ define JACK2_CONFIGURE_CMDS
 endef
 
 define JACK2_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define JACK2_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
 		install)
 endef
 
 define JACK2_INSTALL_STAGING_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
 		install)
 endef
 
-- 
2.7.3
