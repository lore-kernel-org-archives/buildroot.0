From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:59:01 +0200
Subject: [Buildroot] [git commit] support/download: Add support to pass
	options directly to downloaders
Message-ID: <20160902142938.D884A7FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff559846fdc11f718ef6ed49c25117fab90b8019
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support to pass options to the underlying command that is used
by downloader. Useful for retrieving data with server-side checking for
user login or passwords, use a proxy or use specific options for cloning
a repository via git and hg.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/bzr  | 4 +++-
 support/download/cp   | 4 +++-
 support/download/cvs  | 4 +++-
 support/download/git  | 6 ++++--
 support/download/hg   | 4 +++-
 support/download/scp  | 4 +++-
 support/download/svn  | 4 +++-
 support/download/wget | 4 +++-
 8 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index e18b01f..75b7b41 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -26,6 +26,8 @@ repo="${2}"
 rev="${3}"
 basename="${4}"
 
+shift 4 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _bzr() {
@@ -49,5 +51,5 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
 fi
 
 _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
-    ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
+    ${timestamp_opt} - "${@}" "'${repo}'" -r "'${rev}'" \
     >"${output}"
diff --git a/support/download/cp b/support/download/cp
index 09ce3d1..0ee1f3b 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -28,10 +28,12 @@ shift $((OPTIND-1))
 output="${1}"
 source="${2}"
 
+shift 2 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${source}'" "'${output}'"
+_localfiles ${verbose} "${@}""'${source}'" "'${output}'"
diff --git a/support/download/cvs b/support/download/cvs
index 7980389..50050ab 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -26,6 +26,8 @@ rev="${3}"
 rawname="${4}"
 basename="${5}"
 
+shift 5 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _cvs() {
@@ -48,6 +50,6 @@ fi
 
 export TZ=UTC
 _cvs ${verbose} -z3 -d"'${repo}'" \
-     co -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
+     co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/git b/support/download/git
index 416cd1b..281db61 100755
--- a/support/download/git
+++ b/support/download/git
@@ -30,6 +30,8 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
+shift 4 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _git() {
@@ -46,7 +48,7 @@ _git() {
 git_done=0
 if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if _git clone ${verbose} --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
+    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
@@ -54,7 +56,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    _git clone ${verbose} "'${repo}'" "'${basename}'"
+    _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
 fi
 
 pushd "${basename}" >/dev/null
diff --git a/support/download/hg b/support/download/hg
index 25cb4e9..3af0169 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -25,13 +25,15 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
+shift 4 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _hg() {
     eval ${HG} "${@}"
 }
 
-_hg clone ${verbose} --noupdate "'${repo}'" "'${basename}'"
+_hg clone ${verbose} "${@}" --noupdate "'${repo}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
diff --git a/support/download/scp b/support/download/scp
index 95cf502..825fd41 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -23,10 +23,12 @@ shift $((OPTIND-1))
 output="${1}"
 url="${2}"
 
+shift 2 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _scp() {
     eval ${SCP} "${@}"
 }
 
-_scp ${verbose} "'${url}'" "'${output}'"
+_scp ${verbose} "${@}" "'${url}'" "'${output}'"
diff --git a/support/download/svn b/support/download/svn
index 4dcdd06..77abf3d 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -25,12 +25,14 @@ repo="${2}"
 rev="${3}"
 basename="${4}"
 
+shift 4 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export ${verbose} "'${repo}@${rev}'" "'${basename}'"
+_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/wget b/support/download/wget
index 0fc7ffa..768de90 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -23,10 +23,12 @@ shift $((OPTIND-1))
 output="${1}"
 url="${2}"
 
+shift 2 # Get rid of our options
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _wget() {
     eval ${WGET} "${@}"
 }
 
-_wget ${verbose} -O "'${output}'" "'${url}'"
+_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
