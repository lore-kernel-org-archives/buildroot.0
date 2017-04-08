From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:33 +0200
Subject: [Buildroot] [git commit] check-package: check *.hash files
Message-ID: <20170408141752.76BBA7FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c931bbf5f168ed7c5c10060d0665b16e0b60e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check each hash entry (see [1]) and warn when:
- it does not have three fields;
- its type is unknown;
- its length does not match its type;
- the name of the file contains a directory component.

[1] http://nightly.buildroot.org/#adding-packages-hash

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/checkpackagelib_hash.py | 62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib_hash.py
index 1f26883..47fe187 100644
--- a/support/scripts/checkpackagelib_hash.py
+++ b/support/scripts/checkpackagelib_hash.py
@@ -3,8 +3,70 @@
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-source".
 
+import re
+
+from checkpackagebase import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
 from checkpackagelib import ConsecutiveEmptyLines
 from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
 from checkpackagelib import TrailingSpace
+
+
+def _empty_line_or_comment(text):
+    return text.strip() == "" or text.startswith("#")
+
+
+class HashFilename(_CheckFunction):
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) < 3:
+            return
+
+        if '/' in fields[2]:
+            return ["{}:{}: use filename without directory component"
+                    " ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class HashNumberOfFields(_CheckFunction):
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) != 3:
+            return ["{}:{}: expected three fields ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class HashType(_CheckFunction):
+    len_of_hash = {"md5": 32, "sha1": 40, "sha224": 56, "sha256": 64,
+                   "sha384": 96, "sha512": 128}
+
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) < 2:
+            return
+
+        htype, hexa = fields[:2]
+        if htype == "none":
+            return
+        if htype not in self.len_of_hash.keys():
+            return ["{}:{}: unexpected type of hash ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+        if not re.match("^[0-9A-Fa-f]{%s}$" % self.len_of_hash[htype], hexa):
+            return ["{}:{}: hash size does not match type "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text,
+                    "expected {} hex digits".format(self.len_of_hash[htype])]
