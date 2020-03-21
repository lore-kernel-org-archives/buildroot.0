From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 21 Mar 2020 17:58:52 -0300
Subject: [Buildroot] [PATCH v5] package/busybox: patch for glibc-2.31 and
 musl-1.2.0 compatibility
Message-ID: <20200321205852.19564-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Current release of busybox 1_31_1 is failing to build with glibc-2.31
due to removal of stime() from glibc. It also fails to build with musl
1.2.0 due to the direct use of __NR_clock_gettime.

Add a patch squashing five patches applied upstream. Three patches fix
64-bit time_t issues, one fixes the direct use of __NR_clock_gettime,
which is not safe, and the last one removes stime() function calls.

We could use the origianl patches directly but they depend on a large
previous change which is not worthwhile to pick. Squashing the patches,
rebased to version 1.31.1, minimizes the size of the change.

Fixes:
  http://autobuild.buildroot.net/results/f45f91aea6deee6699eabdfa618ac44873b8da51/

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
Supersedes: https://patchwork.ozlabs.org/patch/1249916/
---
Changes v5:
- Drop the first patch, squash the other ones and rebase on v1.31.1, as
  suggested by Romain Naour
Changes v4:
- Rabase on the master branch
- Add SOB lines to patches
---
 ...ation-of-5-commits-rebased-to-tag-1_.patch | 257 ++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 package/busybox/0003-This-is-a-combination-of-5-commits-rebased-to-tag-1_.patch

diff --git a/package/busybox/0003-This-is-a-combination-of-5-commits-rebased-to-tag-1_.patch b/package/busybox/0003-This-is-a-combination-of-5-commits-rebased-to-tag-1_.patch
new file mode 100644
index 0000000000..c3e092c13a
--- /dev/null
+++ b/package/busybox/0003-This-is-a-combination-of-5-commits-rebased-to-tag-1_.patch
@@ -0,0 +1,257 @@
+From cf0ebc9dfd24ffe7484448df28b8f47cd9b8fcd7 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:49 -0700
+Subject: [PATCH] This is a combination of 5 commits, rebased to tag 1_31_1
+
+================================= commit #1 ==================================
+date: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t fall back to the libc call.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+(cherry picked from commit b7b7452f292f03eefafa6fd1da9bcfc933dee15a)
+================================= commit #2 ==================================
+time: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t report a compilation error. This avoids us have to
+deal with converting between 64-bit and 32-bit values. There are
+currently no architectures where this is the case.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Change-Id: Ifb889f03a06c6bf8d0e927e6eb828851b01e5603
+
+(cherry picked from commit 902d3992922fc8db8495d5fb30a4581711b60c62)
+================================= commit #3 ==================================
+runsv: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t report a compilation error. This avoids us have to
+deal with converting between 64-bit and 32-bit values. There are
+currently no architectures where this is the case.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+(cherry picked from commit ad27d44ebe950335616f37e36863469dc181b455)
+================================= commit #4 ==================================
+Remove syscall wrappers around clock_gettime, closes 12091
+
+12091 "Direct use of __NR_clock_gettime is not time64-safe".
+
+function                                             old     new   delta
+runsv_main                                          1698    1712     +14
+startservice                                         378     383      +5
+get_mono                                              31      25      -6
+date_main                                            932     926      -6
+gettimeofday_ns                                       17       -     -17
+------------------------------------------------------------------------------
+(add/remove: 0/1 grow/shrink: 2/2 up/down: 19/-29)            Total: -10 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Change-Id: Ibd66f8bfda5da268f511d4f274aff28b52ceddde
+
+(cherry picked from commit be5a505d771a77c640acc35ceaa470c80e62f954)
+================================= commit #5 ==================================
+Remove stime() function calls
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
+Change-Id: I6ad7e67cf47d9a5cb5f82f2d192cb96d34e0f725
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+(cherry picked from commit d3539be8f27b8cbfdfee460fe08299158f08bcd9)
+==============================================================================
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ Makefile.flags           |  6 ++++--
+ coreutils/date.c         | 13 +++++++------
+ libbb/missing_syscalls.c |  8 --------
+ libbb/time.c             |  4 +---
+ runit/runsv.c            |  4 +---
+ util-linux/rdate.c       |  8 ++++++--
+ 6 files changed, 19 insertions(+), 24 deletions(-)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 6f6142cc5..bea464753 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -129,10 +129,12 @@ endif
+ # fall back to using a temp file:
+ CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}' >crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c >/dev/null 2>&1 && echo "y"; rm crypttest.c)
+ ifeq ($(CRYPT_AVAILABLE),y)
+-LDLIBS += m crypt
++LDLIBS += m rt crypt
+ else
+-LDLIBS += m
++LDLIBS += m rt
+ endif
++# libm may be needed for dc, awk, ntpd
++# librt may be needed for clock_gettime()
+ 
+ # libpam may use libpthread, libdl and/or libaudit.
+ # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
+diff --git a/coreutils/date.c b/coreutils/date.c
+index 3414d38ae..77a7d1368 100644
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -33,10 +33,9 @@
+ //config:	Enable option (-I) to output an ISO-8601 compliant
+ //config:	date/time string.
+ //config:
+-//config:# defaults to "no": stat's nanosecond field is a bit non-portable
+ //config:config FEATURE_DATE_NANO
+ //config:	bool "Support %[num]N nanosecond format specifier"
+-//config:	default n  # syscall(__NR_clock_gettime)
++//config:	default n # stat's nanosecond field is a bit non-portable
+ //config:	depends on DATE
+ //config:	select PLATFORM_LINUX
+ //config:	help
+@@ -272,13 +271,14 @@ int date_main(int argc UNUSED_PARAM, char **argv)
+ #endif
+ 	} else {
+ #if ENABLE_FEATURE_DATE_NANO
+-		/* libc has incredibly messy way of doing this,
+-		 * typically requiring -lrt. We just skip all this mess */
+-		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
++		clock_gettime(CLOCK_REALTIME, &ts);
+ #else
+ 		time(&ts.tv_sec);
+ #endif
+ 	}
++#if !ENABLE_FEATURE_DATE_NANO
++	ts.tv_nsec = 0;
++#endif
+ 	localtime_r(&ts.tv_sec, &tm_time);
+ 
+ 	/* If date string is given, update tm_time, and maybe set date */
+@@ -301,9 +301,10 @@ int date_main(int argc UNUSED_PARAM, char **argv)
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
+diff --git a/libbb/time.c b/libbb/time.c
+index f9b8da0b3..1077bfa4f 100644
+--- a/libbb/time.c
++++ b/libbb/time.c
+@@ -253,11 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(char *buf, unsigned len, time_t *tp)
+ #define CLOCK_MONOTONIC 1
+ #endif
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void get_mono(struct timespec *ts)
+ {
+-	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
++	if (clock_gettime(CLOCK_MONOTONIC, ts))
+ 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
+ }
+ unsigned long long FAST_FUNC monotonic_ns(void)
+diff --git a/runit/runsv.c b/runit/runsv.c
+index ccc762d78..36d85101e 100644
+--- a/runit/runsv.c
++++ b/runit/runsv.c
+@@ -51,11 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #if ENABLE_MONOTONIC_SYSCALL
+ #include <sys/syscall.h>
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
+-	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
++	clock_gettime(CLOCK_REALTIME, ts);
+ }
+ #else
+ static void gettimeofday_ns(struct timespec *ts)
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
-- 
2.18.2
