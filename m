From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:11:15 +0100
Subject: [Buildroot] [git commit] support/kconfig/merge_config.sh: avoid
 false positive matches from comment lines
Message-ID: <20181202071558.601558A3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b87c2ae816c1395154779a3b907ad660c18dd35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are using empty CONFIG_PREFIX_. This results in false positive match
for comment lines when merging config fragments.

To avoid false positive reports, we use separate sed expressions and
address comment lines explicitly.

This is actually is in the Linux kernel mainline (v4.20-rc2):
6bbe4385d035c6fac56f840a59861a0310ce137b
("kconfig: merge_config: avoid false positive matches from comment lines")

Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/kconfig/merge_config.sh                    |  7 +++--
 ...false-positive-matches-from-comment-lines.patch | 32 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 404ca3864f..14917806a3 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -109,7 +109,8 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
+SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
 
 TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
@@ -123,7 +124,7 @@ for MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
-	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
+	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
@@ -166,7 +167,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
+for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 
 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
 	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
diff --git a/support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch b/support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
new file mode 100644
index 0000000000..c11144e47e
--- /dev/null
+++ b/support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
@@ -0,0 +1,32 @@
+Index: kconfig/merge_config.sh
+===================================================================
+--- kconfig.orig/merge_config.sh
++++ kconfig/merge_config.sh
+@@ -109,7 +109,8 @@ if [ ! -r "$INITFILE" ]; then
+ fi
+ 
+ MERGE_LIST=$*
+-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
++SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
++SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
+ 
+ TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
+ 
+@@ -123,7 +124,7 @@ for MERGE_FILE in $MERGE_LIST ; do
+ 		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
+ 		exit 1
+ 	fi
+-	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
++	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
+ 
+ 	for CFG in $CFG_LIST ; do
+ 		grep -q -w $CFG $TMP_FILE || continue
+@@ -166,7 +167,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERN
+ 
+ 
+ # Check all specified config values took (might have missed-dependency issues)
+-for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
++for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
+ 
+ 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
+ 	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index be8627db13..e5a6f69d8f 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -9,3 +9,4 @@
 18-merge-config.sh-create-temporary-files-in-tmp.patch
 19-merge_config.sh-add-br2-external-support.patch
 20-merge_config.sh-Allow-to-define-config-prefix.patch
+21-Avoid-false-positive-matches-from-comment-lines.patch
