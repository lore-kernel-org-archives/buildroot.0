From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 22:08:02 +0100
Subject: [Buildroot] [PATCHv4 7/8] support/download/svn: implement
 source-check
In-Reply-To: <20190215210803.8969-1-patrickdepinguin@gmail.com>
References: <20190215210803.8969-1-patrickdepinguin@gmail.com>
Message-ID: <20190215210803.8969-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Suggested-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/svn | 12 ++++++++++++
 1 file changed, 12 insertions(+)

v4: new patch

diff --git a/support/download/svn b/support/download/svn
index 542b25c0a2..93984b6c45 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the revision exists in the remote repository.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
@@ -16,9 +17,11 @@ set -e
 #   SVN      : the svn command to call
 
 verbose=
+checkonly=false
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=true;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
@@ -36,6 +39,15 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
+if ! _svn ls ${verbose} -r "'${rev}'" "'${uri}'" > /dev/null; then
+    printf "Revision '%s' does not exist in this repository\n." "${rev}"
+    exit 1
+fi
+
+if ${checkonly}; then
+    exit 0
+fi
+
 _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
-- 
2.19.2
