From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 18:30:02 +0100
Subject: [Buildroot] [git commit] package/busybox: fix build with musl 1.2.0
Message-ID: <20200322172038.95ACC846ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6732d952d069ecc3f6d1d8c10b1e6f0b4a4f3472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox 1.31.1 fails to build with musl 1.2.0 due to the direct use of
__NR_clock_gettime. Pull four patches already applied upstream to fix
the problem.

The patches were rebased to version 1.31.1 to minimize the change, since
the original ones depended on a previous commit which is not worthwhile
to pick.

Fixes:
  http://autobuild.buildroot.net/results/f45f91aea6deee6699eabdfa618ac44873b8da51/

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN. <yann.morin.1998@free.fr>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-date-Use-64-prefix-syscall-if-we-have-to.patch |  61 ++++++++++
 ...-time-Use-64-prefix-syscall-if-we-have-to.patch |  50 ++++++++
 ...runsv-Use-64-prefix-syscall-if-we-have-to.patch |  50 ++++++++
 ...all-wrappers-around-clock_gettime-closes-.patch | 134 +++++++++++++++++++++
 4 files changed, 295 insertions(+)

diff --git a/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..2b89584f00
--- /dev/null
+++ b/package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,61 @@
+From 29ba834ed7d968de0460f7fd87156d43d8120d8f Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:49 -0700
+Subject: [PATCH] date: Use 64 prefix syscall if we have to
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
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ coreutils/date.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/coreutils/date.c b/coreutils/date.c
+index 3414d38ae..1e0a675ca 100644
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -36,7 +36,7 @@
+ //config:# defaults to "no": stat's nanosecond field is a bit non-portable
+ //config:config FEATURE_DATE_NANO
+ //config:	bool "Support %[num]N nanosecond format specifier"
+-//config:	default n  # syscall(__NR_clock_gettime)
++//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
+ //config:	depends on DATE
+ //config:	select PLATFORM_LINUX
+ //config:	help
+@@ -271,10 +271,17 @@ int date_main(int argc UNUSED_PARAM, char **argv)
+ 		 */
+ #endif
+ 	} else {
+-#if ENABLE_FEATURE_DATE_NANO
++#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
+ 		/* libc has incredibly messy way of doing this,
+ 		 * typically requiring -lrt. We just skip all this mess */
+ 		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
++#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
++		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
++		 * This simplifies the code for us as we don't need to convert
++		 * between 64-bit and 32-bit. We also don't have a way to
++		 * report overflow errors here.
++		 */
++		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
+ #else
+ 		time(&ts.tv_sec);
+ #endif
+-- 
+2.18.2
+
diff --git a/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..4481a82bac
--- /dev/null
+++ b/package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,50 @@
+From 88732c5593e16ef6177f6e6110132ed69b06d2eb Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:50 -0700
+Subject: [PATCH] time: Use 64 prefix syscall if we have to
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
+(cherry picked from commit 902d3992922fc8db8495d5fb30a4581711b60c62)
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ libbb/time.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libbb/time.c b/libbb/time.c
+index f9b8da0b3..821f9a24b 100644
+--- a/libbb/time.c
++++ b/libbb/time.c
+@@ -257,7 +257,14 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(char *buf, unsigned len, time_t *tp)
+  * typically requiring -lrt. We just skip all this mess */
+ static void get_mono(struct timespec *ts)
+ {
++#if defined(__NR_clock_gettime)
+ 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
++#elif __TIMESIZE == 64
++	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
++#else
++# error "We currently don't support architectures without " \
++	"the __NR_clock_gettime syscall and 32-bit time_t"
++#endif
+ 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
+ }
+ unsigned long long FAST_FUNC monotonic_ns(void)
+-- 
+2.18.2
+
diff --git a/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch b/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..0d25a6e72e
--- /dev/null
+++ b/package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,50 @@
+From 8f4b588eb9737c2c0d1b199c7e609d880e0858a8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:51 -0700
+Subject: [PATCH] runsv: Use 64 prefix syscall if we have to
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
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ runit/runsv.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/runit/runsv.c b/runit/runsv.c
+index ccc762d78..737909b0e 100644
+--- a/runit/runsv.c
++++ b/runit/runsv.c
+@@ -55,7 +55,14 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
++#if defined(__NR_clock_gettime)
+ 	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
++#elif __TIMESIZE == 64
++	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
++#else
++# error "We currently don't support architectures without " \
++	"the __NR_clock_gettime syscall and 32-bit time_t"
++#endif
+ }
+ #else
+ static void gettimeofday_ns(struct timespec *ts)
+-- 
+2.18.2
+
diff --git a/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
new file mode 100644
index 0000000000..9d95d683f3
--- /dev/null
+++ b/package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
@@ -0,0 +1,134 @@
+From 07375fc6fd5912f34a36a097dc679f6e0af23f8a Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 24 Oct 2019 16:26:55 +0200
+Subject: [PATCH] Remove syscall wrappers around clock_gettime, closes 12091
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
+(cherry picked from commit be5a505d771a77c640acc35ceaa470c80e62f954)
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ Makefile.flags   |  6 ++++--
+ coreutils/date.c | 16 +++-------------
+ libbb/time.c     | 11 +----------
+ runit/runsv.c    | 11 +----------
+ 4 files changed, 9 insertions(+), 35 deletions(-)
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
+index 1e0a675ca..e479c23a2 100644
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -33,10 +33,9 @@
+ //config:	Enable option (-I) to output an ISO-8601 compliant
+ //config:	date/time string.
+ //config:
+-//config:# defaults to "no": stat's nanosecond field is a bit non-portable
+ //config:config FEATURE_DATE_NANO
+ //config:	bool "Support %[num]N nanosecond format specifier"
+-//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
++//config:	default n # stat's nanosecond field is a bit non-portable
+ //config:	depends on DATE
+ //config:	select PLATFORM_LINUX
+ //config:	help
+@@ -271,17 +270,8 @@ int date_main(int argc UNUSED_PARAM, char **argv)
+ 		 */
+ #endif
+ 	} else {
+-#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
+-		/* libc has incredibly messy way of doing this,
+-		 * typically requiring -lrt. We just skip all this mess */
+-		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
+-#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
+-		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
+-		 * This simplifies the code for us as we don't need to convert
+-		 * between 64-bit and 32-bit. We also don't have a way to
+-		 * report overflow errors here.
+-		 */
+-		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
++#if ENABLE_FEATURE_DATE_NANO
++		clock_gettime(CLOCK_REALTIME, &ts);
+ #else
+ 		time(&ts.tv_sec);
+ #endif
+diff --git a/libbb/time.c b/libbb/time.c
+index 821f9a24b..1077bfa4f 100644
+--- a/libbb/time.c
++++ b/libbb/time.c
+@@ -253,18 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(char *buf, unsigned len, time_t *tp)
+ #define CLOCK_MONOTONIC 1
+ #endif
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void get_mono(struct timespec *ts)
+ {
+-#if defined(__NR_clock_gettime)
+-	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
+-#elif __TIMESIZE == 64
+-	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
+-#else
+-# error "We currently don't support architectures without " \
+-	"the __NR_clock_gettime syscall and 32-bit time_t"
+-#endif
++	if (clock_gettime(CLOCK_MONOTONIC, ts))
+ 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
+ }
+ unsigned long long FAST_FUNC monotonic_ns(void)
+diff --git a/runit/runsv.c b/runit/runsv.c
+index 737909b0e..36d85101e 100644
+--- a/runit/runsv.c
++++ b/runit/runsv.c
+@@ -51,18 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #if ENABLE_MONOTONIC_SYSCALL
+ #include <sys/syscall.h>
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
+-#if defined(__NR_clock_gettime)
+-	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
+-#elif __TIMESIZE == 64
+-	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
+-#else
+-# error "We currently don't support architectures without " \
+-	"the __NR_clock_gettime syscall and 32-bit time_t"
+-#endif
++	clock_gettime(CLOCK_REALTIME, ts);
+ }
+ #else
+ static void gettimeofday_ns(struct timespec *ts)
+-- 
+2.18.2
+
