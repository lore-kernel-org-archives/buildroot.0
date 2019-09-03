From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:30 +0200
Subject: [Buildroot] [PATCH 07/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: separate the lines support
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-7-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lines 'comment...', 'if ...' and 'menu ...' will be handled without
sharing any code so lets separate their handling.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index d8f26ef435..7f92f580b8 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -94,22 +94,22 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
         source_line = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
 
-        if text.startswith("comment ") or text.startswith("if ") or \
-           text.startswith("menu "):
+        if text.startswith("comment "):
+            if not self.state.endswith("-comment"):
+                self.state += "-comment"
 
-            if text.startswith("comment"):
-                if not self.state.endswith("-comment"):
-                    self.state += "-comment"
+            self.initialize_level_elements(text)
+
+        elif text.startswith("if "):
+            self.state += "-if"
 
-            elif text.startswith("if") or text.startswith("menu"):
-                if text.startswith("if"):
-                    self.state += "-if"
+            self.initialize_level_elements(text)
 
-                elif text.startswith("menu"):
-                    if self.state.endswith("-comment"):
-                        self.state = self.state[:-8]
+        elif text.startswith("menu "):
+            if self.state.endswith("-comment"):
+                self.state = self.state[:-8]
 
-                    self.state += "-menu"
+            self.state += "-menu"
 
             self.initialize_level_elements(text)
 
-- 
2.17.1
