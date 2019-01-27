From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:42 -0200
Subject: [Buildroot] [PATCH 7/8] utils/check-package: handle ifdef/ifndef in
 .mk files
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently check-package only knows about ifeq/ifneq.
Add code to handle ifdef/ifndef as well.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 4387cf7167..51c6577d2c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -1,34 +1,38 @@
 # See utils/checkpackagelib/readme.txt before editing this file.
 # There are already dependency checks during the build, so below check
 # functions don't need to check for things already checked by exploring the
 # menu options using "make menuconfig" and by running "make" with appropriate
 # packages enabled.
 
 import re
 
 from checkpackagelib.base import _CheckFunction
 from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 
+# used in more than one check
+start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
+end_conditional = ["endif"]
+
 
 class Indent(_CheckFunction):
     COMMENT = re.compile("^\s*#")
-    CONDITIONAL = re.compile("^\s*(ifeq|ifneq|endif)\s")
+    CONDITIONAL = re.compile("^\s*({})\s".format("|".join(start_conditional + end_conditional)))
     ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
     END_DEFINE = re.compile("^\s*endef\s")
     MAKEFILE_TARGET = re.compile("^[^# \t]+:\s")
     START_DEFINE = re.compile("^\s*define\s")
 
     def before(self):
         self.define = False
         self.backslash = False
         self.makefile_target = False
 
     def check_line(self, lineno, text):
         if self.START_DEFINE.search(text):
             self.define = True
             return
         if self.END_DEFINE.search(text):
             self.define = False
@@ -209,34 +213,34 @@ class TypoInPackageVariable(_CheckFunction):
             return
         if self.REGEX.search(text) is None:
             return ["{}:{}: possible typo: {} -> *{}*"
                     .format(self.filename, lineno, variable, self.package),
                     text]
 
 
 class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
         "_AUTORECONF\s*=\s*NO",
         "_LIBTOOL_PATCH\s*=\s*YES"])))
     DEFAULT_GENERIC_FLAG = re.compile("^.*{}".format("|".join([
         "_INSTALL_IMAGES\s*=\s*NO",
         "_INSTALL_REDISTRIBUTE\s*=\s*YES",
         "_INSTALL_STAGING\s*=\s*NO",
         "_INSTALL_TARGET\s*=\s*YES"])))
-    END_CONDITIONAL = re.compile("^\s*(endif)")
-    START_CONDITIONAL = re.compile("^\s*(ifeq|ifneq)")
+    END_CONDITIONAL = re.compile("^\s*({})".format("|".join(end_conditional)))
+    START_CONDITIONAL = re.compile("^\s*({})".format("|".join(start_conditional)))
 
     def before(self):
         self.conditional = 0
 
     def check_line(self, lineno, text):
         if self.START_CONDITIONAL.search(text):
             self.conditional += 1
             return
         if self.END_CONDITIONAL.search(text):
             self.conditional -= 1
             return
 
         # allow non-default conditionally overridden by default
         if self.conditional > 0:
             return
 
-- 
2.17.1
