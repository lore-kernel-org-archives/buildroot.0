From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:47:54 +0200
Subject: [Buildroot] [git commit branch/next] support/download: remove help
 from wrapper
Message-ID: <20180809214127.4D7BA8B799@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dc6c43703fc4eb0721a0d34ad5eeebf57527b44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The download wrapper is a purely internal helper, and is not supposed to
be callable manually. No need to offer some help.

Besides, the help text was way out-dated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/dl-wrapper | 47 +--------------------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 4059c37ebc..742bbd5428 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -4,8 +4,6 @@
 # Its role is to ensure atomicity when saving downloaded files
 # back to BR2_DL_DIR, and not clutter BR2_DL_DIR with partial,
 # failed downloads.
-#
-# Call it with -h to see some help.
 
 # To avoid cluttering BR2_DL_DIR, we download to a trashable
 # location, namely in $(BUILD_DIR).
@@ -27,9 +25,8 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":hc:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
         case "${OPT}" in
-        h)  help; exit 0;;
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
         D)  old_dl_dir="${OPTARG}";;
@@ -212,48 +209,6 @@ main() {
     return ${rc}
 }
 
-help() {
-    cat <<_EOF_
-NAME
-    ${my_name} - download wrapper for Buildroot
-
-SYNOPSIS
-    ${my_name} [OPTION]... -- [BACKEND OPTION]...
-
-DESCRIPTION
-    Wrapper script around different download mechanisms. Ensures that
-    concurrent downloads do not conflict, that partial downloads are
-    properly evicted without leaving temporary files, and that access
-    rights are maintained.
-
-    -h  This help text.
-
-    -u URIs
-        The URI to get the file from, the URI must respect the format given in
-        the example.
-        You may give as many '-u URI' as you want, the script will stop@the
-        frist successful download.
-
-        Example: backend+URI; git+http://example.com or http+http://example.com
-
-    -o FILE
-        Store the downloaded archive in FILE.
-
-    -H FILE
-        Use FILE to read hashes from, and check them against the downloaded
-        archive.
-
-  Exit status:
-    0   if OK
-    !0  in case of error
-
-ENVIRONMENT
-
-    BUILD_DIR
-        The path to Buildroot's build dir
-_EOF_
-}
-
 trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
 warn()   { trace "${@}" >&2; }
 errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
