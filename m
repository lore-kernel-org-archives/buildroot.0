From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Thu, 28 Dec 2017 18:04:41 +0300
Subject: [Buildroot] [PATCH 1/1] merge_config.sh: add br2-external support
Message-ID: <1514473481-20353-1-git-send-email-ilya.kuzmich@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass BR2_EXTERNAL value via -e option.
This will prevent merge_config.sh from silently eating any symbols defined in
external trees on a clean buildroot tree invocation.

Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
---
 support/kconfig/merge_config.sh | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 8a1708b..f52318a 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -33,6 +33,7 @@ usage() {
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files"
+	echo "  -e    br external tree"
 }
 
 MAKE=true
@@ -71,6 +72,11 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-e")
+		EXTERNAL=$2
+		shift 2
+		continue
+		;;
 	*)
 		break
 		;;
@@ -127,11 +133,16 @@ if [ "$OUTPUT" != "." ] ; then
 	OUTPUT_ARG="O=$OUTPUT"
 fi
 
+EXTERNAL_ARG=""
+if [ "$EXTERNAL" ] ; then
+    EXTERNAL_ARG="BR2_EXTERNAL=$EXTERNAL"
+fi
+
 
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
2.7.4
