From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:21 +0200
Subject: [Buildroot] [PATCH v2 07/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: check package ordering just before 'if '
 statement
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-8-jerzy.m.grzegorek@gmail.com>
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 142e8f745d..709dbae0fe 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -108,6 +108,22 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
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
