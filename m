From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:21 -0300
Subject: [Buildroot] [PATCH v2 6/9] check-package: check *.mk files
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-7-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warn when there are obvious indentation errors:
- the number of expect tabs is not yet checked since it is more complex
  to achieve;
- the content inside define ... endef should be indented with tab(s),
  see [1];
- line just after a backslash should be indented with tab(s), see [2];
- other lines should not be indented, see [3];
- ignore empty lines and comments.
Warn when there is no well-formatted header in the file:
- 80 hashes at lines 1 and 5;
- 1 hash at lines 2 and 4;
- empty line at line 6;
- see [4];
- ignore files that only include other mk files.
Warn when there are more than one space before backslash, see [5].
Warn when there is a trailing backslash [6].
Warn for flags set to default value YES or NO, see [7], [8], [9].

[1] http://patchwork.ozlabs.org/patch/681429/
[2] http://patchwork.ozlabs.org/patch/681430/
[3] http://patchwork.ozlabs.org/patch/559209/
[4] http://nightly.buildroot.org/#writing-rules-mk
[5] http://patchwork.ozlabs.org/patch/649084/
[6] http://patchwork.ozlabs.org/patch/535550/
[7] http://patchwork.ozlabs.org/patch/704718/
[8] http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems
[9] http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - use classes instead of functions to declare each check (Thomas DS);
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m1.865s
    user	0m1.836s
    sys	0m0.028s
    
    Indent:
     support/scripts/check-package --include-only Indent \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      24
     (cd support/scripts/check-package-example && \
     ../check-package --include-only Indent -vv package/*/*)
      package/package1/package1.mk:22: unexpected indent with tabs
      < tab  >PACKAGE1_INSTALL_STAGING = NO
      package/package1/package1.mk:27: expected indent with tabs
                             depend3
      package/package1/package1.mk:42: expected indent with tabs
              mkdir -p $(TARGET_DIR)/var/lib
      package/package1/package1.mk:51: expected indent with tabs
              $(PACKAGE1_INSTALL_SOMETHING_ELSE)
      180 lines processed
      4 warnings generated
    
    PackageHeader:
     support/scripts/check-package --include-only PackageHeader \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      22
     (cd support/scripts/check-package-example && \
     ../check-package --include-only PackageHeader -vv package/*/*)
      package/package1/package1.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
      ########################################
      ################################################################################
      package/package1/package1.mk:5: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
      ########################################################################################################################
      ################################################################################
      package/package1/package1.mk:6: should be a blank line (http://nightly.buildroot.org/#writing-rules-mk)
      PACKAGE1_VERSION=1.0
      180 lines processed
      3 warnings generated
    
    SpaceBeforeBackslash:
     support/scripts/check-package --include-only SpaceBeforeBackslash \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      342
     (cd support/scripts/check-package-example && \
     ../check-package --include-only SpaceBeforeBackslash -vv package/*/*)
      package/package1/package1.mk:26: use only one space before backslash
      PACKAGE1_DEPENDENCIES = depend1 depend2  \
      package/package1/package1.mk:28: use only one space before backslash
      PACKAGE1_DEPENDENCIES += depend5< tab  >\
      180 lines processed
      2 warnings generated
    
    TrailingBackslash:
     support/scripts/check-package --include-only TrailingBackslash \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      20
     (cd support/scripts/check-package-example && \
     ../check-package --include-only TrailingBackslash -vv package/*/*)
      package/package1/package1.mk:29: remove trailing backslash
      < tab  >depend4 \
      180 lines processed
      1 warnings generated
    
    UselessFlag:
     support/scripts/check-package --include-only UselessFlag \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      0
     (cd support/scripts/check-package-example && \
     ../check-package --include-only UselessFlag -vv package/*/*)
      package/package1/package1.mk:14: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_STAGING=NO
      package/package1/package1.mk:15: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_TARGET = YES< tab  >
      package/package1/package1.mk:16: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_IMAGES  =  NO
      package/package1/package1.mk:17: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
       PACKAGE1_INSTALL_REDISTRIBUTE = YES
      package/package1/package1.mk:18: useless default value (http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages)
      PACKAGE1_AUTORECONF = NO
      package/package1/package1.mk:19: useless default value (http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages)
      PACKAGE1_LIBTOOL_PATCH< tab  >=< tab  >YES
      180 lines processed
      6 warnings generated

 support/scripts/checkpackagelib_mk.py | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
index a37304b6d..f66888d21 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -4,8 +4,168 @@
 # menu options using "make menuconfig" and by running "make" with appropriate
 # packages enabled.
 
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
+class Indent(_CheckFunction):
+    COMMENT = re.compile("^\s*#")
+    CONDITIONAL = re.compile("^\s*(ifeq|ifneq|endif)\s")
+    ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
+    END_DEFINE = re.compile("^\s*endef\s")
+    MAKEFILE_TARGET = re.compile("^[^# \t]+:\s")
+    START_DEFINE = re.compile("^\s*define\s")
+
+    def before(self):
+        self.define = False
+        self.backslash = False
+        self.makefile_target = False
+
+    def check_line(self, lineno, text):
+        if self.START_DEFINE.search(text):
+            self.define = True
+            return
+        if self.END_DEFINE.search(text):
+            self.define = False
+            return
+
+        expect_tabs = False
+        if self.define or self.backslash or self.makefile_target:
+            expect_tabs = True
+        if self.CONDITIONAL.search(text):
+            expect_tabs = False
+
+        # calculate for next line
+        if self.ENDS_WITH_BACKSLASH.search(text):
+            self.backslash = True
+        else:
+            self.backslash = False
+
+        if self.MAKEFILE_TARGET.search(text):
+            self.makefile_target = True
+            return
+        if text.strip() == "":
+            self.makefile_target = False
+            return
+
+        # comment can be indented or not inside define ... endef, so ignore it
+        if self.define and self.COMMENT.search(text):
+            return
+
+        if expect_tabs:
+            if not text.startswith("\t"):
+                return ["{}:{}: expected indent with tabs"
+                        .format(self.filename, lineno),
+                        text]
+        else:
+            if text.startswith("\t"):
+                return ["{}:{}: unexpected indent with tabs"
+                        .format(self.filename, lineno),
+                        text]
+
+
+class PackageHeader(_CheckFunction):
+    def before(self):
+        self.skip = False
+
+    def check_line(self, lineno, text):
+        if self.skip or lineno > 6:
+            return
+
+        if lineno in [1, 5]:
+            if lineno == 1 and text.startswith("include "):
+                self.skip = True
+                return
+            if text.rstrip() != "#" * 80:
+                return ["{}:{}: should be 80 hashes ({}#writing-rules-mk)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text,
+                        "#" * 80]
+        elif lineno in [2, 4]:
+            if text.rstrip() != "#":
+                return ["{}:{}: should be 1 hash ({}#writing-rules-mk)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text]
+        elif lineno == 6:
+            if text.rstrip() != "":
+                return ["{}:{}: should be a blank line ({}#writing-rules-mk)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text]
+
+
+class SpaceBeforeBackslash(_CheckFunction):
+    TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
+
+    def check_line(self, lineno, text):
+        if self.TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH.match(text.rstrip()):
+            return ["{}:{}: use only one space before backslash"
+                    .format(self.filename, lineno),
+                    text]
+
+
+class TrailingBackslash(_CheckFunction):
+    ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
+
+    def before(self):
+        self.backslash = False
+
+    def check_line(self, lineno, text):
+        last_line_ends_in_backslash = self.backslash
+
+        # calculate for next line
+        if self.ENDS_WITH_BACKSLASH.search(text):
+            self.backslash = True
+            self.lastline = text
+            return
+        self.backslash = False
+
+        if last_line_ends_in_backslash and text.strip() == "":
+            return ["{}:{}: remove trailing backslash"
+                    .format(self.filename, lineno - 1),
+                    self.lastline]
+
+
+class UselessFlag(_CheckFunction):
+    DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
+        "_AUTORECONF\s*=\s*NO",
+        "_LIBTOOL_PATCH\s*=\s*YES"])))
+    DEFAULT_GENERIC_FLAG = re.compile("^.*{}".format("|".join([
+        "_INSTALL_IMAGES\s*=\s*NO",
+        "_INSTALL_REDISTRIBUTE\s*=\s*YES",
+        "_INSTALL_STAGING\s*=\s*NO",
+        "_INSTALL_TARGET\s*=\s*YES"])))
+    END_CONDITIONAL = re.compile("^\s*(endif)")
+    START_CONDITIONAL = re.compile("^\s*(ifeq|ifneq)")
+
+    def before(self):
+        self.conditional = 0
+
+    def check_line(self, lineno, text):
+        if self.START_CONDITIONAL.search(text):
+            self.conditional += 1
+            return
+        if self.END_CONDITIONAL.search(text):
+            self.conditional -= 1
+            return
+
+        # allow non-default conditionally overridden by default
+        if self.conditional > 0:
+            return
+
+        if self.DEFAULT_GENERIC_FLAG.search(text):
+            return ["{}:{}: useless default value ({}#"
+                    "_infrastructure_for_packages_with_specific_build_systems)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+        if self.DEFAULT_AUTOTOOLS_FLAG.search(text):
+            return ["{}:{}: useless default value "
+                    "({}#_infrastructure_for_autotools_based_packages)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
-- 
2.11.0
