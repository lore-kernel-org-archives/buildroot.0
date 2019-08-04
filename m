From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:48 +0200
Subject: [Buildroot] [PATCH buildroot-test 9/9] utils/daily-mail: add a
 header for the build_results section
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-10-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a header to the autobuild_results table will keep the email clear
when other notifications -- and thus other tables -- will be added.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/utils/daily-mail b/utils/daily-mail
index 7af1933..2d5e684 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -182,6 +182,23 @@ def shrink_str(string, length, allign='right', fill='...'):
 
 def show_results(results, show_status, show_orphan=False):
     contents = ""
+    # Header
+    if show_status:
+        contents += '{:^12} | {:^30} | {:^3} | {:^79}'.format('arch', 'reason', 'OK?', 'url')
+    else:
+        contents += '{:^12} | {:^30} | {:^79}'.format('arch', 'reason', 'url')
+    if show_orphan:
+        contents += ' | {:^5}'.format('orph?')
+
+    if show_status:
+        contents += '\n{0:-^12}-+-{0:-^30}-+-{0:-^3}-+-{0:-^79}-'.format('')
+    else:
+        contents += '\n{0:-^12}-+-{0:-^30}-+-{0:-^79}-'.format('')
+    if show_orphan:
+        contents += '+-{0:-^5}-'.format('')
+    contents += '\n'
+
+    # Actual data
     for r in results:
         arch = r['arch']
         reason = shrink_str(r['reason'], 30)
-- 
2.21.0
