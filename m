From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 19:05:52 +0100
Subject: [Buildroot] [PATCHv2 7/8] support/download/scp: implement
 source-check
In-Reply-To: <20190204180553.18394-1-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
Message-ID: <20190204180553.18394-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/scp | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/download/scp b/support/download/scp
index 80cf495c4e..d81952956c 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -7,17 +7,20 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the file exists remotely.
 #   -o FILE     Copy to local file FILE.
 #   -f FILE     Copy from remote file FILE.
 #   -u URI      Download file at URI.
 #
 # Environment:
 #   SCP       : the scp command to call
+#   SSH       : the ssh command to use for checkonly
 
 verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -33,8 +36,19 @@ shift $((OPTIND-1)) # Get rid of our options
 _scp() {
     eval ${SCP} "${@}"
 }
+_ssh() {
+    eval ${SSH} "${@}"
+}
 
 # Remove any scheme prefix
 uri="${uri##scp://}"
 
+if [ -n "${checkonly}" ]; then
+    # uri now looks like:  foo.example.org:some/directory
+    domain="${uri%%:*}"
+    path="${uri#*:}/${filename}"
+    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null
+    exit ${?}
+fi
+
 _scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
-- 
2.19.2
