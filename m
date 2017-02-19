From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:23 -0300
Subject: [Buildroot] [PATCH v2 8/9] check-package: check Config.* files
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warn when help text is larger than 72 columns, see [1].
Warn for wrongly indented attributes, see [1].
Warn when the convention of attributes order is not followed, see [2].

[1] http://nightly.buildroot.org/#writing-rules-config-in
[2] http://nightly.buildroot.org/#_config_files

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - update commit subject since now Config.* are tested;
  - use classes instead of functions to declare each check (Thomas DS);
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m2.196s
    user	0m2.116s
    sys	0m0.044s
    
    AttributesOrder:
     support/scripts/check-package --include-only AttributesOrder \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      369
     (cd support/scripts/check-package-example && \
     ../check-package --include-only AttributesOrder -vv package/*/*)
      package/package1/Config.in:3: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
      < tab  >bool "pAcKaGe"
      package/package1/Config.in:6: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
      < tab  >depends on BR2_USE_WCHAR
      package/package1/Config.something:6: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
      < tab  >bool "Extension 1"
      180 lines processed
      3 warnings generated
    
    HelpText:
     support/scripts/check-package --include-only HelpText \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      987
     (cd support/scripts/check-package-example && \
     ../check-package --include-only HelpText -vv package/*/*)
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
      180 lines processed
      6 warnings generated
    
    Indent:
     support/scripts/check-package --include-only Indent \
     $(find package -name 'Config.*') 2>/dev/null | wc -l
      501
     (cd support/scripts/check-package-example && \
     ../check-package --include-only Indent -vv package/*/*)
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
      package/package1/Config.in:44: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
              depends on BR2_USE_MMU
      package/package1/package1.mk:22: unexpected indent with tabs
      < tab  >PACKAGE1_INSTALL_STAGING = NO
      package/package1/package1.mk:27: expected indent with tabs
                             depend3
      package/package1/package1.mk:42: expected indent with tabs
              mkdir -p $(TARGET_DIR)/var/lib
      package/package1/package1.mk:51: expected indent with tabs
              $(PACKAGE1_INSTALL_SOMETHING_ELSE)
      180 lines processed
      11 warnings generated

 support/scripts/checkpackagelib_config.py | 128 ++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib_config.py
index ee5981e64..be52d9432 100644
--- a/support/scripts/checkpackagelib_config.py
+++ b/support/scripts/checkpackagelib_config.py
@@ -3,8 +3,136 @@
 # "bool", so below check functions don't need to check for things already
 # checked by running "make menuconfig".
 
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
+# used in more than one check
+entries_that_should_not_be_indented = [
+    "choice", "comment", "config", "endchoice", "endif", "endmenu", "if",
+    "menu", "menuconfig", "source"]
+
+
+class AttributesOrder(_CheckFunction):
+    attributes_order_convention = {
+        "bool": 1, "prompt": 1, "string": 1, "default": 2, "depends": 3,
+        "select": 4, "help": 5}
+
+    def before(self):
+        self.state = 0
+
+    def check_line(self, lineno, text):
+        if _empty_or_comment(text) or _part_of_help_text(text):
+            return
+
+        attribute = text.split()[0]
+
+        if attribute in entries_that_should_not_be_indented:
+            self.state = 0
+            return
+        if attribute not in self.attributes_order_convention.keys():
+            return
+        new_state = self.attributes_order_convention[attribute]
+        wrong_order = self.state > new_state
+
+        # save to process next line
+        self.state = new_state
+
+        if wrong_order:
+            return ["{}:{}: attributes order: type, default, depends on,"
+                    " select, help ({}#_config_files)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class HelpText(_CheckFunction):
+    HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
+    URL_ONLY = re.compile("^(http|https|git)://\S*$")
+
+    def before(self):
+        self.help_text = False
+
+    def check_line(self, lineno, text):
+        if _empty_or_comment(text):
+            return
+
+        entry = text.split()[0]
+
+        if entry in entries_that_should_not_be_indented:
+            self.help_text = False
+            return
+        if text.strip() == "help":
+            self.help_text = True
+            return
+
+        if not self.help_text:
+            return
+
+        if self.HELP_TEXT_FORMAT.match(text.rstrip()):
+            return
+        if self.URL_ONLY.match(text.strip()):
+            return
+        return ["{}:{}: help text: <tab><2 spaces><62 chars>"
+                " ({}#writing-rules-config-in)"
+                .format(self.filename, lineno, self.url_to_manual),
+                text,
+                "\t  " + "123456789 " * 6 + "12"]
+
+
+class Indent(_CheckFunction):
+    ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
+    entries_that_should_be_indented = [
+        "bool", "default", "depends", "help", "prompt", "select", "string"]
+
+    def before(self):
+        self.backslash = False
+
+    def check_line(self, lineno, text):
+        if _empty_or_comment(text) or _part_of_help_text(text):
+            self.backslash = False
+            return
+
+        entry = text.split()[0]
+
+        last_line_ends_in_backslash = self.backslash
+
+        # calculate for next line
+        if self.ENDS_WITH_BACKSLASH.search(text):
+            self.backslash = True
+        else:
+            self.backslash = False
+
+        if last_line_ends_in_backslash:
+            if text.startswith("\t"):
+                return
+            return ["{}:{}: continuation line should be indented using tabs"
+                    .format(self.filename, lineno),
+                    text]
+
+        if entry in self.entries_that_should_be_indented:
+            if not text.startswith("\t{}".format(entry)):
+                return ["{}:{}: should be indented with one tab"
+                        " ({}#_config_files)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text]
+        elif entry in entries_that_should_not_be_indented:
+            if not text.startswith(entry):
+                return ["{}:{}: should not be indented"
+                        .format(self.filename, lineno),
+                        text]
-- 
2.11.0
