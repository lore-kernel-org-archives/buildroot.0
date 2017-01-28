From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 20:55:08 +1300
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
	CLOCK_MONOTONIC detection for Xwayland
Message-ID: <20170128075533.EB87381EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb17f64bfe8018f650222632c02ee7a68643d565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d119a6b1c0cb90089a6451f5a3c112944e406a4f
("package/x11r7/xserver_xorg-server: add missing dependency for
wayland support") is not sufficient to fix a build with wayland
support based the configuration at:

  http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/

The build errors out at a later stage during configure:

  configure: error: Xwayland requires CLOCK_MONOTONIC support.

This commit adds a patch from OpenEmbedded to fix the problem.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.19.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
new file mode 100644
index 0000000..c5f04bf
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
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
