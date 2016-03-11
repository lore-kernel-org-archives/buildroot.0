From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:32:05 +0100
Subject: [Buildroot] [PATCH 1/3] support/download/git: do not use bare clones
In-Reply-To: <cover.1457721001.git.yann.morin.1998@free.fr>
References: <cover.1457721001.git.yann.morin.1998@free.fr>
Message-ID: <f58852bfa4c80e8db66747b0c5e98fb614257657.1457721001.git.yann.morin.1998@free.fr>
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
probably, it is a sha1) and we defer the check to the checkout, which
would fail if the requested cset is missing anyway.

Furthermore, we can no longer rely on git to generate reproducible
tarballs, so we have to handle it all manually:
  - get the date of the commit to store in the archive,
  - store only numeric owners,
  - store owner and group as 0 (zero, although any arbitrary value
    would have been fine, as long as it's a constant),
  - sort the files to store in the archive.

Finally, we get rid of the .git directory as it is not very usefull in a
tarball.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note about removing .git : yes, we could keep it, at the expense of much
larger size of the generated archive. Some people would like the .git to
stay, to speed-up later downloads. However, there's no easy way we could
do that. For example:
  - clone foo-12345, keep the .git n the tarball
  - update buildroot
  - clone foo-98765
For that second clone, how could we know we have to extract foo-12345
first? So, the .git in the archive is pretty much useless for Buildroot.
---
 support/download/git | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/support/download/git b/support/download/git
index 314b388..5672217 100755
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
@@ -49,10 +49,33 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
+    _git clone ${verbose} "'${repo}'" "'${basename}'"
 fi
 
-GIT_DIR="${basename}" \
-_git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
+pushd "${basename}" >/dev/null
 
+# Try to get the special refs exposed by some forges (pull-requests for
+# github, changes for gerrit...). There is no easy way to know whether
+# the cset the user passed us is such a special ref or a tag or a sha1
+# or whatever else. We'll eventually fail at checking out that cset,
+# below, if there is an issue anyway. Since most of the cset we're gonna
+# have to clone are not such special refs, consign the output to oblivion
+# so as not to alarm unsuspecting users, but still trace it as a warning.
+if ! _git fetch "'${cset}:${cset}'" >/dev/null 2>&1; then
+    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
+fi
+
+# Checkout the required changeset.
+_git checkout -q "'${cset}'"
+
+# Get date of commit to generate a reproducible archive.
+date="$( _git show --no-patch --pretty=format:%cD )"
+
+# We do not need the .git dir to generate the tarball
+rm -rf .git
+
+popd >/dev/null
+
+tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+         -T <(find "${basename}" -not -type d |sort) >"${output}.tmp"
 gzip -n <"${output}.tmp" >"${output}"
-- 
1.9.1
