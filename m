From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 17:33:22 +0200
Subject: [Buildroot] [git commit] support/check-package: don't check
	filenames of hashes
Message-ID: <20170703161020.0BC79804FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efb61ae07bfe21bda5b323364a2b38ece01ba40a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we check that the filenames in hash lists do not contain
a slash '/' character, because all we are checking so far are the
downloaded archives, and we explicitly need the filename to not contain
a directory component at all.

However, we're soon to also check the hashes of the license files in
packages sources, and those license files may be at any arbitrary
directory-depth in the packages source tree.

[Peter: Remove reference to files with same basename]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_hash.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 10b2748..c4d055e 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
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
