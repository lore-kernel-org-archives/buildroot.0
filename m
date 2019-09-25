From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:24:42 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: add functions to initialize arrays elements
Message-ID: <20190925201939.3A1578F69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7197d3cb807baefc4840dd6b636b00bbdfc5cdf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Factor out two functions to initialize arrays elements. They will be
reused by followup patches.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index d12653f080..aaa31e4d72 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -72,6 +72,20 @@ class CommentsMenusPackagesOrder(_CheckFunction):
     def get_level(self):
         return len(self.state.split('-')) - 1
 
+    def initialize_package_level_elements(self, text):
+        try:
+            self.menu_of_packages[self.level] = text[:-1]
+            self.package[self.level] = ""
+            self.print_package_warning[self.level] = True
+        except IndexError:
+            self.menu_of_packages.append(text[:-1])
+            self.package.append("")
+            self.print_package_warning.append(True)
+
+    def initialize_level_elements(self, text):
+        self.level = self.get_level()
+        self.initialize_package_level_elements(text)
+
     def check_line(self, lineno, text):
         # We only want to force sorting for the top-level menus
         if self.filename not in ["package/Config.in",
@@ -94,16 +108,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                 elif text.startswith("menu"):
                     self.state += "-menu"
 
-            self.level = self.get_level()
-
-            try:
-                self.menu_of_packages[self.level] = text[:-1]
-                self.package[self.level] = ""
-                self.print_package_warning[self.level] = True
-            except IndexError:
-                self.menu_of_packages.append(text[:-1])
-                self.package.append("")
-                self.print_package_warning.append(True)
+            self.initialize_level_elements(text)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("comment"):
