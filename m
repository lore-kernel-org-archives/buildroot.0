From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:11:11 +0100
Subject: [Buildroot] [git commit] support/kconfig/merge_config.sh: fix
 merging buildroot config files
Message-ID: <20181202071558.5104D82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f069a665c862b6c4890d0802e7835d0ba62e27a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows us to define config prefix with CONFIG_ environment
variable.

By setting the proper config prefix, we will have proper 'redundant
configuration warnings' when we use '-r -m' options.

This is actually already in mainline for v4.20-rc1:
2cd3faf87d2d8f6123adf34741b9a7b98828a76f
("merge_config.sh: Allow to define config prefix")

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/kconfig/merge_config.sh                    |  7 ++++-
 ...e_config.sh-Allow-to-define-config-prefix.patch | 31 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 50de5114dc..404ca3864f 100755
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
diff --git a/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch b/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
new file mode 100644
index 0000000000..645043b163
--- /dev/null
+++ b/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
@@ -0,0 +1,31 @@
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
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index e136de7937..be8627db13 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -8,3 +8,4 @@
 17-backport-kecho.patch
 18-merge-config.sh-create-temporary-files-in-tmp.patch
 19-merge_config.sh-add-br2-external-support.patch
+20-merge_config.sh-Allow-to-define-config-prefix.patch
