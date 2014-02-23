From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 12:32:29 +0100
Subject: [Buildroot] [git commit] alsa-lib: add patch to remove hardcoded
	-ldl
Message-ID: <20140223113404.D0EC49B9FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffd7a00aef72359c630046fbb84d735a9f06db8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AM_PATH_ALSA macro in utils/alsa.m4 unconditionally uses -ldl. This
breaks compilation of alsa-utils (and probably other packages using this
macro) for targets that do not support dynamic loading, such as for
Blackfin FLAT binaries.

This patch updates the macro to check if dlopen is available, and use that
result to conditionally add -ldl to the list of libraries.

Fixes
http://autobuild.buildroot.org/results/de2/de286880973be956f6c504aa9a758171d6f49674/build-end.log

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-0004-conditional-enabling-of-libdl-in-m4.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch b/package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch
new file mode 100644
index 0000000..c533419
--- /dev/null
+++ b/package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch
@@ -0,0 +1,35 @@
+alsa-lib: conditionally enable libdl in AM_PATH_ALSA m4 macro
+
+The AM_PATH_ALSA macro in utils/alsa.m4 unconditionally uses -ldl. This
+breaks compilation of alsa-utils (and probably other packages using this
+macro) for targets that do not support dynamic loading, such as for
+Blackfin FLAT binaries.
+
+This patch updates the macro to check if dlopen is available, and use that
+result to conditionally add -ldl to the list of libraries.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+---
+
+diff --git a/utils/alsa.m4 b/utils/alsa.m4
+--- a/utils/alsa.m4
++++ b/utils/alsa.m4
+@@ -44,6 +44,8 @@ if test "$alsa_inc_prefix" != "" ; then
+ fi
+ AC_MSG_RESULT($ALSA_CFLAGS)
+ 
++AC_CHECK_LIB(c, dlopen, LIBDL="", [AC_CHECK_LIB(dl, dlopen, LIBDL="-ldl")])
++
+ dnl add any special lib dirs
+ AC_MSG_CHECKING(for ALSA LDFLAGS)
+ if test "$alsa_prefix" != "" ; then
+@@ -52,7 +54,7 @@ if test "$alsa_prefix" != "" ; then
+ fi
+ 
+ dnl add the alsa library
+-ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
++ALSA_LIBS="$ALSA_LIBS -lasound -lm $LIBDL -lpthread"
+ LIBS="$ALSA_LIBS $LIBS"
+ AC_MSG_RESULT($ALSA_LIBS)
+ 
