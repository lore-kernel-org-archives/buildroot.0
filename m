From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:22:28 +0200
Subject: [Buildroot] [git commit] download/git: try to recover from
 utterly-broken repositories
Message-ID: <20180501192232.54C9282627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7efb43e86da9699af94392f595a9e6421cbc958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases, the repository may be in a state we can't automatically
recover from, especially since we must still support oldish git versions
that do not provide the necessary commands or options thereof.

As a last-ditch recovery, delete the repository and recreate the cache
from scratch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index bd37a0a8d9..39e57aac34 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
-set -e
+set -E
 
 # Download helper for git, to be called from the download wrapper script
 #
@@ -16,6 +16,33 @@ set -e
 # Environment:
 #   GIT      : the git command to call
 
+# Save our path and options in case we need to call ourselves again
+myname="${0}"
+declare -a OPTS=("${@}")
+
+# This function is called when an error occurs. Its job is to attempt a
+# clone from scratch (only once!) in case the git tree is borked, or in
+# case an unexpected and unsupported situation arises with submodules
+# or uncommitted stuff (e.g. if the user manually mucked around in the
+# git cache).
+_on_error() {
+    local ret=${?}
+
+    printf "Detected a corrupted git cache.\n" >&2
+    if ${BR_GIT_BACKEND_FIRST_FAULT:-false}; then
+        printf "This is the second time in a row; bailing out\n" >&2
+        exit ${ret}
+    fi
+    export BR_GIT_BACKEND_FIRST_FAULT=true
+
+    printf "Removing it and starting afresh.\n" >&2
+
+    popd >/dev/null
+    rm -rf "${git_cache}"
+
+    exec "${myname}" "${OPTS[@]}" || exit ${ret}
+}
+
 verbose=
 recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -39,6 +66,9 @@ git_cache="${dl_dir}/git"
 mkdir -p "${git_cache}"
 pushd "${git_cache}" >/dev/null
 
+# Any error now should try to recover
+trap _on_error ERR
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _git() {
@@ -114,8 +144,9 @@ if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-# Check that the changeset does exist. If it does not, no reason to go
-# on, we can fast-track to the exit path.
+# Check that the changeset does exist. If it does not, re-cloning from
+# scratch won't help, so we don't want to trash the repository for a
+# missing commit. We just exit without going through the ERR trap.
 if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
     printf "Commit '%s' does not exist in this repository\n." "${cset}"
     exit 1
