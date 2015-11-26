From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 27 Nov 2015 00:34:24 +0300
Subject: [Buildroot] [PATCH] util-linux: fix static builds with uClibc
Message-ID: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What happens util-linux on configuration step tries to build
and example that uses timer_create() function. That function
exists in librt and configuration utility correctly adds this
lib (-lrt).

But timer_create() uses pthreads internally and so for successful
linkage "-lpthread" is required as well (in addition to "-lrt").

0005-build-sys-use-REALTIME_LIBS.patch is a back-port of upstream
commit
https://github.com/karelzak/util-linux/commit/b97edfe731fdf3d3e92e40494b22658207ab6d3c
that won't apply cleanly on v2.27.1

0006-buildsys-fix-static-configuration-and-building.patch was just
sent upstream, see https://github.com/karelzak/util-linux/pull/234

Both patches must be removed on util-linux version bump.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-build-sys-use-REALTIME_LIBS.patch         | 40 ++++++++++++++++++++++
 ...sys-fix-static-configuration-and-building.patch | 39 +++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
 create mode 100644 package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch

diff --git a/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch b/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
new file mode 100644
index 0000000..605345c
--- /dev/null
+++ b/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
@@ -0,0 +1,40 @@
+From 9ed54668c15534a3b9d75e8a3e90b72ea426e596 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Fri, 9 Oct 2015 11:31:49 +0200
+Subject: [PATCH] build-sys: use REALTIME_LIBS
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ misc-utils/Makemodule.am | 2 +-
+ sys-utils/Makemodule.am  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
+index e801611..b96d18b 100644
+--- a/misc-utils/Makemodule.am
++++ b/misc-utils/Makemodule.am
+@@ -90,7 +90,7 @@ endif
+ if BUILD_UUIDD
+ usrsbin_exec_PROGRAMS += uuidd
+ dist_man_MANS += misc-utils/uuidd.8
+-uuidd_LDADD = $(LDADD) libuuid.la libcommon.la
++uuidd_LDADD = $(LDADD) libuuid.la libcommon.la $(REALTIME_LIBS)
+ uuidd_CFLAGS = $(DAEMON_CFLAGS) $(AM_CFLAGS) -I$(ul_libuuid_incdir)
+ uuidd_LDFLAGS = $(DAEMON_LDFLAGS) $(AM_LDFLAGS)
+ uuidd_SOURCES = misc-utils/uuidd.c
+diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
+index f306e65..3d28ff1 100644
+--- a/sys-utils/Makemodule.am
++++ b/sys-utils/Makemodule.am
+@@ -2,7 +2,7 @@ if BUILD_FLOCK
+ usrbin_exec_PROGRAMS += flock
+ dist_man_MANS += sys-utils/flock.1
+ flock_SOURCES = sys-utils/flock.c lib/monotonic.c lib/timer.c
+-flock_LDADD = $(LDADD) libcommon.la -lrt
++flock_LDADD = $(LDADD) libcommon.la $(REALTIME_LIBS)
+ endif
+ 
+ if BUILD_IPCMK
+-- 
+2.5.0
+
diff --git a/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch b/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
new file mode 100644
index 0000000..e58a0d4
--- /dev/null
+++ b/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
@@ -0,0 +1,39 @@
+From 5afb95fcce9d1dd072d5fcec9b632e9fcfcf419f Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Tue, 24 Nov 2015 14:47:04 +0300
+Subject: [PATCH] buildsys: fix static configuration and building
+
+In case of uClibc librt depends on libpthread.
+
+In particular timer_create() function uses pthread_XXX().
+
+That means in case of static builds it's required to link
+not librt alone but together with libpthread.
+
+That issues was spotted in Buldroot autobuilder failures:
+http://autobuild.buildroot.net/results/759/75960db671807091fe9155aee9e46a6245e32590/
+http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6075f72..e9b8794 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -391,8 +391,8 @@ AC_CHECK_FUNCS([timer_createx],
+ 	[have_time="yes"],
+ 	[AC_CHECK_LIB([rt], [timer_create], [
+ 		have_timer="yes"
+-		REALTIME_LIBS="-lrt"
+-	])]
++		REALTIME_LIBS="-lrt -lpthread"
++	],[],[-lpthread])]
+ )
+ 
+ 
+-- 
+2.5.0
+
-- 
2.5.0
