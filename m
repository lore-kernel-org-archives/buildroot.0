From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:33 +0200
Subject: [Buildroot] [buildroot-test 2/5] utils/daily-mail: allow to pass a
 date in arguments
In-Reply-To: <20190804152536.17829-1-victor.huesca@bootlin.com>
References: <20190804152536.17829-1-victor.huesca@bootlin.com>
Message-ID: <20190804152536.17829-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use a custorm date instead of the hardcoded yesterday.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index d4c69f6..cb7402f 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -13,10 +13,13 @@ import csv
 from collections import defaultdict
 import math
 import argparse
+import re
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib  # noqa: E402
 
+RE_DATE = re.compile(r'^\d\d\d\d-\d\d-\d\d$')
+
 baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
 
@@ -383,13 +386,20 @@ def calculate_notifications(results):
 def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('--dry-run', action='store_true', help='Do not send email, only show output')
-    return parser.parse_args()
+    parser.add_argument('--date', action='store', help='Use this date instead of yesterday')
+    args = parser.parse_args()
+    if args.date and not RE_DATE.match(args.date):
+        parser.error('date must be in format YYYY-MM-DD')
+    return args
 
 
 def __main__():
     args = parse_args()
-    yesterday = date.today() - timedelta(1)
-    yesterday_str = yesterday.strftime('%Y-%m-%d')
+    if args.date:
+        yesterday_str = args.date
+    else:
+        yesterday = date.today() - timedelta(1)
+        yesterday_str = yesterday.strftime('%Y-%m-%d')
     branches = get_branches()
 
     db = _mysql.connect(host=localconfig.host,
-- 
2.21.0
