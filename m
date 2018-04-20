From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Apr 2018 07:17:20 +0300
Subject: [Buildroot] [PATCH] lz4: fix host build with glibc older than 2.17
Message-ID: <81c4c77f0304c32bd46c98bdd34da22c62c4c51e.1524197840.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc before 2.17 require the -lrt linker option for clock_gettime(). We
do not support pre 2.17 glibc for the target anymore, but there are
still host platforms with these versions. Add upstream patch to skip use
of clock_gettime() with older glibc versions.

Should fix:
http://autobuild.buildroot.net/results/bc5/bc5d6447ab16a61d9dcf56723106f0b107826ef4/
http://autobuild.buildroot.net/results/7dd/7dd47bef902845a0f7803f1a6c702ec154855858/
http://autobuild.buildroot.net/results/952/9523dbc767dc325befabeb9240c4009e78779c7d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...rictive-conditions-for-clock_gettime.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch

diff --git a/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch b/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch
new file mode 100644
index 000000000000..678f16abb776
--- /dev/null
+++ b/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch
@@ -0,0 +1,58 @@
+From 7dba09af47dd3daa1562a6332a643a1a59dba4a8 Mon Sep 17 00:00:00 2001
+From: Yann Collet <cyan@fb.com>
+Date: Tue, 16 Jan 2018 10:21:37 -0800
+Subject: [PATCH] use more restrictive conditions for clock_gettime()
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 7dba09af47dd3
+
+ programs/util.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/programs/util.h b/programs/util.h
+index fc7f63e8140e..a3576d7e3a57 100644
+--- a/programs/util.h
++++ b/programs/util.h
+@@ -141,6 +141,7 @@ extern "C" {
+ *  Time functions
+ ******************************************/
+ #if defined(_WIN32)   /* Windows */
++
+     typedef LARGE_INTEGER UTIL_time_t;
+     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { UTIL_time_t x; QueryPerformanceCounter(&x); return x; }
+     UTIL_STATIC U64 UTIL_getSpanTimeMicro(UTIL_time_t clockStart, UTIL_time_t clockEnd)
+@@ -165,7 +166,9 @@ extern "C" {
+         }
+         return 1000000000ULL*(clockEnd.QuadPart - clockStart.QuadPart)/ticksPerSecond.QuadPart;
+     }
++
+ #elif defined(__APPLE__) && defined(__MACH__)
++
+     #include <mach/mach_time.h>
+     typedef U64 UTIL_time_t;
+     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { return mach_absolute_time(); }
+@@ -189,7 +192,9 @@ extern "C" {
+         }
+         return ((clockEnd - clockStart) * (U64)rate.numer) / ((U64)rate.denom);
+     }
+-#elif (PLATFORM_POSIX_VERSION >= 200112L)
++
++#elif (PLATFORM_POSIX_VERSION >= 200112L) && (defined __UCLIBC__ || ((__GLIBC__ == 2 && __GLIBC_MINOR__ >= 17) || __GLIBC__ > 2))
++
+     #include <time.h>
+     typedef struct timespec UTIL_time_t;
+     UTIL_STATIC UTIL_time_t UTIL_getTime(void)
+@@ -227,7 +232,9 @@ extern "C" {
+         nano += diff.tv_nsec;
+         return nano;
+     }
++
+ #else   /* relies on standard C (note : clock_t measurements can be wrong when using multi-threading) */
++
+     typedef clock_t UTIL_time_t;
+     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { return clock(); }
+     UTIL_STATIC U64 UTIL_getSpanTimeMicro(UTIL_time_t clockStart, UTIL_time_t clockEnd) { return 1000000ULL * (clockEnd - clockStart) / CLOCKS_PER_SEC; }
+-- 
+2.17.0
+
-- 
2.17.0
