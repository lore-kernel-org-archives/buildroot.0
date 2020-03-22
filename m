From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 18:30:04 +0100
Subject: [Buildroot] [git commit] package/busybox: fix build with glibc 2.31
Message-ID: <20200322172038.A8BDA846ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13f2d688a24f47446af236829bd6ca194d5aea5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox 1.31.1 fails to build with glibc 2.31 due to the removal of
stime() from glibc. Pull a patch already applied upstream to fix the
problem.

The patch was rebased on version 1.31.1 to minimize the change, since
the original one depended on a previous commit which is not worthwhile
to pick.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN. <yann.morin.1998@free.fr>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../busybox/0007-Remove-stime-function-calls.patch | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/package/busybox/0007-Remove-stime-function-calls.patch b/package/busybox/0007-Remove-stime-function-calls.patch
new file mode 100644
index 0000000000..58e1ced3de
--- /dev/null
+++ b/package/busybox/0007-Remove-stime-function-calls.patch
@@ -0,0 +1,97 @@
+From 59102e499ac25c4311246d2b9417b3e5830cf851 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 19 Nov 2019 13:06:40 +0100
+Subject: [PATCH] Remove stime() function calls
+
+stime() has been deprecated in glibc 2.31 and replaced with
+clock_settime(). Let's replace the stime() function calls with
+clock_settime() in preperation.
+
+function                                             old     new   delta
+rdate_main                                           197     224     +27
+clock_settime                                          -      27     +27
+date_main                                            926     941     +15
+stime                                                 37       -     -37
+------------------------------------------------------------------------------
+(add/remove: 2/2 grow/shrink: 2/0 up/down: 69/-37)             Total: 32 bytes
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+(cherry picked from commit d3539be8f27b8cbfdfee460fe08299158f08bcd9)
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ coreutils/date.c         | 6 +++++-
+ libbb/missing_syscalls.c | 8 --------
+ util-linux/rdate.c       | 8 ++++++--
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/coreutils/date.c b/coreutils/date.c
+index e479c23a2..77a7d1368 100644
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -276,6 +276,9 @@ int date_main(int argc UNUSED_PARAM, char **argv)
+ 		time(&ts.tv_sec);
+ #endif
+ 	}
++#if !ENABLE_FEATURE_DATE_NANO
++	ts.tv_nsec = 0;
++#endif
+ 	localtime_r(&ts.tv_sec, &tm_time);
+ 
+ 	/* If date string is given, update tm_time, and maybe set date */
+@@ -298,9 +301,10 @@ int date_main(int argc UNUSED_PARAM, char **argv)
+ 		if (date_str[0] != '@')
+ 			tm_time.tm_isdst = -1;
+ 		ts.tv_sec = validate_tm_time(date_str, &tm_time);
++		ts.tv_nsec = 0;
+ 
+ 		/* if setting time, set it */
+-		if ((opt & OPT_SET) && stime(&ts.tv_sec) < 0) {
++		if ((opt & OPT_SET) && clock_settime(CLOCK_REALTIME, &ts) < 0) {
+ 			bb_perror_msg("can't set date");
+ 		}
+ 	}
+diff --git a/libbb/missing_syscalls.c b/libbb/missing_syscalls.c
+index 87cf59b3d..dc40d9155 100644
+--- a/libbb/missing_syscalls.c
++++ b/libbb/missing_syscalls.c
+@@ -15,14 +15,6 @@ pid_t getsid(pid_t pid)
+ 	return syscall(__NR_getsid, pid);
+ }
+ 
+-int stime(const time_t *t)
+-{
+-	struct timeval tv;
+-	tv.tv_sec = *t;
+-	tv.tv_usec = 0;
+-	return settimeofday(&tv, NULL);
+-}
+-
+ int sethostname(const char *name, size_t len)
+ {
+ 	return syscall(__NR_sethostname, name, len);
+diff --git a/util-linux/rdate.c b/util-linux/rdate.c
+index 70f829e7f..878375d78 100644
+--- a/util-linux/rdate.c
++++ b/util-linux/rdate.c
+@@ -95,9 +95,13 @@ int rdate_main(int argc UNUSED_PARAM, char **argv)
+ 	if (!(flags & 2)) { /* no -p (-s may be present) */
+ 		if (time(NULL) == remote_time)
+ 			bb_error_msg("current time matches remote time");
+-		else
+-			if (stime(&remote_time) < 0)
++		else {
++			struct timespec ts;
++			ts.tv_sec = remote_time;
++			ts.tv_nsec = 0;
++			if (clock_settime(CLOCK_REALTIME, &ts) < 0)
+ 				bb_perror_msg_and_die("can't set time of day");
++		}
+ 	}
+ 
+ 	if (flags != 1) /* not lone -s */
+-- 
+2.18.2
+
