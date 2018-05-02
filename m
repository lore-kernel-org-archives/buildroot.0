From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 22:04:57 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: bump to version 1.1.0
Message-ID: <20180502200457.25434-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Add patch for getrandom (sent upstream:
  https://github.com/smuellerDD/libkcapi/pull/56)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-getrandom-call-in-kcapi-rng.c.patch   |  31 +++++
 ...1-Have-sufficient-memory-size-for-message.patch |  31 -----
 .../0002-Do-not-compile-unused-functions.patch     |  35 ------
 ...0003-Unify-code-to-read-from-seed-sources.patch | 132 ---------------------
 ...4-internal.h-make-inline-functions-static.patch | 103 ----------------
 package/libkcapi/libkcapi.hash                     |   5 +-
 package/libkcapi/libkcapi.mk                       |   2 +-
 7 files changed, 36 insertions(+), 303 deletions(-)
 create mode 100644 package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
 delete mode 100644 package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
 delete mode 100644 package/libkcapi/0002-Do-not-compile-unused-functions.patch
 delete mode 100644 package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
 delete mode 100644 package/libkcapi/0004-internal.h-make-inline-functions-static.patch

diff --git a/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch b/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
new file mode 100644
index 0000000000..d83edd9261
--- /dev/null
+++ b/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
@@ -0,0 +1,31 @@
+From 581717cfb0e35c041246da0c0c591a6e9f7a40e5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 May 2018 21:03:45 +0200
+Subject: [PATCH] Fix getrandom call in kcapi-rng.c
+
+_GNU_SOURCE must be defined and unistd.h must be included to be able to
+use getrandom
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+[Upstream status: https://github.com/smuellerDD/libkcapi/pull/56]
+---
+ lib/kcapi-rng.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/kcapi-rng.c b/lib/kcapi-rng.c
+index 45f4d18..9ceabd4 100644
+--- a/lib/kcapi-rng.c
++++ b/lib/kcapi-rng.c
+@@ -18,6 +18,8 @@
+  * DAMAGE.
+  */
+ 
++#define _GNU_SOURCE
++#include <unistd.h>
+ #include <linux/random.h>
+ #ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
+-- 
+2.14.1
+
diff --git a/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch b/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
deleted file mode 100644
index 39e683f58a..0000000000
--- a/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b56deda7c13c257050fdbdd71c1a5a47b78aa63e Mon Sep 17 00:00:00 2001
-From: Stephan Mueller <smueller@chronox.de>
-Date: Thu, 3 Aug 2017 17:50:51 +0200
-Subject: [PATCH] Have sufficient memory size for message
-
-With GCC 7, the size of the buffer in snprintf is checked. The
-occurrence here is found to be too small.
-
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/b56deda7c13c257050fdbdd71c1a5a47b78aa63e]
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
----
- speed-test/cryptoperf-base.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/speed-test/cryptoperf-base.c b/speed-test/cryptoperf-base.c
-index 8766ca7..07384ae 100644
---- a/speed-test/cryptoperf-base.c
-+++ b/speed-test/cryptoperf-base.c
-@@ -172,7 +172,7 @@ char *cp_print_status(struct cp_test *test, int raw)
- 			(unsigned long)(processed_bytes/totaltime),
- 			(unsigned long)ops);
- 	} else {
--		#define VALLEN 10
-+		#define VALLEN 23
- 		char byteseconds[VALLEN + 1];
- 
- 		memset(byteseconds, 0, sizeof(byteseconds));
--- 
-2.7.4
-
diff --git a/package/libkcapi/0002-Do-not-compile-unused-functions.patch b/package/libkcapi/0002-Do-not-compile-unused-functions.patch
deleted file mode 100644
index 97ab7fc50b..0000000000
--- a/package/libkcapi/0002-Do-not-compile-unused-functions.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 217b154a5f65d46064ceb69ce69664105e703a74 Mon Sep 17 00:00:00 2001
-From: Stephan Mueller <smueller@chronox.de>
-Date: Thu, 3 Aug 2017 17:52:48 +0200
-Subject: [PATCH] Do not compile unused functions
-
-GCC 7 now rightfully complains about unused functions.
-
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-
-[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/217b154a5f65d46064ceb69ce69664105e703a74]
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
----
- apps/kcapi-rng.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/apps/kcapi-rng.c b/apps/kcapi-rng.c
-index df7decf..e15edf9 100644
---- a/apps/kcapi-rng.c
-+++ b/apps/kcapi-rng.c
-@@ -45,6 +45,7 @@ struct kcapi_handle *rng = NULL;
- unsigned int Verbosity = 0;
- char *rng_name = NULL;
- 
-+#ifndef HAVE_GETRANDOM
- static int read_complete(int fd, uint8_t *buf, uint32_t buflen)
- {
- 	ssize_t ret;
-@@ -76,6 +77,7 @@ static int read_random(uint8_t *buf, uint32_t buflen)
- 	close(fd);
- 	return ret;
- }
-+#endif
- 
- static int get_random(uint8_t *buf, uint32_t buflen)
- {
diff --git a/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch b/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
deleted file mode 100644
index b636ffe908..0000000000
--- a/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 450dfb09ee72ffedea8f2a25fdce17295f01f62f Mon Sep 17 00:00:00 2001
-From: Stephan Mueller <smueller@chronox.de>
-Date: Tue, 8 Aug 2017 10:04:06 +0200
-Subject: [PATCH] Unify code to read from seed sources
-
-Remove the code duplication for FD reads and syscall reads.
-
-This patch also fixes the use of __NR_getrandom resolution.
-
-[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/450dfb09ee72ffedea8f2a25fdce17295f01f62f]
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
-
----
- apps/kcapi-rng.c | 71 +++++++++++++++++++++++++-------------------------------
- 1 file changed, 32 insertions(+), 39 deletions(-)
-
-diff --git a/apps/kcapi-rng.c b/apps/kcapi-rng.c
-index e15edf9..96da111 100644
---- a/apps/kcapi-rng.c
-+++ b/apps/kcapi-rng.c
-@@ -17,7 +17,9 @@
-  * DAMAGE.
-  */
- 
-+#define _GNU_SOURCE
- #include <unistd.h>
-+#include <sys/syscall.h>
- #include <errno.h>
- #include <limits.h>
- #include <stdint.h>
-@@ -41,56 +43,48 @@
- /* Minimum seed is 256 bits. */
- #define KCAPI_RNG_MINSEEDSIZE 32
- 
--struct kcapi_handle *rng = NULL;
--unsigned int Verbosity = 0;
--char *rng_name = NULL;
-+static struct kcapi_handle *rng = NULL;
-+static unsigned int Verbosity = 0;
-+static char *rng_name = NULL;
- 
--#ifndef HAVE_GETRANDOM
--static int read_complete(int fd, uint8_t *buf, uint32_t buflen)
-+#if !defined(HAVE_GETRANDOM) && !defined(__NR_getrandom)
-+static int random_fd = -1;
-+static int open_random(void)
- {
--	ssize_t ret;
-+	random_fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC);
-+	if (0 > random_fd)
-+		return random_fd;
- 
--	do {
--		ret = read(fd, buf, buflen);
--		if (0 < ret) {
--			buflen -= ret;
--			buf += ret;
--		}
--	} while ((0 < ret || EINTR == errno || ERESTART == errno)
--		 && buflen > 0);
--
--	if (buflen == 0)
--		return 0;
--	return 1;
-+	return 0;
- }
- 
--static int read_random(uint8_t *buf, uint32_t buflen)
-+static void close_random(void)
- {
--	int fd;
--	int ret = 0;
--
--	fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC);
--	if (0 > fd)
--		return fd;
--
--	ret = read_complete(fd, buf, buflen);
--	close(fd);
--	return ret;
-+	close(random_fd);
- }
- #endif
- 
- static int get_random(uint8_t *buf, uint32_t buflen)
- {
-+	ssize_t ret;
-+
- 	if (buflen > INT_MAX)
- 		return 1;
- 
-+#if (!defined(HAVE_GETRANDOM) && !defined(__NR_getrandom))
-+	ret = open_random();
-+	if (ret)
-+		return ret;
-+#endif
-+
-+	do {
- #ifdef HAVE_GETRANDOM
--	return getrandom(buf, buflen, 0);
-+		ret = getrandom(buf, buflen, 0);
-+#elif defined __NR_getrandom
-+		ret = syscall(__NR_getrandom, buf, buflen, 0);
- #else
--# ifdef __NR_getrandom
--	do {
--		int ret = syscall(__NR_getrandom, buf, buflen, 0);
--
-+		ret = read(random_fd, buf, buflen);
-+#endif
- 		if (0 < ret) {
- 			buflen -= ret;
- 			buf += ret;
-@@ -98,14 +92,13 @@ static int get_random(uint8_t *buf, uint32_t buflen)
- 	} while ((0 < ret || EINTR == errno || ERESTART == errno)
- 		 && buflen > 0);
- 
-+#if (!defined(HAVE_GETRANDOM) && !defined(__NR_getrandom))
-+	close_random();
-+#endif
-+
- 	if (buflen == 0)
- 		return 0;
--
- 	return 1;
--# else
--	return read_random(buf, buflen);
--# endif
--#endif
- }
- 
- static void usage(void)
diff --git a/package/libkcapi/0004-internal.h-make-inline-functions-static.patch b/package/libkcapi/0004-internal.h-make-inline-functions-static.patch
deleted file mode 100644
index a050173964..0000000000
--- a/package/libkcapi/0004-internal.h-make-inline-functions-static.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 2b9e01ee31c1b7596b19f0c89954e93e217b0479 Mon Sep 17 00:00:00 2001
-From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
-Date: Thu, 21 Sep 2017 10:16:33 +0200
-Subject: [PATCH] internal.h: make inline functions static
-
-With some GCC configurations/build options it is possible for gcc to
-ignore the inline hint. As the methods are not declared static, gcc
-expects a definition to be provided elsewhere, which is not the case
-here resulting in the following linker error:
-
-libtool: link: /home/marcin/br-test-pkg/br-arm-cortex-a9-glibc/host/bin/arm-linux-gcc
--fstack-protector-strong -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
--D_FILE_OFFSET_BITS=64 -Os -Wl,-z -Wl,relro -Wl,-z -Wl,now -o bin/kcapi
-test/bin_kcapi-kcapi-main.o  ./.libs/libkcapi.so -Wl,-rpath
--Wl,/home/marcin/br-test-pkg/br-arm-cortex-a9-glibc/build/libkcapi-0.14.0/.libs
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_vmsplice_iov'
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_read_data'
-./.libs/libkcapi.so: undefined reference to `_kcapi_aio_read_iov'
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_recv_data'
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_send_data'
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_vmsplice_chunk'
-./.libs/libkcapi.so: undefined reference to `_kcapi_common_send_meta'
-collect2: error: ld returned 1 exit status
-
-$ arm-linux-gcc --version
-arm-linux-gcc.br_real (Buildroot 2017.08-git-01078-g95b1dae) 7.1.0
-
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-
-[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/2b9e01ee31c1b7596b19f0c89954e93e217b0479]
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
----
- lib/internal.h | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/internal.h b/lib/internal.h
-index 0d98f24..addf450 100644
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -233,7 +233,7 @@ void kcapi_dolog(int severity, const char *fmt, ...);
- int32_t _kcapi_common_send_meta_fd(struct kcapi_handle *handle, int *fdptr,
- 				   struct iovec *iov, uint32_t iovlen,
- 				   uint32_t enc, uint32_t flags);
--inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
- 				       struct iovec *iov, uint32_t iovlen,
- 				       uint32_t enc, uint32_t flags)
- {
-@@ -244,7 +244,7 @@ inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
- int32_t _kcapi_common_vmsplice_iov_fd(struct kcapi_handle *handle, int *fdptr,
- 				      struct iovec *iov, unsigned long iovlen,
- 				      uint32_t flags);
--inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
- 				   struct iovec *iov, unsigned long iovlen,
- 				   uint32_t flags)
- {
-@@ -255,7 +255,7 @@ inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
- int32_t _kcapi_common_send_data_fd(struct kcapi_handle *handle, int *fdprt,
- 				   struct iovec *iov, uint32_t iovlen,
- 				   uint32_t flags);
--inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
- 				       struct iovec *iov, uint32_t iovlen,
- 				       uint32_t flags)
- {
-@@ -265,7 +265,7 @@ inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
- 
- int32_t _kcapi_common_recv_data_fd(struct kcapi_handle *handle, int *fdptr,
- 				   struct iovec *iov, uint32_t iovlen);
--inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
- 				       struct iovec *iov, uint32_t iovlen)
- {
- 	return _kcapi_common_recv_data_fd(handle, &handle->opfd, iov, iovlen);
-@@ -273,7 +273,7 @@ inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
- 
- int32_t _kcapi_common_read_data_fd(struct kcapi_handle *handle, int *fdptr,
- 				   uint8_t *out, uint32_t outlen);
--inline int32_t _kcapi_common_read_data(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_read_data(struct kcapi_handle *handle,
- 				       uint8_t *out, uint32_t outlen)
- {
- 	return _kcapi_common_read_data_fd(handle, &handle->opfd, out, outlen);
-@@ -285,7 +285,7 @@ int _kcapi_common_close(struct kcapi_handle *handle, int fdptr);
- int32_t _kcapi_common_vmsplice_chunk_fd(struct kcapi_handle *handle, int *fdptr,
- 				        const uint8_t *in, uint32_t inlen,
- 				        uint32_t flags);
--inline int32_t _kcapi_common_vmsplice_chunk(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_common_vmsplice_chunk(struct kcapi_handle *handle,
- 					    const uint8_t *in, uint32_t inlen,
- 					    uint32_t flags)
- {
-@@ -315,7 +315,7 @@ int _kcapi_aio_send_iov(struct kcapi_handle *handle, struct iovec *iov,
- 
- int32_t _kcapi_aio_read_iov_fd(struct kcapi_handle *handle, int *fdptr,
- 			       struct iovec *iov, uint32_t iovlen);
--inline int32_t _kcapi_aio_read_iov(struct kcapi_handle *handle,
-+static inline int32_t _kcapi_aio_read_iov(struct kcapi_handle *handle,
- 				   struct iovec *iov, uint32_t iovlen)
- {
- 	return _kcapi_aio_read_iov_fd(handle, &handle->opfd, iov, iovlen);
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 9873e6623e..9cb1e80ccb 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 411fc32b3e36ac0268837a8d4538eb8aef487b3a3e9b21a2b88b8ed2f926edf3	libkcapi-0.14.0.tar.xz
+sha256 ac80211317750f6a545b1e5547cfb6ae450b37c11acb6d24982a581705eb5250	libkcapi-1.1.0.tar.xz
+sha256 b0336f8f07a6abf8b0a59d961f53601d7c4a7c09a8137805b730a34a976039f8	COPYING
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING.gplv2
+sha256 13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239	COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index d21c81b168..44469017df 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 0.14.0
+LIBKCAPI_VERSION = 1.1.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
-- 
2.14.1
