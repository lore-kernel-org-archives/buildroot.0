From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:38:41 +0100
Subject: [Buildroot] [git commit] utils/check-package: handle ifdef/ifndef
 in .mk files
Message-ID: <20190129153856.0F28380F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe7a5d7120a50866315c6b02ce07ad10d32dcc8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently check-package only knows about ifeq/ifneq.
Add code to handle ifdef/ifndef as well.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_mk.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 4387cf7167..51c6577d2c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -12,10 +12,14 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
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
@@ -222,8 +226,8 @@ class UselessFlag(_CheckFunction):
         "_INSTALL_REDISTRIBUTE\s*=\s*YES",
         "_INSTALL_STAGING\s*=\s*NO",
         "_INSTALL_TARGET\s*=\s*YES"])))
-    END_CONDITIONAL = re.compile("^\s*(endif)")
-    START_CONDITIONAL = re.compile("^\s*(ifeq|ifneq)")
+    END_CONDITIONAL = re.compile("^\s*({})".format("|".join(end_conditional)))
+    START_CONDITIONAL = re.compile("^\s*({})".format("|".join(start_conditional)))
 
     def before(self):
         self.conditional = 0
