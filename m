From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 May 2014 14:01:47 +0200
Subject: [Buildroot] [PATCH 08/11] pkg-infra: don't use DL_DIR as scratchpad
	for temporary VCS checkouts
In-Reply-To: <cover.1399204808.git.yann.morin.1998@free.fr>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
Message-ID: <dab61c93748c350621eba4987a23e0752c6b6f45.1399204808.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

DL_DIR can be a very precious place for some users: they use it to store
all the downloaded archives to share across all their Buildroot (and
maybe non-Buildroot) builds.

We do not want to trash this location with our temporary VCS (git, Hg,
svn, cvs) repository clones/checkouts.

Turns out that we already have some kind of scratchpad, the BUILD_DIR.
Although it is not really a disposable location, that's the best we have
so far.

Also, we create the temporary tarballs by appending '.tmp' to the final
tarball, since we want the temporary to be on the same filesystem as the
final location, so the 'mv' is just a plain rename(2), and we are not
left with a half-copied file as the final location.

Note: we're using neither ${TMP} nor ${TMPDIR} since they are shared
locations, sometime with little place (eg. tmpfs), and some of the
repositories we clone/checkout can be very big.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v4 -> v5
  - explain why we create the temp files where we create them  (Arnout)

Changes v3 -> v4:
  - remove spurious bump in package/fis  (Samuel)
---
 support/download/cvs  | 18 ++++++++++++------
 support/download/git  | 16 ++++++++++------
 support/download/hg   | 20 +++++++++++++-------
 support/download/svn  | 19 ++++++++++++-------
 support/download/wget |  7 +++++--
 5 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/support/download/cvs b/support/download/cvs
index 06b8647..e4c1f32 100755
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
@@ -20,8 +20,14 @@ rawname="${3}"
 basename="${4}"
 output="${5}"
 
-cd "${BR2_DL_DIR}"
+repodir="${basename}.tmp-cvs-checkout"
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}" "${output}.tmp"
+
 ${CVS} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
+       co -d "${repodir}" -r ":${rev}" -P "${rawname}"
+tar czf "${output}.tmp" "${repodir}"
+mv "${output}.tmp" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/git b/support/download/git
index 96db3a9..5ba26fb 100755
--- a/support/download/git
+++ b/support/download/git
@@ -10,15 +10,19 @@ set -e
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
+
+cd "${BUILD_DIR}"
+# Remove leftovers from a previous failed run
+rm -rf "${repodir}" "${output}.tmp" "${output}.tmp2"
 
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
@@ -30,8 +34,8 @@ fi
 
 pushd "${repodir}"
 ${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
-gzip -c "${output}.tmp" >"${output}"
-rm -f "${output}.tmp"
+gzip -c "${output}.tmp" >"${output}.tmp2"
+mv "${output}.tmp2" "${output}"
 popd
 
-rm -rf "${repodir}"
+rm -rf "${repodir}" "${output}.tmp"
diff --git a/support/download/hg b/support/download/hg
index 70b49cf..d96a0c5 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -10,16 +10,22 @@ set -e
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
+rm -rf "${repodir}" "${output}.tmp"
+
+${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"
+${HG} archive --repository "${repodir}" --type tgz --prefix "${basename}" \
+              --rev "${cset}" "${output}.tmp"
+mv "${output}.tmp" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/svn b/support/download/svn
index c3ab32c..073709f 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -10,16 +10,21 @@ set -e
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
+rm -rf "${repodir}" "${output}.tmp"
+
+${SVN} export -r "${rev}" "${repo}" "${repodir}"
+tar czf "${output}.tmp" "${repodir}"
+mv "${output}.tmp" "${output}"
+rm -rf "${repodir}"
diff --git a/support/download/wget b/support/download/wget
index 7865517..7c941e4 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,14 +8,17 @@ set -e
 #   $1: URL
 #   $2: output file
 # And this environment:
-#   WGET      : the wget command to call
+#   WGET     : the wget command to call
 
 url="${1}"
 output="${2}"
 
+# Remove leftovers from a previous failed run
+rm -rf "${output}.tmp"
+
 if ${WGET} -O "${output}.tmp" "${url}"; then
     mv "${output}.tmp" "${output}"
 else
-    rm -f "${output}.tmp"
+    rm -f "${tmpfile}"
     exit 1
 fi
-- 
1.8.3.2
