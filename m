From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Mar 2021 21:22:59 +0100
Subject: [Buildroot] [git commit] support/download: fix git/svn corrupted
 cache
Message-ID: <20210319200711.5FE4A883F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b70ce5665126246bd6b6bf804c6d9eea1fc599cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 54d3d94b6e3846447b5796ef8587b08b537cd348 ("support/download: print
command used for download") broke the git and svn download helpers, because
these helpers have invocations of the _git/_svn commands where the exact
output matters.

For example for git, this would result in:

    date: invalid date ???GIT_DIR=.../dl/libyuv/git/.git git log -1 --pretty=format:%ci \n2019-04-12 17:48:45 +0000???
    Detected a corrupted git cache.
    Removing it and starting afresh.

Fix by splitting the _git function in two: _git and _plain_git.
The former echoes the command, and then calls the latter.
Most invocations use _git as before, but those cases where the output should
not be disturbed, directly call _plain_git.

For symmetry, all download helpers are aligned, even though only the git and
svn helpers were broken.

Fixes: #13631
Fixes:
    http://autobuild.buildroot.org/results/c2f/c2fcd4aa6660e3c2f9c6f85646ca7dfe0db56040/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[yann.morin.1998 at free.fr: add bug report and autobuild failure]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/bzr  |  4 ++++
 support/download/cvs  |  4 ++++
 support/download/file |  4 ++++
 support/download/git  | 10 +++++++---
 support/download/hg   |  4 ++++
 support/download/scp  |  4 ++++
 support/download/svn  |  6 +++++-
 support/download/wget |  4 ++++
 8 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 835f6ef564..6f77bc286e 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -37,6 +37,10 @@ _bzr() {
     if [ -z "${quiet}" ]; then
         printf '%s ' ${BZR} "${@}"; printf '\n'
     fi
+    _plain_bzr "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_bzr() {
     eval ${BZR} "${@}"
 }
 
diff --git a/support/download/cvs b/support/download/cvs
index ed034ade2d..0c079e2403 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -42,6 +42,10 @@ _cvs() {
     if [ -z "${quiet}" ]; then
         printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
     fi
+    _plain_cvs "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_cvs() {
     eval timeout 10m ${CVS} "${@}"
 }
 
diff --git a/support/download/file b/support/download/file
index f2a638b1a8..a893ca5cc3 100755
--- a/support/download/file
+++ b/support/download/file
@@ -39,6 +39,10 @@ _localfiles() {
     if [ -n "${verbose}" ]; then
         printf '%s ' ${LOCALFILES} "${@}"; printf '\n'
     fi
+    _plain_localfiles "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
diff --git a/support/download/git b/support/download/git
index 336e170126..1e690d4444 100755
--- a/support/download/git
+++ b/support/download/git
@@ -82,6 +82,10 @@ _git() {
     if [ -z "${quiet}" ]; then
         printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
     fi
+    _plain_git "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_git() {
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
@@ -115,7 +119,7 @@ _EOF_
 _git init .
 
 # Ensure the repo has an origin (in case a previous run was killed).
-if ! _git remote |grep -q -E '^origin$'; then
+if ! _plain_git remote |grep -q -E '^origin$'; then
     _git remote add origin "'${uri}'"
 fi
 
@@ -181,7 +185,7 @@ _git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
 # %ci is ISO 8601, so it's fully qualified, with TZ and all.
-date="$( _git log -1 --pretty=format:%ci )"
+date="$( _plain_git log -1 --pretty=format:%ci )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
@@ -194,7 +198,7 @@ if [ ${recurse} -eq 1 ]; then
     # versions. However, we can't do that if git is too old and uses
     # full repositories for submodules.
     cmd='printf "%s\n" "${path}/"'
-    for module_dir in $( _git submodule --quiet foreach "'${cmd}'" ); do
+    for module_dir in $( _plain_git submodule --quiet foreach "'${cmd}'" ); do
         [ -f "${module_dir}/.git" ] || continue
         relative_dir="$( sed -r -e 's,/+,/,g; s,[^/]+/,../,g' <<<"${module_dir}" )"
         sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: "${relative_dir}":" "${module_dir}/.git"
diff --git a/support/download/hg b/support/download/hg
index add697d6ad..a7542e5c84 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -36,6 +36,10 @@ _hg() {
     if [ -z "${quiet}" ]; then
         printf '%s ' ${HG} "${@}"; printf '\n'
     fi
+    _plain_hg "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_hg() {
     eval ${HG} "${@}"
 }
 
diff --git a/support/download/scp b/support/download/scp
index 27dcb5550f..14e768b601 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -34,6 +34,10 @@ _scp() {
     if [ -z "${quiet}" ]; then
         printf '%s ' ${SCP} "${@}"; printf '\n'
     fi
+    _plain_scp "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_scp() {
     eval ${SCP} "${@}"
 }
 
diff --git a/support/download/svn b/support/download/svn
index e85ff6981f..b23b7773d3 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -43,6 +43,10 @@ _svn() {
     if [ -z "${quiet}" ]; then
         printf '%s ' ${SVN} "${@}"; printf '\n'
     fi
+    _plain_svn "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_svn() {
     eval ${SVN} "${@}"
 }
 
@@ -53,7 +57,7 @@ _svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
 # UTC timezone), which we can feed as-is to the --mtime option for tar.
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
-date="$( _svn info "'${uri}@${rev}'" \
+date="$( _plain_svn info "'${uri}@${rev}'" \
         |sed -r -e '/^Last Changed Date: /!d; s///'
        )"
 
diff --git a/support/download/wget b/support/download/wget
index 383b1edd26..68bd0b13c8 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -36,6 +36,10 @@ _wget() {
     if [ -z "${quiet}" ]; then
         printf '%s ' ${WGET} "${@}"; printf '\n'
     fi
+    _plain_wget "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_wget() {
     eval ${WGET} "${@}"
 }
 
