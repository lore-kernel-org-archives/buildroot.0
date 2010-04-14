From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Apr 2010 20:41:15 +0200
Subject: [Buildroot] [git commit master] busybox: 1.16.1 dnsd / hwclock fixes
Message-ID: <20100414194912.9F2A920A76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f018b77ff6bf413d29377bd4a59d491a24969da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.1-dnsd.patch    |   29 +++++
 package/busybox/busybox-1.16.1-hwclock.patch |  152 ++++++++++++++++++++++++++
 2 files changed, 181 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.1-dnsd.patch
 create mode 100644 package/busybox/busybox-1.16.1-hwclock.patch

diff --git a/package/busybox/busybox-1.16.1-dnsd.patch b/package/busybox/busybox-1.16.1-dnsd.patch
new file mode 100644
index 0000000..414ac33
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-dnsd.patch
@@ -0,0 +1,29 @@
+diff -urpN busybox-1.16.1/include/platform.h busybox-1.16.1-dnsd/include/platform.h
+--- busybox-1.16.1/include/platform.h	2010-03-28 10:43:35.000000000 -0700
++++ busybox-1.16.1-dnsd/include/platform.h	2010-04-14 10:06:10.888341149 -0700
+@@ -291,10 +291,12 @@ typedef unsigned smalluint;
+ #if 1 /* if needed: !defined(arch1) && !defined(arch2) */
+ # define ALIGN1 __attribute__((aligned(1)))
+ # define ALIGN2 __attribute__((aligned(2)))
++# define ALIGN4 __attribute__((aligned(4)))
+ #else
+ /* Arches which MUST have 2 or 4 byte alignment for everything are here */
+ # define ALIGN1
+ # define ALIGN2
++# define ALIGN4
+ #endif
+ 
+ 
+diff -urpN busybox-1.16.1/networking/dnsd.c busybox-1.16.1-dnsd/networking/dnsd.c
+--- busybox-1.16.1/networking/dnsd.c	2010-03-28 10:43:36.000000000 -0700
++++ busybox-1.16.1-dnsd/networking/dnsd.c	2010-04-14 10:06:10.922348571 -0700
+@@ -459,7 +459,8 @@ int dnsd_main(int argc UNUSED_PARAM, cha
+ 	unsigned lsa_size;
+ 	int udps, opts;
+ 	uint16_t port = 53;
+-	uint8_t buf[MAX_PACK_LEN + 1];
++	/* Ensure buf is 32bit aligned (we need 16bit, but 32bit can't hurt) */
++	uint8_t buf[MAX_PACK_LEN + 1] ALIGN4;
+ 
+ 	opts = getopt32(argv, "vi:c:t:p:d", &listen_interface, &fileconf, &sttl, &sport);
+ 	//if (opts & 0x1) // -v
diff --git a/package/busybox/busybox-1.16.1-hwclock.patch b/package/busybox/busybox-1.16.1-hwclock.patch
new file mode 100644
index 0000000..63350ae
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-hwclock.patch
@@ -0,0 +1,152 @@
+diff -urpN busybox-1.16.1/util-linux/hwclock.c busybox-1.16.1-hwclock/util-linux/hwclock.c
+--- busybox-1.16.1/util-linux/hwclock.c	2010-03-19 19:58:07.000000000 -0700
++++ busybox-1.16.1-hwclock/util-linux/hwclock.c	2010-04-14 09:29:37.889208237 -0700
+@@ -109,10 +109,53 @@ static void to_sys_clock(const char **pp
+ 
+ static void from_sys_clock(const char **pp_rtcname, int utc)
+ {
+-#define TWEAK_USEC 200
+-	struct tm tm_time;
++#if 1
+ 	struct timeval tv;
++	struct tm tm_time;
++	int rtc;
++
++	rtc = rtc_xopen(pp_rtcname, O_WRONLY);
++	gettimeofday(&tv, NULL);
++	/* Prepare tm_time */
++	if (sizeof(time_t) == sizeof(tv.tv_sec)) {
++		if (utc)
++			gmtime_r((time_t*)&tv.tv_sec, &tm_time);
++		else
++			localtime_r((time_t*)&tv.tv_sec, &tm_time);
++	} else {
++		time_t t = tv.tv_sec;
++		if (utc)
++			gmtime_r(&t, &tm_time);
++		else
++			localtime_r(&t, &tm_time);
++	}
++#else
++/* Bloated code which tries to set hw clock with better precision.
++ * On x86, even though code does set hw clock within <1ms of exact
++ * whole seconds, apparently hw clock (at least on some machines)
++ * doesn't reset internal fractional seconds to 0,
++ * making all this a pointless excercise.
++ */
++	/* If we see that we are N usec away from whole second,
++	 * we'll sleep for N-ADJ usecs. ADJ corrects for the fact
++	 * that CPU is not infinitely fast.
++	 * On infinitely fast CPU, next wakeup would be
++	 * on (exactly_next_whole_second - ADJ). On real CPUs,
++	 * this difference between current time and whole second
++	 * is less than ADJ (assuming system isn't heavily loaded).
++	 */
++	/* Small value of 256us gives very precise sync for 2+ GHz CPUs.
++	 * Slower CPUs will fail to sync and will go to bigger
++	 * ADJ values. qemu-emulated armv4tl with ~100 MHz
++	 * performance ends up using ADJ ~= 4*1024 and it takes
++	 * 2+ secs (2 tries with successively larger ADJ)
++	 * to sync. Even straced one on the same qemu (very slow)
++	 * takes only 4 tries.
++	 */
++#define TWEAK_USEC 256
+ 	unsigned adj = TWEAK_USEC;
++	struct tm tm_time;
++	struct timeval tv;
+ 	int rtc = rtc_xopen(pp_rtcname, O_WRONLY);
+ 
+ 	/* Try to catch the moment when whole second is close */
+@@ -124,55 +167,64 @@ static void from_sys_clock(const char **
+ 
+ 		t = tv.tv_sec;
+ 		rem_usec = 1000000 - tv.tv_usec;
+-		if (rem_usec < 1024) {
+-			/* Less than 1ms to next second. Good enough */
++		if (rem_usec < adj) {
++			/* Close enough */
+  small_rem:
+ 			t++;
+ 		}
+ 
+-		/* Prepare tm */
++		/* Prepare tm_time from t */
+ 		if (utc)
+ 			gmtime_r(&t, &tm_time); /* may read /etc/xxx (it takes time) */
+ 		else
+ 			localtime_r(&t, &tm_time); /* same */
+-		tm_time.tm_isdst = 0;
++
++		if (adj >= 32*1024) {
++			break; /* 32 ms diff and still no luck?? give up trying to sync */
++		}
+ 
+ 		/* gmtime/localtime took some time, re-get cur time */
+ 		gettimeofday(&tv, NULL);
+ 
+-		if (tv.tv_sec < t /* may happen if rem_usec was < 1024 */
+-		 || (tv.tv_sec == t && tv.tv_usec < 1024)
++		if (tv.tv_sec < t /* we are still in old second */
++		 || (tv.tv_sec == t && tv.tv_usec < adj) /* not too far into next second */
+ 		) {
+-			/* We are not too far into next second. Good. */
+-			break;
+-		}
+-		adj += 32; /* 2^(10-5) = 2^5 = 32 iterations max */
+-		if (adj >= 1024) {
+-			/* Give up trying to sync */
+-			break;
++			break; /* good, we are in sync! */
+ 		}
+ 
+-		/* Try to sync up by sleeping */
+ 		rem_usec = 1000000 - tv.tv_usec;
+-		if (rem_usec < 1024) {
+-			goto small_rem; /* already close, don't sleep */
++		if (rem_usec < adj) {
++			t = tv.tv_sec;
++			goto small_rem; /* already close to next sec, don't sleep */
+ 		}
+-		/* Need to sleep.
+-		 * Note that small adj on slow processors can make us
+-		 * to always overshoot tv.tv_usec < 1024 check on next
+-		 * iteration. That's why adj is increased on each iteration.
+-		 * This also allows it to be reused as a loop limiter.
+-		 */
+-		usleep(rem_usec - adj);
+-	}
+ 
+-	xioctl(rtc, RTC_SET_TIME, &tm_time);
++		/* Try to sync up by sleeping */
++		usleep(rem_usec - adj);
+ 
+-	/* Debug aid to find "good" TWEAK_USEC.
++		/* Jump to 1ms diff, then increase fast (x2): EVERY loop
++		 * takes ~1 sec, people won't like slowly converging code here!
++		 */
++	//bb_error_msg("adj:%d tv.tv_usec:%d", adj, (int)tv.tv_usec);
++		if (adj < 512)
++			adj = 512;
++		/* ... and if last "overshoot" does not look insanely big,
++		 * just use it as adj increment. This makes convergence faster.
++		 */
++		if (tv.tv_usec < adj * 8) {
++			adj += tv.tv_usec;
++			continue;
++		}
++		adj *= 2;
++	}
++	/* Debug aid to find "optimal" TWEAK_USEC with nearly exact sync.
+ 	 * Look for a value which makes tv_usec close to 999999 or 0.
+-	 * for 2.20GHz Intel Core 2: TWEAK_USEC ~= 200
++	 * For 2.20GHz Intel Core 2: optimal TWEAK_USEC ~= 200
+ 	 */
+-	//bb_error_msg("tv.tv_usec:%d adj:%d", (int)tv.tv_usec, adj);
++	//bb_error_msg("tv.tv_usec:%d", (int)tv.tv_usec);
++#endif
++
++	tm_time.tm_isdst = 0;
++	xioctl(rtc, RTC_SET_TIME, &tm_time);
+ 
+ 	if (ENABLE_FEATURE_CLEAN_UP)
+ 		close(rtc);
-- 
1.6.3.3
