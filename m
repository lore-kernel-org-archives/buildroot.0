From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jul 2014 23:44:36 +0200
Subject: [Buildroot] [PATCH 5/6 v2] support/download: only create final temp
	file when needed
In-Reply-To: <cover.1404769268.git.yann.morin.1998@free.fr>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <c3e279af897c67750241863d1a18d159019bbd44.1404769268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create the temp file in the final location only when it is needed.

This avoids the nasty experience of seeing lots of temp files in
BR2_DL_DIR, that would linger around in case the downloads fails.

Add a comment on why we don't clean-up after git.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - fold the git comment in this commit
---
 support/download/bzr  | 2 +-
 support/download/cvs  | 2 +-
 support/download/git  | 7 +++++--
 support/download/hg   | 2 +-
 support/download/scp  | 2 +-
 support/download/svn  | 2 +-
 support/download/wget | 2 +-
 7 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index f86fa82..a2cb440 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -17,7 +17,6 @@ rev="${2}"
 output="${3}"
 
 tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
@@ -27,6 +26,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/cvs b/support/download/cvs
index a8ab080..22863d8 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -21,7 +21,6 @@ basename="${4}"
 output="${5}"
 
 repodir="${basename}.tmp-cvs-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 cd "${BUILD_DIR}"
 # Remove leftovers from a previous failed run
@@ -36,6 +35,7 @@ rm -rf "${repodir}"
 ret=1
 if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
            co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if tar czf - "${repodir}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/git b/support/download/git
index bc5aabc..e8e9055 100755
--- a/support/download/git
+++ b/support/download/git
@@ -19,8 +19,6 @@ basename="${3}"
 output="${4}"
 
 repodir="${basename}.tmp-git-checkout"
-tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
@@ -33,6 +31,9 @@ cd "${BUILD_DIR}"
 # Remove leftovers from a previous failed run
 rm -rf "${repodir}"
 
+# Upon failure, git cleans behind itself, so no need to catch failures
+# here. The only case when git would not clean up, is if it gets killed
+# with SIGKILL, which is user-initiated, so we let the user handle that.
 git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
@@ -47,8 +48,10 @@ fi
 
 ret=1
 pushd "${repodir}" >/dev/null
+tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 if ${GIT} archive --prefix="${basename}/" --format=tar "${cset}" \
                   >"${tmp_tar}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if gzip -c "${tmp_tar}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/hg b/support/download/hg
index 8b36db9..7e5c9eb 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -19,7 +19,6 @@ basename="${3}"
 output="${4}"
 
 repodir="${basename}.tmp-hg-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 cd "${BUILD_DIR}"
 # Remove leftovers from a previous failed run
@@ -33,6 +32,7 @@ rm -rf "${repodir}"
 
 ret=1
 if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if ${HG} archive --repository "${repodir}" --type tgz \
                      --prefix "${basename}" --rev "${cset}" \
                      - >"${tmp_output}"; then
diff --git a/support/download/scp b/support/download/scp
index e16ece5..1cc18de 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -13,10 +13,10 @@ set -e
 url="${1}"
 output="${2}"
 tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${SCP} "${url}" "${tmp_dl}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/svn b/support/download/svn
index 259d3ed..232d887 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -19,7 +19,6 @@ basename="${3}"
 output="${4}"
 
 repodir="${basename}.tmp-svn-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 cd "${BUILD_DIR}"
 # Remove leftovers from a previous failed run
@@ -33,6 +32,7 @@ rm -rf "${repodir}"
 
 ret=1
 if ${SVN} export "${repo}@${rev}" "${repodir}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if tar czf - "${repodir}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/wget b/support/download/wget
index 0f71108..e961d71 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -15,7 +15,6 @@ url="${1}"
 output="${2}"
 
 tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 # Play tic-tac-toe with temp files
 # - first, we download to a trashable location (the build-dir)
@@ -25,6 +24,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${WGET} -O "${tmp_dl}" "${url}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
     if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
-- 
1.9.1
