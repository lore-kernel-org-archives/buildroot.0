From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:54:42 +0100
Subject: [Buildroot] [git commit] merge_config.sh: add br2-external support
Message-ID: <20180129135525.0828F87F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28fac3973b3c693c453594b007c08c1e1e5c4af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass BR2_EXTERNAL value via -e option.
This will prevent merge_config.sh from silently eating any symbols defined in
external trees on a clean buildroot tree invocation.

Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/merge_config.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 8a1708b50f..e1d7ffa7b5 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -33,6 +33,7 @@ usage() {
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files"
+	echo "  -e    colon-separated list of br2-external trees to use (optional)"
 }
 
 MAKE=true
@@ -71,6 +72,11 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-e")
+		EXTERNAL_ARG="BR2_EXTERNAL=$2"
+		shift 2
+		continue
+		;;
 	*)
 		break
 		;;
@@ -131,7 +137,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
