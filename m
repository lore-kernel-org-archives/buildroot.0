From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 21:44:08 +0200
Subject: [Buildroot] [PATCH 4/7 v3] download/git: try to recover from
 utterly-broken repositories
In-Reply-To: <cover.1524426211.git.yann.morin.1998@free.fr>
References: <cover.1524426211.git.yann.morin.1998@free.fr>
Message-ID: <e78c3488487215f634d26e3867536127c3656bf3.1524426211.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 support/download/git | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index bd37a0a8d9..921a35998b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -16,6 +16,33 @@ set -e
 # Environment:
 #   GIT      : the git command to call
 
+# Save out path and options in case we need to call ourselves again
+myname="${0}"
+declare -a OPTS=("${@}")
+
+# This function is called when an error occurs. Its job is to attempt a
+# clone from scratch (only once!) in case the git tree is borked, or in
+# case an unexpected and unsupported situation arises with submodules
+# or uncomitted stuff (e.g. if the user manually mucked around in the
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
-- 
2.14.1
