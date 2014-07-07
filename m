From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jul 2014 23:44:37 +0200
Subject: [Buildroot] [PATCH 6/6 v2] support/download: rationalise naming and
	use of the temporary files
In-Reply-To: <cover.1404769268.git.yann.morin.1998@free.fr>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <b16d43fcd8082ce3444c04e8db2ef2e896b40834.1404769268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we have temporary files to store 'downloaded' files or
repositories, and they all are created using 'mktemp .XXXXXX'.
Also, temporary repositories are named in a inconsistent manner.

This poses a problem in case something goes wrong: it is not possible
to easily see what temp file corresponds to what attempted download.

Make all this a bit more homogeneous:
  - name the temporary files and directories after the final file,
    with this mktemp pattern:   ${BUILD_DIR}/.${output##*/}.XXXXXX

This ensures it is easy to correlate a temp file or dir to the
associated download attempt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Notes:
  - I was not able to test those helpers, because we have no package
    using them: cp, cvs, scp;
  - I tested bzr with our sole package using bazaar, so corner cases
    might spring to our attention at unexpected times;
  - the cvs helper uses a little trick, due to the fact that cvs is
    so ancient it has never learned the ability to generate archives
    on its own.

Tested with this defconfig, which exercises all possible helpers:
    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y            # wget
    BR2_PACKAGE_DVB_APPS=y              # hg
    BR2_PACKAGE_DTV_SCAN_TABLES=y       # git
    BR2_PACKAGE_FIS=y                   # svn
    BR2_PACKAGE_PYTHON=y                # wget, needed for pynfc:
    BR2_PACKAGE_PYTHON_NFC=y            # bzr

---
Changes v1 -> v2:
  - remove left-over hunk in cvs helper
  - fix double-dot in scp helper
  - use the tar transform trick in svn helper, too
---
 support/download/bzr  |  3 +--
 support/download/cvs  | 17 ++++++++++-------
 support/download/git  |  7 +------
 support/download/hg   |  7 +------
 support/download/scp  |  4 +++-
 support/download/svn  | 19 +++++++++++--------
 support/download/wget |  3 +--
 7 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index a2cb440..ff01bff 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -16,8 +16,6 @@ repo="${1}"
 rev="${2}"
 output="${3}"
 
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - the we move to a temp file in the final location, so it is
@@ -25,6 +23,7 @@ tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 # - finally, we atomically rename to the final file
 
 ret=1
+tmp_dl="$( mktemp "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
diff --git a/support/download/cvs b/support/download/cvs
index 22863d8..b580eda 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -20,23 +20,26 @@ rawname="${3}"
 basename="${4}"
 output="${5}"
 
-repodir="${basename}.tmp-cvs-checkout"
-
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - then we create a temporary tarball in the final location, so it is
 #   on the same filesystem as the final file
 # - finally, we atomically rename to the final file
 
+# Since cvs by itself is not capable of generating archives, we use
+# a little trick of tar, to transform the filenames as they are being
+# added to the archive, by replacing the leadin '.' with the basename
+# of the package. Note: basename is just that, a basename, so it does
+# not contain any '/', so we need not escape them for the transform
+# expression.
+
 ret=1
+repodir="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
            co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
-    if tar czf - "${repodir}" >"${tmp_output}"; then
+    if tar czf - -C "${repodir}" --transform "s/^\./${basename}/;" . \
+           >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/git b/support/download/git
index e8e9055..c53d87f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -18,8 +18,6 @@ cset="${2}"
 basename="${3}"
 output="${4}"
 
-repodir="${basename}.tmp-git-checkout"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - then we create the uncomporessed tarball in tht same trashable location
@@ -27,14 +25,11 @@ repodir="${basename}.tmp-git-checkout"
 #   it is on the same filesystem as the final file
 # - finally, we atomically rename to the final file
 
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
 # Upon failure, git cleans behind itself, so no need to catch failures
 # here. The only case when git would not clean up, is if it gets killed
 # with SIGKILL, which is user-initiated, so we let the user handle that.
 git_done=0
+repodir="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
     if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"; then
diff --git a/support/download/hg b/support/download/hg
index 7e5c9eb..104d034 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -18,12 +18,6 @@ cset="${2}"
 basename="${3}"
 output="${4}"
 
-repodir="${basename}.tmp-hg-checkout"
-
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - then we create a temporary tarball in the final location, so it is
@@ -31,6 +25,7 @@ rm -rf "${repodir}"
 # - finally, we atomically rename to the final file
 
 ret=1
+repodir="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
     if ${HG} archive --repository "${repodir}" --type tgz \
diff --git a/support/download/scp b/support/download/scp
index 1cc18de..6aa3a23 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -12,9 +12,11 @@ set -e
 
 url="${1}"
 output="${2}"
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+tmp_dl="$( mktemp "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 
 ret=1
+# Note: it looks like scp does not unlink the destination,
+# which is what we want (observed by stracing scp.)
 if ${SCP} "${url}" "${tmp_dl}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
diff --git a/support/download/svn b/support/download/svn
index 232d887..7a46d0f 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -18,22 +18,25 @@ rev="${2}"
 basename="${3}"
 output="${4}"
 
-repodir="${basename}.tmp-svn-checkout"
-
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - then we create a temporary tarball in the final location, so it is
 #   on the same filesystem as the final file
 # - finally, we atomically rename to the final file
 
+# Since svn by itself is not capable of generating archives, we use
+# a little trick of tar, to transform the filenames as they are being
+# added to the archive, by replacing the leadin '.' with the basename
+# of the package. Note: basename is just that, a basename, so it does
+# not contain any '/', so we need not escape them for the transform
+# expression.
+
 ret=1
-if ${SVN} export "${repo}@${rev}" "${repodir}"; then
+repodir="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
+if ${SVN} export --force "${repo}@${rev}" "${repodir}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
-    if tar czf - "${repodir}" >"${tmp_output}"; then
+    if tar czf - -C "${repodir}" --transform "s/^\./${basename}/;" . \
+           >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/wget b/support/download/wget
index e961d71..9bb6700 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -14,8 +14,6 @@ set -e
 url="${1}"
 output="${2}"
 
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
 # - then we copy to a temporary tarball in the final location, so it is
@@ -23,6 +21,7 @@ tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 # - finally, we atomically rename to the final file
 
 ret=1
+tmp_dl="$( mktemp "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
 if ${WGET} -O "${tmp_dl}" "${url}"; then
     tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
-- 
1.9.1
