From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Sun, 28 Aug 2011 15:32:04 +0200
Subject: [Buildroot] [PATCH] git fetcher: do not remove the tree after
	initial clone
Message-ID: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the current implementation of the 'git fetcher' the project git tree is
cloned for every build (if the commit ID has changed, otherwise the .tar.gz
would already exist). This appears to me quite inefficient since rebuilding
with a more recent commit is a common use case.

With this patch I am changing how the 'git fetch algorithm' works as follows:

- if project <foobar> uses git, the tree will be cloned in dl/git/foobar
- the tree is cloned using 'git clone -n' to make sure that we can reliably
  update the tree later (--bare does not create the correct refspec, and
  --mirror would work but is doing more than necessary)
- the clone is done only the first time, e.g. when dl/git/foobar does not
  exist
- when making another build, if dl/git/foobar exists, the tree is not
  cloned, but instead we run 'git fetch --all --tags' to update the existing
  tree. that can save a lot of time, especially with large trees since only
  the delta is downloaded. '--all --tags' is required to make sure that all
  remotes commits are downloaded.

Note1: git fetch is actually called even the first time, right after the
       clone, this is obviously not required, but it made the code much
       simpler in the makefile, and it does not hurt too much

Note2: similiar mechanism might be implemented for other SCM supported by
       buildroot

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 package/Makefile.package.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 868bf28..2a2cc40 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -1,4 +1,4 @@
-################################################################################
+###############################################################################
 # Generic package infrastructure
 #
 # This file implements an infrastructure that eases development of
@@ -105,13 +105,13 @@ endif
 
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
-	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	(mkdir -p $(DL_DIR)/git && pushd $(DL_DIR)/git > /dev/null && \
+        (test -d $($(PKG)_NAME) ||  $(GIT) clone -n $($(PKG)_SITE) $($(PKG)_NAME) ) && \
+	pushd $($(PKG)_NAME) > /dev/null && \
+        $(GIT) fetch --tags --all && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
 	popd > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
 
-- 
1.7.5.4
