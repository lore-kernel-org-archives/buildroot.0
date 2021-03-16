From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 23:26:12 +0100
Subject: [Buildroot] [git commit] support/download: print command used for
 download
Message-ID: <20210316220248.06E6980367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54d3d94b6e3846447b5796ef8587b08b537cd348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though that most download commands actually print some output, like
progress indication or other messages, the actual command used is not. This
makes it hard to analyze a build log when you are not fully familiar with
the typical output of said log.

Update the download helpers to do just that, respecting any quiet/verbose
flag so that a silent make (make -s) does not get more verbose.

Note: getting rid of the duplication of the command in the script is not
straightforward without breaking support for arguments with spaces.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[yann.morin.1998 at free.fr: use printf, not echo]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/bzr  | 3 +++
 support/download/cvs  | 3 +++
 support/download/file | 3 +++
 support/download/git  | 3 +++
 support/download/hg   | 3 +++
 support/download/scp  | 3 +++
 support/download/svn  | 3 +++
 support/download/wget | 3 +++
 8 files changed, 24 insertions(+)

diff --git a/support/download/bzr b/support/download/bzr
index 7cc6890a30..835f6ef564 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -34,6 +34,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _bzr() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${BZR} "${@}"; printf '\n'
+    fi
     eval ${BZR} "${@}"
 }
 
diff --git a/support/download/cvs b/support/download/cvs
index 463d70c220..ed034ade2d 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -39,6 +39,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # ). Since nobody sane will put large code bases in CVS, a timeout of
 # 10 minutes should do the trick.
 _cvs() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
+    fi
     eval timeout 10m ${CVS} "${@}"
 }
 
diff --git a/support/download/file b/support/download/file
index e52fcf2c8c..f2a638b1a8 100755
--- a/support/download/file
+++ b/support/download/file
@@ -36,6 +36,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _localfiles() {
+    if [ -n "${verbose}" ]; then
+        printf '%s ' ${LOCALFILES} "${@}"; printf '\n'
+    fi
     eval ${LOCALFILES} "${@}"
 }
 
diff --git a/support/download/git b/support/download/git
index 01e0f214cf..336e170126 100755
--- a/support/download/git
+++ b/support/download/git
@@ -79,6 +79,9 @@ trap _on_error ERR
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _git() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
+    fi
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
diff --git a/support/download/hg b/support/download/hg
index c8149c9c91..add697d6ad 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -33,6 +33,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _hg() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${HG} "${@}"; printf '\n'
+    fi
     eval ${HG} "${@}"
 }
 
diff --git a/support/download/scp b/support/download/scp
index 636d66c66a..27dcb5550f 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -31,6 +31,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _scp() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${SCP} "${@}"; printf '\n'
+    fi
     eval ${SCP} "${@}"
 }
 
diff --git a/support/download/svn b/support/download/svn
index 395c92594f..e85ff6981f 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -40,6 +40,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _svn() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${SVN} "${@}"; printf '\n'
+    fi
     eval ${SVN} "${@}"
 }
 
diff --git a/support/download/wget b/support/download/wget
index 1bcb1e4b00..383b1edd26 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -33,6 +33,9 @@ shift $((OPTIND-1)) # Get rid of our options
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _wget() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${WGET} "${@}"; printf '\n'
+    fi
     eval ${WGET} "${@}"
 }
 
