From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 12 Aug 2015 15:31:05 -0700
Subject: [Buildroot] [RFC] merge_config.sh creates files in buildroot source
	directory
Message-ID: <55CBC929.8020101@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A co-worker had a problem where their Linux .config did not at all match 
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE ("board-layer/linux/board.defconfig" 
below). The problem turned out to be that merge_config.sh was failing. 
(Side note: it failed poorly; the build completed "successfully.")

merge_config.sh is invoked from the root of the Buildroot source tree, 
and attempts to create a temporary file there. This is a problem for my 
team because our Buildroot source tree is shared, and read-only for most 
users. The problem seems to affect all kconfig projects, including Linux 
and busybox.

support/kconfig/merge_config.sh -m -O /.../output/build/linux-4.0 /.../board-layer/linux/board.defconfig
mktemp: cannot create temp file ./.tmp.config.YIXmE19452: Permission denied
Using /.../board-layer/linux/board.defconfig as base
support/kconfig/merge_config.sh: line 88: $TMP_FILE: ambiguous redirect
cp: missing destination file operand after `/.../output/build/linux-4.0/.config'
Try `cp --help' for more information.
#
# merged configuration written to /.../output/build/linux-4.0/.config (needs make)


Invoking mktemp with --tmpdir seems to resolve the problem, but I 
haven't investigated more deeply than that.

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 81b0c61..5beb79d 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -82,7 +82,7 @@ shift;
  
  MERGE_LIST=$*
  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp --tmpdir ./.tmp.config.XXXXXXXXXX)
  
  echo "Using $INITFILE as base"
  cat $INITFILE > $TMP_FILE


-- 
Hollis Blanchard
Mentor Graphics Emulation Division
