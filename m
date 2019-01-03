From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:26 +0100
Subject: [Buildroot] [PATCH 11/11] support/download: implement source-check
 in svn backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-12-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/svn | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/download/svn b/support/download/svn
index 542b25c0a2..e6f41f24fc 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the revision exists in the remote repository
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
@@ -19,6 +20,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
@@ -36,6 +38,11 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
+if [ -n "${checkonly}" ]; then
+    _svn ls ${verbose} "${@}" "'${uri}@${rev}'" > /dev/null
+    exit ${?}
+fi
+
 _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
-- 
2.18.1
