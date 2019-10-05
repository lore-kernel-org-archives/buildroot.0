From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:15 +0200
Subject: [Buildroot] [PATCH v2 01/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: remove '-comment' state before the '-menu' one
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-2-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment may contain packages or if-endif block(s) but not menu(s)
of packages, so lets remove the '-comment' state before the '-menu' one.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
-- 
2.17.1
