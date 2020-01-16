From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 16 Jan 2020 13:38:50 -0600
Subject: [Buildroot] [PATCH 2/4] support/download/git: support download
 features
In-Reply-To: <20200116193852.17683-1-vfazio@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
Message-ID: <20200116193852.17683-2-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initial support is limited to submodules.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/download/git | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/download/git b/support/download/git
index 075f665bbf..eb1778a2f9 100755
--- a/support/download/git
+++ b/support/download/git
@@ -43,8 +43,16 @@ _on_error() {
     exec "${myname}" "${OPTS[@]}" || exit ${ret}
 }
 
+feature_requested() {
+    local feature="${1}"
+    local features_requested="${2}"
+
+    grep -qow "${feature}" <<<"${features_requested}"
+}
+
 verbose=
 recurse=0
+features=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
@@ -54,6 +62,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     c)  cset="${OPTARG}";;
     d)  dl_dir="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    x)  features="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
@@ -75,6 +84,9 @@ _git() {
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
+# check for requested features we support
+if feature_requested "submodules" "${features}"; then recurse=1; fi
+
 # Create a warning file, that the user should not use the git cache.
 # It's ours. Our precious.
 cat <<-_EOF_ >"${dl_dir}/git.readme"
-- 
2.25.0
