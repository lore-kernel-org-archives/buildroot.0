From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:26:48 +0200
Subject: [Buildroot] [git commit] support/download: fix the git helper
Message-ID: <20140708222427.C47389D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebe6154ff4b2a7399f6d3b66dba01c71237cf133
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When switching the git helper over to a shell script, a special case was
not carried over: in case the remote has the required reference, we
attempt a shallow clone, using --depth 1. However, this is not supported
when the remote is accessed with the http protocol.

Therefore, the download fails.

What happened before the conversion to a shell script was that the helper
in the Makefile would fallback to doing a full-clone.

This is the case and behaviour that were lost in the conversion.

To avoid making the script too complex, we only attempt a full clone if
needed. And we decide that a full clone is needed by default; we decide
it is unnecessary if the remote has the needed reference *and* the
shallow clone was successful.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index badb491..116e5a9 100755
--- a/support/download/git
+++ b/support/download/git
@@ -33,10 +33,14 @@ cd "${BUILD_DIR}"
 # Remove leftovers from a previous failed run
 rm -rf "${repodir}"
 
+git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"
-else
+    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"; then
+        git_done=1
+    fi
+fi
+if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
     ${GIT} clone --bare "${repo}" "${repodir}"
 fi
