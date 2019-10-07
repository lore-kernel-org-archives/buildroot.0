From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: separate comment/if/menu cases
Message-ID: <20191007213951.E76AD8B465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0625899e3bf174094ea46f3e285ee23c29745d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The handling of 'comment...', 'if ...' and 'menu ...' lines have almost
nothing in common, and subsequent patches will give them even less in
common. Therefore, completely separate their handling in top-level
conditions. The only code that gets duplicated in the different branches
is the 'self.initialize_level_elements(text)' call.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 499660feb7..06c066c5ca 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -95,22 +95,22 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
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
 
