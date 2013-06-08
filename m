From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri,  7 Jun 2013 21:43:42 -0400
Subject: [Buildroot] [PATCH] Makefile: change rsync used in overlays to
	always transfer files
Message-ID: <1370655822-2668-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If two files with the same relative paths exist in multiple overlay
skeletons, and they have the same modification time and size, then rsync
might not copy the later file on top of the earlier file.  This patch fixes
this by adding the -I option to the rsync commands used in the overlay
skeleton file installations.  ("man rsync" indicates that this option turns
off the file-size/mod-date "quick check" behavior, causing all files to be
updated - more like the cp commands that we had originally.)

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Test scenario:  add overlay dirs to configuration, such as:

    BR2_ROOTFS_OVERLAY="$(TOPDIR)/AAA $(TOPDIR)/BBB"

Now make a file in both dirs, one at a time, and make:

    $ mkdir -p AAA/etc BBB/etc
    $ echo AAA > AAA/etc/test.txt
    $ echo BBB > BBB/etc/test.txt
    $ make

The file in target is the file from the last overlay skeleton, as expected:
    $ cat output/target/etc/test.txt
    BBB

Now use touch to make the dates on both files the same, delete the file in
TARGET_DIR, and make again.  The result is that the file from the first skeleton
gets into target, contrary to the expected result:

    $ touch AAA/etc/test.txt BBB/etc/test.txt
    $ rm output/target/etc/test.txt
    $ make
    $ cat output/target/etc/test.txt
    AAA

Adding the -I to the rsync fixes this.
---
 Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d7437a7..969c0c9 100644
--- a/Makefile
+++ b/Makefile
@@ -431,7 +431,7 @@ endif
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	rsync -a \
+	rsync -a -I \
 		--exclude .empty --exclude .svn --exclude .git \
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
@@ -507,7 +507,7 @@ endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a \
+		rsync -a -I \
 			--exclude .empty --exclude .svn --exclude .git \
 			--exclude .hg --exclude=CVS --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
-- 
1.7.9.5
