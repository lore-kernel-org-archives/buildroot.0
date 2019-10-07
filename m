From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: remove '-comment' state before the '-menu' one
Message-ID: <20191007213951.E08768B4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd251d68e5995b7c146c9712ce25a187a25b87de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A comment is considered an alternative delimiter like a menu. I.e.,
a menu that comes after a comment should not be considered a submenu of
that comment. Therefore, remove the '-comment' state before adding the
'-menu' one.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index fc0df3dd17..499660feb7 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -107,6 +107,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                     self.state += "-if"
 
                 elif text.startswith("menu"):
+                    if self.state.endswith("-comment"):
+                        self.state = self.state[:-8]
+
                     self.state += "-menu"
 
             self.initialize_level_elements(text)
