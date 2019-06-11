From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue, 11 Jun 2019 22:49:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] checkpackagelib/lib_config.py: check
 packages alphabetical order in {Config.in, Config.in.host}
In-Reply-To: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
References: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190611204946.3848-2-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
Changes v1 -> v2:
 - swap patches 1 and 2 (Arnout)
 - drop trailing lines (copy/paste side effect)
 - rewrap lines to < 80 chars
 - add variable to cut lines to < 80 chars
 - change alphabetical order of '_" to go before digits (Arnout)

TODO : checking of menu of comments and menu of menus
---

 utils/checkpackagelib/lib_config.py | 65 +++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 89d44da57e..642634fc44 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -60,6 +60,71 @@ class AttributesOrder(_CheckFunction):
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
+            level = self.level[self.state]
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
+            level = self.level[self.state]
+            self.new_package[level] = text[17: -(len(self.filename)-5):]
+
+            if self.package[level] != "" and \
+               self.print_package_warning[level] and \
+               self.new_package[level].replace('_', '.') < self.package[level].replace('_', '.'):
+                self.print_package_warning[level] = False
+                return ["{}:{}: Packages in: {},\n                  are not "
+                        "alphabetically ordered;\n                  correct "
+                        "order: '-', '_', digits, capitals, lowercase"
+                        .format(self.filename, lineno, self.menu_of_packages[level]),
+                        text]
+
+            self.package[level] = self.new_package[level]
+
+
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
     URL_ONLY = re.compile("^(http|https|git)://\S*$")
-- 
2.17.1
