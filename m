From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Jun 2017 00:03:37 +0200
Subject: [Buildroot] [PATCH 1/5] support/check-package: don't check
	filenames of hashes
In-Reply-To: <cover.1498428166.git.yann.morin.1998@free.fr>
References: <cover.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <eafeec501266452fc7973871c7853bf6d016dfce.1498428166.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we check that the filenames in hash lists do not contain
a slash '/' character, because all we are checking so far are the
downloaded archives, and we explicitly need the filename to not contain
a directory component at all.

However, we're soon to also check the hashes of the license files in
packages sources, and those license files may be at any arbitrary
directory-depth in the packages source tree, and thus two or more
license files may have the same basename.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/scripts/checkpackagelib/lib_hash.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/support/scripts/checkpackagelib/lib_hash.py b/support/scripts/checkpackagelib/lib_hash.py
index c76abb43f1..e4beb0404f 100644
--- a/support/scripts/checkpackagelib/lib_hash.py
+++ b/support/scripts/checkpackagelib/lib_hash.py
@@ -17,22 +17,6 @@ def _empty_line_or_comment(text):
     return text.strip() == "" or text.startswith("#")
 
 
-class HashFilename(_CheckFunction):
-    def check_line(self, lineno, text):
-        if _empty_line_or_comment(text):
-            return
-
-        fields = text.split()
-        if len(fields) < 3:
-            return
-
-        if '/' in fields[2]:
-            return ["{}:{}: use filename without directory component"
-                    " ({}#adding-packages-hash)"
-                    .format(self.filename, lineno, self.url_to_manual),
-                    text]
-
-
 class HashNumberOfFields(_CheckFunction):
     def check_line(self, lineno, text):
         if _empty_line_or_comment(text):
-- 
2.11.0
