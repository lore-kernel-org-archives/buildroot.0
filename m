From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 31 Dec 2016 01:21:07 -0200
Subject: [Buildroot] [PATCH 6/9] check-package: check *.mk files
In-Reply-To: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
Message-ID: <20161231032110.11573-7-ricardo.martincoski@gmail.com>
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

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m2.125s
    user	0m2.084s
    sys	0m0.040s
    
    CHECK_INDENT:
     support/scripts/check-package --include-only check_indent \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      23
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_indent -vv package/*/*)
      package/package1/package1.mk:20: unexpected indent with tabs
      < tab  >PACKAGE1_INSTALL_STAGING = NO
      package/package1/package1.mk:25: expected indent with tabs
                             depend3
      package/package1/package1.mk:35: expected indent with tabs
              mkdir -p $(TARGET_DIR)/var/lib
      package/package1/package1.mk:44: expected indent with tabs
              $(PACKAGE1_INSTALL_SOMETHING_ELSE)
      159 lines processed
      4 warnings generated
    
    CHECK_PACKAGE_HEADER:
     support/scripts/check-package --include-only check_package_header \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      20
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_package_header -vv package/*/*)
      package/package1/package1.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
      ########################################
      ################################################################################
      package/package1/package1.mk:5: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
      ########################################################################################################################
      ################################################################################
      package/package1/package1.mk:6: should be a blank line (http://nightly.buildroot.org/#writing-rules-mk)
      PACKAGE1_VERSION=1.0
      159 lines processed
      3 warnings generated
    
    CHECK_SPACE_BEFORE_BACKSLASH:
     support/scripts/check-package --include-only check_space_before_backslash \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      342
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_space_before_backslash -vv package/*/*)
      package/package1/package1.mk:24: use only one space before backslash
      PACKAGE1_DEPENDENCIES = depend1 depend2  \
      package/package1/package1.mk:26: use only one space before backslash
      PACKAGE1_DEPENDENCIES += depend5< tab  >\
      159 lines processed
      2 warnings generated
    
    CHECK_TRAILING_BACKSLASH:
     support/scripts/check-package --include-only check_trailing_backslash \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      21
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_trailing_backslash -vv package/*/*)
      package/package1/package1.mk:27: remove trailing backslash
      < tab  >depend4 \
      159 lines processed
      1 warnings generated
    
    CHECK_USELESS_FLAG:
     support/scripts/check-package --include-only check_useless_flag \
     $(find package -name '*.mk') 2>/dev/null | wc -l
      0
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_useless_flag -vv package/*/*)
      package/package1/package1.mk:12: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_STAGING=NO
      package/package1/package1.mk:13: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_TARGET = YES< tab  >
      package/package1/package1.mk:14: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
      PACKAGE1_INSTALL_IMAGES  =  NO
      package/package1/package1.mk:15: useless default value (http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems)
       PACKAGE1_INSTALL_REDISTRIBUTE = YES
      package/package1/package1.mk:16: useless default value (http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages)
      PACKAGE1_AUTORECONF = NO
      package/package1/package1.mk:17: useless default value (http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages)
      PACKAGE1_LIBTOOL_PATCH< tab  >=< tab  >YES
      159 lines processed
      6 warnings generated

 support/scripts/checkpackagelib_mk.py | 174 ++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
index 1ff0973dd..40574584a 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -4,8 +4,182 @@
 # menu options using "make menuconfig" and by running "make" with appropriate
 # packages enabled.
 
+import re
+
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
 from checkpackagelib import check_consecutive_empty_lines
 from checkpackagelib import check_empty_last_line
 from checkpackagelib import check_newline_at_eof
 from checkpackagelib import check_trailing_space
+
+# used by more than one function
+ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
+
+COMMENT = re.compile("^\s*#")
+CONDITIONAL = re.compile("^\s*(ifeq|ifneq|endif)\s")
+END_DEFINE = re.compile("^\s*endef\s")
+MAKEFILE_TARGET = re.compile("^[^# \t]+:\s")
+START_DEFINE = re.compile("^\s*define\s")
+
+
+def check_indent(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_indent.define = False
+        check_indent.backslash = False
+        check_indent.makefile_target = False
+        return
+    if end:
+        return
+
+    if START_DEFINE.search(text):
+        check_indent.define = True
+        return
+    if END_DEFINE.search(text):
+        check_indent.define = False
+        return
+
+    expect_tabs = False
+    if (check_indent.define or check_indent.backslash or
+            check_indent.makefile_target):
+        expect_tabs = True
+    if CONDITIONAL.search(text):
+        expect_tabs = False
+
+    # calculate for next line
+    if ENDS_WITH_BACKSLASH.search(text):
+        check_indent.backslash = True
+    else:
+        check_indent.backslash = False
+
+    if MAKEFILE_TARGET.search(text):
+        check_indent.makefile_target = True
+        return
+    if text.strip() == "":
+        check_indent.makefile_target = False
+        return
+
+    # comment can be indented or not inside define ... endef, so ignore it
+    if check_indent.define and COMMENT.search(text):
+        return
+
+    if expect_tabs:
+        if not text.startswith("\t"):
+            return ["{}:{}: expected indent with tabs"
+                    .format(fname, lineno),
+                    text]
+    else:
+        if text.startswith("\t"):
+            return ["{}:{}: unexpected indent with tabs"
+                    .format(fname, lineno),
+                    text]
+
+
+def check_package_header(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_package_header.skip = False
+        return
+    if end or check_package_header.skip or lineno > 6:
+        return
+
+    if lineno in [1, 5]:
+        if lineno == 1 and text.startswith("include "):
+            check_package_header.skip = True
+            return
+        if text.rstrip() != "#" * 80:
+            return ["{}:{}: should be 80 hashes ({}#writing-rules-mk)"
+                    .format(fname, lineno, args.manual_url),
+                    text,
+                    "#" * 80]
+    elif lineno in [2, 4]:
+        if text.rstrip() != "#":
+            return ["{}:{}: should be 1 hash ({}#writing-rules-mk)"
+                    .format(fname, lineno, args.manual_url),
+                    text]
+    elif lineno == 6:
+        if text.rstrip() != "":
+            return ["{}:{}: should be a blank line ({}#writing-rules-mk)"
+                    .format(fname, lineno, args.manual_url),
+                    text]
+
+
+TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
+
+
+def check_space_before_backslash(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start or end:
+        return
+
+    if TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH.match(text.rstrip()):
+        return ["{}:{}: use only one space before backslash"
+                .format(fname, lineno),
+                text]
+
+
+def check_trailing_backslash(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_trailing_backslash.backslash = False
+        return
+    if end:
+        return
+
+    last_line_ends_in_backslash = check_trailing_backslash.backslash
+
+    # calculate for next line
+    if ENDS_WITH_BACKSLASH.search(text):
+        check_trailing_backslash.backslash = True
+        check_trailing_backslash.lastline = text
+        return
+    check_trailing_backslash.backslash = False
+
+    if last_line_ends_in_backslash and text.strip() == "":
+        return ["{}:{}: remove trailing backslash"
+                .format(fname, lineno - 1),
+                check_trailing_backslash.lastline]
+
+
+DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
+    "_AUTORECONF\s*=\s*NO",
+    "_LIBTOOL_PATCH\s*=\s*YES"])))
+DEFAULT_GENERIC_FLAG = re.compile("^.*{}".format("|".join([
+    "_INSTALL_IMAGES\s*=\s*NO",
+    "_INSTALL_REDISTRIBUTE\s*=\s*YES",
+    "_INSTALL_STAGING\s*=\s*NO",
+    "_INSTALL_TARGET\s*=\s*YES"])))
+END_CONDITIONAL = re.compile("^\s*(endif)")
+START_CONDITIONAL = re.compile("^\s*(ifeq|ifneq)")
+
+
+def check_useless_flag(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_useless_flag.conditional = 0
+        return
+    if end:
+        return
+
+    if START_CONDITIONAL.search(text):
+        check_useless_flag.conditional += 1
+        return
+    if END_CONDITIONAL.search(text):
+        check_useless_flag.conditional -= 1
+        return
+
+    # allow non-default conditionally overridden by default
+    if check_useless_flag.conditional > 0:
+        return
+
+    if DEFAULT_GENERIC_FLAG.search(text):
+        return ["{}:{}: useless default value "
+                "({}#_infrastructure_for_packages_with_specific_build_systems)"
+                .format(fname, lineno, args.manual_url),
+                text]
+
+    if DEFAULT_AUTOTOOLS_FLAG.search(text):
+        return ["{}:{}: useless default value "
+                "({}#_infrastructure_for_autotools_based_packages)"
+                .format(fname, lineno, args.manual_url),
+                text]
-- 
2.11.0
