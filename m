From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Oct 2017 22:43:28 +0200
Subject: [Buildroot] [RFC 1/3] support/kconfig/merge_config.sh: merge also
	buildroot config files
In-Reply-To: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1507668210-5427-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a way to merge buildroot config file programmatically.
It adds an option (-b, buildroot mode) to manage buildroot config files.
The buildroot mode changes the way the script looks for configurations
entries using the BR2_ prefix and modify the call to the make command
to be buildroot friendly.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 support/kconfig/merge_config.sh | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 8a1708b..cb6e439 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -29,6 +29,7 @@ trap clean_up HUP INT TERM
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
 	echo "  -h    display this help text"
+	echo "  -b    buildroot mode (searches for BR2_ and uses a custom make command)"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
@@ -39,6 +40,8 @@ MAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 OUTPUT=.
+BUILDROOT_MODE=FALSE
+CONFIG_PREFIX=CONFIG_
 
 while true; do
 	case $1 in
@@ -71,6 +74,12 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-b")
+		BUILDROOT_MODE=true
+		CONFIG_PREFIX=BR2_
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -81,7 +90,7 @@ INITFILE=$1
 shift;
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
 TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
@@ -131,7 +140,12 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+if [ "$BUILDROOT_MODE" = "false" ]; then
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+else
+cp $TMP_FILE $OUTPUT/.config
+make $OUTPUT_ARG olddefconfig
+fi
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
2.7.4
