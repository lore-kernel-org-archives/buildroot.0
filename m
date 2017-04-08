From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:34 +0200
Subject: [Buildroot] [git commit] check-package: check *.patch files
Message-ID: <20170408141752.8170E82563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23b0b4c02818be535086f5e2b1962bfa9d4a321c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warn when the name of the patch file does not start with number (apply
order), see [1].
Warn when the patch was generated using git format-patch without -N, see
[2].
Warn when the patch file has no SoB, see [3].

[1] http://nightly.buildroot.org/#_providing_patches
[2] http://patchwork.ozlabs.org/patch/704753/
[3] http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/checkpackagelib_patch.py | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/support/scripts/checkpackagelib_patch.py b/support/scripts/checkpackagelib_patch.py
index 131e423..ee46efb 100644
--- a/support/scripts/checkpackagelib_patch.py
+++ b/support/scripts/checkpackagelib_patch.py
@@ -3,5 +3,60 @@
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
 
+import re
+
+from checkpackagebase import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
 from checkpackagelib import NewlineAtEof
+
+
+class ApplyOrder(_CheckFunction):
+    APPLY_ORDER = re.compile("/\d{1,4}-[^/]*$")
+
+    def before(self):
+        if not self.APPLY_ORDER.search(self.filename):
+            return ["{}:0: use name <number>-<description>.patch "
+                    "({}#_providing_patches)"
+                    .format(self.filename, self.url_to_manual)]
+
+
+class NumberedSubject(_CheckFunction):
+    NUMBERED_PATCH = re.compile("Subject:\s*\[PATCH\s*\d+/\d+\]")
+
+    def before(self):
+        self.git_patch = False
+        self.lineno = 0
+        self.text = None
+
+    def check_line(self, lineno, text):
+        if text.startswith("diff --git"):
+            self.git_patch = True
+            return
+        if self.NUMBERED_PATCH.search(text):
+            self.lineno = lineno
+            self.text = text
+
+    def after(self):
+        if self.git_patch and self.text:
+            return ["{}:{}: generate your patches with 'git format-patch -N'"
+                    .format(self.filename, self.lineno),
+                    self.text]
+
+
+class Sob(_CheckFunction):
+    SOB_ENTRY = re.compile("^Signed-off-by: .*$")
+
+    def before(self):
+        self.found = False
+
+    def check_line(self, lineno, text):
+        if self.found:
+            return
+        if self.SOB_ENTRY.search(text):
+            self.found = True
+
+    def after(self):
+        if not self.found:
+            return ["{}:0: missing Signed-off-by in the header "
+                    "({}#_format_and_licensing_of_the_package_patches)"
+                    .format(self.filename, self.url_to_manual)]
