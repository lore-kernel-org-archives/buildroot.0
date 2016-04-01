From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Apr 2016 22:25:28 +0200
Subject: [Buildroot] [PATCH 1/4 v2] support/download/git: do not use bare
	clones
In-Reply-To: <cover.1459541702.git.yann.morin.1998@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
Message-ID: <46bd01446c4d29cc9420380986b1a498a8606375.1459541702.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we are using bare clones, so as to minimise the disk usage,
most notably for largeish repositories such as the one for the Linux
kernel, which can go beyond the 1GiB barrier.

However, this precludes updating (and thus using) the submodules, if
any, of the repositories, as a working copy is required to use
submodules (becaue we need to know the list of submodules, where to find
them, where to clone them, what cset to checkout, and all those is
dependent upon the checked out cset of the father repository).

Switch to using /plain/ clones with a working copy.

This means that the extra refs used by some forges (like pull-requests
for Github, or changes for gerrit...) are no longer fetched as part of
the clone, because git does not offer to do a mirror clone when there is
a working copy.

Instead, we have to fetch those special refs by hand. Since there is no
easy solution to know whether the cset the user asked for is such a
special ref or not, we just try to always fetch the cset requested by
the user; if this fails, we assume that this is not a special ref (most
probably, it is a sha1) and we defer the check to the archive creation,
which would fail if the requested cset is missing anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/git | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 314b388..20b436e 100755
--- a/support/download/git
+++ b/support/download/git
@@ -41,7 +41,7 @@ _git() {
 git_done=0
 if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if _git clone ${verbose} --depth 1 -b "'${cset}'" --bare "'${repo}'" "'${basename}'"; then
+    if _git clone ${verbose} --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
@@ -49,10 +49,25 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
+    _git clone ${verbose} "'${repo}'" "'${basename}'"
+fi
+
+pushd "${basename}" >/dev/null
+
+# Try to get the special refs exposed by some forges (pull-requests for
+# github, changes for gerrit...). There is no easy way to know whether
+# the cset the user passed us is such a special ref or a tag or a sha1
+# or whatever else. We'll eventually fail at checking out that cset,
+# below, if there is an issue anyway. Since most of the cset we're gonna
+# have to clone are not such special refs, consign the output to oblivion
+# so as not to alarm unsuspecting users, but still trace it as a warning.
+if ! _git fetch "'${cset}:${cset}'" >/dev/null 2>&1; then
+    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-GIT_DIR="${basename}" \
 _git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
 
+# Not really required, but here for consistency
+popd >/dev/null
+
 gzip -n <"${output}.tmp" >"${output}"
-- 
1.9.1
