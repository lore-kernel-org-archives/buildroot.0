From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Feb 2019 11:38:34 +0100
Subject: [Buildroot] [PATCHv5 4/9] support/download/file: implement
 source-check
In-Reply-To: <20190219103839.25409-1-patrickdepinguin@gmail.com>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
Message-ID: <20190219103839.25409-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/file | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

v5: no changes

v4:
- use true/false as values to 'checkonly' (Yann E. Morin)
- replace incorrect 'exit $?' by explicit 'exit 0' (Yann E. Morin)
- replace 'test -e' by 'test -f' which is more specific

v3: no changes

diff --git a/support/download/file b/support/download/file
index e52fcf2c8c..059a8dde4c 100755
--- a/support/download/file
+++ b/support/download/file
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the source file exists.
 #   -o FILE     Copy to file FILE.
 #   -f FILE     Copy from basename file FILE.
 #   -u DIR      Copy from FILE in DIR.
@@ -20,9 +21,11 @@ set -e
 # Make 'cp' verbose by default, so it behaves a bit like the others.
 verbose=-v
 
+checkonly=false
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
+    C)  checkonly=true;;
     o)  output="${OPTARG}";;
     f)  file="${OPTARG}";;
     u)  dir="${OPTARG}";;
@@ -39,4 +42,12 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
+# Remove any scheme prefix
+dir="${dir##file://}"
+
+if ${checkonly}; then
+    test -f "'${dir}/${file}'"
+    exit 0
+fi
+
+_localfiles ${verbose} "'${dir}/${file}'" "'${output}'"
-- 
2.19.2
