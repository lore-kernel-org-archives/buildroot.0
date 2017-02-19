From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:18 -0300
Subject: [Buildroot] [PATCH v2 3/9] check-package: check whitespace and
	empty lines
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - update commit subject since now Config.* are tested;
  - use classes instead of functions to declare each check (Thomas DS);
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m0.622s
    user	0m0.576s
    sys	0m0.048s
    
    ConsecutiveEmptyLines:
     support/scripts/check-package --include-only ConsecutiveEmptyLines \
     $(find package -type f) 2>/dev/null | wc -l
      23
     (cd support/scripts/check-package-example && \
     ../check-package --include-only ConsecutiveEmptyLines -vv package/*/*)
      package/package1/Config.in:22: consecutive empty lines
      package/package1/Config.something:3: consecutive empty lines
      package/package1/package1.hash:8: consecutive empty lines
      package/package1/package1.mk:25: consecutive empty lines
      180 lines processed
      4 warnings generated
    
    EmptyLastLine:
     support/scripts/check-package --include-only EmptyLastLine \
     $(find package -type f) 2>/dev/null | wc -l
      18
     (cd support/scripts/check-package-example && \
     ../check-package --include-only EmptyLastLine -vv package/*/*)
      package/package1/package1.hash:8: empty line at end of file
      package/package1/package1.mk:55: empty line at end of file
      180 lines processed
      2 warnings generated
    
    TrailingSpace:
     support/scripts/check-package --include-only TrailingSpace \
     $(find package -type f) 2>/dev/null | wc -l
      5
     (cd support/scripts/check-package-example && \
     ../check-package --include-only TrailingSpace -vv package/*/*)
      package/package1/package1.hash:2: line contains trailing whitespace
      sha256 1234567890123456789012345678901234567890123456789012345678901234 package1-1.0.tar.gz
      package/package1/package1.hash:7: line contains trailing whitespace
    
      package/package1/package1.mk:7: line contains trailing whitespace
      PACKAGE1_SITE = https://localhost
      package/package1/package1.mk:14: line contains trailing whitespace
      PACKAGE1_INSTALL_STAGING=NO
      package/package1/package1.mk:15: line contains trailing whitespace
      PACKAGE1_INSTALL_TARGET = YES< tab  >
      package/package1/package1.mk:55: line contains trailing whitespace
      < tab  >
      180 lines processed
      6 warnings generated

 support/scripts/checkpackagelib.py        | 35 +++++++++++++++++++++++++++++++
 support/scripts/checkpackagelib_config.py |  3 +++
 support/scripts/checkpackagelib_hash.py   |  3 +++
 support/scripts/checkpackagelib_mk.py     |  3 +++
 4 files changed, 44 insertions(+)

diff --git a/support/scripts/checkpackagelib.py b/support/scripts/checkpackagelib.py
index 1a4904183..280084575 100644
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
index f546d173e..ee5981e64 100644
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
index 8c0337fc9..1f268838f 100644
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
index 84eeef889..a37304b6d 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -5,4 +5,7 @@
 # packages enabled.
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import ConsecutiveEmptyLines
+from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
+from checkpackagelib import TrailingSpace
-- 
2.11.0
