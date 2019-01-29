From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:37:47 +0100
Subject: [Buildroot] [git commit] utils/check-package: allow to disable
 warning for a line
Message-ID: <20190129153856.092F18147C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a6c5ab2c31f732802a7ac643ca6335821d6d38f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently any exceptions for a check function need to be coded into the
check-package script itself.

Create a pattern that can be used in a comment to make check-package
ignore one or more warning types in the line immediately below:
 # check-package Indent, VariableWithBraces

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package           | 4 ++++
 utils/checkpackagelib/base.py | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 26439f08eb..ce1fe98d67 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -132,10 +132,14 @@ def check_file_using_lib(fname):
         f = open(fname, "r", errors="surrogateescape")
     else:
         f = open(fname, "r")
+    lastline = ""
     for lineno, text in enumerate(f.readlines()):
         nlines += 1
         for cf in objects:
+            if cf.disable.search(lastline):
+                continue
             nwarnings += print_warnings(cf.check_line(lineno + 1, text))
+        lastline = text
     f.close()
     for cf in objects:
         nwarnings += print_warnings(cf.after())
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index fc09bec9a2..9544a64e5a 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -1,10 +1,12 @@
 # See utils/checkpackagelib/readme.txt before editing this file.
+import re
 
 
 class _CheckFunction(object):
     def __init__(self, filename, url_to_manual):
         self.filename = filename
         self.url_to_manual = url_to_manual
+        self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
 
     def before(self):
         pass
