From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 23:27:58 +0200
Subject: [Buildroot] [git commit master] customize: fix copy paths
Message-ID: <20100506212940.7B6498B86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea0695ff5edff392603a77b9299833fbb399e429
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #849, #1135

customize.mk used to copy files with a wrong command, resulting in one
directory level in excess. For example, source/etc/myfile would have
produced /etc/etc/myfile in the target filesystem instead of /etc/myfile.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    4 +++-
 package/customize/customize.mk |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 46939f0..10ca888 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,13 +2,15 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: hal, mplayer, pciutils,
+	Updated/fixed packages: customize, hal, mplayer, pciutils,
 	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils,
 	wpa_supplicant
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#849: "customize" package copies files to wrong place in target tree
 	#985: Bump usb_modeswitch package to 1.1.0
+	#1135: Package customize. Wrong copying
 	#1525: Package hal deletes a whole <target>/etc/rc.d directory
 	#1699: Fix usbutils dependencies and bump
 	#1705: Fix pciutils broken cross compiling
diff --git a/package/customize/customize.mk b/package/customize/customize.mk
index 780e42b..d2b8518 100644
--- a/package/customize/customize.mk
+++ b/package/customize/customize.mk
@@ -11,7 +11,7 @@ $(BUILD_DIR)/.customize:
 	 /bin/ls -d * > $(BUILD_DIR)/series || \
 	 touch $(BUILD_DIR)/series )
 	for f in `cat $(BUILD_DIR)/series`; do \
-		cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
+		cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
 	done
 	rm -f $(BUILD_DIR)/series
 	touch $@
-- 
1.6.3.3
