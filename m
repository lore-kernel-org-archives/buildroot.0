From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 18:10:31 +0200
Subject: [Buildroot] [git commit] package/lttng-babeltrace: fix static build
Message-ID: <20160530161104.85E11818DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef18eedce6f8daef20de1531efffb7d429f40b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch fixing libuuid detection on static build.

Fixes:
  http://autobuild.buildroot.net/results/43b/43b98ddf9eb44152ed9ac4a98d887af14831d8da/

[Peter: add comment why autoreconf is needed]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-uuid-support-detection-on-static-build.patch | 63 ++++++++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk       |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch b/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
new file mode 100644
index 0000000..849c0a3
--- /dev/null
+++ b/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
@@ -0,0 +1,63 @@
+From 670d0961a823df0db28f39a354430f3dc2519418 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 28 May 2016 12:53:33 +0200
+Subject: [PATCH] configure: fix uuid support detection on static build
+
+This change adds uuid support detection using pkg-config, before falling
+back on default AC_CHECK_LIB calls.
+
+Using flags from pkg-config is useful for static build, because they
+also include dependency flags; whereas
+
+AC_CHECK_LIB function achieves its test by trying to link against the
+requested library, without taking care of its dependency
+requirements/flags. Therefore, in case of static build, it can fail on
+the uuid detection like [1], because the uuid's dependency flags
+(regarding gettext) are missing.
+Instead, using pkg-config to do the check will take care of getting and
+setting all required flags.
+
+This change adds uuid detection using pkg-config helper before falling
+back on the standard AC_CHECK_LIB detection for platforms missing
+pkg-config.
+
+This issue [1] has been triggered on Buildroot farms.
+
+[1] http://autobuild.buildroot.net/results/43b/43b98ddf9eb44152ed9ac4a98d887af14831d8da/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 632fe39..b344fa8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,6 +65,15 @@ esac
+ AM_CONDITIONAL([BABELTRACE_BUILD_WITH_MINGW], [test "x$MINGW32" = "xyes"])
+ 
+ # Check for libuuid
++PKG_CHECK_MODULES([UUID], [uuid],
++[
++	LIBS="${UUID_LIBS} ${LIBS}"
++	CFLAGS="${CFLAGS} ${UUID_CFLAGS}"
++	AC_DEFINE_UNQUOTED([BABELTRACE_HAVE_LIBUUID], 1, [Has libuuid support.])
++	have_libuuid=yes
++],
++[
++# try detecting libuuid without pkg-config
+ AC_CHECK_LIB([uuid], [uuid_generate],
+ [
+ 	AC_DEFINE_UNQUOTED([BABELTRACE_HAVE_LIBUUID], 1, [Has libuuid support.])
+@@ -83,6 +92,7 @@ AC_CHECK_LIB([uuid], [uuid_generate],
+ 			AC_MSG_ERROR([Cannot find libuuid uuid_generate nor libc uuid_create. Use [LDFLAGS]=-Ldir to specify their location.])
+ 		fi
+ 	])
++])
+ ]
+ )
+ AM_CONDITIONAL([BABELTRACE_BUILD_WITH_LIBUUID], [test "x$have_libuuid" = "xyes"])
+-- 
+2.8.3
+
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 5de77fb..fdc647e 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -10,7 +10,9 @@ LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
-LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
+LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+# for 0002-configure-fix-uuid-support-detection-on-static-build.patch
+LTTNG_BABELTRACE_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
