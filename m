From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:20 -0300
Subject: [Buildroot] [PATCH v2 5/9] check-package: check *.patch files
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - do not warn for numbered subject if the patch was not generated with
    git (based on comments from Thomas DS and Thomas P);
  - use classes instead of functions to declare each check (Thomas DS);
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m0.935s
    user	0m0.904s
    sys	0m0.028s
    
    ApplyOrder:
     support/scripts/check-package --include-only ApplyOrder \
     $(find package -name '*.patch') 2>/dev/null | wc -l
      16
     (cd support/scripts/check-package-example && \
     ../check-package --include-only ApplyOrder -vv package/*/*)
      package/package1/wrong-name.patch:0: use name <number>-<description>.patch (http://nightly.buildroot.org/#_providing_patches)
      180 lines processed
      1 warnings generated
    
    NumberedSubject:
     support/scripts/check-package --include-only NumberedSubject \
     $(find package -name '*.patch') 2>/dev/null | wc -l
      139
     (cd support/scripts/check-package-example && \
     ../check-package --include-only NumberedSubject -vv package/*/*)
      package/package1/0001-do-something.patch:4: generate your patches with 'git format-patch -N'
      Subject: [PATCH 25/39] do something
      180 lines processed
      1 warnings generated
    
    Sob:
     support/scripts/check-package --include-only Sob \
     $(find package -name '*.patch') 2>/dev/null | wc -l
      143
     (cd support/scripts/check-package-example && \
     ../check-package --include-only Sob -vv package/*/*)
      package/package1/0001-do-something.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
      package/package1/wrong-name.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
      180 lines processed
      2 warnings generated

 support/scripts/checkpackagelib_patch.py | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/support/scripts/checkpackagelib_patch.py b/support/scripts/checkpackagelib_patch.py
index 131e42347..ee46efb70 100644
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
-- 
2.11.0
