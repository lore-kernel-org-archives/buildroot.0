From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  6 Aug 2014 00:56:54 +0200
Subject: [Buildroot] [PATCH v2] support/download: fix the git helper
Message-ID: <1407279414-26210-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-add the git_done variable (lost in commit [1])
and change result file from 'output.gz' to 'output'.

Fixes download problem reported by Rohit Kumar [2].

[1] http://git.buildroot.net/buildroot/commit/?id=7e40a1103a919a8177f00ddca2b46b4439953511
[2] http://lists.busybox.net/pipermail/buildroot/2014-August/103733.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>

---
Change v1->v2:
  - produce file 'output' instead of 'output.gz'
---
 support/download/git | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 6edaa90..47e1e52 100755
--- a/support/download/git
+++ b/support/download/git
@@ -19,6 +19,7 @@ basename="${4}"
 
 # Try to see if we can do a shallow clone, since it is faster
 # than a full clone.
+git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
     if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
@@ -33,6 +34,4 @@ if [ ${git_done} -eq 0 ]; then
 fi
 
 GIT_DIR="${basename}" \
-${GIT} archive --prefix="${basename}/" -o "${output}" --format=tar "${cset}"
-
-gzip "${output}"
+${GIT} archive --prefix="${basename}/" -o "${output}" --format=tar.gz "${cset}"
-- 
1.8.1.4
