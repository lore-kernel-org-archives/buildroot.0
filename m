From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 22:55:52 +0200
Subject: [Buildroot] [git commit] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
Message-ID: <20170427213728.AD9A882839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e73cf8a228a15ae11530cd589b11930cf4f4478d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/genimage.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 0ed0e8b..6c8d9e5 100755
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
 
