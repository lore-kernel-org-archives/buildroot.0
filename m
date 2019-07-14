From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Jul 2019 14:44:00 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
Message-ID: <20190714124400.29431-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CommentsMenusPackagesOrder check builds the 'state' to track the
depth of menus and conditions. However, a menuconfig doesn't create a
menu by itself - it is always followed by a condition that implies the
menu. As a result, when unwinding the 'state', the level will be wrong.

Fix this by checking for menu followed by a space, so it no longer
matches menuconfig.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f0edb9993d..94faf1b0fc 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -73,7 +73,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def check_line(self, lineno, text):
         if text.startswith("comment") or text.startswith("if") or \
-           text.startswith("menu"):
+           text.startswith("menu "):
 
             if text.startswith("comment"):
                 if not self.state.endswith("-comment"):
-- 
2.21.0
