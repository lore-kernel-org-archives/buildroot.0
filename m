From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Aug 2019 10:02:35 +0200
Subject: [Buildroot] [PATCH v3 1/3] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
In-Reply-To: <20190801080237.5462-1-arnout@mind.be>
References: <20190801080237.5462-1-arnout@mind.be>
Message-ID: <20190801080237.5462-2-arnout@mind.be>
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
matches menuconfig. For consistency, do the same for comment and if
as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
v3: use Jerzy's approach of adding a space after all conditions, not
    just menu.

v2: Jerzy independently did a similar change.
---
 utils/checkpackagelib/lib_config.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 7d7567ac67..b42760396e 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -77,8 +77,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                                  "package/Config.in.host"]:
             return
 
-        if text.startswith("comment") or text.startswith("if") or \
-           text.startswith("menu"):
+        if text.startswith("comment ") or text.startswith("if ") or \
+           text.startswith("menu "):
 
             if text.startswith("comment"):
                 if not self.state.endswith("-comment"):
-- 
2.21.0
