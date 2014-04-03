From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:33:07 +0200
Subject: [Buildroot] [git commit] eudev: only use pragma diagnostics if GCC
	supports it.
Message-ID: <20140403193844.EED068DB6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b70dec3fedff9923f443cee2cd70b6f2318e63a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eudev uses GCC pragma diagnostics [1] for some of its logging functions,
to circumvent -Wformat-nonliteral. This feature is only available in GCC
>= 4.6.

The external toolchains for some architectures (PowerPC, SuperH) are based on
GCC 4.5. So eudev will not compile when using them.

systemd also uses the pragma diagnostics, but its dependency on Linux
headers >= 3.8 for the toolchain indirectly forces recent versions of
GCC.

This workaround enables the pragma diagnostics only when using GCC >= 4.6.
This means that if the user uses GCC 4.5 and explicitly sets the options
-Werror -Wformat-nonliteral, the build will fail...

[1] http://gcc.gnu.org/onlinedocs/gcc/Diagnostic-Pragmas.html#Diagnostic-Pragmas

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
new file mode 100644
index 0000000..8b70fbf
--- /dev/null
+++ b/package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
@@ -0,0 +1,37 @@
+From dc8aa43b7b6d0cead7d8a0c1a151d289a5233a10 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Wed, 2 Apr 2014 12:36:52 +0200
+Subject: [PATCH] libudev: Only use #pragma for ignoring diagnostics if GCC
+ version supports it.
+
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/libudev/macro.h |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/libudev/macro.h b/src/libudev/macro.h
+index ac2a23f..fb55983 100644
+--- a/src/libudev/macro.h
++++ b/src/libudev/macro.h
+@@ -40,12 +40,17 @@
+ #define _cleanup_(x) __attribute__((cleanup(x)))
+ 
+ 
++#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
+ #define DISABLE_WARNING_FORMAT_NONLITERAL                               \
+         _Pragma("GCC diagnostic push");                                 \
+         _Pragma("GCC diagnostic ignored \"-Wformat-nonliteral\"")
+ 
+ #define REENABLE_WARNING                                                \
+         _Pragma("GCC diagnostic pop")
++#else
++#define DISABLE_WARNING_FORMAT_NONLITERAL
++#define REENABLE_WARNING
++#endif
+ 
+ /* Rounds up */
+ 
+-- 
+1.7.9.5
+
