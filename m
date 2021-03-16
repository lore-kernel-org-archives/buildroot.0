From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 23:26:12 +0100
Subject: [Buildroot] [git commit] support/download: rename internal
 'verbose' variable where applicable
Message-ID: <20210316220247.ECA3E880C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3300788ce072cd8ca582f9ceb127451bff3f767b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most 'verbose' variable inside the download helpers actually mean 'quiet'.
I.e. they are assigned in case quiet operation is requested, and empty in
case of non-quiet operation. Using the name 'verbose' for such a variable is
confusing, especially when you want to test the variable on emptiness or
non-emptiness (in a subsequent commit).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/bzr  | 6 +++---
 support/download/cvs  | 6 +++---
 support/download/git  | 4 ++--
 support/download/hg   | 8 ++++----
 support/download/scp  | 6 +++---
 support/download/svn  | 6 +++---
 support/download/wget | 6 +++---
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 5289a421cd..7cc6890a30 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -16,10 +16,10 @@ set -e
 #   BZR      : the bzr command to call
 
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  quiet=-q;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -53,6 +53,6 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
     timestamp_opt="--per-file-timestamps"
 fi
 
-_bzr export ${verbose} --root="'${basename}/'" --format=tgz \
+_bzr export ${quiet} --root="'${basename}/'" --format=tgz \
     ${timestamp_opt} - "${@}" "'${uri}'" -r "'${cset}'" \
     >"${output}"
diff --git a/support/download/cvs b/support/download/cvs
index 9d0dc3cb3a..463d70c220 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -16,10 +16,10 @@ set -e
 # Environment:
 #   CVS      : the cvs command to call
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-Q;;
+    q)  quiet=-Q;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG#*://}";;
     c)  rev="${OPTARG}";;
@@ -57,7 +57,7 @@ if [[ ! "${uri}" =~ ^: ]]; then
 fi
 
 export TZ=UTC
-_cvs ${verbose} -z3 -d"'${uri}'" \
+_cvs ${quiet} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/git b/support/download/git
index fa98198fe0..01e0f214cf 100755
--- a/support/download/git
+++ b/support/download/git
@@ -50,11 +50,11 @@ _on_error() {
     exec "${myname}" "${OPTS[@]}" || exit ${ret}
 }
 
-verbose=
+quiet=
 recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q; exec >/dev/null;;
+    q)  quiet=-q; exec >/dev/null;;
     r)  recurse=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
diff --git a/support/download/hg b/support/download/hg
index efb515fca5..c8149c9c91 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -15,10 +15,10 @@ set -e
 # Environment:
 #   HG       : the hg command to call
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  quiet=-q;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -36,8 +36,8 @@ _hg() {
     eval ${HG} "${@}"
 }
 
-_hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
+_hg clone ${quiet} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
-_hg archive ${verbose} --repository "'${basename}'" --type tgz \
+_hg archive ${quiet} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
             - >"${output}"
diff --git a/support/download/scp b/support/download/scp
index 80cf495c4e..636d66c66a 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -14,10 +14,10 @@ set -e
 # Environment:
 #   SCP       : the scp command to call
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  quiet=-q;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -37,4 +37,4 @@ _scp() {
 # Remove any scheme prefix
 uri="${uri##scp://}"
 
-_scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
+_scp ${quiet} "${@}" "'${uri}/${filename}'" "'${output}'"
diff --git a/support/download/svn b/support/download/svn
index 75bf9ab3b2..395c92594f 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -22,10 +22,10 @@ set -e
 
 . "${0%/*}/helpers"
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  quiet=-q;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
@@ -43,7 +43,7 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export --ignore-keywords ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
+_svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 # Get the date of the revision, to generate reproducible archives.
 # The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
diff --git a/support/download/wget b/support/download/wget
index c69e6071aa..1bcb1e4b00 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -15,10 +15,10 @@ set -e
 # Environment:
 #   WGET     : the wget command to call
 
-verbose=
+quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  quiet=-q;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
@@ -40,4 +40,4 @@ _wget() {
 # mirror
 [ -n "${encode}" ] && filename=${filename//\?/%3F}
 
-_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
+_wget ${quiet} "${@}" -O "'${output}'" "'${url}/${filename}'"
