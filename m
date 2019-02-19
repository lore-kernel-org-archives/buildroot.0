From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Feb 2019 11:38:33 +0100
Subject: [Buildroot] [PATCHv5 3/9] support/download/wget: implement
 source-check
In-Reply-To: <20190219103839.25409-1-patrickdepinguin@gmail.com>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
Message-ID: <20190219103839.25409-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/wget | 8 ++++++++
 1 file changed, 8 insertions(+)

v5: no changes

v4: (feedback Yann E. Morin)
- use true/false as values to 'checkonly'
- replace incorrect 'exit $?' by explicit 'exit 0'

v3: no changes

diff --git a/support/download/wget b/support/download/wget
index c69e6071aa..277eab6660 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the file exists remotely.
 #   -o FILE     Save into file FILE.
 #   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
@@ -16,9 +17,11 @@ set -e
 #   WGET     : the wget command to call
 
 verbose=
+checkonly=false
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=true;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
@@ -40,4 +43,9 @@ _wget() {
 # mirror
 [ -n "${encode}" ] && filename=${filename//\?/%3F}
 
+if ${checkonly}; then
+    _wget --spider ${verbose} "${@}" "'${url}/${filename}'"
+    exit 0
+fi
+
 _wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
-- 
2.19.2
