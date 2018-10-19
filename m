From: Nasser <afshin.nasser@gmail.com>
Date: Sat, 20 Oct 2018 02:28:23 +0330
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant config
 mechanism
Message-ID: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use BR2_* style for configuration variables in buildroot so we should
use this style when extracting configuration options. Otherwise CFG_LIST
will almost always be empty.

The CONFIG_* style has been taken form the Linux kernel and is not
appropriate in this context.

Signed-off-by: Nasser <Afshin.Nasser@gmail.com>
---

If you add 'set -x' in the beginning of the script you can see that $CFG_LIST
is always empty.

When having redundancy in the configuration fragments, you can see that the
$TMP_FILE file has redundant configuration options when calling 'make'. Note
that after applying this patch, calling 'make' in this script, will not produce
any warnings due to redundancy issues anymore. This is because now repeated
options are all properly omitted before calling 'make'. After applying this
patch '-r -m' options work as expected.

Further more, note that without this patch, any inconsistent re-assignment is
not reported by this script. Although there are some warnings if you did not
specify -m option. They are all 'make' reports.

 support/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 67d1314..87a8d02 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -99,7 +99,7 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(BR2_[a-zA-Z0-9_]*\)[= ].*/\2/p"
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
-- 
2.7.4
