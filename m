From: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
Date: Sun, 16 Apr 2017 23:10:47 +0530
Subject: [Buildroot] [PATCH v8 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
Message-ID: <20170416174048.4737-1-abhimanyu.v@gmail.com>
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

 support/scripts/genimage.sh | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 0ed0e8bcc..2b5549fb0 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -5,13 +5,18 @@ die() {
   exit 1
 }
 
+# Parse arguments and put into argument list of the script
+eval set -- $(getopt -n genimage.sh -o c: -- "$@")
+
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-while getopts c: OPT ; do
-	case "${OPT}" in
-	c) GENIMAGE_CFG="${OPTARG}";;
-	:) die "option '${OPTARG}' expects a mandatory argument\n";;
-	\?) die "unknown option '${OPTARG}'\n";;
+while true ; do
+	case "$1" in
+	-c) [ ! -z "$2" ] || die "option '${1}' expects a mandatory argument\n";
+	    GENIMAGE_CFG="${2}";
+	    shift 2 ;;
+	--) shift 1; break ;;
+	*) die "unknown option '${1}'\n";;
 	esac
 done
 
-- 
2.11.0
