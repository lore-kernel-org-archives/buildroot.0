From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:33:50 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] tekui: disable parallel
 build
Message-ID: <20190129163255.52626821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa5bbe4b85e00a220928664a1252c565a71fd295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

It seems tekui has parallel build issues since November 2017:
 - Fatal error: can't create build/posix/directfb_lua.lo: No such file or directory
 - /home/peko/autobuild/instance-3/output/host/bin/microblazeel-buildroot-linux-uclibc-ar: ../../lib/posix/libtekdebug.a: No such file or directory
 - Fatal error: can't create build/posix/visual_mod.lo: No such file or directory

So disable parallel build

Fixes:
 - http://autobuild.buildroot.org/results/0732568fcbaa6829154fa91c352b52f074384df0
 - http://autobuild.buildroot.org/results/580593e79bc4ecdea1dc71d16607e5c88f87403c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c80789c9171c86dd4a75718eb3f4c0cd75c0dead)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
+#??Package does not build in parallel due to improper make rules
+TEKUI_MAKE = $(MAKE1)
+
 TEKUI_MAKE_OPTS = \
 	CC="$(TARGET_CC) -fPIC" \
 	AR="$(TARGET_AR) rcu" \
