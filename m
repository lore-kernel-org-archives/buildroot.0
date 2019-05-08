From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 May 2019 19:34:27 +0200
Subject: [Buildroot] [PATCH v1] utils/check-package: warn about utf-8
 characters in .mk files
Message-ID: <20190508173427.8612-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: is_ascii taken from one of the stackoverflow suggestions ([1])

[1] https://stackoverflow.com/questions/196345/how-to-check-if-a-string-in-python-is-in-ascii
---
 utils/checkpackagelib/lib.py    | 13 +++++++++++++
 utils/checkpackagelib/lib_mk.py |  1 +
 2 files changed, 14 insertions(+)

diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
index 6afe1aabce..c65a2ed939 100644
--- a/utils/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -52,3 +52,16 @@ class TrailingSpace(_CheckFunction):
             return ["{}:{}: line contains trailing whitespace"
                     .format(self.filename, lineno),
                     text]
+
+class Utf8Characters(_CheckFunction):
+    def is_ascii(self, s):
+        try:
+            return all(ord(c) < 128 for c in s)
+        except TypeError:
+            return False
+
+    def check_line(self, lineno, text):
+        if not self.is_ascii(text):
+            return ["{}:{}: line contains UTF-8 characters"
+                    .format(self.filename, lineno),
+                    text]
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 00efeb7fb2..9e9a045776 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -11,6 +11,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.lib import Utf8Characters         # noqa: F401

 # used in more than one check
 start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
--
2.21.0
