From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Feb 2019 11:38:37 +0100
Subject: [Buildroot] [PATCHv5 7/9] support/download/scp: implement
 source-check
In-Reply-To: <20190219103839.25409-1-patrickdepinguin@gmail.com>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
Message-ID: <20190219103839.25409-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

We use 'test -f' rather than 'ls' because 'test' is a mandatory POSIX
utility while 'ls' is not.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/scp | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

v5: no changes

v4: (feedback Yann E. Morin)
- use true/false as values to 'checkonly'
- replace incorrect 'exit $?' by explicit 'exit 0'
- use 'test -f' instead of 'ls' which is more certain to be present (POSIX
  mandatory utility)

v3: no changes

diff --git a/support/download/scp b/support/download/scp
index 80cf495c4e..52ccf06d6e 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -7,17 +7,21 @@ set -e
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
+checkonly=false
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=true;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -33,8 +37,19 @@ shift $((OPTIND-1)) # Get rid of our options
 _scp() {
     eval ${SCP} "${@}"
 }
+_ssh() {
+    eval ${SSH} "${@}"
+}
 
 # Remove any scheme prefix
 uri="${uri##scp://}"
 
+if ${checkonly}; then
+    # uri now looks like:  foo.example.org:some/directory
+    domain="${uri%%:*}"
+    path="${uri#*:}/${filename}"
+    _ssh ${verbose} "${@}" "'${domain}'" test -f "'${path}'" > /dev/null
+    exit 0
+fi
+
 _scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
-- 
2.19.2
