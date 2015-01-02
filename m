From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Jan 2015 16:53:39 +0100
Subject: [Buildroot] [PATCH 1/3 v10] support/download: support -q in all
	download backends
In-Reply-To: <cover.1420213948.git.yann.morin.1998@free.fr>
References: <cover.1420213948.git.yann.morin.1998@free.fr>
Message-ID: <21a2668944b8b10698608dfedff20e233ad09662.1420213948.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option flag to all backends, as well as the check-hash script, so
as to silence download helpers when the user wants a silent build.

Additionaly, make the default be verbose.

Inspired by Fabio's patch on git/svn.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>

---
Note: cvs, cp and scp are not tested, because we do not have in-tree
packages using those transport methods.
---
 support/download/bzr        | 23 ++++++++++++++++-------
 support/download/check-hash |  8 ++++++++
 support/download/cp         | 20 +++++++++++++++-----
 support/download/cvs        | 23 +++++++++++++++--------
 support/download/git        | 24 ++++++++++++++++--------
 support/download/hg         | 24 ++++++++++++++++--------
 support/download/scp        | 20 +++++++++++++++-----
 support/download/svn        | 22 +++++++++++++++-------
 support/download/wget       | 20 +++++++++++++++-----
 9 files changed, 131 insertions(+), 53 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index c157ca8..5819ac7 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -4,17 +4,26 @@
 set -e
 
 # Download helper for bzr, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: bzr repo
-#   $3: bzr revision
-#   $4: basename
-# And this environment:
+#
+# Call it as:
+#   .../bzr [-q] OUT_FILE REPO_URL REV BASENAME
+#
+# Environemnt:
 #   BZR      : the bzr command to call
 
+
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 rev="${3}"
 basename="${4}"
 
-${BZR} export --root="${basename}/" --format=tgz "${output}" "${repo}" -r "${rev}"
+${BZR} export ${verbose} --root="${basename}/" --format=tgz "${output}" "${repo}" -r "${rev}"
diff --git a/support/download/check-hash b/support/download/check-hash
index b59fd2a..4c07274 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -10,6 +10,14 @@ set -e
 #       saved as, to be able to match it to the corresponding hashes
 #       in the .hash file
 
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  exec >/dev/null;;
+    \?) exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 h_file="${1}"
 file="${2}"
 base="${3}"
diff --git a/support/download/cp b/support/download/cp
index 463fc38..132cad7 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -4,13 +4,23 @@
 set -e
 
 # Download helper for cp, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: source file
-# And this environment:
+#
+# Call it as:
+#   .../cp [-q] OUT_FILE SRC_FILE
+#
+# Environment:
 #   LOCALFILES: the cp command to call
 
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 source="${2}"
 
-${LOCALFILES} "${source}" "${output}"
+${LOCALFILES} ${verbose} "${source}" "${output}"
diff --git a/support/download/cvs b/support/download/cvs
index 56a11c2..2c3a666 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -4,22 +4,29 @@
 set -e
 
 # Download helper for cvs, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: cvs repo
-#   $3: cvs revision
-#   $4: package's name (eg. foobar)
-#   $5: package's basename (eg. foobar-1.2.3)
-# And this environment:
+#
+# Call it as:
+#   .../cvs [-q] OUT_FILE CVS_URL REV PKG_NAME BASENAME
+#
+# Environment:
 #   CVS      : the cvs command to call
 
+verbose=
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-Q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 rev="${3}"
 rawname="${4}"
 basename="${5}"
 
-${CVS} -z3 -d":pserver:anonymous@${repo}" \
+${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
        co -d "${basename}" -r ":${rev}" -P "${rawname}"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/git b/support/download/git
index 5d36ca4..7f1801f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -4,14 +4,22 @@
 set -e
 
 # Download helper for git, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: git repo
-#   $3: git cset
-#   $4: package's basename (eg. foobar-1.2.3)
-# And this environment:
+#
+# Call it as:
+#   .../git [-q] OUT_FILE REPO_URL CSET BASENAME
+#
+# Environment:
 #   GIT      : the git command to call
 
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 cset="${3}"
@@ -22,7 +30,7 @@ basename="${4}"
 git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
+    if ${GIT} clone ${verbose} --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
@@ -30,7 +38,7 @@ if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    ${GIT} clone --bare "${repo}" "${basename}"
+    ${GIT} clone ${verbose} --bare "${repo}" "${basename}"
 fi
 
 GIT_DIR="${basename}" \
diff --git a/support/download/hg b/support/download/hg
index 66bd2ed..f6880fa 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -4,21 +4,29 @@
 set -e
 
 # Download helper for hg, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: hg repo
-#   $3: hg cset
-#   $4: package's basename (eg. foobar-1.2.3)
-# And this environment:
+#
+# Call it as:
+#   .../hg [-q] OUT_FILE REPO_URL CSET BASENAME
+#
+# Environment:
 #   HG       : the hg command to call
 
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 cset="${3}"
 basename="${4}"
 
-${HG} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
+${HG} clone ${verbose} --noupdate --rev "${cset}" "${repo}" "${basename}"
 
-${HG} archive --repository "${basename}" --type tgz \
+${HG} archive ${verbose} --repository "${basename}" --type tgz \
               --prefix "${basename}" --rev "${cset}" \
               "${output}"
diff --git a/support/download/scp b/support/download/scp
index f3e92f3..3d6876f 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -4,13 +4,23 @@
 set -e
 
 # Download helper for scp, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: URL
-# And this environment:
+#
+# Call it as:
+#   .../scp [-q] OUT_FILE SRC_URL
+#
+# Environment:
 #   SCP       : the scp command to call
 
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 url="${2}"
 
-${SCP} "${url}" "${output}"
+${SCP} ${verbose} "${url}" "${output}"
diff --git a/support/download/svn b/support/download/svn
index a960f7d..558bca0 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -4,19 +4,27 @@
 set -e
 
 # Download helper for svn, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: svn repo
-#   $3: svn revision
-#   $4: package's basename (eg. foobar-1.2.3)
-# And this environment:
+#
+# Call it as:
+#   .../svn [-q] OUT_FILE REPO_URL REV BASNAME
+#
+# Environment:
 #   SVN      : the svn command to call
 
+verbose=
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 repo="${2}"
 rev="${3}"
 basename="${4}"
 
-${SVN} export "${repo}@${rev}" "${basename}"
+${SVN} export ${verbose} "${repo}@${rev}" "${basename}"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/wget b/support/download/wget
index 6b73726..7eb21a4 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -4,13 +4,23 @@
 set -e
 
 # Download helper for wget, to be called from the download wrapper script
-# Expected arguments:
-#   $1: output file
-#   $2: URL
-# And this environment:
+#
+# Call it as:
+#   .../wget [-q] OUT_FILE URL
+#
+# Environment:
 #   WGET     : the wget command to call
 
+verbose=-v
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
 output="${1}"
 url="${2}"
 
-${WGET} -O "${output}" "${url}"
+${WGET} ${verbose} -O "${output}" "${url}"
-- 
1.9.1
