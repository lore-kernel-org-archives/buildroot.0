From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 11:07:51 +0200
Subject: [Buildroot] [PATCH 2/6 v2] download/git: try to recover from
 utterly-broken repositories
In-Reply-To: <cover.1524388060.git.yann.morin.1998@free.fr>
References: <cover.1524388060.git.yann.morin.1998@free.fr>
Message-ID: <8f347509db00c8c2108a5a9fef1b8862fcf3b8b0.1524388060.git.yann.morin.1998@free.fr>
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
 support/download/git | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/download/git b/support/download/git
index 19a3e8ebee..ebd04bc7b3 100755
--- a/support/download/git
+++ b/support/download/git
@@ -16,6 +16,30 @@ set -e
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
+    if ${BR_GIT_BACKEND_FIRST_FAULT:-false}; then
+        printf "Double-fault in git-cache"
+        exit ${ret}
+    fi
+    export BR_GIT_BACKEND_FIRST_FAULT=true
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
@@ -39,6 +63,9 @@ git_cache="${dl_dir}/git"
 mkdir -p "${git_cache}"
 pushd "${git_cache}" >/dev/null
 
+# Any error now should try to recover
+trap _on_error ERR
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _git() {
-- 
2.14.1
