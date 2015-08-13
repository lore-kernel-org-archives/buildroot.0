From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 13 Aug 2015 15:22:52 -0700
Subject: [Buildroot] [PATCH] kconfig: support read-only Buildroot source
	directories
Message-ID: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

merge_config.sh currently tries to create a .tmp file in the top-level
Buildroot source tree. This fails when that directory is read-only, leading
to unexpected .config file contents (affecting the configuration of Buildroot
itself, Linux, and Busybox).

Fix it by using mktemp --tmpdir to create the .tmp file in $TMPDIR or /tmp.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 support/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 81b0c61..19d968b 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -82,7 +82,7 @@ shift;
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp --tmpdir .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
-- 
2.3.2
