From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:42 +0200
Subject: [Buildroot] [PATCH buildroot-test 3/9] utils/daily-mail: add a
 function to shrink strings to a fixed size
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a function to shrink a string to a fixed length while
appending '...' to the remaining part. This allows to factorize a bit
the formatting part and will allow to easily add this kind of length
restriction in future kind of notification.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 0774242..f6a55a6 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -11,6 +11,7 @@ from datetime import date, timedelta
 import localconfig
 import csv
 from collections import defaultdict
+import math
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib  # noqa: E402
@@ -161,13 +162,38 @@ def add_package_notification(branch, notifications, build_result):
     build_result['orphan'] = orphan
 
 
+def shrink_str(string, length, allign='right', fill='...'):
+    '''
+    Returns the `string` shrinked to fit `length` characters and with `fill`
+    added on `allign`.
+
+    :Example:
+
+    >>> shrink_str('This is a very long string!', 10)
+    'This is...'
+
+    >>> shrink_str('This is a very long string!', 20, allign='center', fill='[...]')
+    'This is[...] string!'
+    '''
+    if len(fill) > length:
+        raise ValueError('`length` cannot be shorter than `fill`')
+    if allign == 'right':
+        return string[:length-len(fill)] + fill if len(string) > length else string
+    elif allign == 'left':
+        return fill + string[len(string)-length+len(fill):] if len(string) > length else string
+    elif allign == 'center':
+        lcut = math.floor((length - len(fill)) / 2)
+        rcut = len(string) - math.ceil((length - len(fill)) / 2)
+        return string[:lcut] + fill + string[rcut:] if len(string) > length else string
+    else:
+        raise ValueError('allign must be either `left`, `right` or `center`')
+
+
 def show_results(results, show_status, show_orphan=False):
     contents = ""
     for r in results:
         arch = r['arch']
-        reason = r['reason']
-        if len(reason) > 30:
-            reason = reason[0:27] + "..."
+        reason = shrink_str(r['reason'], 30)
         status = int(r['status'])
         if status == 1:
             status_str = "NOK"
@@ -258,9 +284,7 @@ def global_email_branch_result(results, results_by_reason, branch):
     contents += "Classification of failures by reason\n"
     contents += "------------------------------------\n\n"
     for r in results_by_reason:
-        reason = r['reason']
-        if len(reason) > 30:
-            reason = reason[0:27] + "..."
+        reason = shrink_str(r['reason'], 30)
         count = int(r['reason_count'])
         contents += "%30s | %-2d\n" % (reason, count)
     contents += "\n\n"
-- 
2.21.0
