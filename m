From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri,  6 Nov 2015 23:39:24 -0500
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full git
	clone
Message-ID: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When specifying BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, a user may want to
specify the SHA of a reference different than a branch or tag.

For instance, Gerrit stores the patchsets under refs/changes/xx/xxx, and
Github stores the pull requests under refs/pull/xxx/head.

When cloning a repository with --bare, you don't fetch these references.
This patch uses --mirror for a full clone, in order to give the user
access to all references of the Git repository.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 0e6103b..357a558 100755
--- a/support/download/git
+++ b/support/download/git
@@ -43,7 +43,7 @@ if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    ${GIT} clone ${verbose} --bare "${repo}" "${basename}"
+    ${GIT} clone ${verbose} --mirror "${repo}" "${basename}"
 fi
 
 GIT_DIR="${basename}" \
-- 
2.6.2
