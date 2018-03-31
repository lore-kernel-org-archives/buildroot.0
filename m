From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:24:07 +0200
Subject: [Buildroot] [v3 13/13] download: git: introduce cache feature
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-13-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now we keep the git clone that we download and generates our tarball
from there.
The main goal here is that if you change the version of a package (say
Linux), instead of cloning all over again, you will simply 'git fetch'
from the repo the missing objects, then generates the tarball again.

This should speed the 'source' part of the build significantly.

The drawback is that the DL_DIR will grow much larger; but time is more
important than disk space nowadays.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
   - Fix bad regex in the 'transform' option of tar (found by Peter
   Seiderer)
v2 -> v3:
   - Change git fetch origin to use the uri of the package instead of
   the name of the default remote 'origin' (Thomas Petazzoni)
---
 support/download/git | 70 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/support/download/git b/support/download/git
index 58a2c6ad9d..301f7e792a 100755
--- a/support/download/git
+++ b/support/download/git
@@ -39,28 +39,34 @@ _git() {
     eval ${GIT} "${@}"
 }
 
-# Try a shallow clone, since it is faster than a full clone - but that only
-# works if the version is a ref (tag or branch). Before trying to do a shallow
-# clone we check if ${cset} is in the list provided by git ls-remote. If not
-# we fall back on a full clone.
-#
-# Messages for the type of clone used are provided to ease debugging in case of
-# problems
-git_done=0
-if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${basename}'"; then
-        git_done=1
-    else
-        printf "Shallow clone failed, falling back to doing a full clone\n"
+# We want to check if a cache of the git clone of this repo already exists.
+git_cache="${BR2_DL_DIR}/${basename%%-*}/git"
+
+# If the cache directory already exists, don't try to clone.
+if [ ! -d "${git_cache}" ]; then
+    # Try a shallow clone, since it is faster than a full clone - but that
+    # only works if the versionis a ref (tag or branch). Before trying to do a
+    # shallow clone we check if ${cset} is in the list provided by git
+    # ls-remote. If not we fall back on a full clone.
+    #
+    # Messages for the type of clone used are provided to ease debugging in
+    # case of problems
+    git_done=0
+    if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
+        printf "Doing shallow clone\n"
+        if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${git_cache}'"; then
+            git_done=1
+        else
+            printf "Shallow clone failed, falling back to doing a full clone\n"
+        fi
+    fi
+    if [ ${git_done} -eq 0 ]; then
+        printf "Doing full clone\n"
+        _git clone ${verbose} "${@}" "'${uri}'" "'${git_cache}'"
     fi
-fi
-if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    _git clone ${verbose} "${@}" "'${uri}'" "'${basename}'"
 fi
 
-pushd "${basename}" >/dev/null
+pushd "${git_cache}" >/dev/null
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
@@ -69,7 +75,7 @@ pushd "${basename}" >/dev/null
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch "'${uri}'" "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
@@ -86,20 +92,24 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not want the .git dir; we keep other .git files, in case they
-# are the only files in their directory.
+# Generate the archive, sort with the C locale so that it is reproducible
+# We do not want the .git dir; we keep other .git
+# files, in case they are the only files in their directory.
 # The .git dir would generate non reproducible tarballs as it depends on
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
-rm -rf .git
+find . -not -type d \
+	-and -not -path "./.git/*" >"${BR2_DL_DIR}/${basename}.list"
+LC_ALL=C sort <"${BR2_DL_DIR}/${basename}.list" >"${BR2_DL_DIR}/${basename}.list.sorted"
 
-popd >/dev/null
-
-# Generate the archive, sort with the C locale so that it is reproducible
-find "${basename}" -not -type d >"${basename}.list"
-LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
-         -T "${basename}.list.sorted" >"${output}.tar"
+tar cf - --transform="s/^\.$/${basename}/" \
+	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+         -T "${BR2_DL_DIR}/${basename}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
+
+rm -f "${BR2_DL_DIR}/${basename}.list"
+rm -f "${BR2_DL_DIR}/${basename}.list.sorted"
+
+popd >/dev/null
-- 
2.16.2
