From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Thu,  1 Nov 2018 04:39:53 +0330
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot config
 files
In-Reply-To: <20181031205608.GA4061@x230>
References: <20181031205608.GA4061@x230>
Message-ID: <20181101010953.20996-1-afshin.nasser@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows us to define config prefix with CONFIG_ environment
variable. Now we can define BR2_ prefix when we are going to merge
buildroot fragment configs.

By setting the proper config prefix, we will have proper 'redundant
configuration warnings' when we use '-r -m' options.

This is actually an upstream patch [1] from linux/kbuild project.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=for-next&id=f6fe19e9d84400e1c9544c1909952c2c7c6a90a2

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 support/kconfig/merge_config.sh                    |  8 ++++-
 ...e_config.sh-Allow-to-define-config-prefix.patch | 39 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 utils/test-pkg                                     |  2 +-
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 50de5114dc..15441182cf 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -34,12 +34,16 @@ usage() {
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -e    colon-separated list of br2-external trees to use (optional)"
+	echo
+	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_
+	environment variable."
 }
 
 RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 OUTPUT=.
+CONFIG_PREFIX=${CONFIG_-CONFIG_}
 
 while true; do
 	case $1 in
@@ -105,7 +109,8 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+
 TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
@@ -157,6 +162,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+unset CONFIG_
 make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
 
diff --git a/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch b/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
new file mode 100644
index 0000000000..7b05736b05
--- /dev/null
+++ b/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
@@ -0,0 +1,39 @@
+Index: kconfig/merge_config.sh
+===================================================================
+--- kconfig.orig/merge_config.sh
++++ kconfig/merge_config.sh
+@@ -34,12 +34,16 @@ usage() {
+ 	echo "  -r    list redundant entries when merging fragments"
+ 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
+ 	echo "  -e    colon-separated list of br2-external trees to use (optional)"
++	echo
++	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_
++	environment variable."
+ }
+ 
+ RUNMAKE=true
+ ALLTARGET=alldefconfig
+ WARNREDUN=false
+ OUTPUT=.
++CONFIG_PREFIX=${CONFIG_-CONFIG_}
+ 
+ while true; do
+ 	case $1 in
+@@ -105,7 +109,8 @@ if [ ! -r "$INITFILE" ]; then
+ fi
+ 
+ MERGE_LIST=$*
+-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
++SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
++
+ TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
+ 
+ echo "Using $INITFILE as base"
+@@ -157,6 +162,7 @@ fi
+ # Use the merged file as the starting point for:
+ # alldefconfig: Fills in any missing symbols with Kconfig default
+ # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
++unset CONFIG_
+ make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
+ 
+ 
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index e136de7937..be8627db13 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -8,3 +8,4 @@
 17-backport-kecho.patch
 18-merge-config.sh-create-temporary-files-in-tmp.patch
 19-merge_config.sh-add-br2-external-support.patch
+20-merge_config.sh-Allow-to-define-config-prefix.patch
diff --git a/utils/test-pkg b/utils/test-pkg
index aa91ee02cf..f2d519b4f6 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -129,7 +129,7 @@ build_one() {
 
     mkdir -p "${dir}"
 
-    support/kconfig/merge_config.sh -O "${dir}" \
+    CONFIG_=BR2_ support/kconfig/merge_config.sh -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
         >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
-- 
2.15.0
