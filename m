From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:07:49 +0100
Subject: [Buildroot] [git commit] zlog: Add patch to remove -Werror
Message-ID: <20141026210813.1B3D9B0BEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa630d3fc9e77656ad997adb5a194df829a0ad82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to remove -Werror and avoid build errors because of warnings.

Fixes: http://autobuild.buildroot.net/results/6935e1107d832e5678c8742239eccd89d4abed47/
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ove-Werror-and-avoid-build-failures-becau.patch |   38 ++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch b/package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch
new file mode 100644
index 0000000..0f1b912
--- /dev/null
+++ b/package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch
@@ -0,0 +1,38 @@
+From 4a08c9e07fa8b7a1d6a76b927ea97e3eaa784845 Mon Sep 17 00:00:00 2001
+From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+Date: Sun, 26 Oct 2014 16:16:25 -0300
+Subject: [PATCH] compile: Remove -Werror and avoid build failures because of
+ warnings
+
+Using -Werror on production is a bad idea, as otherwise harmless warnings
+get treated as errors breaking builds. This is currently the case with
+Nios-II architecture toolchain, warning about a deprecated macro:
+
+../usr/nios2-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
+error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
+ # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Instead of trying to fix the macro, let's fix the real issue here,
+and remove -Werror.
+
+Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+---
+ src/makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/makefile b/src/makefile
+index 294dc08..4ac4c43 100644
+--- a/src/makefile
++++ b/src/makefile
+@@ -32,7 +32,7 @@ ZLOG_MINOR=2
+ # Fallback to gcc when $CC is not in $PATH.
+ CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+ OPTIMIZATION?=-O2
+-WARNINGS=-Wall -Werror -Wstrict-prototypes -fwrapv
++WARNINGS=-Wall -Wstrict-prototypes -fwrapv
+ DEBUG?= -g -ggdb
+ REAL_CFLAGS=$(OPTIMIZATION) -fPIC -pthread $(CFLAGS) $(WARNINGS) $(DEBUG)
+ REAL_LDFLAGS=$(LDFLAGS) -pthread
+-- 
+2.1.0
+
