From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 18:52:44 +0100
Subject: [Buildroot] [git commit branch/next] support/download: fetch all
	refs on full git clone
Message-ID: <20151129175259.1E1AA8164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8b8251a921a7fa4e05b545e503cfc4e736d1d0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When specifying BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, a user may want to
specify the SHA of a reference different than a branch or tag.

For instance, Gerrit stores the patchsets under refs/changes/xx/xxx, and
Github stores the pull requests under refs/pull/xxx/head.

When cloning a repository with --bare, you don't fetch these references.
This patch uses --mirror for a full clone, in order to give the user
access to all references of the Git repository.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
