From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:42 +0100
Subject: [Buildroot] [PATCH 09/13] pkg-infra: don't use DL_DIR as scratchpad
	for temporary VCS checkouts
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <73002df4bf03b846612f10187f59508c65f365d0.1393781650.git.yann.morin.1998@free.fr>
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

Note: we're using neither ${TMP} nor ${TMPDIR} since they are shared
locations, sometime with little place (eg. tmpfs), and some of the
repositories we clone/checkout can be very big.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/cvs  | 16 ++++++++++------
 support/download/git  |  9 ++++++---
 support/download/hg   | 16 ++++++++++------
 support/download/svn  | 14 ++++++++------
 support/download/wget | 10 ++++++----
 5 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/support/download/cvs b/support/download/cvs
index 06b8647..a0adfc3 100755
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
@@ -20,8 +20,12 @@ rawname="${3}"
 basename="${4}"
 output="${5}"
 
-cd "${BR2_DL_DIR}"
+repodir="${basename}.tmp-cvs-checkout"
+
+cd "${BUILD_DIR}"
+rm -rf "${repodir}" # Remove leftovers from a previous failed run
+
 ${CVS} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
-tar czf "${output}" "${basename}"
-rm -rf "${basename}"
+       co -d "${repodir}" -r ":${rev}" -P "${rawname}"
+tar czf "${output}" "${repodir}"
+rm -rf "${repodir}"
diff --git a/support/download/git b/support/download/git
index 96db3a9..6321448 100755
--- a/support/download/git
+++ b/support/download/git
@@ -10,15 +10,18 @@ set -e
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
+rm -rf "${repodir}" # Remove leftovers from a previous failed run
 
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
diff --git a/support/download/hg b/support/download/hg
index 70b49cf..f166548 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -10,16 +10,20 @@ set -e
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
+repodir="${basename}.tmp-hg-checkout"
+
+cd "${BUILD_DIR}"
+rm -rf "${repodir}" # Remove leftovers from a previous failed run
+
+${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"
+${HG} archive --repository "${repodir}" --type tgz --prefix "${basename}" \
               --rev "${cset}" "${output}"
-rm -rf "${basename}"
+rm -rf "${repodir}"
diff --git a/support/download/svn b/support/download/svn
index c3ab32c..ada934b 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -10,16 +10,18 @@ set -e
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
+repodir="${basename}.tmp-svn-checkout"
+
+pushd "${BUILD_DIR}"
+${SVN} export -r "${rev}" "${repo}" "${repodir}"
+tar czf "${output}" "${repodir}"
+rm -rf "${repodir}"
 popd
diff --git a/support/download/wget b/support/download/wget
index 7865517..a5b4f3a 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,14 +8,16 @@ set -e
 #   $1: URL
 #   $2: output file
 # And this environment:
-#   WGET      : the wget command to call
+#   WGET     : the wget command to call
 
 url="${1}"
 output="${2}"
 
-if ${WGET} -O "${output}.tmp" "${url}"; then
-    mv "${output}.tmp" "${output}"
+tmpfile="${BUILD_DIR}/${output##*/}.tmp-download"
+
+if ${WGET} -O "${tmpfile}" "${url}"; then
+    mv "${tmpfile}" "${output}"
 else
-    rm -f "${output}.tmp"
+    rm -f "${tmpfile}"
     exit 1
 fi
-- 
1.8.3.2
