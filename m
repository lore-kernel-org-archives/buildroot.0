From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:32 +0200
Subject: [Buildroot] [git commit] check-package: check whitespace and empty
	lines
Message-ID: <20170408141752.6C8A57FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6bf3239cb1650c3fb7451d6a2026c64db2a15bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create 3 new check functions to warn when:
- there are consecutive empty lines in the file, see [1];
- the last line of the file is empty, see [2];
- there are lines with trailing whitespace, see [3].

Apply these functions to Config.*, *.mk and *.hash, but not for *.patch
files since they can contain any of these and still be valid.

[1] http://patchwork.ozlabs.org/patch/682660/
[2] http://patchwork.ozlabs.org/patch/643288/
[3] http://patchwork.ozlabs.org/patch/398984/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/checkpackagelib.py        | 35 +++++++++++++++++++++++++++++++
 support/scripts/checkpackagelib_config.py |  3 +++
 support/scripts/checkpackagelib_hash.py   |  3 +++
 support/scripts/checkpackagelib_mk.py     |  3 +++
 4 files changed, 44 insertions(+)

diff --git a/support/scripts/checkpackagelib.py b/support/scripts/checkpackagelib.py
index 1a49041..2800845 100644
--- a/support/scripts/checkpackagelib.py
+++ b/support/scripts/checkpackagelib.py
@@ -3,6 +3,32 @@
 from checkpackagebase import _CheckFunction
 
 
+class ConsecutiveEmptyLines(_CheckFunction):
+    def before(self):
+        self.lastline = "non empty"
+
+    def check_line(self, lineno, text):
+        if text.strip() == "" == self.lastline.strip():
+            return ["{}:{}: consecutive empty lines"
+                    .format(self.filename, lineno)]
+        self.lastline = text
+
+
+class EmptyLastLine(_CheckFunction):
+    def before(self):
+        self.lastlineno = 0
+        self.lastline = "non empty"
+
+    def check_line(self, lineno, text):
+        self.lastlineno = lineno
+        self.lastline = text
+
+    def after(self):
+        if self.lastline.strip() == "":
+            return ["{}:{}: empty line at end of file"
+                    .format(self.filename, self.lastlineno)]
+
+
 class NewlineAtEof(_CheckFunction):
     def before(self):
         self.lastlineno = 0
@@ -17,3 +43,12 @@ class NewlineAtEof(_CheckFunction):
             return ["{}:{}: missing newline at end of file"
                     .format(self.filename, self.lastlineno),
                     self.lastline]
+
+
+class TrailingSpace(_CheckFunction):
+    def check_line(self, lineno, text):
+        line = text.rstrip("\r\n")
+        if line != line.rstrip():
+            return ["{}:{}: line contains trailing whitespace"
+                    .format(self.filename, lineno),
+                    text]
diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib_config.py
index f546d17..ee5981e 100644
--- a/support/scripts/checkpackagelib_config.py
+++ b/support/scripts/checkpackagelib_config.py
@@ -4,4 +4,7 @@
 # checked by running "make menuconfig".
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import ConsecutiveEmptyLines
+from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
+from checkpackagelib import TrailingSpace
diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib_hash.py
index 8c0337f..1f26883 100644
--- a/support/scripts/checkpackagelib_hash.py
+++ b/support/scripts/checkpackagelib_hash.py
@@ -4,4 +4,7 @@
 # "make package-dirclean package-source".
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import ConsecutiveEmptyLines
+from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
+from checkpackagelib import TrailingSpace
diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
index 84eeef8..a37304b 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -5,4 +5,7 @@
 # packages enabled.
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import ConsecutiveEmptyLines
+from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
+from checkpackagelib import TrailingSpace
