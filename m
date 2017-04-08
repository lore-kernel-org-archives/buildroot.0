From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:38 +0200
Subject: [Buildroot] [git commit] check-package: check Config.* files
Message-ID: <20170408141752.A0CC5817AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=203b33fab215f54b3efa8533ae677ea6997526a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warn when help text is larger than 72 columns, see [1].
Warn for wrongly indented attributes, see [1].
Warn when the convention of attributes order is not followed, see [2].

[1] http://nightly.buildroot.org/#writing-rules-config-in
[2] http://nightly.buildroot.org/#_config_files

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/checkpackagelib_config.py | 128 ++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib_config.py
index ee5981e..be52d94 100644
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
