From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:26 +0200
Subject: [Buildroot] [git commit] jack2: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121835.F1BE381F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b3fd59f45be2304e056a7103bf01d4f9db86ae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this case in particular it's $(TARGET_CONFIGURE_OPTS), which includes
$(TARGET_MAKE_ENV).

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
