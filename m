From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2016 09:23:37 +0100
Subject: [Buildroot] [git commit] util-linux: fix static builds with uClibc
Message-ID: <20160202084044.F0DEE80831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c823c6ee6ae68115f4d81b6aa5020486a273018e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case of uClibc librt depends on libpthread. In particular
timer_create() function uses pthread_XXX(). That means in case
of static builds it's required to link not librt alone but
together with libpthread. So if checking timer_create function
in librt fails, it is necessary to check if timer_create function
successfully links with "-lpthread".

That issues was spotted in Buldroot autobuilder failures:
http://autobuild.buildroot.net/results/759/75960db671807091fe9155aee9e46a6245e32590/
http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/

0005-build-sys-use-REALTIME_LIBS.patch is a back-port of upstream
https://github.com/karelzak/util-linux/commit/b97edfe731fdf3d3e92e40494b22658207ab6d3c
that won't apply cleanly on v2.27.1

0006-buildsys-fix-static-configuration-and-building.patch was just
applied upstream, see https://github.com/karelzak/util-linux/commit/71a77ca1ddfdd7e0d14caad9e8a607a83d61a45c

Both patches must be removed on util-linux version bump.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-build-sys-use-REALTIME_LIBS.patch         | 41 ++++++++++++++++
 ...sys-fix-static-configuration-and-building.patch | 54 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch b/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
new file mode 100644
index 0000000..6402ef5
--- /dev/null
+++ b/package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
@@ -0,0 +1,41 @@
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
+
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
index 0000000..cd5654e
--- /dev/null
+++ b/package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
@@ -0,0 +1,54 @@
+From f69e18629d1c91d83ab91314baf5e34088b57f6e Mon Sep 17 00:00:00 2001
+From: Lada Trimasova <ltrimas@synopsys.com>
+Date: Wed, 27 Jan 2016 16:26:41 +0300
+Subject: [PATCH] buildsys: fix static configuration and building
+
+In case of uClibc librt depends on libpthread. In particular
+timer_create() function uses pthread_XXX(). That means in case
+of static builds it's required to link not librt alone but
+together with libpthread. So if checking timer_create function
+in librt fails, it is necessary to check if timer_create function
+successfully links with "-lpthread".
+
+That issues was spotted in Buldroot autobuilder failures:
+http://autobuild.buildroot.net/results/759/75960db671807091fe9155aee9e46a6245e32590/
+http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/
+
+Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
+---
+ configure.ac | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 56512c0..9392bf2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -382,14 +382,23 @@ AC_CHECK_FUNCS([clock_gettime], [],
+ AC_SUBST([REALTIME_LIBS])
+ 
+ have_timer="no"
+-AC_CHECK_FUNCS([timer_createx],
++AC_CHECK_FUNCS([timer_create],
+ 	[have_time="yes"],
+ 	[AC_CHECK_LIB([rt], [timer_create], [
+ 		have_timer="yes"
+ 		REALTIME_LIBS="-lrt"
+-	])]
++	],[
++		AC_SEARCH_LIBS([timer_create], [rt], [
++			AC_MSG_RESULT(yes)
++			have_timer="yes"
++			REALTIME_LIBS="-lrt -lpthread"
++		],[], [-lpthread]
++		)
++		])]
+ )
+ 
++AC_SUBST([REALTIME_LIBS])
++
+ 
+ AC_CHECK_MEMBER([struct sockaddr.sa_len],
+ 		AC_DEFINE_UNQUOTED([HAVE_SA_LEN], [1], [Define if struct sockaddr contains sa_len]), [],
+-- 
+2.5.0
+
