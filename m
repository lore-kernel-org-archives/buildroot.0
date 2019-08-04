From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:34 +0200
Subject: [Buildroot] [buildroot-test 3/5] utils/daily-mail: allow to specify
 branches from command-line
In-Reply-To: <20190804152536.17829-1-victor.huesca@bootlin.com>
References: <20190804152536.17829-1-victor.huesca@bootlin.com>
Message-ID: <20190804152536.17829-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to specify branches to include in emails instead of
reading the 'branches' file. If no branch is provided, the default
'branches' file is used.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index cb7402f..040ee15 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -387,6 +387,7 @@ def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('--dry-run', action='store_true', help='Do not send email, only show output')
     parser.add_argument('--date', action='store', help='Use this date instead of yesterday')
+    parser.add_argument('--branches', action='store', nargs='+', help='List of branches (blank separated)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
         parser.error('date must be in format YYYY-MM-DD')
@@ -400,7 +401,7 @@ def __main__():
     else:
         yesterday = date.today() - timedelta(1)
         yesterday_str = yesterday.strftime('%Y-%m-%d')
-    branches = get_branches()
+    branches = args.branches if args.branches else get_branches()
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
-- 
2.21.0
