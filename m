From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 22:52:03 +0200
Subject: [Buildroot] [git commit] lttng-libust: Disable liblttng-ust-dl with
	uClibc.
Message-ID: <20140406205214.02FF09C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abf58f46cedacace1db53de5cc12a8fe9f7fbd82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to uClibc commit [1], dlinfo is not available.
To be able to use LTTng UST with uClibc, we need to disable
the Dynamic Linker Tracing functionality [2].

Fixes:
http://autobuild.buildroot.net/results/a6c/a6c33dd7ec2a36a50c5ea74b989a371d6c85e899/build-end.log

[1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
[2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...iblttng-ust-dl-if-dlinfo-is-not-available.patch |   52 ++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch b/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
new file mode 100644
index 0000000..7849840
--- /dev/null
+++ b/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
@@ -0,0 +1,52 @@
+Disable liblttng-ust-dl if dlinfo is not available in C library.
+
+According to uClibc commit [1], dlinfo is not available.
+To be able to use LTTng UST with uClibc, we need to disable
+the Dynamic Linker Tracing functionality [2].
+
+[1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
+[2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 3 +++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b79d2dd..c907ff1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,11 +4,14 @@ SUBDIRS = . include snprintf libringbuffer liblttng-ust-comm \
+ 		liblttng-ust \
+ 		liblttng-ust-ctl \
+ 		liblttng-ust-fork \
+-		liblttng-ust-dl \
+ 		liblttng-ust-libc-wrapper \
+ 		liblttng-ust-cyg-profile \
+ 		tools
+ 
++if HAVE_DLINFO
++SUBDIRS += liblttng-ust-dl
++endif
++
+ if BUILD_JNI_INTERFACE
+ SUBDIRS += liblttng-ust-java liblttng-ust-jul
+ endif
+diff --git a/configure.ac b/configure.ac
+index f507883..5dcf0e2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -145,6 +145,9 @@ AC_C_INLINE
+ AC_FUNC_MALLOC
+ AC_CHECK_FUNCS([gettimeofday munmap socket strerror strtol sched_getcpu sysconf])
+ 
++AC_CHECK_FUNCS([dlinfo])
++AM_CONDITIONAL([HAVE_DLINFO], [test "${ac_cv_func_dlinfo}" = "yes"])
++
+ CFLAGS="-Wall $CFLAGS"
+ 
+ # URCU
+-- 
+1.9.0
+
