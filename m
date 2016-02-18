From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Feb 2016 22:46:58 +0100
Subject: [Buildroot] [PATCH v1] fbterm: fix musl compile (missing string.h
	include)
Message-ID: <1455832018-17573-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  mouse.cpp: In function 's32 open_gpm(Gpm_Connect*)':
  mouse.cpp:58:37: error: 'memset' was not declared in this scope
    memset((s8 *)&addr, 0, sizeof(addr));
                                     ^
  mouse.cpp:60:64: error: 'strncpy' was not declared in this scope
    strncpy(addr.sun_path, GPM_NODE_CTL, sizeof(addr.sun_path) - 1);

in case BR2_PACKAGE_GPM is defined.

Add proper gpm dependency and configure option too.

[1] http://autobuild.buildroot.net/results/a60/a602d61e68f662217ad868de79711a8ea892a3a9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../fbterm/0002-mouse.cpp-fix-musl-compile.patch   | 30 ++++++++++++++++++++++
 package/fbterm/fbterm.mk                           |  7 +++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/fbterm/0002-mouse.cpp-fix-musl-compile.patch

diff --git a/package/fbterm/0002-mouse.cpp-fix-musl-compile.patch b/package/fbterm/0002-mouse.cpp-fix-musl-compile.patch
new file mode 100644
index 0000000..5182d8b
--- /dev/null
+++ b/package/fbterm/0002-mouse.cpp-fix-musl-compile.patch
@@ -0,0 +1,30 @@
+From a34dba99aff2994269ee347da67feb7ede9b1a67 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 18 Feb 2016 22:32:38 +0100
+Subject: [PATCH] mouse.cpp: fix musl compile
+
+Add missing include, fixes:
+
+  mouse.cpp:58:37: error: 'memset' was not declared in this scope
+  mouse.cpp:60:64: error: 'strncpy' was not declared in this scope
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/mouse.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mouse.cpp b/src/mouse.cpp
+index 0435dd9..f173137 100644
+--- a/src/mouse.cpp
++++ b/src/mouse.cpp
+@@ -27,6 +27,7 @@ DEFINE_INSTANCE(Mouse)
+ #include <stddef.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <gpm.h>
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+-- 
+2.1.4
+
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index d78d6b7..7a424a5 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -16,4 +16,11 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 FBTERM_CONF_ENV += LIBS='-lpthread'
 endif
 
+ifeq ($(BR2_PACKAGE_GPM),y)
+FBTERM_DEPENDENCIES += gpm
+FBTERM_CONF_OPTS += --enable-gpm
+else
+FBTERM_CONF_OPTS += --disable-gpm
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
