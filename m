From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 14:03:00 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xserver_xorg-server: Fix
	build with wayland, part II
In-Reply-To: <20161227130301.22831-1-bernd.kuhls@t-online.de>
References: <20161227130301.22831-1-bernd.kuhls@t-online.de>
Message-ID: <20161227130301.22831-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous patch is not sufficient to fix a build with wayland
support based on
http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/

The build still errors out at a later stage during configure:

configure: error: Xwayland requires CLOCK_MONOTONIC support.

Add a patch from OpenEmbedded to fix the problem.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/1.19.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch

diff --git a/package/x11r7/xserver_xorg-server/1.19.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.19.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
new file mode 100644
index 000000000..c5f04bf25
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
@@ -0,0 +1,66 @@
+Discover monotonic clock using compile-time check
+
+monotonic clock check does not work when cross-compiling.
+
+Upstream-Status: Denied [Does not work on OpenBSD]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+Original patch follows:
+
+When xorg-xserver is being cross-compiled, there is currently no way
+for us to detect whether the monotonic clock is available on the
+target system, because we aren't able to run a test program on the host
+system. Currently, in this situation, we default to not use the
+monotonic clock. One problem with this situation is that the user will
+be treated as idle when the date is updated.
+
+To fix this situation, we now use a compile-time check to detect whether the
+monotonic clock is available. This check can run just fine when we are
+cross-compiling.
+
+Signed-off-by: David James <davidjames@google.com>
+
+Downloaded from
+https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 17 +++++++----------
+ 1 file changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f7ab48c..26e85cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
+         CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
+     fi
+ 
+-    AC_RUN_IFELSE([AC_LANG_SOURCE([
++    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #include <time.h>
+-
+-int main(int argc, char *argv[[]]) {
+-    struct timespec tp;
+-
+-    if (clock_gettime(CLOCK_MONOTONIC, &tp) == 0)
++#include <unistd.h>
++int main() {
++#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
++        #error No monotonic clock
++#endif
+         return 0;
+-    else
+-        return 1;
+ }
+-    ])], [MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no],
+-       [MONOTONIC_CLOCK="cross compiling"])
++]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
+ 
+     LIBS="$LIBS_SAVE"
+     CPPFLAGS="$CPPFLAGS_SAVE"
+-- 
+2.1.4
+
-- 
2.11.0
