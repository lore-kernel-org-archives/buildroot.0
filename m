From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 22:48:59 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: append elements to arrays if needed
Message-ID: <20190801204617.BAEBF8B8F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83a34f77051db6980aea277a8ab8e467f68f495a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the future, the nesting level of menus, comments and conditions may
increase. The fixed array length used now is not appropriate. Therefore,
append elements to the arrays if needed.

Also change order of variables.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index b42760396e..6cbdc209c8 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -61,9 +61,9 @@ class AttributesOrder(_CheckFunction):
 
 
 class CommentsMenusPackagesOrder(_CheckFunction):
-    print_package_warning = [True, True, True, True, True, True]
-    menu_of_packages = ["", "", "", "", "", ""]
-    package = ["", "", "", "", "", ""]
+    menu_of_packages = []
+    package = []
+    print_package_warning = []
 
     def before(self):
         self.state = ""
@@ -92,9 +92,15 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                     self.state += "-menu"
 
             level = self.get_level()
-            self.package[level] = ""
-            self.print_package_warning[level] = True
-            self.menu_of_packages[level] = text[:-1]
+
+            try:
+                self.menu_of_packages[level] = text[:-1]
+                self.package[level] = ""
+                self.print_package_warning[level] = True
+            except IndexError:
+                self.menu_of_packages.append(text[:-1])
+                self.package.append("")
+                self.print_package_warning.append(True)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("comment"):
