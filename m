From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 31 Dec 2016 01:21:09 -0200
Subject: [Buildroot] [PATCH 8/9] check-package: check Config.in.* files
In-Reply-To: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
Message-ID: <20161231032110.11573-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warn when help text is larger than 72 columns, see [1].
Warn for wrongly indented attributes, see [1].
Warn when the convention of attributes order are not followed, see [2].

[1] http://nightly.buildroot.org/#writing-rules-config-in
[2] http://nightly.buildroot.org/#_config_files

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m2.453s
    user	0m2.396s
    sys	0m0.056s
    
    CHECK_ATTRIBUTES_ORDER:
     support/scripts/check-package --include-only check_attributes_order \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      359
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_attributes_order -vv package/*/*)
      package/package1/Config.in:3: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
      < tab  >bool "pAcKaGe"
      package/package1/Config.in:6: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
      < tab  >depends on BR2_USE_WCHAR
      159 lines processed
      2 warnings generated
    
    CHECK_HELP_TEXT:
     support/scripts/check-package --include-only check_help_text \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      988
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_help_text -vv package/*/*)
      package/package1/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
      < tab  >  package1 is a bad stylized package. Its only purpose is to exemplify
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      package/package1/Config.in:9: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
                common style mistakes
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      package/package1/Config.in:10: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
      < tab  >some more help text but no url
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      package/package1/Config.in:23: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
      < tab  >  Another paragraph. - But this time we cross the column 72 by 1.
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      package/package1/Config.in:24: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
      < tab  > wrong_line_with_single_word
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      package/package1/Config.in:25: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
      < tab  >  http://www.example.com/ urls do not have spaces and this line is too long.
      < tab  >  123456789 123456789 123456789 123456789 123456789 123456789 12
      159 lines processed
      6 warnings generated
    
    CHECK_INDENT:
     support/scripts/check-package --include-only check_indent \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      495
     (cd support/scripts/check-package-example && \
     ../check-package --include-only check_indent -vv package/*/*)
      package/package1/Config.in:13: should not be indented
       config BR2_PACKAGE_PACKAGE1_OPTION
      package/package1/Config.in:14: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              bool "package1 option"
      package/package1/Config.in:15: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              depends on BR2_USE_MMU
      package/package1/Config.in:16: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
      package/package1/Config.in:17: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              help
      package/package1/Config.in:37: continuation line should be indented using tabs
                      if BR2_aarch64
      package/package1/Config.in:41: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              depends on BR2_USE_MMU
      package/package1/package1.mk:20: unexpected indent with tabs
      < tab  >PACKAGE1_INSTALL_STAGING = NO
      package/package1/package1.mk:25: expected indent with tabs
                             depend3
      package/package1/package1.mk:35: expected indent with tabs
              mkdir -p $(TARGET_DIR)/var/lib
      package/package1/package1.mk:44: expected indent with tabs
              $(PACKAGE1_INSTALL_SOMETHING_ELSE)
      159 lines processed
      11 warnings generated

 support/scripts/checkpackagelib_config.py | 126 ++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib_config.py
index aec8b3ea4..a52f06247 100644
--- a/support/scripts/checkpackagelib_config.py
+++ b/support/scripts/checkpackagelib_config.py
@@ -3,8 +3,134 @@
 # "bool", so below check functions don't need to check for things already
 # checked by running "make menuconfig".
 
+import re
+
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
 from checkpackagelib import check_consecutive_empty_lines
 from checkpackagelib import check_empty_last_line
 from checkpackagelib import check_newline_at_eof
 from checkpackagelib import check_trailing_space
+
+
+def _empty_or_comment(text):
+    line = text.strip()
+    # ignore empty lines and comment lines indented or not
+    return line == "" or line.startswith("#")
+
+
+def _part_of_help_text(text):
+    return text.startswith("\t  ")
+
+
+# used in more than one function
+entries_that_should_not_be_indented = [
+    "choice", "comment", "config", "endchoice", "endif", "endmenu", "if",
+    "menu", "menuconfig", "source"]
+
+
+attributes_order_convention = {
+    "bool": 1, "prompt": 1, "string": 1, "default": 2, "depends": 3,
+    "select": 4, "help": 5}
+
+
+def check_attributes_order(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_attributes_order.state = 0
+        return
+    if end or _empty_or_comment(text) or _part_of_help_text(text):
+        return
+
+    attribute = text.split()[0]
+
+    if attribute in entries_that_should_not_be_indented:
+        check_attributes_order.state = 0
+        return
+    if attribute not in attributes_order_convention.keys():
+        return
+    new_state = attributes_order_convention[attribute]
+    wrong_order = check_attributes_order.state > new_state
+
+    # save to process next line
+    check_attributes_order.state = new_state
+
+    if wrong_order:
+        return ["{}:{}: attributes order: type, default, depends on,"
+                " select, help ({}#_config_files)"
+                .format(fname, lineno, args.manual_url),
+                text]
+
+
+HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
+URL_ONLY = re.compile("^(http|https|git)://\S*$")
+
+
+def check_help_text(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start:
+        check_help_text.help_text = False
+        return
+    if end or _empty_or_comment(text):
+        return
+
+    entry = text.split()[0]
+
+    if entry in entries_that_should_not_be_indented:
+        check_help_text.help_text = False
+        return
+    if text.strip() == "help":
+        check_help_text.help_text = True
+        return
+
+    if not check_help_text.help_text:
+        return
+
+    if HELP_TEXT_FORMAT.match(text.rstrip()):
+        return
+    if URL_ONLY.match(text.strip()):
+        return
+    return ["{}:{}: help text: <tab><2 spaces><62 chars>"
+            " ({}#writing-rules-config-in)"
+            .format(fname, lineno, args.manual_url),
+            text,
+            "\t  " + "123456789 " * 6 + "12"]
+
+
+ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
+entries_that_should_be_indented = [
+    "bool", "default", "depends", "help", "prompt", "select", "string"]
+
+
+def check_indent(
+        fname, args, lineno=0, text=None, start=False, end=False):
+    if start or end or _empty_or_comment(text) or _part_of_help_text(text):
+        check_indent.backslash = False
+        return
+
+    entry = text.split()[0]
+
+    last_line_ends_in_backslash = check_indent.backslash
+
+    # calculate for next line
+    if ENDS_WITH_BACKSLASH.search(text):
+        check_indent.backslash = True
+    else:
+        check_indent.backslash = False
+
+    if last_line_ends_in_backslash:
+        if text.startswith("\t"):
+            return
+        else:
+            return ["{}:{}: continuation line should be indented using tabs"
+                    .format(fname, lineno),
+                    text]
+
+    if entry in entries_that_should_be_indented:
+        if not text.startswith("\t{}".format(entry)):
+            return ["{}:{}: should be indented with one tab ({}#_config_files)"
+                    .format(fname, lineno, args.manual_url),
+                    text]
+    elif entry in entries_that_should_not_be_indented:
+        if not text.startswith(entry):
+            return ["{}:{}: should not be indented".format(fname, lineno),
+                    text]
-- 
2.11.0
