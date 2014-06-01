From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 19:40:43 +0200
Subject: [Buildroot] [PATCH 09/12] pkg-infra: don't use DL_DIR as scratchpad
	for temporary downloads
In-Reply-To: <cover.1401644349.git.yann.morin.1998@free.fr>
References: <cover.1401644349.git.yann.morin.1998@free.fr>
Message-ID: <6de658f7751ced3969fb11871c77f98fe9cdc097.1401644349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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

---
Changes v5 -> v6:
  - ensure we can do parallel downloads from multiple build-dirs  (Thomas)

Changes v4 -> v5
  - explain why we create the temp files where we create them  (Arnout)

Changes v3 -> v4:
  - remove spurious bump in package/fis  (Samuel)
---
 support/download/bzr  | 24 +++++++++++++++++++++---
 support/download/cvs  | 25 +++++++++++++++++++------
 support/download/git  | 25 +++++++++++++++++++------
 support/download/hg   | 27 ++++++++++++++++++++-------
 support/download/svn  | 26 +++++++++++++++++++-------
 support/download/wget | 19 +++++++++++++++----
 6 files changed, 113 insertions(+), 33 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 68121f4..4be36a0 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -9,11 +9,29 @@ set -e
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
+
+# Remove leftovers from a previous failed run
+rm -rf "${BUILD_DIR}/.foo.tmp"
+
+# Play tric-trac with temp files
+# - first, we download to a trashable location (the build-dir)
+# - the we move to a temp file in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+if ${BZR} export "${tmp_dl}" "${repo}" -r "${rev}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
+    mv "${tmp_dl}" "${tmp_output}"
+    mv "${tmp_output}" "${output}"
+else
+    rm -f "${tmp_dl}"
+    exit 1
+fi
diff --git a/support/download/cvs b/support/download/cvs
index 06b8647..fa917aa 100755
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
@@ -20,8 +20,21 @@ rawname="${3}"
 basename="${4}"
 output="${5}"
 
-cd "${BR2_DL_DIR}"
+repodir="${basename}.tmp-cvs-checkout"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tric-trac with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
 ${CVS} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
+       co -d "${repodir}" -r ":${rev}" -P "${rawname}"
+temp_output="$( mktemp "${output}.XXXXXX" )"
+tar czf "${temp_output}" "${repodir}"
+mv "${temp_output}" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/git b/support/download/git
index 96db3a9..7515f91 100755
--- a/support/download/git
+++ b/support/download/git
@@ -10,15 +10,27 @@ set -e
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
+
+# Play tric-trac with temp files
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
@@ -29,9 +41,10 @@ else
 fi
 
 pushd "${repodir}"
-${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
-gzip -c "${output}.tmp" >"${output}"
-rm -f "${output}.tmp"
+${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" --format=tar "${cset}"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+gzip -c "${tmp_tar}" >"${tmp_output}"
+mv "${tmp_output}" "${output}"
 popd
 
 rm -rf "${repodir}"
diff --git a/support/download/hg b/support/download/hg
index 70b49cf..ee4eab8 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -10,16 +10,29 @@ set -e
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
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tric-trac with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+${HG} archive --repository "${repodir}" --type tgz --prefix "${basename}" \
+              --rev "${cset}" "${tmp_output}"
+mv "${tmp_output}" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/svn b/support/download/svn
index c3ab32c..846ab6b 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -10,16 +10,28 @@ set -e
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
-${SVN} export -r "${rev}" "${repo}" "${basename}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
-popd
+repodir="${basename}.tmp-svn-checkout"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}"
+
+# Play tric-trac with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we create a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+${SVN} export -r "${rev}" "${repo}" "${repodir}"
+tmp_output="$( mktemp "${output}.XXXXXX" )"
+tar czf "${tmp_output}" "${repodir}"
+mv "${tmp_output}" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/wget b/support/download/wget
index 7865517..b010a55 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,14 +8,25 @@ set -e
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
+tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
+
+# Play tric-trac with temp files
+# - first, we download to a trashable location (the build-dir)
+# - then we copy to a temporary tarball in the final location, so it is
+#   on the same filesystem as the final file
+# - finally, we atomically rename to the final file
+
+if ${WGET} -O "${tmp_dl}" "${url}"; then
+    tmp_output="$( mktemp "${output}.XXXXXX" )"
+    mv "${tmp_dl}" "${tmp_output}"
+    mv "${tmp_output}" "${output}"
 else
-    rm -f "${output}.tmp"
+    rm -f "${tmp_dl}"
     exit 1
 fi
-- 
1.8.3.2
