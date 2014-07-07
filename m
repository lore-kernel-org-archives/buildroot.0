From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jul 2014 23:44:34 +0200
Subject: [Buildroot] [PATCH 3/6 v2] support/download: properly use temp files
In-Reply-To: <cover.1404769268.git.yann.morin.1998@free.fr>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <4477e057bedd7e284b8a4fe562ec233547c10727.1404769268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using 'mv' to move files to temp files, the existing temp file is
forcibly removed by 'mv', and a new file is created.

Although this should have little impact to us, there is still a race
conditions in case two parallel downloads would step on each other's
toes, and it goes like that:

    Process 1                       Process 2
    mktemp tmp_output
    mv tmp_dl tmp_output
        removes tmp_output
                                    mktemp tmp_ouput
        writes to tmp_output
                                    mv tmp_dl tmp_output
                                        removes tmp_output
                                        writes to tmp_output
    mv tmp_output output
                                    mv tmp_output output

In this case, mktemp has the opportunity to create the same tmp_output
temporary file, and we trash the content from one with the content
from the other, and the last to do the final 'mv' breaks horibly.

Instead, use 'cat', which guarantees that tmp_output is not removed
before writing to it.

This complexifies a bit the local-files (cp) helper, but better safe
than sorry.

(Note: this is a purely theoretical issue, I did not observe it yet, but
it is slated to happen one day or the other, and will be very hard to
debug then.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/bzr  | 2 +-
 support/download/cp   | 9 ++++++---
 support/download/cvs  | 2 +-
 support/download/git  | 4 ++--
 support/download/hg   | 2 +-
 support/download/scp  | 2 +-
 support/download/svn  | 2 +-
 support/download/wget | 2 +-
 8 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 19d837d..f86fa82 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -27,7 +27,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
+    if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/cp b/support/download/cp
index 8f6bc06..e73159b 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -13,12 +13,15 @@ set -e
 source="${1}"
 output="${2}"
 
+tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
-if ${LOCALFILES} "${source}" "${tmp_output}"; then
-    mv "${tmp_output}" "${output}"
-    ret=0
+if ${LOCALFILES} "${source}" "${tmp_dl}"; then
+    if cat "${tmp_dl}" >"${tmp_output}"; then
+        mv "${tmp_output}" "${output}"
+        ret=0
+    fi
 fi
 
 # Cleanup
diff --git a/support/download/cvs b/support/download/cvs
index 9aeed79..a8ab080 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -36,7 +36,7 @@ rm -rf "${repodir}"
 ret=1
 if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
            co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
-    if tar czf "${tmp_output}" "${repodir}"; then
+    if tar czf - "${repodir}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/git b/support/download/git
index 116e5a9..bc5aabc 100755
--- a/support/download/git
+++ b/support/download/git
@@ -47,8 +47,8 @@ fi
 
 ret=1
 pushd "${repodir}" >/dev/null
-if ${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" \
-                  --format=tar "${cset}"; then
+if ${GIT} archive --prefix="${basename}/" --format=tar "${cset}" \
+                  >"${tmp_tar}"; then
     if gzip -c "${tmp_tar}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
diff --git a/support/download/hg b/support/download/hg
index 6e9e26b..8b36db9 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -35,7 +35,7 @@ ret=1
 if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
     if ${HG} archive --repository "${repodir}" --type tgz \
                      --prefix "${basename}" --rev "${cset}" \
-                     "${tmp_output}"; then
+                     - >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/scp b/support/download/scp
index d3aad43..e16ece5 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -17,7 +17,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${SCP} "${url}" "${tmp_dl}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
+    if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/svn b/support/download/svn
index 39cbbcb..259d3ed 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -33,7 +33,7 @@ rm -rf "${repodir}"
 
 ret=1
 if ${SVN} export "${repo}@${rev}" "${repodir}"; then
-    if tar czf "${tmp_output}" "${repodir}"; then
+    if tar czf - "${repodir}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
diff --git a/support/download/wget b/support/download/wget
index cbeca3b..0f71108 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -25,7 +25,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
 if ${WGET} -O "${tmp_dl}" "${url}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
+    if cat "${tmp_dl}" >"${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
     fi
-- 
1.9.1
