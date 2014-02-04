From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 17:23:04 +0100
Subject: [Buildroot] [git commit] Makefile: change rsync used in overlays to
	always transfer files
Message-ID: <20140204163209.5C8979C7D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f865405c9215071a3031f2a2b89db9ec686342d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If two files with the same relative paths exist in multiple overlay
skeletons, and they have the same modification time and size, then rsync
might not copy the later file on top of the earlier file.  This patch fixes
this by adding the -I option to the rsync commands used in the overlay
skeleton file installations.  ("man rsync" indicates that this option turns
off the file-size/mod-date "quick check" behavior, causing all files to be
updated - more like the cp commands that we had originally.)

[Peter: use --ignore-times to make it obvious what the option does]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 4a675d4..9775397 100644
--- a/Makefile
+++ b/Makefile
@@ -472,7 +472,7 @@ RSYNC_VCS_EXCLUSIONS = \
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	rsync -a $(RSYNC_VCS_EXCLUSIONS) \
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=Du+w --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
