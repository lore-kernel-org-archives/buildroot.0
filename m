From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 09:48:18 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] util-linux: add two
 upstream patches to fix blocking on getrandom() with recent kernels
Message-ID: <20180528074724.D400282A4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4d86707cd67817496fa7a904b73b2538ad4058c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As part of the fix for CVE-2018-1108 (kernel drivers before version 4.17-rc1
are vulnerable to a weakness in the Linux kernel's implementation of random
seed data.  Programs, early in the boot sequence, could use the data
allocated for the seed before it was sufficiently generated), the kernel
random number generator initialization routine was changed.  See the
project-zero writeup for more details:

https://bugs.chromium.org/p/project-zero/issues/detail?id=1559

These changes have now also been backported to 4.14.x (since 4.14.39) and
4.16.x (since 4.16.7).

This change unfortunately causes users of libuuid from util-linux to block
for a very long time waiting for sufficient entropy.  An example of this is
mke2fs, which uses libuuid to generate the filesystem UUID.

Fix this by backporting two post-2.31 fixes from upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2-lib-randutils-Do-not-block-on-getrandom.patch | 52 ++++++++++++++++
 ...andutils-don-t-break-on-EAGAIN-use-usleep.patch | 71 ++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/package/util-linux/0002-lib-randutils-Do-not-block-on-getrandom.patch b/package/util-linux/0002-lib-randutils-Do-not-block-on-getrandom.patch
new file mode 100644
index 0000000000..79fa577c4e
--- /dev/null
+++ b/package/util-linux/0002-lib-randutils-Do-not-block-on-getrandom.patch
@@ -0,0 +1,52 @@
+From a9cf659e0508c1f56813a7d74c64f67bbc962538 Mon Sep 17 00:00:00 2001
+From: Carlo Caione <carlo@endlessm.com>
+Date: Mon, 19 Mar 2018 10:31:07 +0000
+Subject: [PATCH] lib/randutils: Do not block on getrandom()
+
+In Endless we have hit a problem when using 'sfdisk' on the really first
+boot to automatically expand the rootfs partition. On this platform
+'sfdisk' is blocking on getrandom() because not enough random bytes are
+available. This is an ARM platform without a hwrng.
+
+We fix this passing GRND_NONBLOCK to getrandom(). 'sfdisk' will use the
+best entropy it has available and fallback only as necessary.
+
+Signed-off-by: Carlo Caione <carlo@endlessm.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/randutils.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/randutils.c b/lib/randutils.c
+index e1c4059e1..02c3d9eb0 100644
+--- a/lib/randutils.c
++++ b/lib/randutils.c
+@@ -36,6 +36,8 @@
+ 
+ #if !defined(HAVE_GETRANDOM) && defined(SYS_getrandom)
+ /* libc without function, but we have syscal */
++#define GRND_NONBLOCK 0x01
++#define GRND_RANDOM 0x02
+ static int getrandom(void *buf, size_t buflen, unsigned int flags)
+ {
+ 	return (syscall(SYS_getrandom, buf, buflen, flags));
+@@ -104,13 +106,15 @@ void random_get_bytes(void *buf, size_t nbytes)
+ 		int x;
+ 
+ 		errno = 0;
+-		x = getrandom(cp, n, 0);
++		x = getrandom(cp, n, GRND_NONBLOCK);
+ 		if (x > 0) {			/* success */
+ 		       n -= x;
+ 		       cp += x;
+ 		       lose_counter = 0;
+ 		} else if (errno == ENOSYS)	/* kernel without getrandom() */
+ 			break;
++		else if (errno == EAGAIN)
++			break;
+ 		else if (lose_counter++ > 16)	/* entropy problem? */
+ 			break;
+ 	}
+-- 
+2.11.0
+
diff --git a/package/util-linux/0003-lib-randutils-don-t-break-on-EAGAIN-use-usleep.patch b/package/util-linux/0003-lib-randutils-don-t-break-on-EAGAIN-use-usleep.patch
new file mode 100644
index 0000000000..a48f12fcee
--- /dev/null
+++ b/package/util-linux/0003-lib-randutils-don-t-break-on-EAGAIN-use-usleep.patch
@@ -0,0 +1,71 @@
+From edc1c90cb972fdca1f66be5a8e2b0706bd2a4949 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 20 Mar 2018 14:17:24 +0100
+Subject: [PATCH] lib/randutils: don't break on EAGAIN, use usleep()
+
+The current code uses lose_counter to make more attempts to read
+random numbers. It seems better to wait a moment between attempts to
+avoid busy loop (we do the same in all-io.h).
+
+The worst case is 1 second delay for all random_get_bytes() on systems
+with uninitialized entropy pool -- for example you call sfdisk (MBR Id
+or GPT UUIDs) on very first boot, etc. In this case it will use libc
+rand() as a fallback solution.
+
+Note that we do not use random numbers for security sensitive things
+like keys or so. It's used for random based UUIDs etc.
+
+Addresses: https://github.com/karelzak/util-linux/pull/603
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/randutils.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/lib/randutils.c b/lib/randutils.c
+index 02c3d9eb0..de4279530 100644
+--- a/lib/randutils.c
++++ b/lib/randutils.c
+@@ -95,6 +95,9 @@ int random_get_fd(void)
+  * Use /dev/urandom if possible, and if not,
+  * use glibc pseudo-random functions.
+  */
++#define UL_RAND_READ_ATTEMPTS	8
++#define UL_RAND_READ_DELAY	125000	/* microseconds */
++
+ void random_get_bytes(void *buf, size_t nbytes)
+ {
+ 	unsigned char *cp = (unsigned char *)buf;
+@@ -111,11 +114,14 @@ void random_get_bytes(void *buf, size_t nbytes)
+ 		       n -= x;
+ 		       cp += x;
+ 		       lose_counter = 0;
+-		} else if (errno == ENOSYS)	/* kernel without getrandom() */
+-			break;
+-		else if (errno == EAGAIN)
++
++		} else if (errno == ENOSYS) {	/* kernel without getrandom() */
+ 			break;
+-		else if (lose_counter++ > 16)	/* entropy problem? */
++
++		} else if (errno == EAGAIN && lose_counter < UL_RAND_READ_ATTEMPTS) {
++			xusleep(UL_RAND_READ_DELAY);	/* no etropy, wait and try again */
++			lose_counter++;
++		} else
+ 			break;
+ 	}
+ 
+@@ -134,8 +140,9 @@ void random_get_bytes(void *buf, size_t nbytes)
+ 			while (n > 0) {
+ 				ssize_t x = read(fd, cp, n);
+ 				if (x <= 0) {
+-					if (lose_counter++ > 16)
++					if (lose_counter++ > UL_RAND_READ_ATTEMPTS)
+ 						break;
++					xusleep(UL_RAND_READ_DELAY);
+ 					continue;
+ 				}
+ 				n -= x;
+-- 
+2.11.0
+
