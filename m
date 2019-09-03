From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:29 +0200
Subject: [Buildroot] [PATCH 06/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: remove '-comment' state before the '-menu' one
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-6-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment may contain packages or if-endif block(s) but not menu(s)
of packages, so lets remove the '-comment' state before the '-menu' one.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index de5faa19a2..d8f26ef435 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -106,6 +106,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                     self.state += "-if"
 
                 elif text.startswith("menu"):
+                    if self.state.endswith("-comment"):
+                        self.state = self.state[:-8]
+
                     self.state += "-menu"
 
             self.initialize_level_elements(text)
-- 
2.17.1
