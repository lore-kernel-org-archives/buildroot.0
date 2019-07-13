From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Jul 2019 00:21:26 +0200
Subject: [Buildroot] [git commit] checkpackagelib/lib_config.py: check
 packages alphabetical order in {Config.in, Config.in.host}
Message-ID: <20190713222452.85742813D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e36a63cf6b325f76ad62c1e06b8a6d4fb4c9f062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
[Arnout:
 - calculate level by counting - instead of with a static array;
 - new_package is only used locally, so don't make it a class member;
 - do indentation according to length of prefix;
 - don't split string in the middle of a line;
 - report first wrong package per menu;
 - do replace() only once;
 - add comment why we do replace().
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 89d44da57e..f0edb9993d 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -60,6 +60,72 @@ class AttributesOrder(_CheckFunction):
                     text]
 
 
+class CommentsMenusPackagesOrder(_CheckFunction):
+    print_package_warning = [True, True, True, True, True, True]
+    menu_of_packages = ["", "", "", "", "", ""]
+    package = ["", "", "", "", "", ""]
+
+    def before(self):
+        self.state = ""
+
+    def get_level(self):
+        return len(self.state.split('-')) - 1
+
+    def check_line(self, lineno, text):
+        if text.startswith("comment") or text.startswith("if") or \
+           text.startswith("menu"):
+
+            if text.startswith("comment"):
+                if not self.state.endswith("-comment"):
+                    self.state += "-comment"
+
+            elif text.startswith("if") or text.startswith("menu"):
+                if text.startswith("if"):
+                    self.state += "-if"
+
+                elif text.startswith("menu"):
+                    self.state += "-menu"
+
+            level = self.get_level()
+            self.package[level] = ""
+            self.print_package_warning[level] = True
+            self.menu_of_packages[level] = text[:-1]
+
+        elif text.startswith("endif") or text.startswith("endmenu"):
+            if self.state.endswith("comment"):
+                self.state = self.state[:-8]
+
+            if text.startswith("endif"):
+                self.state = self.state[:-3]
+
+            elif text.startswith("endmenu"):
+                self.state = self.state[:-5]
+
+        elif text.startswith('\tsource "package/'):
+            level = self.get_level()
+            new_package = text[17: -(len(self.filename)-5):]
+
+            # We order _ before A, so replace it with .
+            new_package_ord = new_package.replace('_', '.')
+
+            if self.package[level] != "" and \
+               self.print_package_warning[level] and \
+               new_package_ord < self.package[level]:
+                self.print_package_warning[level] = False
+                prefix = "{}:{}: ".format(self.filename, lineno)
+                spaces = " " * len(prefix)
+                return ["{prefix}Packages in: {menu},\n"
+                        "{spaces}are not alphabetically ordered;\n"
+                        "{spaces}correct order: '-', '_', digits, capitals, lowercase;\n"
+                        "{spaces}first incorrect package: {package}"
+                        .format(prefix=prefix, spaces=spaces,
+                                menu=self.menu_of_packages[level],
+                                package=new_package),
+                        text]
+
+            self.package[level] = new_package_ord
+
+
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
     URL_ONLY = re.compile("^(http|https|git)://\S*$")
