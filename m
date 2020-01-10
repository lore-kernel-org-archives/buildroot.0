From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 10 Jan 2020 09:14:39 -0300
Subject: [Buildroot] [PATCH] package/libpam-tacplus: fix build for nios2
Message-ID: <20200110121439.16180-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Pull an upstream patch that prevents compilation errors due to an unused
return value.

Add patch not yet applied upstream to prevent another failure because of
the formatters used to print size_t and ssize_t values.

Upstream status: https://github.com/kravietz/pam_tacplus/pull/136

Fixes:
  http://autobuild.buildroot.net/results/cf15b09bd7501c017a4e8cf9fb80857197d4a433/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...s-and-change-order-of-PRNG-functions.patch | 126 ++++++++++++++++++
 ...-zu-as-ssize_t-and-size_t-formatters.patch |  48 +++++++
 2 files changed, 174 insertions(+)
 create mode 100644 package/libpam-tacplus/0003-Improve-tests-and-change-order-of-PRNG-functions.patch
 create mode 100644 package/libpam-tacplus/0004-Use-zd-and-zu-as-ssize_t-and-size_t-formatters.patch

diff --git a/package/libpam-tacplus/0003-Improve-tests-and-change-order-of-PRNG-functions.patch b/package/libpam-tacplus/0003-Improve-tests-and-change-order-of-PRNG-functions.patch
new file mode 100644
index 0000000000..5e4fb42d85
--- /dev/null
+++ b/package/libpam-tacplus/0003-Improve-tests-and-change-order-of-PRNG-functions.patch
@@ -0,0 +1,126 @@
+From d5ea51ff6a9b74bdc8a9ea7e6758d520f9b9a9fa Mon Sep 17 00:00:00 2001
+From: Pawel Krawczyk <pawel.krawczyk@hush.com>
+Date: Thu, 13 Dec 2018 11:43:45 +0000
+Subject: [PATCH] Improve tests and change order of PRNG functions
+
+Try to use getrandom, RAND_pseudo_bytes, RAND_bytes and legacy code
+in that order. The rationale is that getrandom comes built-in and
+RAND_pseudo_bytes is faster for non-crypto.
+---
+ libtac/lib/magic.c | 64 +++++++++++++++++++++++++++-------------------
+ 1 file changed, 37 insertions(+), 27 deletions(-)
+
+diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
+index 97aa035..7850276 100644
+--- a/libtac/lib/magic.c
++++ b/libtac/lib/magic.c
+@@ -25,6 +25,7 @@
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <errno.h>
+ 
+ #ifdef HAVE_CONFIG_H
+   #include "config.h"
+@@ -50,54 +51,63 @@
+ 	static void f(void)
+ #endif
+ 
+-/* if OpenSSL library is available this legacy code will not be compiled in */
+-#if defined(HAVE_OPENSSL_RAND_H) && defined(HAVE_LIBCRYPTO)
++#if defined(HAVE_GETRANDOM)
+ 
+-#include <openssl/rand.h>
++# if defined(HAVE_SYS_RANDOM_H)
++#  include <sys/random.h>
++# else
++#  error no header containing getrandom(2) declaration
++# endif
++
++/* getrandom(2) is the most convenient and secure options from our point of view so it's on the first order of preference */
+ 
+-/*
+- * magic - Returns the next magic number.
+- */
+ u_int32_t
+ magic()
+ {
+     u_int32_t num;
++    ssize_t ret;
+ 
+-#ifdef HAVE_RAND_BYTES
+-    RAND_bytes((unsigned char *)&num, sizeof(num));
+-#else
+-    RAND_pseudo_bytes((unsigned char *)&num, sizeof(num));
+-#endif
+-
++    ret = getrandom(&num, sizeof(num), GRND_NONBLOCK);
++    if(ret < 0) {
++    	TACSYSLOG(LOG_CRIT,"%s: getrandom failed to provide random bytes: %s", __FUNCTION__, strerror(errno));
++    	exit(1);
++    }
++    if(ret < (ssize_t) sizeof(num)) {
++    	TACSYSLOG(LOG_CRIT,"%s: getrandom less bytes than expected: %ld vs %lu", __FUNCTION__, ret, sizeof(num));
++    	exit(1);
++    }
+     return num;
+ }
+ 
+-#elif defined(HAVE_GETRANDOM)
++#elif defined(HAVE_OPENSSL_RAND_H) && defined(HAVE_LIBCRYPTO)
+ 
+-# if defined(HAVE_SYS_RANDOM_H)
+-#  include <sys/random.h>
+-# else
+-#  error no header containing getrandom(2) declaration
+-# endif
++#include <openssl/rand.h>
++
++/* RAND_bytes is OpenSSL's classic function to obtain cryptographic strength pseudo-random bytes
++   however, since the magic() function is used to generate TACACS+ session id rather than crypto keys
++   we can use RAND_pseudo_bytes() which doesn't deplete the system's entropy pool
++   */
+ 
+-/*
+- * magic - Returns the next magic number.
+- */
+ u_int32_t
+ magic()
+ {
+     u_int32_t num;
+ 
+-    getrandom(&num, sizeof(num), GRND_NONBLOCK);
++#ifdef HAVE_RAND_BYTES
++    RAND_bytes((unsigned char *)&num, sizeof(num));
++#elif HAVE_RAND_PSEUDO_BYTES
++    RAND_pseudo_bytes((unsigned char *)&num, sizeof(num));
++#else
++	#error Neither  RAND_bytes nor RAND_pseudo_bytes seems to be available
++#endif
+     return num;
+ }
+ 
+ #else
+ 
+-/*
+- * magic_init - Initialize the magic number generator.
+- *
+- * Attempts to compute a random number seed which will not repeat.
++/* Finally, if nothing else works, use the legacy function that will use random(3) seeded from /dev/urandom,
++ * or just use a weak PRNG initialisation using time. But since magic() is used for session identifier and not crypto
++ * keys generation it can be used as a last resort.
+  */
+ INITIALIZER(magic_init)
+ {
+@@ -114,7 +124,7 @@ INITIALIZER(magic_init)
+         }
+     }
+ 
+-    // fallback
++    // Fallback to ancient time-based PRNG seeding; if urandom worked, this doesn't "break" the entropy already collected
+     gettimeofday(&t, NULL);
+     seed ^= gethostid() ^ t.tv_sec ^ t.tv_usec ^ getpid();
+ 
+-- 
+2.18.2
+
diff --git a/package/libpam-tacplus/0004-Use-zd-and-zu-as-ssize_t-and-size_t-formatters.patch b/package/libpam-tacplus/0004-Use-zd-and-zu-as-ssize_t-and-size_t-formatters.patch
new file mode 100644
index 0000000000..64c036660d
--- /dev/null
+++ b/package/libpam-tacplus/0004-Use-zd-and-zu-as-ssize_t-and-size_t-formatters.patch
@@ -0,0 +1,48 @@
+From 1d44436ea8c65f128fed1cdf5f60c81fd667c1c2 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Fri, 10 Jan 2020 08:48:26 -0300
+Subject: [PATCH] Use '%zd' and '%zu' as ssize_t and size_t formatters
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error with GCC 8.3.0, for nios2:
+
+In file included from libtac/lib/magic.h:24,
+                 from libtac/lib/magic.c:35:
+libtac/lib/magic.c: In function ?magic?:
+libtac/lib/magic.c:77:25: error: format ?%ld? expects argument of type ?long int?, but argument 4 has type ?ssize_t? {aka ?int?} [-Werror=format=]
+      TACSYSLOG(LOG_CRIT,"%s: getrandom less bytes than expected: %ld vs %lu", __FUNCTION__, ret, sizeof(num));
+                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                ~~~
+./libtac/include/libtac.h:70:50: note: in definition of macro ?TACSYSLOG?
+ #define TACSYSLOG(level, fmt, ...) syslog(level, fmt, ## __VA_ARGS__)
+                                                  ^~~
+libtac/lib/magic.c:77:25: error: format ?%lu? expects argument of type ?long unsigned int?, but argument 5 has type ?unsigned int? [-Werror=format=]
+      TACSYSLOG(LOG_CRIT,"%s: getrandom less bytes than expected: %ld vs %lu", __FUNCTION__, ret, sizeof(num));
+                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                     ~~~~~~~~~~~
+./libtac/include/libtac.h:70:50: note: in definition of macro ?TACSYSLOG?
+ #define TACSYSLOG(level, fmt, ...) syslog(level, fmt, ## __VA_ARGS__)
+                                                  ^~~
+cc1: all warnings being treated as errors
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ libtac/lib/magic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
+index 7850276..9df5e3f 100644
+--- a/libtac/lib/magic.c
++++ b/libtac/lib/magic.c
+@@ -73,7 +73,7 @@ magic()
+     	exit(1);
+     }
+     if(ret < (ssize_t) sizeof(num)) {
+-    	TACSYSLOG(LOG_CRIT,"%s: getrandom less bytes than expected: %ld vs %lu", __FUNCTION__, ret, sizeof(num));
++    	TACSYSLOG(LOG_CRIT,"%s: getrandom less bytes than expected: %zd vs %zu", __FUNCTION__, ret, sizeof(num));
+     	exit(1);
+     }
+     return num;
+-- 
+2.18.2
+
-- 
2.18.2
