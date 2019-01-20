From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Jan 2019 19:09:22 +0100
Subject: [Buildroot] [PATCH 1/1] tekui: disable parallel build
Message-ID: <20190120180922.16105-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems tekui has parallel build issues since November 2017:
 - Fatal error: can't create build/posix/directfb_lua.lo: No such file or directory
 - /home/peko/autobuild/instance-3/output/host/bin/microblazeel-buildroot-linux-uclibc-ar: ../../lib/posix/libtekdebug.a: No such file or directory
 - Fatal error: can't create build/posix/visual_mod.lo: No such file or directory

So disable parallel build

Fixes:
 - http://autobuild.buildroot.org/results/0732568fcbaa6829154fa91c352b52f074384df0
 - http://autobuild.buildroot.org/results/580593e79bc4ecdea1dc71d16607e5c88f87403c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tekui/tekui.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index f9ae849033..3f39072527 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -11,6 +11,9 @@ TEKUI_LICENSE = MIT
 TEKUI_LICENSE_FILES = COPYRIGHT
 TEKUI_DEPENDENCIES = freetype luainterpreter
 
+#?Package does not build in parallel due to improper make rules
+TEKUI_MAKE = $(MAKE1)
+
 TEKUI_MAKE_OPTS = \
 	CC="$(TARGET_CC) -fPIC" \
 	AR="$(TARGET_AR) rcu" \
-- 
2.14.1
