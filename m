From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:47 +0200
Subject: [Buildroot] [PATCH buildroot-test 09/10] utils/daily-mail: add
 argument for gitlab-ci related data
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-10-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides two new data to the args parser to allow enabling
defconfigs, runtime-tests and sanity checks in global/developer emails.
These tree data are grouped together in a gitlab-ci data group as they
are fetched at the same time.

This new list will be use by the next patch to enable gitlab-ci jobs in
email.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 0510c07..6b0a1b4 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -776,7 +776,8 @@ def parse_args():
     parser.add_argument('--branches', action='store', nargs='+', help='List of branches (blank separated)')
     parser.add_argument('--dest', action='store', nargs='+', choices=['dev', 'global'],
                         help='List of emails type to send (ie. global, dev)')
-    parser.add_argument('--data', action='store', nargs='+', choices=['autobuild', 'outdated'],
+    parser.add_argument('--data', action='store', nargs='+',
+                        choices=['autobuild', 'outdated', 'defconfig', 'runtime-test'],
                         help='List of information to add in emails (blank separated)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
@@ -787,13 +788,13 @@ def parse_args():
 def __main__():
     args = parse_args()
     if args.date:
-        date_str = args.date
+        date_struct = datetime.strptime(args.date, '%Y-%m-%d').date()
     else:
-        yesterday = date.today() - timedelta(1)
-        date_str = yesterday.strftime('%Y-%m-%d')
-    branches = args.branches if args.branches else get_branches()
+        date_struct = date.today() - timedelta(1)
+    date_str = date_struct.isoformat()
+    branches = args.branches or get_branches()
     email_dest = set(args.dest) if args.dest else {'dev', 'global'}
-    email_data = set(args.data) if args.data else {'autobuild', 'outdated'}
+    email_data = set(args.data) if args.data else {'autobuild', 'outdated', 'defconfig', 'runtime-test'}
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
-- 
2.21.0
