From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 31 Dec 2016 01:21:04 -0200
Subject: [Buildroot] [PATCH 3/9] check-package: check whitespace and empty
	lines
In-Reply-To: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
Message-ID: <20161231032110.11573-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create 3 new check functions to warn when:
- there are consecutive empty lines in the file, see [1];
- the last line of the file is empty, see [2];
- there are lines with trailing whitespace, see [3].

Apply these functions to Config.in, .mk and .hash, but not for .patch
files since they can contain any of these and still be valid.

[1] http://patchwork.ozlabs.org/patch/682660/
[2] http://patchwork.ozlabs.org/patch/643288/
[3] http://patchwork.ozlabs.org/patch/398984/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m0.787s
    user	0m0.772s
    sys	0m0.012s
    
    CHECK_CONSECUTIVE_EMPTY_LINES:
     support/scripts/check-package --include-only check_consecutive_empty_lines \
     $(find package -type f) 2>/dev/null | wc -l
      22
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_consecutive_empty_lines -vv package/*/*)
      package/package1/Config.in:22: consecutive empty lines
      package/package1/package1.hash:8: consecutive empty lines
      package/package1/package1.mk:23: consecutive empty lines
      159 lines processed
      3 warnings generated
    
    CHECK_EMPTY_LAST_LINE:
     support/scripts/check-package --include-only check_empty_last_line \
     $(find package -type f) 2>/dev/null | wc -l
      17
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_empty_last_line -vv package/*/*)
      package/package1/package1.hash:8: empty line at end of file
      package/package1/package1.mk:48: empty line at end of file
      159 lines processed
      2 warnings generated
    
    CHECK_TRAILING_SPACE:
     support/scripts/check-package --include-only check_trailing_space \
     $(find package -type f) 2>/dev/null | wc -l
      3
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_trailing_space -vv package/*/*)
      package/package1/package1.hash:2: line contains trailing whitespace
      sha256 1234567890123456789012345678901234567890123456789012345678901234 package1-1.0.tar.gz
      package/package1/package1.hash:7: line contains trailing whitespace
    
      package/package1/package1.mk:7: line contains trailing whitespace
      PACKAGE1_SITE = https://localhost
      package/package1/package1.mk:12: line contains trailing whitespace
      PACKAGE1_INSTALL_STAGING=NO
      package/package1/package1.mk:13: line contains trailing whitespace
      PACKAGE1_INSTALL_TARGET = YES< tab  >
      package/package1/package1.mk:48: line contains trailing whitespace
      < tab  >
      159 lines processed
      6 warnings generated

 support/scripts/checkpackagelib.py        | 38 +++++++++++++++++++++++++++++++
 support/scripts/checkpackagelib_config.py |  3 +++
 support/scripts/checkpackagelib_hash.py   |  3 +++
 support/scripts/checkpackagelib_mk.py     |  3 +++
 4 files changed, 47 insertions(+)

diff --git a/support/scripts/checkpackagelib.py b/support/scripts/checkpackagelib.py
index 987399954..787b22551 100644
--- a/support/scripts/checkpackagelib.py
+++ b/support/scripts/checkpackagelib.py
@@ -1,6 +1,33 @@
 # See support/scripts/check-package.txt before editing this file.
 
 
+def check_consecutive_empty_lines(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_consecutive_empty_lines.lastline = "non empty"
+        return
+    if end:
+        return
+    if text.strip() == "" == check_consecutive_empty_lines.lastline.strip():
+        return ["{}:{}: consecutive empty lines".format(fname, lineno)]
+    check_consecutive_empty_lines.lastline = text
+
+
+def check_empty_last_line(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_empty_last_line.lastlineno = 0
+        check_empty_last_line.lastline = "non empty"
+        return
+    if end:
+        if check_empty_last_line.lastline.strip() == "":
+            return ["{}:{}: empty line at end of file"
+                    .format(fname, check_empty_last_line.lastlineno)]
+        return
+    check_empty_last_line.lastlineno = lineno
+    check_empty_last_line.lastline = text
+
+
 def check_newline_at_eof(
         fname, args, lineno=0, text=None, start=False, end=False):
     if start:
@@ -16,3 +43,14 @@ def check_newline_at_eof(
         return
     check_newline_at_eof.lastlineno = lineno
     check_newline_at_eof.lastline = text
+
+
+def check_trailing_space(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start or end:
+        return
+    line = text.rstrip("\r\n")
+    if line != line.rstrip():
+        return ["{}:{}: line contains trailing whitespace"
+                .format(fname, lineno),
+                text]
diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib_config.py
index 2660cccd7..aec8b3ea4 100644
--- a/support/scripts/checkpackagelib_config.py
+++ b/support/scripts/checkpackagelib_config.py
@@ -4,4 +4,7 @@
 # checked by running "make menuconfig".
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import check_consecutive_empty_lines
+from checkpackagelib import check_empty_last_line
 from checkpackagelib import check_newline_at_eof
+from checkpackagelib import check_trailing_space
diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib_hash.py
index 590d5a7c4..d095f9255 100644
--- a/support/scripts/checkpackagelib_hash.py
+++ b/support/scripts/checkpackagelib_hash.py
@@ -4,4 +4,7 @@
 # "make package-dirclean package-source".
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import check_consecutive_empty_lines
+from checkpackagelib import check_empty_last_line
 from checkpackagelib import check_newline_at_eof
+from checkpackagelib import check_trailing_space
diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
index ad7362335..1ff0973dd 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -5,4 +5,7 @@
 # packages enabled.
 
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
+from checkpackagelib import check_consecutive_empty_lines
+from checkpackagelib import check_empty_last_line
 from checkpackagelib import check_newline_at_eof
+from checkpackagelib import check_trailing_space
-- 
2.11.0
