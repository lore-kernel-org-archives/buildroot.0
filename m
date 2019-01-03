From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:21 +0100
Subject: [Buildroot] [PATCH 06/11] support/download: implement source-check
 in file backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/file | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index e52fcf2c8c..3a92fa9f67 100755
--- a/support/download/file
+++ b/support/download/file
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the source file exists
 #   -o FILE     Copy to file FILE.
 #   -f FILE     Copy from basename file FILE.
 #   -u DIR      Copy from FILE in DIR.
@@ -23,6 +24,7 @@ verbose=-v
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     f)  file="${OPTARG}";;
     u)  dir="${OPTARG}";;
@@ -39,4 +41,12 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
+# Remove any scheme prefix
+dir="${dir##file://}"
+
+if [ -n "${checkonly}" ]; then
+    test -e "'${dir}/${file}'"
+    exit ${?}
+fi
+
+_localfiles ${verbose} "'${dir}/${file}'" "'${output}'"
-- 
2.18.1
