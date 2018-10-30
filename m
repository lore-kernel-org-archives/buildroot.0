From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:58:09 +0100
Subject: [Buildroot] [git commit] kconfig: Restore missing custom changes +
 add patches
Message-ID: <20181030201012.E029083239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3366b270562f42723a3b8032f73bb03b541d113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6eacea5ae0 accidentally removed these changes in merge_config.sh:
0f56304521 ("merge_config.sh: create temporary files in /tmp")
28fac3973b ("merge_config.sh: add br2-external support")

Changes were lost because commits just changed files, but didn't add patches.
Therefore not only restore our changes, but also add (updated) patches.

Missing 0f56304521 caused breaking merge_config.sh when used in out of
tree build:
$ make -C buildroot O=$PWD/output defconfig
...
$ cd output
$ echo 'BR2_TARGET_GENERIC_HOSTNAME="test"' > test.frag
$ ../buildroot/support/kconfig/merge_config.sh .config test.frag
Using .config as base
Merging test.frag
umask 0022 && make -C /home/test/buildroot O=/home/test/output/. alldefconfig
  GEN     /home/test/output/Makefile
*** Can't read seed configuration "./.tmp.config.qIcpASpUyh"!
make[1]: *** [Makefile:925: alldefconfig] Error 1
make: *** [Makefile:16: _all] Error 2

Fixes: 6eacea5ae0 support/kconfig: bump to kconfig from Linux 4.17-rc2

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reported-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/merge_config.sh                    | 10 ++++-
 ...e-config.sh-create-temporary-files-in-tmp.patch | 27 +++++++++++++
 ...-merge_config.sh-add-br2-external-support.patch | 47 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  2 +
 4 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 67d1314476..50de5114dc 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -33,6 +33,7 @@ usage() {
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
+	echo "  -e    colon-separated list of br2-external trees to use (optional)"
 }
 
 RUNMAKE=true
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
@@ -100,7 +106,7 @@ fi
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
@@ -151,7 +157,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
diff --git a/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
new file mode 100644
index 0000000000..f2a261f308
--- /dev/null
+++ b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
@@ -0,0 +1,27 @@
+commit 0f56304521db42bd2c05867fd78a247104a4ad95
+Author: Henrique Marks <henrique.marks@datacom.ind.br>
+Date: Mon, 7 Dec 2015 12:08:45 -0200
+
+    merge_config.sh: create temporary files in /tmp
+
+    Creating temporary files in /tmp (or the path pointed by $TMPDIR) allows the
+    buildroot top directory to be read-only and shareable between multible builds.
+    This follows what other scripts do, e.g. check-kernel-headers.sh.
+
+    Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
+    Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+Index: kconfig/merge_config.sh
+===================================================================
+--- kconfig.orig/merge_config.sh
++++ kconfig/merge_config.sh
+@@ -100,7 +100,7 @@ fi
+ 
+ MERGE_LIST=$*
+ SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
++TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
+ 
+ echo "Using $INITFILE as base"
+ cat $INITFILE > $TMP_FILE
diff --git a/support/kconfig/patches/19-merge_config.sh-add-br2-external-support.patch b/support/kconfig/patches/19-merge_config.sh-add-br2-external-support.patch
new file mode 100644
index 0000000000..1d0ef323bd
--- /dev/null
+++ b/support/kconfig/patches/19-merge_config.sh-add-br2-external-support.patch
@@ -0,0 +1,47 @@
+commit 28fac3973b3c693c453594b007c08c1e1e5c4af3
+Author: Ilya Kuzmich <ilya.kuzmich@gmail.com>
+Date: Tue, 9 Jan 2018 14:37:43 +0300
+
+    merge_config.sh: add br2-external support
+
+    Pass BR2_EXTERNAL value via -e option.
+    This will prevent merge_config.sh from silently eating any symbols defined in
+    external trees on a clean buildroot tree invocation.
+
+    Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
+    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+Index: kconfig/merge_config.sh
+===================================================================
+--- kconfig.orig/merge_config.sh
++++ kconfig/merge_config.sh
+@@ -33,6 +33,7 @@ usage() {
+ 	echo "  -n    use allnoconfig instead of alldefconfig"
+ 	echo "  -r    list redundant entries when merging fragments"
+ 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
++	echo "  -e    colon-separated list of br2-external trees to use (optional)"
+ }
+ 
+ RUNMAKE=true
+@@ -71,6 +72,11 @@ while true; do
+ 		shift 2
+ 		continue
+ 		;;
++	"-e")
++		EXTERNAL_ARG="BR2_EXTERNAL=$2"
++		shift 2
++		continue
++		;;
+ 	*)
+ 		break
+ 		;;
+@@ -151,7 +157,7 @@ fi
+ # Use the merged file as the starting point for:
+ # alldefconfig: Fills in any missing symbols with Kconfig default
+ # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
++make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
+ 
+ 
+ # Check all specified config values took (might have missed-dependency issues)
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 36591e2189..e136de7937 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -6,3 +6,5 @@
 14-support-out-of-tree-config.patch
 16-fix-space-to-de-select-options.patch
 17-backport-kecho.patch
+18-merge-config.sh-create-temporary-files-in-tmp.patch
+19-merge_config.sh-add-br2-external-support.patch
