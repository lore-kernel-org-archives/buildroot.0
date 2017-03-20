From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 20 Mar 2017 21:11:22 +0100
Subject: [Buildroot] [PATCH] skalibs: fix endianness detection on x86
Message-ID: <20170320201122.26539-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the patch for compile time endianness detection so it works on
x86 platforms using GCC <= 4.4.

Fixes:

  http://autobuild.buildroot.net/results/c2e8e1180571976b412cbba729c45a3698aea0b2
  http://autobuild.buildroot.net/results/2ee47107d8a67470f7bc3e10cf763202d5455d17

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 .../skalibs/0001-No-runtime-tests-for-endianness.patch  | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
index 4390d44..5f763c4 100644
--- a/package/skalibs/0001-No-runtime-tests-for-endianness.patch
+++ b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
@@ -1,6 +1,6 @@
-From 1e6f0b094c6ce6454be572704b866d2ce0962e59 Mon Sep 17 00:00:00 2001
+From 6754b208e7ec3bd1d4265db18fa4c0e7961a77bf Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Sun, 4 Dec 2016 19:10:40 +0100
+Date: Mon, 20 Mar 2017 20:05:00 +0100
 Subject: [PATCH] No runtime tests for endianness
 
 Replace build and execution of runtime test programs for determining
@@ -12,8 +12,8 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
  configure                     | 15 +++++++++++----
  src/sysdeps/trybigendian.c    | 16 ++++++++++++++++
- src/sysdeps/trylittleendian.c | 16 ++++++++++++++++
- 3 files changed, 43 insertions(+), 4 deletions(-)
+ src/sysdeps/trylittleendian.c | 19 +++++++++++++++++++
+ 3 files changed, 46 insertions(+), 4 deletions(-)
  create mode 100644 src/sysdeps/trybigendian.c
  create mode 100644 src/sysdeps/trylittleendian.c
 
@@ -70,16 +70,19 @@ index 0000000..d857572
 +}
 diff --git a/src/sysdeps/trylittleendian.c b/src/sysdeps/trylittleendian.c
 new file mode 100644
-index 0000000..eba065a
+index 0000000..68b93c1
 --- /dev/null
 +++ b/src/sysdeps/trylittleendian.c
-@@ -0,0 +1,16 @@
+@@ -0,0 +1,19 @@
 +#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __LITTLE_ENDIAN) ||	\
 +	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_LITTLE_ENDIAN__) || \
 +	defined(__LITTLE_ENDIAN) ||					\
 +	defined(__ARMEL__) ||						\
 +	defined(__THUMBEL__) ||					\
 +	defined(__AARCH64EL__) ||					\
++	defined(__i386) || defined(__i386__) ||			\
++	defined(__amd64) || defined(__amd64__) ||			\
++	defined(__x86_64) || defined(__x86_64__) ||			\
 +	defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
 +#define YEAH
 +#else
@@ -91,5 +94,5 @@ index 0000000..eba065a
 +	return 0;
 +}
 -- 
-2.5.5
+2.1.4
 
-- 
2.9.3
