From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:20 +0100
Subject: [Buildroot] [PATCH 05/11] support/download: implement source-check
 in wget backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-6-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/wget | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/download/wget b/support/download/wget
index c69e6071aa..7f626e0071 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the file exists remotely
 #   -o FILE     Save into file FILE.
 #   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
@@ -19,6 +20,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
@@ -40,4 +42,9 @@ _wget() {
 # mirror
 [ -n "${encode}" ] && filename=${filename//\?/%3F}
 
+if [ -n "${checkonly}" ]; then
+    _wget --spider ${verbose} "${@}" "'${url}/${filename}'"
+    exit ${?}
+fi
+
 _wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
-- 
2.18.1
