From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 11:56:56 +0200
Subject: [Buildroot] [git commit] support/download: relocate the git clone
	comment
Message-ID: <20150531095750.6C50B80E19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef92d32f19f1f92d78a42530ddb75355a9861d77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit 95a572282e87 (pkg-infra: move the git download helper to a
script, 2014-07-02), move the comment describing the shallow clone trickery as
well. Merge this comment with the existing helper comment that was added in
7e40a1103a91 (support/download: convert git to use the wrapper, 2014-08-03).

Rename $($(PKG)_DL_VERSION) to ${cset} to match the helper code context.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    6 ------
 support/download/git    |    9 +++++++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f6ed8be..c86b9ab 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -73,12 +73,6 @@ export BR_NO_CHECK_HASH_FOR =
 # to get all the sources needed for one's build configuration.
 ################################################################################
 
-# Try a shallow clone - but that only works if the version is a ref (tag or
-# branch). Before trying to do a shallow clone we check if $($(PKG)_DL_VERSION)
-# is in the list provided by git ls-remote. If not we fall back on a full clone.
-#
-# Messages for the type of clone used are provided to ease debugging in case of
-# problems
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
diff --git a/support/download/git b/support/download/git
index 73cbc0f..fd5f539 100755
--- a/support/download/git
+++ b/support/download/git
@@ -25,8 +25,13 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
-# Try to see if we can do a shallow clone, since it is faster
-# than a full clone.
+# Try a shallow clone, since it is faster than a full clone - but that only
+# works if the version is a ref (tag or branch). Before trying to do a shallow
+# clone we check if ${cset} is in the list provided by git ls-remote. If not
+# we fall back on a full clone.
+#
+# Messages for the type of clone used are provided to ease debugging in case of
+# problems
 git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
