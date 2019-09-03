From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:35 +0200
Subject: [Buildroot] [PATCH 12/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check package ordering just before 'if '
 statement
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-12-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the statement

 if BR2_PACKAGE_..._FOO

(if exist) refers to the foo package, so the line

 source package/foo/Config.in

should go just before that statement.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index a356702ca8..1ef46774a9 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -105,6 +105,22 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
             self.initialize_level_elements(text)
 
+            if text.startswith("if BR2_PACKAGE_") and \
+               self.new_package.replace('-', '_').upper() not in text:
+                self.print_package_warning[self.level-1] = False
+                prefix = "{}:{}: ".format(self.filename, lineno)
+                spaces = " " * len(prefix)
+                return ["{prefix}Packages in: {menu},\n"
+                        "{spaces}are not alphabetically ordered;\n"
+                        "{spaces}first incorrect package: {package} ;\n"
+                        "{spaces}this package, placed just before if statement,\n"
+                        "{spaces}should match the one used in\n"
+                        "{spaces}{text}"
+                        .format(prefix=prefix, spaces=spaces, text=text,
+                                menu=self.menu_of_packages[self.level-1],
+                                package=self.new_package),
+                        text]
+
         elif text.startswith("menu "):
             if self.state.endswith("-comment"):
                 self.state = self.state[:-8]
-- 
2.17.1
