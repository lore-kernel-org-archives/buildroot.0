From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 Aug 2017 22:01:34 -0500
Subject: [Buildroot] [PATCH] util-linux: Revert genrandom(2) logic
Message-ID: <1502506894-64344-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New logic was added at configure time and new conditional code
in lib/randutils.c between versions 2.29.2 and >= 2.30.  The logic
determines if the glibc or syscall API should be used for
rand calls.  This has been observed causing issues in a
configuration of a 4.1 kernel and glibc2.25.  A tool like
parted when used at boot hangs for ~40x the time and when
debugged with gdb shows blocking on genrandom, even though
a entropy check from a hardware rng used by rngd is adequate
before the parted tool is used.

Bug tracker:
https://github.com/karelzak/util-linux/issues/496

Upstream reverted commits
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=b192dd6943e5bb5d2a3773b2c9b06cbd4eb28258
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=cc01c2dca4f62e36505570d5cb15f868aa44bf54

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--

I haven't completely root caused this issue but figured I'd
get it out there while we investigate further.  It was
disected down to these changes but further investigation
is limited on my project and we're going to carry this workaround.

Debug notes:
We did notice that if we straced the parted tool and let all that
output hit console it didn't block and take the complete 40sec to
return.  So our theory was that entropy was created via the uart
output.  We also noticed similar if we enabled networking that
the tool would return much faster.  So we wondered if these commits
are actually using a API that doesn't leverage a hardware rng
output as ours was setup with a value of ~3000 when we checked
the entropy quality.  Any thoughts on comparable packages which
would use a similar approach to using this new API?

---
 ...randutils-glibc-2.25-has-getrandom-2-decl.patch |  31 ++++
 ...randutils-use-getrandom-2-when-it-is-avai.patch | 169 +++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 package/util-linux/0002-Revert-lib-randutils-glibc-2.25-has-getrandom-2-decl.patch
 create mode 100644 package/util-linux/0003-Revert-lib-randutils-use-getrandom-2-when-it-is-avai.patch

diff --git a/package/util-linux/0002-Revert-lib-randutils-glibc-2.25-has-getrandom-2-decl.patch b/package/util-linux/0002-Revert-lib-randutils-glibc-2.25-has-getrandom-2-decl.patch
new file mode 100644
index 0000000..eb96d60
--- /dev/null
+++ b/package/util-linux/0002-Revert-lib-randutils-glibc-2.25-has-getrandom-2-decl.patch
@@ -0,0 +1,31 @@
+From 8278bc37aa497ec60af05cf2baf2e0050125a0aa Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Fri, 11 Aug 2017 19:43:46 -0500
+Subject: [PATCH] Revert "lib/randutils: glibc 2.25 has getrandom(2)
+ declaration"
+
+This reverts commit b192dd6943e5bb5d2a3773b2c9b06cbd4eb28258.
+
+Upstream:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=b192dd6943e5bb5d2a3773b2c9b06cbd4eb28258
+
+---
+ lib/randutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/randutils.c b/lib/randutils.c
+index 09dd261..fdce868 100644
+--- a/lib/randutils.c
++++ b/lib/randutils.c
+@@ -26,7 +26,7 @@
+ #endif
+ 
+ #ifdef HAVE_GETRANDOM
+-# include <sys/random.h>
++# include <linux/random.h>
+ #elif defined (__linux__)
+ # if !defined(SYS_getrandom) && defined(__NR_getrandom)
+    /* usable kernel-headers, but old glibc-headers */
+-- 
+1.9.1
+
diff --git a/package/util-linux/0003-Revert-lib-randutils-use-getrandom-2-when-it-is-avai.patch b/package/util-linux/0003-Revert-lib-randutils-use-getrandom-2-when-it-is-avai.patch
new file mode 100644
index 0000000..764b0eb
--- /dev/null
+++ b/package/util-linux/0003-Revert-lib-randutils-use-getrandom-2-when-it-is-avai.patch
@@ -0,0 +1,169 @@
+From 6018bf2aadfa6e9222b8164f73f561a3952d2130 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Fri, 11 Aug 2017 20:05:10 -0500
+Subject: [PATCH] Revert "lib/randutils: use getrandom(2) when it is
+ available"
+
+This reverts commit cc01c2dca4f62e36505570d5cb15f868aa44bf54.
+
+Conflicts:
+	lib/randutils.c
+
+Upstream:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=cc01c2dca4f62e36505570d5cb15f868aa44bf54
+
+---
+ configure.ac    |  1 -
+ lib/randutils.c | 70 ++++++++++++++-------------------------------------------
+ 2 files changed, 17 insertions(+), 54 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 35b0a30..e440b6a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -396,7 +396,6 @@ AC_CHECK_FUNCS([ \
+ 	getdtablesize \
+ 	getexecname \
+ 	getmntinfo \
+-	getrandom \
+ 	getrlimit \
+ 	getsgnam \
+ 	inotify_init \
+diff --git a/lib/randutils.c b/lib/randutils.c
+index fdce868..e8f67be 100644
+--- a/lib/randutils.c
++++ b/lib/randutils.c
+@@ -25,24 +25,6 @@
+ #define THREAD_LOCAL static
+ #endif
+ 
+-#ifdef HAVE_GETRANDOM
+-# include <linux/random.h>
+-#elif defined (__linux__)
+-# if !defined(SYS_getrandom) && defined(__NR_getrandom)
+-   /* usable kernel-headers, but old glibc-headers */
+-#  define SYS_getrandom __NR_getrandom
+-# endif
+-#endif
+-
+-#if !defined(HAVE_GETRANDOM) && defined(SYS_getrandom)
+-/* libc without function, but we have syscal */
+-static int getrandom(void *buf, size_t buflen, unsigned int flags)
+-{
+-	return (syscall(SYS_getrandom, buf, buflen, flags));
+-}
+-# define HAVE_GETRANDOM
+-#endif
+-
+ #if defined(__linux__) && defined(__NR_gettid) && defined(HAVE_JRAND48)
+ #define DO_JRAND_MIX
+ THREAD_LOCAL unsigned short ul_jrand_seed[3];
+@@ -53,12 +35,21 @@ int rand_get_number(int low_n, int high_n)
+ 	return rand() % (high_n - low_n + 1) + low_n;
+ }
+ 
+-static void crank_random(void)
++int random_get_fd(void)
+ {
+-	int i;
++	int i, fd;
+ 	struct timeval tv;
+ 
+-	gettimeofday(&tv, NULL);
++	fd = open("/dev/urandom", O_RDONLY | O_CLOEXEC);
++	if (fd == -1)
++		fd = open("/dev/random", O_RDONLY | O_NONBLOCK | O_CLOEXEC);
++	if (fd >= 0) {
++		i = fcntl(fd, F_GETFD);
++		if (i >= 0)
++			fcntl(fd, F_SETFD, i | FD_CLOEXEC);
++	}
++
++	gettimeofday(&tv, 0);
+ 	srand((getpid() << 16) ^ getuid() ^ tv.tv_sec ^ tv.tv_usec);
+ 
+ #ifdef DO_JRAND_MIX
+@@ -70,24 +61,10 @@ static void crank_random(void)
+ 	gettimeofday(&tv, NULL);
+ 	for (i = (tv.tv_sec ^ tv.tv_usec) & 0x1F; i > 0; i--)
+ 		rand();
+-}
+-
+-int random_get_fd(void)
+-{
+-	int i, fd;
+-
+-	fd = open("/dev/urandom", O_RDONLY | O_CLOEXEC);
+-	if (fd == -1)
+-		fd = open("/dev/random", O_RDONLY | O_NONBLOCK | O_CLOEXEC);
+-	if (fd >= 0) {
+-		i = fcntl(fd, F_GETFD);
+-		if (i >= 0)
+-			fcntl(fd, F_SETFD, i | FD_CLOEXEC);
+-	}
+-	crank_random();
+ 	return fd;
+ }
+ 
++
+ /*
+  * Generate a stream of random nbytes into buf.
+  * Use /dev/urandom if possible, and if not,
+@@ -95,19 +72,10 @@ int random_get_fd(void)
+  */
+ void random_get_bytes(void *buf, size_t nbytes)
+ {
+-	size_t i;
+-	unsigned char *cp = (unsigned char *)buf;
+-
+-#ifdef HAVE_GETRANDOM
+-	while (getrandom(buf, nbytes, 0) < 0) {
+-		if (errno == EINTR)
+-			continue;
+-		break;
+-	}
+-#else
+-	size_t n = nbytes;
++	size_t i, n = nbytes;
+ 	int fd = random_get_fd();
+ 	int lose_counter = 0;
++	unsigned char *cp = (unsigned char *) buf;
+ 
+ 	if (fd >= 0) {
+ 		while (n > 0) {
+@@ -124,12 +92,11 @@ void random_get_bytes(void *buf, size_t nbytes)
+ 
+ 		close(fd);
+ 	}
+-#endif
++
+ 	/*
+ 	 * We do this all the time, but this is the only source of
+ 	 * randomness if /dev/random/urandom is out to lunch.
+ 	 */
+-	crank_random();
+ 	for (cp = buf, i = 0; i < nbytes; i++)
+ 		*cp++ ^= (rand() >> 7) & 0xFF;
+ 
+@@ -155,9 +122,6 @@ void random_get_bytes(void *buf, size_t nbytes)
+  */
+ const char *random_tell_source(void)
+ {
+-#ifdef HAVE_GETRANDOM
+-	return _("getrandom() function");
+-#else
+ 	size_t i;
+ 	static const char *random_sources[] = {
+ 		"/dev/urandom",
+@@ -168,7 +132,7 @@ const char *random_tell_source(void)
+ 		if (!access(random_sources[i], R_OK))
+ 			return random_sources[i];
+ 	}
+-#endif
++
+ 	return _("libc pseudo-random functions");
+ }
+ 
+-- 
+1.9.1
+
-- 
1.9.1
