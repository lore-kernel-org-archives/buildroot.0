From: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
Date: Mon, 24 Apr 2017 10:54:45 +0530
Subject: [Buildroot] [PATCH v10 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
Message-ID: <20170424052445.7637-1-abhimanyu.v@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>

When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
ends up with following error:

Error: Missing argument

This is because, an extra positional argument is also passed
along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didn't
have support to parse positional and optional arguments
together.

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

---
 Changes v7->v8
   - New file
 Changes v8->v9
   - Fix indentation
   - Use bash basename as script name instead hardcoding (by arnout)
 Changes v9->v10 (Suggested by Arnout)
   - Remove tab indentation (use existing 2 space indent)
   - Fix commit message grammer
   - add reviewed-by tag
   - keep tested-by tag as no code change just indentation

 support/scripts/genimage.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 0ed0e8bcc..6c8d9e5ad 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -5,13 +5,22 @@ die() {
   exit 1
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
+	-c)
+	  GENIMAGE_CFG="${2}";
+	  shift 2 ;;
+	--) # Discard all non-option parameters
+	  shift 1;
+	  break ;;
+	*)
+	  die "unknown option '${1}'" ;;
 	esac
 done
 
-- 
2.11.0
