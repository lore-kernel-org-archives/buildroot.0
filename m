From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:14:04 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/4] utils/daily-mail: allow to
 print a header for results section
In-Reply-To: <20190708081406.28215-1-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
Message-ID: <20190708081406.28215-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This table quite clear without header but as I had a template for the outdated
table I also added the possibility to include one for results too.

Note that this commit only add the option to print the header but does not
enable it, so the existing behavior is preserved.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 4ab7710..b4d0a56 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -158,8 +158,25 @@ def add_outdated_pkg_notification(notifications, outdated_pkg):
             notif = get_notification_for_dev(notifications, get_orphan_developer())
             notif.package_version_notification.append(pkg)
 
-def show_results(results, show_status, show_orphan=False):
+
+def show_results(results, show_status, show_orphan=False, show_header=False):
     contents = ""
+    if show_header:
+        if show_status:
+            contents += '{:^12} | {:^30} | {:^3} | {:^79}'.format('arch', 'reason', 'OK?', 'url')
+        else:
+            contents += '{:^12} | {:^30} | {:^79}'.format('arch', 'reason', 'url')
+        if show_orphan:
+            contents += ' | {:^5}'.format('orph?')
+
+        if show_status:
+            contents += '\n{0:-^12}-+-{0:-^30}-+-{0:-^3}-+-{0:-^79}-'.format('')
+        else:
+            contents += '\n{0:-^12}-+-{0:-^30}-+-{0:-^79}-'.format('')
+        if show_orphan:
+            contents += '+-{:-^5}-'.format('')
+        contents += '\n'
+
     for r in results:
         arch = r['arch']
         reason = r['reason']
-- 
2.21.0
