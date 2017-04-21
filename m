From: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
Date: Sat, 22 Apr 2017 00:28:38 +0530
Subject: [Buildroot] [PATCH v9 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
Message-ID: <20170421185839.17905-1-abhimanyu.v@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>

When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
ends up with following error:

Error: Missing argument

This is because, extra positional argument is also passed
along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didnt
had support to parse positional and optional argument
together.

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
---
 Changes v7->v8
   - New file
 Changes v8->v9
   - Fix indentation
   - Use bash basename as script name instead hardcoding

 support/scripts/genimage.sh | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 0ed0e8bcc..a2309e224 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,17 +1,26 @@
 #!/bin/bash
 
 die() {
-  echo "Error: $@" >&2
-  exit 1
+	echo "Error: $@" >&2
+	exit 1
 }
 
+# Parse arguments and put into argument list of the script
+opts="$(getopt -n "${0##*/}" -o c: -- "$@")" || exit $?
+eval set -- "$opts"
+
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-while getopts c: OPT ; do
-	case "${OPT}" in
-	c) GENIMAGE_CFG="${OPTARG}";;
-	:) die "option '${OPTARG}' expects a mandatory argument\n";;
-	\?) die "unknown option '${OPTARG}'\n";;
+while true ; do
+	case "$1" in
+		-c)
+			GENIMAGE_CFG="${2}";
+			shift 2 ;;
+		--) # Discard all non-option parameters
+			shift 1;
+			break ;;
+		*)
+			die "unknown option '${1}'" ;;
 	esac
 done
 
-- 
2.11.0
