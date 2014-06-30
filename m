From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:29 +0200
Subject: [Buildroot] [PATCH 11/14] pkg-infra: don't use DL_DIR as scratchpad
	for temporary downloads
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <411f011145e1194c3f07baa1cdffb6f69b8b1969.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DL_DIR can be a very precious place for some users: they use it to store
all the downloaded archives to share across all their Buildroot (and
maybe non-Buildroot) builds.

We do not want to trash this location with our temporary downloads (e.g.
git, Hg, svn, cvs repository clones/checkouts, or wget, bzr tep tarballs).

Turns out that we already have some kind of scratchpad, the BUILD_DIR.
Although it is not really a disposable location, that's the best we have
so far.

Also, we create the temporary tarballs with mktemp using the final tarrball,
as template, since we want the temporary to be on the same filesystem as
the final location, so the 'mv' is just a plain, atomic rename(2), and we
are not left with a half-copied file as the final location.

Using mktemp ensures all temp file names are unique, so it allows for
parallel downloads from different build dirs at the same time, without
cloberring each downloads.

Note: we're using neither ${TMP} nor ${TMPDIR} since they are shared
locations, sometime with little place (eg. tmpfs), and some of the
repositories we clone/checkout can be very big.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tested a particular scenario that used to fail: two separate builds
using a shared DL_DIR, ccache enabled, so that they run almost
synchronously. These would download the same file at the same time,
corrupting each other. With the patches in this series, all works
fine.]

---
Change v7 -> v8:
  - use a cleaner and saner code path to detect errors
  - convert the cp and scp helpers, too  (Thomas DS)

Changes v6 -> v7:
  - drop leftovers from a previous attempt in bzr  (Thomas)

Changes v5 -> v6:
  - ensure we can do parallel downloads from multiple build-dirs  (Thomas)

Changes v4 -> v5
  - explain why we create the temp files where we create them  (Arnout)

Changes v3 -> v4:
  - remove spurious bump in package/fis  (Samuel)
---
 support/download/bzr  | 25 ++++++++++++++++++++++---
 support/download/cp   | 12 +++++++++++-
 support/download/cvs  | 34 +++++++++++++++++++++++++++-------
 support/download/git  | 33 ++++++++++++++++++++++++++-------
 support/download/hg   | 35 ++++++++++++++++++++++++++++-------
 support/download/scp  | 14 +++++++++++++-
 support/download/svn  | 33 ++++++++++++++++++++++++++-------
 support/download/wget | 26 ++++++++++++++++++++------
 8 files changed, 173 insertions(+), 39 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 68121f4..2a927d6 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -9,11 +9,30 @@ set -e
 #   $2: bzr revision
 #   $3: output file
 # And this environment:
-#   BZR       : the bzr command to call
-#   BR2_DL_DIR: path to Buildroot's download dir
+#   BZR      : the bzr command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 repo="${1}"
 rev="${2}"
 output="${3}"
 
-${BZR} export "${output}" "${repo}" -r "${rev}"
+tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - the we move to a temp file in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+ret=1
+if ${BZR} export "${tmp_dl}" "${repo}" -r "${rev}"; then
+    if mv "${tmp_dl}" "${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
+
+# Cleanup
+rm -f "${tmp_dl}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/cp b/support/download/cp
index d820846..eeb5856 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -13,4 +13,14 @@ set -e
 source="${1}"
 output="${2}"
 
-${LOCALFILES} "${source}" "${output}"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+ret=1
+if ${LOCALFILES} "${source}" "${tmp_output}"; then
+    mv "${tmp_output}" "${output}"
+    ret=0
+fi
+
+# Cleanup
+rm -f "${tmp_output}"
+exit ${ret}
diff --git a/support/download/cvs b/support/download/cvs
index 06b8647..ee32958 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -11,8 +11,8 @@ set -e
 #   $4: package's basename (eg. foobar-1.2.3)
 #   $5: output file
 # And this environment:
-#   CVS       : the cvs command to call
-#   BR2_DL_DIR: path to Buildroot's download dir
+#   CVS      : the cvs command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 repo="${1}"
 rev="${2}"
@@ -20,8 +20,28 @@ rawname="${3}"
 basename="${4}"
 output="${5}"
 
-cd "${BR2_DL_DIR}"
-${CVS} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
+repodir="${basename}.tmp-cvs-checkout"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+ret=1
+if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
+           co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
+    if tar czf "${tmp_output}" "${repodir}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
+
+# Cleanup
+rm -rf "${repodir}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/git b/support/download/git
index 96db3a9..79ce15e 100755
--- a/support/download/git
+++ b/support/download/git
@@ -10,15 +10,28 @@ set -e
 #   $3: package's basename (eg. foobar-1.2.3)
 #   $4: output file
 # And this environment:
-#   BR2_DL_DIR: path to Buildroot's download dir
-#   GIT       : the git command to call
+#   GIT      : the git command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 repo="${1}"
 cset="${2}"
 basename="${3}"
 output="${4}"
 
-repodir="${BR2_DL_DIR}/${basename}"
+repodir="${basename}.tmp-git-checkout"
+tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create the uncomporessed tarball in tht same trashable location
+# - then we create a temporary compressed tarball in the final location, so
+#   it is on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
 
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
@@ -28,10 +41,16 @@ else
     ${GIT} clone --bare "${repo}" "${repodir}"
 fi
 
+ret=1
 pushd "${repodir}"
-${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
-gzip -c "${output}.tmp" >"${output}"
-rm -f "${output}.tmp"
+if ${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" \
+                  --format=tar "${cset}"; then
+    if gzip -c "${tmp_tar}" >"${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
 popd
 
-rm -rf "${repodir}"
+rm -rf "${repodir}" "${tmp_tar}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/hg b/support/download/hg
index 70b49cf..1568ff0 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -10,16 +10,37 @@ set -e
 #   $3: package's basename (eg. foobar-1.2.3)
 #   $4: output file
 # And this environment:
-#   HG        : the hg command to call
-#   BR2_DL_DIR: path to Buildroot's download dir
+#   HG       : the hg command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 repo="${1}"
 cset="${2}"
 basename="${3}"
 output="${4}"
 
-cd "${BR2_DL_DIR}"
-${HG} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
-${HG} archive --repository "${basename}" --type tgz --prefix "${basename}" \
-              --rev "${cset}" "${output}"
-rm -rf "${basename}"
+repodir="${basename}.tmp-hg-checkout"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+ret=1
+if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
+    if ${HG} archive --repository "${repodir}" --type tgz \
+                     --prefix "${basename}" --rev "${cset}" \
+                     "${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
+
+# Cleanup
+rm -rf "${repodir}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/scp b/support/download/scp
index 9f8a4f0..e9ca013 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -12,5 +12,17 @@ set -e
 
 url="${1}"
 output="${2}"
+tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
 
-${SCP} "${url}" "${output}"
+ret=1
+if ${SCP} "${url}" "${tmp_dl}"; then
+    if mv "${tmp_dl}" "${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
+
+# Cleanup
+rm -f "${tmp_dl}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/svn b/support/download/svn
index 717fad3..258e676 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -10,16 +10,35 @@ set -e
 #   $3: package's basename (eg. foobar-1.2.3)
 #   $4: output file
 # And this environment:
-#   SVN       : the svn command to call
-#   BR2_DL_DIR: path to Buildroot's download dir
+#   SVN      : the svn command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 repo="${1}"
 rev="${2}"
 basename="${3}"
 output="${4}"
 
-pushd "${BR2_DL_DIR}"
-${SVN} export "${repo}@${rev}" "${basename}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
-popd
+repodir="${basename}.tmp-svn-checkout"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+ret=1
+if ${SVN} export "${repo}@${rev}" "${repodir}"; then
+    if tar czf "${tmp_output}" "${repodir}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
+fi
+
+# Cleanup
+rm -rf "${repodir}" "${tmp_output}"
+exit ${ret}
diff --git a/support/download/wget b/support/download/wget
index 7865517..f1a8f92 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,14 +8,28 @@ set -e
 #   $1: URL
 #   $2: output file
 # And this environment:
-#   WGET      : the wget command to call
+#   WGET     : the wget command to call
+#   BUILD_DIR: path to Buildroot's build dir
 
 url="${1}"
 output="${2}"
 
-if ${WGET} -O "${output}.tmp" "${url}"; then
-    mv "${output}.tmp" "${output}"
-else
-    rm -f "${output}.tmp"
-    exit 1
+tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+
+# Play tic-tac-toe with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we copy to a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+ret=1
+if ${WGET} -O "${tmp_dl}" "${url}"; then
+    if mv "${tmp_dl}" "${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
 fi
+
+rm -f "${tmp_dl}" "${tmp_output}"
+exit ${ret}
-- 
1.9.1
