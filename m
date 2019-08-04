From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:44 +0200
Subject: [Buildroot] [PATCH buildroot-test 5/9] utils/daily-mail: improve
 code readability
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-6-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python dictionaries provide a nice way to get a given value from a dict
while returning a default one in case the key doesn't exists.
This function has the particularity to not modify the dictionary.

This patch replaces code chunks that does this by this 'dict.get(key,
default)'.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 12f909e..c489fc1 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -190,10 +190,7 @@ def show_results(results, show_status, show_orphan=False):
             status_str = "NOK"
         elif status == 2:
             status_str = "TIM"
-        if 'orphan' in r and r['orphan']:
-            orphan_str = "ORPH"
-        else:
-            orphan_str = ""
+        orphan_str = 'ORPH' if r.get('orphan') else ''
         url = http_baseurl + "/results/" + r['identifier']
         if show_status:
             contents += "%12s | %30s | %3s | %40s" % (arch, reason, status_str, url)
@@ -224,14 +221,8 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         show_orphan = k.name == ORPHAN_DEVELOPER
 
         for branch in branches:
-            if branch in v.arch_notifications:
-                archs = v.arch_notifications[branch]
-            else:
-                archs = []
-            if branch in v.package_notifications:
-                packages = v.package_notifications[branch]
-            else:
-                packages = []
+            archs = v.arch_notifications.get(branch, [])
+            packages = v.package_notifications.get(branch, [])
 
             if len(archs) == 0 and len(packages) == 0:
                 continue
-- 
2.21.0
