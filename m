From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Apr 2018 18:22:39 +0200
Subject: [Buildroot] [PATCHv3] core/download fix local backend
Message-ID: <20180404162239.22682-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since c8ef0c03b0b (download: put most of the infra in dl-wrapper), the
backend for local files is now named after the scheme, which is 'file'
for a local file.

From the same commit on, the directory part and the basename are now
passed separately, to let the backend reconstruct the full path when it
needs to do so, which is the case for the 'file' backend too.

Finaly, ff559846fdc1 (support/download: Add support to pass options
directly to downloaders) introduced a nasty error, as it made use of
"${@}" when calling its internal function. Revert that mess now...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v2 -> v3:
  - drop spurious "${@}"

Changes v1 -> v2:
  - really fix it now: filename passed as other option
---
 support/download/{cp => file} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename support/download/{cp => file} (83%)

diff --git a/support/download/cp b/support/download/file
similarity index 83%
rename from support/download/cp
rename to support/download/file
index 52fe2de83d..fefd6d271c 100755
--- a/support/download/cp
+++ b/support/download/file
@@ -2,13 +2,15 @@
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
+set -x
 
 # Download helper for cp, to be called from the download wrapper script
 #
 # Options:
 #   -q          Be quiet.
 #   -o FILE     Copy to file FILE.
-#   -u FILE     Copy from file FILE.
+#   -f FILE     Copy from basename file FILE.
+#   -u DIR      Copy from FILE in DIR.
 #
 # Environment:
 #   LOCALFILES: the cp command to call
@@ -23,7 +25,8 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
     o)  output="${OPTARG}";;
-    u)  source="${OPTARG}";;
+    f)  file="${OPTARG}";;
+    u)  dir="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
@@ -37,4 +40,4 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "${@}""'${source}'" "'${output}'"
+_localfiles ${verbose} "'${dir}${file}'" "'${output}'"
-- 
2.14.1
