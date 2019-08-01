From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 22:48:59 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
Message-ID: <20190801204617.B053788497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c62a2829209671f4f7a209a07eca6608ebd0dfa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CommentsMenusPackagesOrder check builds the 'state' to track the
depth of menus and conditions. However, a menuconfig doesn't create a
menu by itself - it is always followed by a condition that implies the
menu. As a result, when unwinding the 'state', the level will be wrong.

Fix this by checking for menu followed by a space, so it no longer
matches menuconfig. For consistency, do the same for comment and if
as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
