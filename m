From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 31 Jul 2020 20:49:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.32.0
Message-ID: <20200731184942.13948-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dropped patches accepted upstream, refresh 2nd patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested:
                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                        br-aarch64-glibc [ 3/45]: OK
                           br-arcle-hs38 [ 4/45]: OK
                            br-arm-basic [ 5/45]: OK
                  br-arm-cortex-a9-glibc [ 6/45]: OK
                   br-arm-cortex-a9-musl [ 7/45]: OK
                   br-arm-cortex-m4-full [ 8/45]: OK
                             br-arm-full [ 9/45]: OK
                    br-arm-full-nothread [10/45]: OK
                      br-arm-full-static [11/45]: OK
                br-i386-pentium-mmx-musl [12/45]: OK
                   br-i386-pentium4-full [13/45]: OK
                    br-microblazeel-full [14/45]: OK
                      br-mipsel-o32-full [15/45]: OK
                 br-mips32r6-el-hf-glibc [16/45]: OK
                      br-mips64-n64-full [17/45]: OK
                 br-mips64r6-el-hf-glibc [18/45]: OK
                       br-m68k-5208-full [19/45]: OK
                      br-m68k-68040-full [20/45]: OK
                          br-nios2-glibc [21/45]: OK
                      br-openrisc-uclibc [22/45]: OK
                  br-powerpc-e500mc-full [23/45]: OK
               br-powerpc-603e-basic-cpp [24/45]: OK
             br-powerpc64le-power8-glibc [25/45]: OK
               br-powerpc64-power7-glibc [26/45]: OK
                              br-riscv32 [27/45]: OK
                              br-riscv64 [28/45]: OK
                         br-riscv64-musl [29/45]: OK
                             br-sh4-full [30/45]: OK
                         br-sparc-uclibc [31/45]: OK
                        br-sparc64-glibc [32/45]: OK
                          br-xtensa-full [33/45]: OK
                    br-x86-64-core2-full [34/45]: OK
                          br-x86-64-musl [35/45]: OK
                       linaro-aarch64-be [36/45]: OK
                          linaro-aarch64 [37/45]: OK
                              linaro-arm [38/45]: OK
                     sourcery-arm-armv4t [39/45]: OK
                            sourcery-arm [40/45]: OK
                     sourcery-arm-thumb2 [41/45]: OK
                           sourcery-mips [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                          sourcery-nios2 [44/45]: OK
                         sourcery-x86-64 [45/45]: OK
Kind regards,
Petr

 ...trip-non-l-arguments-returned-by-pkg.patch |   4 +-
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  61 --------
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 -------
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 -------
 ...rappers-around-clock_gettime-closes-.patch | 134 ------------------
 .../0007-Remove-stime-function-calls.patch    |  97 -------------
 package/busybox/busybox.hash                  |   4 +-
 package/busybox/busybox.mk                    |   2 +-
 8 files changed, 6 insertions(+), 396 deletions(-)
 delete mode 100644 package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 delete mode 100644 package/busybox/0007-Remove-stime-function-calls.patch

diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
index 8375ae0531..84435442c9 100644
--- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
+++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -5,7 +5,9 @@ Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [yann.morin.1998 at free.fr: refresh for 1.29.0]
+[petr.vorel at gmail.com: refresh for 1.32.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  Makefile.flags | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -14,7 +16,7 @@ diff --git a/Makefile.flags b/Makefile.flags
 index 307afa7..885e323 100644
 --- a/Makefile.flags
 +++ b/Makefile.flags
-@@ -153,7 +153,9 @@ ifeq ($(CONFIG_SELINUX),y)
+@@ -176,7 +176,9 @@ ifeq ($(CONFIG_SELINUX),y)
  SELINUX_PC_MODULES = libselinux libsepol
  $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
  CPPFLAGS += $(SELINUX_CFLAGS)
diff --git a/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 2b89584f00..0000000000
--- a/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 29ba834ed7d968de0460f7fd87156d43d8120d8f Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:49 -0700
-Subject: [PATCH] date: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t fall back to the libc call.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-(cherry picked from commit b7b7452f292f03eefafa6fd1da9bcfc933dee15a)
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- coreutils/date.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/coreutils/date.c b/coreutils/date.c
-index 3414d38ae..1e0a675ca 100644
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -36,7 +36,7 @@
- //config:# defaults to "no": stat's nanosecond field is a bit non-portable
- //config:config FEATURE_DATE_NANO
- //config:	bool "Support %[num]N nanosecond format specifier"
--//config:	default n  # syscall(__NR_clock_gettime)
-+//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
- //config:	depends on DATE
- //config:	select PLATFORM_LINUX
- //config:	help
-@@ -271,10 +271,17 @@ int date_main(int argc UNUSED_PARAM, char **argv)
- 		 */
- #endif
- 	} else {
--#if ENABLE_FEATURE_DATE_NANO
-+#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
- 		/* libc has incredibly messy way of doing this,
- 		 * typically requiring -lrt. We just skip all this mess */
- 		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
-+#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
-+		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
-+		 * This simplifies the code for us as we don't need to convert
-+		 * between 64-bit and 32-bit. We also don't have a way to
-+		 * report overflow errors here.
-+		 */
-+		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
- #else
- 		time(&ts.tv_sec);
- #endif
--- 
-2.18.2
-
diff --git a/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 4481a82bac..0000000000
--- a/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 88732c5593e16ef6177f6e6110132ed69b06d2eb Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:50 -0700
-Subject: [PATCH] time: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t report a compilation error. This avoids us have to
-deal with converting between 64-bit and 32-bit values. There are
-currently no architectures where this is the case.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-(cherry picked from commit 902d3992922fc8db8495d5fb30a4581711b60c62)
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- libbb/time.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libbb/time.c b/libbb/time.c
-index f9b8da0b3..821f9a24b 100644
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -257,7 +257,14 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(char *buf, unsigned len, time_t *tp)
-  * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
-+#if defined(__NR_clock_gettime)
- 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
-+#elif __TIMESIZE == 64
-+	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
-+#else
-+# error "We currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void)
--- 
-2.18.2
-
diff --git a/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 0d25a6e72e..0000000000
--- a/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 8f4b588eb9737c2c0d1b199c7e609d880e0858a8 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:51 -0700
-Subject: [PATCH] runsv: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t report a compilation error. This avoids us have to
-deal with converting between 64-bit and 32-bit values. There are
-currently no architectures where this is the case.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-(cherry picked from commit ad27d44ebe950335616f37e36863469dc181b455)
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- runit/runsv.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/runit/runsv.c b/runit/runsv.c
-index ccc762d78..737909b0e 100644
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -55,7 +55,14 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
-+#if defined(__NR_clock_gettime)
- 	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
-+#elif __TIMESIZE == 64
-+	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
-+#else
-+# error "We currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- }
- #else
- static void gettimeofday_ns(struct timespec *ts)
--- 
-2.18.2
-
diff --git a/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
deleted file mode 100644
index 9d95d683f3..0000000000
--- a/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 07375fc6fd5912f34a36a097dc679f6e0af23f8a Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 24 Oct 2019 16:26:55 +0200
-Subject: [PATCH] Remove syscall wrappers around clock_gettime, closes 12091
-
-12091 "Direct use of __NR_clock_gettime is not time64-safe".
-
-function                                             old     new   delta
-runsv_main                                          1698    1712     +14
-startservice                                         378     383      +5
-get_mono                                              31      25      -6
-date_main                                            932     926      -6
-gettimeofday_ns                                       17       -     -17
-------------------------------------------------------------------------------
-(add/remove: 0/1 grow/shrink: 2/2 up/down: 19/-29)            Total: -10 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-(cherry picked from commit be5a505d771a77c640acc35ceaa470c80e62f954)
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- Makefile.flags   |  6 ++++--
- coreutils/date.c | 16 +++-------------
- libbb/time.c     | 11 +----------
- runit/runsv.c    | 11 +----------
- 4 files changed, 9 insertions(+), 35 deletions(-)
-
-diff --git a/Makefile.flags b/Makefile.flags
-index 6f6142cc5..bea464753 100644
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -129,10 +129,12 @@ endif
- # fall back to using a temp file:
- CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}' >crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c >/dev/null 2>&1 && echo "y"; rm crypttest.c)
- ifeq ($(CRYPT_AVAILABLE),y)
--LDLIBS += m crypt
-+LDLIBS += m rt crypt
- else
--LDLIBS += m
-+LDLIBS += m rt
- endif
-+# libm may be needed for dc, awk, ntpd
-+# librt may be needed for clock_gettime()
- 
- # libpam may use libpthread, libdl and/or libaudit.
- # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
-diff --git a/coreutils/date.c b/coreutils/date.c
-index 1e0a675ca..e479c23a2 100644
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -33,10 +33,9 @@
- //config:	Enable option (-I) to output an ISO-8601 compliant
- //config:	date/time string.
- //config:
--//config:# defaults to "no": stat's nanosecond field is a bit non-portable
- //config:config FEATURE_DATE_NANO
- //config:	bool "Support %[num]N nanosecond format specifier"
--//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
-+//config:	default n # stat's nanosecond field is a bit non-portable
- //config:	depends on DATE
- //config:	select PLATFORM_LINUX
- //config:	help
-@@ -271,17 +270,8 @@ int date_main(int argc UNUSED_PARAM, char **argv)
- 		 */
- #endif
- 	} else {
--#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
--		/* libc has incredibly messy way of doing this,
--		 * typically requiring -lrt. We just skip all this mess */
--		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
--#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
--		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
--		 * This simplifies the code for us as we don't need to convert
--		 * between 64-bit and 32-bit. We also don't have a way to
--		 * report overflow errors here.
--		 */
--		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
-+#if ENABLE_FEATURE_DATE_NANO
-+		clock_gettime(CLOCK_REALTIME, &ts);
- #else
- 		time(&ts.tv_sec);
- #endif
-diff --git a/libbb/time.c b/libbb/time.c
-index 821f9a24b..1077bfa4f 100644
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -253,18 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(char *buf, unsigned len, time_t *tp)
- #define CLOCK_MONOTONIC 1
- #endif
- 
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
--	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
--#elif __TIMESIZE == 64
--	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	if (clock_gettime(CLOCK_MONOTONIC, ts))
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void)
-diff --git a/runit/runsv.c b/runit/runsv.c
-index 737909b0e..36d85101e 100644
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -51,18 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #if ENABLE_MONOTONIC_SYSCALL
- #include <sys/syscall.h>
- 
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
--	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
--#elif __TIMESIZE == 64
--	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	clock_gettime(CLOCK_REALTIME, ts);
- }
- #else
- static void gettimeofday_ns(struct timespec *ts)
--- 
-2.18.2
-
diff --git a/package/busybox/0007-Remove-stime-function-calls.patch b/package/busybox/0007-Remove-stime-function-calls.patch
deleted file mode 100644
index 58e1ced3de..0000000000
--- a/package/busybox/0007-Remove-stime-function-calls.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 59102e499ac25c4311246d2b9417b3e5830cf851 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Nov 2019 13:06:40 +0100
-Subject: [PATCH] Remove stime() function calls
-
-stime() has been deprecated in glibc 2.31 and replaced with
-clock_settime(). Let's replace the stime() function calls with
-clock_settime() in preperation.
-
-function                                             old     new   delta
-rdate_main                                           197     224     +27
-clock_settime                                          -      27     +27
-date_main                                            926     941     +15
-stime                                                 37       -     -37
-------------------------------------------------------------------------------
-(add/remove: 2/2 grow/shrink: 2/0 up/down: 69/-37)             Total: 32 bytes
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-(cherry picked from commit d3539be8f27b8cbfdfee460fe08299158f08bcd9)
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- coreutils/date.c         | 6 +++++-
- libbb/missing_syscalls.c | 8 --------
- util-linux/rdate.c       | 8 ++++++--
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/coreutils/date.c b/coreutils/date.c
-index e479c23a2..77a7d1368 100644
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -276,6 +276,9 @@ int date_main(int argc UNUSED_PARAM, char **argv)
- 		time(&ts.tv_sec);
- #endif
- 	}
-+#if !ENABLE_FEATURE_DATE_NANO
-+	ts.tv_nsec = 0;
-+#endif
- 	localtime_r(&ts.tv_sec, &tm_time);
- 
- 	/* If date string is given, update tm_time, and maybe set date */
-@@ -298,9 +301,10 @@ int date_main(int argc UNUSED_PARAM, char **argv)
- 		if (date_str[0] != '@')
- 			tm_time.tm_isdst = -1;
- 		ts.tv_sec = validate_tm_time(date_str, &tm_time);
-+		ts.tv_nsec = 0;
- 
- 		/* if setting time, set it */
--		if ((opt & OPT_SET) && stime(&ts.tv_sec) < 0) {
-+		if ((opt & OPT_SET) && clock_settime(CLOCK_REALTIME, &ts) < 0) {
- 			bb_perror_msg("can't set date");
- 		}
- 	}
-diff --git a/libbb/missing_syscalls.c b/libbb/missing_syscalls.c
-index 87cf59b3d..dc40d9155 100644
---- a/libbb/missing_syscalls.c
-+++ b/libbb/missing_syscalls.c
-@@ -15,14 +15,6 @@ pid_t getsid(pid_t pid)
- 	return syscall(__NR_getsid, pid);
- }
- 
--int stime(const time_t *t)
--{
--	struct timeval tv;
--	tv.tv_sec = *t;
--	tv.tv_usec = 0;
--	return settimeofday(&tv, NULL);
--}
--
- int sethostname(const char *name, size_t len)
- {
- 	return syscall(__NR_sethostname, name, len);
-diff --git a/util-linux/rdate.c b/util-linux/rdate.c
-index 70f829e7f..878375d78 100644
---- a/util-linux/rdate.c
-+++ b/util-linux/rdate.c
-@@ -95,9 +95,13 @@ int rdate_main(int argc UNUSED_PARAM, char **argv)
- 	if (!(flags & 2)) { /* no -p (-s may be present) */
- 		if (time(NULL) == remote_time)
- 			bb_error_msg("current time matches remote time");
--		else
--			if (stime(&remote_time) < 0)
-+		else {
-+			struct timespec ts;
-+			ts.tv_sec = remote_time;
-+			ts.tv_nsec = 0;
-+			if (clock_settime(CLOCK_REALTIME, &ts) < 0)
- 				bb_perror_msg_and_die("can't set time of day");
-+		}
- 	}
- 
- 	if (flags != 1) /* not lone -s */
--- 
-2.18.2
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index e5b05ae731..cf744ffcda 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,4 +1,4 @@
-# From https://busybox.net/downloads/busybox-1.31.1.tar.bz2.sha256
-sha256 d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998  busybox-1.31.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.32.0.tar.bz2.sha256
+sha256 c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689  busybox-1.32.0.tar.bz2
 # Locally computed
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 24f3ba3b19..7344e8a9ce 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.31.1
+BUSYBOX_VERSION = 1.32.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.27.0
