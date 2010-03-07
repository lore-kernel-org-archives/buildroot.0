From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Mar 2010 23:00:06 +0100
Subject: [Buildroot] [git commit master] e2fsprogs: fix build when no
	binaries/libs are selected
Message-ID: <20100307220412.4AA31776B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=73f244d59483dd9dcddf29cb6c92d9bcdc6f7898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by "Thomas".

Strip fails as it gets called without any arguments. Instead of working
around this, simply remove the package-specific stripping as it is
done later (in target-finalize) anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/e2fsprogs/e2fsprogs.mk |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index bd999db..4857fd1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.05, Not yet released
 
-	 Updated/fixed packages: dosfstools, squashfs
+	 Updated/fixed packages: dosfstools, e2fsprogs, squashfs
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0f8119b..5aa3261 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -67,8 +67,6 @@ E2FSPROGS_TXTTARGETS_ = \
 
 $(E2FSPROGS_HOOK_POST_INSTALL):
 	$(call MESSAGE,"Post installing")
-	# strip binaries
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_y))
 	# remove unneeded
 	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
 	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
-- 
1.6.3.3
