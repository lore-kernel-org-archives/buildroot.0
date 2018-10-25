From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Thu, 25 Oct 2018 04:43:43 +0330
Subject: [Buildroot] [PATCH v2] merge_config.sh: merge also buildroot config
 files
In-Reply-To: <13fac09f-009d-4bbf-1cce-d7d3cd2fd2d6@mind.be>
References: <13fac09f-009d-4bbf-1cce-d7d3cd2fd2d6@mind.be>
Message-ID: <20181025011343.29512-1-afshin.nasser@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds a way to merge buildroot config file programmatically.
It adds an option (-b, buildroot mode) to manage buildroot config files.
The buildroot mode changes the way the script looks for configurations
entries using the BR2_ prefix and modify the call to the make command
to be buildroot friendly.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 ...18-fix-finding-redundant-config-mechanism.patch | 41 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 support/kconfig/patches/18-fix-finding-redundant-config-mechanism.patch

diff --git a/support/kconfig/patches/18-fix-finding-redundant-config-mechanism.patch b/support/kconfig/patches/18-fix-finding-redundant-config-mechanism.patch
new file mode 100644
index 0000000000..eec92a5fad
--- /dev/null
+++ b/support/kconfig/patches/18-fix-finding-redundant-config-mechanism.patch
@@ -0,0 +1,41 @@
+Index: kconfig/merge_config.sh
+===================================================================
+--- kconfig.orig/merge_config.sh
++++ kconfig/merge_config.sh
+@@ -29,6 +29,7 @@ trap clean_up HUP INT TERM
+ usage() {
+ 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+ 	echo "  -h    display this help text"
++	echo "  -b    buildroot mode (searches for BR2_ and uses a custom make command)"
+ 	echo "  -m    only merge the fragments, do not execute the make command"
+ 	echo "  -n    use allnoconfig instead of alldefconfig"
+ 	echo "  -r    list redundant entries when merging fragments"
+@@ -39,6 +40,7 @@ RUNMAKE=true
+ ALLTARGET=alldefconfig
+ WARNREDUN=false
+ OUTPUT=.
++CONFIG_PREFIX=CONFIG_
+ 
+ while true; do
+ 	case $1 in
+@@ -71,6 +73,11 @@ while true; do
+ 		shift 2
+ 		continue
+ 		;;
++	"-b")
++		CONFIG_PREFIX=BR2_
++		shift
++		continue
++		;;
+ 	*)
+ 		break
+ 		;;
+@@ -99,7 +106,7 @@ if [ ! -r "$INITFILE" ]; then
+ fi
+ 
+ MERGE_LIST=$*
+-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
++SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+ 
+ echo "Using $INITFILE as base"
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 36591e2189..5ebc2e0225 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -6,3 +6,4 @@
 14-support-out-of-tree-config.patch
 16-fix-space-to-de-select-options.patch
 17-backport-kecho.patch
+18-fix-finding-redundant-config-mechanism.patch
-- 
2.15.0
