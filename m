From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Dec 2015 10:26:55 +0100
Subject: [Buildroot] [PATCH] support/download: protect from custom commands
	with spaces in args
Message-ID: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some users may provide custom download commands with spaces in their
arguments, like so:
    BR2_HG="hg --config foo.bar='some space-separated value'"

However, the way we currently call those commands does not account
for the extra quotes, and each space-separated part of the command is
interpreted as separate arguments.

Fix that by calling 'eval' on the commands.

Because of the eval, we must further quote our own arguments, to avoid
the eval further splitting them in case there are spaces (even though
we do not support paths with spaces, better be clean from the onset to
avoid breakage in the future).

We change all the wrappers to use a wrapper-function, even those with
a single call, so they all look alike.

Note that we do not single-quote some of the variables, like ${verbose}
because it can be empty and we really do not want to generate an
empty-string argument. That's not a problem, as ${verbose} would not
normally contain space-separated values (it could get set to something
like '-q -v' but in that case we'd still want two arguments, so that's
fine).

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/download/bzr  |  8 +++++++-
 support/download/cp   |  8 +++++++-
 support/download/cvs  | 10 ++++++++--
 support/download/git  | 14 ++++++++++----
 support/download/hg   | 14 ++++++++++----
 support/download/scp  |  8 +++++++-
 support/download/svn  |  8 +++++++-
 support/download/wget |  8 +++++++-
 8 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index c567466..cec9ce8 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -26,4 +26,10 @@ repo="${2}"
 rev="${3}"
 basename="${4}"
 
-${BZR} export ${verbose} --root="${basename}/" --format=tgz "${output}" "${repo}" -r "${rev}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_bzr() {
+    eval ${BZR} "${@}"
+}
+
+_bzr export ${verbose} --root="'${basename}/'" --format=tgz "'${output}'" "'${repo}'" -r "'${rev}'"
diff --git a/support/download/cp b/support/download/cp
index 6e29eef..09ce3d1 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -28,4 +28,10 @@ shift $((OPTIND-1))
 output="${1}"
 source="${2}"
 
-${LOCALFILES} ${verbose} "${source}" "${output}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_localfiles() {
+    eval ${LOCALFILES} "${@}"
+}
+
+_localfiles ${verbose} "'${source}'" "'${output}'"
diff --git a/support/download/cvs b/support/download/cvs
index bfac73b..e1d5035 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -26,6 +26,12 @@ rev="${3}"
 rawname="${4}"
 basename="${5}"
 
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_cvs() {
+    eval ${CVS} "${@}"
+}
+
 if [[ ${rev} =~ ^[0-9] ]]; then
     # Date, because a tag or a branch cannot begin with a number
     select="-D"
@@ -35,7 +41,7 @@ else
 fi
 
 export TZ=UTC
-${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" ${select} "${rev}" -P "${rawname}"
+_cvs ${verbose} -z3 -d"':pserver:anonymous@${repo}'" \
+     co -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/git b/support/download/git
index 357a558..e342ed3 100755
--- a/support/download/git
+++ b/support/download/git
@@ -25,6 +25,12 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_git() {
+    eval ${GIT} "${@}"
+}
+
 # Try a shallow clone, since it is faster than a full clone - but that only
 # works if the version is a ref (tag or branch). Before trying to do a shallow
 # clone we check if ${cset} is in the list provided by git ls-remote. If not
@@ -33,9 +39,9 @@ basename="${4}"
 # Messages for the type of clone used are provided to ease debugging in case of
 # problems
 git_done=0
-if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
+if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if ${GIT} clone ${verbose} --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
+    if _git clone ${verbose} --depth 1 -b "'${cset}'" --bare "'${repo}'" "'${basename}'"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
@@ -43,10 +49,10 @@ if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    ${GIT} clone ${verbose} --mirror "${repo}" "${basename}"
+    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
 fi
 
 GIT_DIR="${basename}" \
-${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
+_git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
 
 gzip <"${output}.tmp" >"${output}"
diff --git a/support/download/hg b/support/download/hg
index ac1e9b9..5bdbbc8 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -25,8 +25,14 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
-${HG} clone ${verbose} --noupdate "${repo}" "${basename}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_hg() {
+    eval ${HG} "${@}"
+}
 
-${HG} archive ${verbose} --repository "${basename}" --type tgz \
-              --prefix "${basename}" --rev "${cset}" \
-              "${output}"
+_hg clone ${verbose} --noupdate "'${repo}'" "'${basename}'"
+
+_hg archive ${verbose} --repository "'${basename}'" --type tgz \
+            --prefix "'${basename}'" --rev "'${cset}'" \
+            "'${output}'"
diff --git a/support/download/scp b/support/download/scp
index 1a62f30..95cf502 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -23,4 +23,10 @@ shift $((OPTIND-1))
 output="${1}"
 url="${2}"
 
-${SCP} ${verbose} "${url}" "${output}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_scp() {
+    eval ${SCP} "${@}"
+}
+
+_scp ${verbose} "'${url}'" "'${output}'"
diff --git a/support/download/svn b/support/download/svn
index 558bca0..4dcdd06 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -25,6 +25,12 @@ repo="${2}"
 rev="${3}"
 basename="${4}"
 
-${SVN} export ${verbose} "${repo}@${rev}" "${basename}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_svn() {
+    eval ${SVN} "${@}"
+}
+
+_svn export ${verbose} "'${repo}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/wget b/support/download/wget
index 885bcf1..0fc7ffa 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -23,4 +23,10 @@ shift $((OPTIND-1))
 output="${1}"
 url="${2}"
 
-${WGET} ${verbose} -O "${output}" "${url}"
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_wget() {
+    eval ${WGET} "${@}"
+}
+
+_wget ${verbose} -O "'${output}'" "'${url}'"
-- 
1.9.1
