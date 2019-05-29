From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Wed, 29 May 2019 17:05:07 +0200
Subject: [Buildroot] [PATCH 1/2] checkpackagelib/lib_config.py: check
 packages alphabetical order in {Config.in, Config.in.host}
Message-ID: <1559142308-3303-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
TODO - checking of menu of comments and menu of menus

 utils/checkpackagelib/lib_config.py | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 89d44da57e..1b3a66f6e1 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -60,6 +60,67 @@ class AttributesOrder(_CheckFunction):
                     text]
 
 
+class CommentsMenusPackagesOrder(_CheckFunction):
+    level = {"": 0,
+             "-menu": 1, "-menu-menu": 2,
+             "-menu-menu-comment": 3, "-menu-menu-if": 3, "-menu-menu-menu": 3,
+             "-menu-menu-comment-if": 4, "-menu-menu-if-if": 4,
+             "-menu-menu-menu-if": 4, "-menu-menu-if-menu": 4,
+             "-menu-menu-comment-if-comment": 5, "-menu-menu-if-if-comment": 5,
+             "-menu-menu-if-if-menu": 5, "-menu-menu-menu-if-comment": 5,
+             "-menu-menu-menu-if-menu": 5}
+
+    print_package_warning = [True, True, True, True, True, True]
+    menu_of_packages = ["", "", "", "", "", ""]
+    package = ["", "", "", "", "", ""]
+    new_package = ["", "", "", "", "", ""]
+
+    def before(self):
+        self.state = ""
+
+    def check_line(self, lineno, text):
+        if text.startswith("comment") or text.startswith("if") or text.startswith("menu"):
+
+            if text.startswith("comment"):
+                if not self.state.endswith("comment"):
+                    self.state += "-comment"
+
+            elif text.startswith("if") or text.startswith("menu"):
+                if text.startswith("if"):
+                    self.state += "-if"
+
+                elif text.startswith("menu"):
+                    self.state += "-menu"
+
+            self.package[self.level[self.state]] = ""
+            self.print_package_warning[self.level[self.state]] = True
+            self.menu_of_packages[self.level[self.state]] = text[:-1]
+
+        elif text.startswith("endif") or text.startswith("endmenu"):
+            if self.state.endswith("comment"):
+                self.state = self.state[:-8]
+
+            if text.startswith("endif"):
+                self.state = self.state[:-3]
+
+            else:
+                self.state = self.state[:-5]
+
+        elif text.startswith('\tsource "package/'):
+            self.new_package[self.level[self.state]] = text[17: -(len(self.filename)-5):]
+
+            if self.package[self.level[self.state]] != "" and \
+               self.print_package_warning[self.level[self.state]] and \
+               self.new_package[self.level[self.state]] < self.package[self.level[self.state]]:
+                self.print_package_warning[self.level[self.state]] = False
+                return ["{}:{}: Packages in: {}, are not alphabetically ordered\n"
+                        "                  correct order: '-', digits, capitals, '_', lowercase"
+                        .format(self.filename, lineno, self.menu_of_packages[self.level[self.state]]),
+                        text]
+
+            self.package[self.level[self.state]] = self.new_package[self.level[self.state]]
+
+
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
     URL_ONLY = re.compile("^(http|https|git)://\S*$")
@@ -141,3 +202,6 @@ class Indent(_CheckFunction):
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
+
+
+
-- 
2.17.1
