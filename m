From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:38:18 +0200
Subject: [Buildroot] [git commit] libkcapi: bump version to 0.14.0
Message-ID: <20170926204958.68DE6803E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd707a9112e38b4ce98326b96c0ed12054ca1cca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from github hash to an official release.

Several upstream patches are required to build the code correctly
on all platforms supported by buildroot.

The test application now uses fork().

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
[Arnout: Squash the two patches, MMU dependency was introduced with the
         version bump.
         Wrap assignments in libkcapi.mk differently.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-Do-not-compile-unused-functions.patch     |  35 ++++++
 ...0003-Unify-code-to-read-from-seed-sources.patch | 132 +++++++++++++++++++++
 ...4-internal.h-make-inline-functions-static.patch | 103 ++++++++++++++++
 package/libkcapi/Config.in                         |   1 +
 package/libkcapi/libkcapi.hash                     |   2 +-
 package/libkcapi/libkcapi.mk                       |  17 ++-
 6 files changed, 285 insertions(+), 5 deletions(-)

diff --git a/package/libkcapi/0002-Do-not-compile-unused-functions.patch b/package/libkcapi/0002-Do-not-compile-unused-functions.patch
new file mode 100644
index 0000000..97ab7fc
--- /dev/null
+++ b/package/libkcapi/0002-Do-not-compile-unused-functions.patch
@@ -0,0 +1,35 @@
+From 217b154a5f65d46064ceb69ce69664105e703a74 Mon Sep 17 00:00:00 2001
+From: Stephan Mueller <smueller@chronox.de>
+Date: Thu, 3 Aug 2017 17:52:48 +0200
+Subject: [PATCH] Do not compile unused functions
+
+GCC 7 now rightfully complains about unused functions.
+
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+
+[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/217b154a5f65d46064ceb69ce69664105e703a74]
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+---
+ apps/kcapi-rng.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/apps/kcapi-rng.c b/apps/kcapi-rng.c
+index df7decf..e15edf9 100644
+--- a/apps/kcapi-rng.c
++++ b/apps/kcapi-rng.c
+@@ -45,6 +45,7 @@ struct kcapi_handle *rng = NULL;
+ unsigned int Verbosity = 0;
+ char *rng_name = NULL;
+ 
++#ifndef HAVE_GETRANDOM
+ static int read_complete(int fd, uint8_t *buf, uint32_t buflen)
+ {
+ 	ssize_t ret;
+@@ -76,6 +77,7 @@ static int read_random(uint8_t *buf, uint32_t buflen)
+ 	close(fd);
+ 	return ret;
+ }
++#endif
+ 
+ static int get_random(uint8_t *buf, uint32_t buflen)
+ {
diff --git a/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch b/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
new file mode 100644
index 0000000..b636ffe
--- /dev/null
+++ b/package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
@@ -0,0 +1,132 @@
+From 450dfb09ee72ffedea8f2a25fdce17295f01f62f Mon Sep 17 00:00:00 2001
+From: Stephan Mueller <smueller@chronox.de>
+Date: Tue, 8 Aug 2017 10:04:06 +0200
+Subject: [PATCH] Unify code to read from seed sources
+
+Remove the code duplication for FD reads and syscall reads.
+
+This patch also fixes the use of __NR_getrandom resolution.
+
+[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/450dfb09ee72ffedea8f2a25fdce17295f01f62f]
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+
+---
+ apps/kcapi-rng.c | 71 +++++++++++++++++++++++++-------------------------------
+ 1 file changed, 32 insertions(+), 39 deletions(-)
+
+diff --git a/apps/kcapi-rng.c b/apps/kcapi-rng.c
+index e15edf9..96da111 100644
+--- a/apps/kcapi-rng.c
++++ b/apps/kcapi-rng.c
+@@ -17,7 +17,9 @@
+  * DAMAGE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <unistd.h>
++#include <sys/syscall.h>
+ #include <errno.h>
+ #include <limits.h>
+ #include <stdint.h>
+@@ -41,56 +43,48 @@
+ /* Minimum seed is 256 bits. */
+ #define KCAPI_RNG_MINSEEDSIZE 32
+ 
+-struct kcapi_handle *rng = NULL;
+-unsigned int Verbosity = 0;
+-char *rng_name = NULL;
++static struct kcapi_handle *rng = NULL;
++static unsigned int Verbosity = 0;
++static char *rng_name = NULL;
+ 
+-#ifndef HAVE_GETRANDOM
+-static int read_complete(int fd, uint8_t *buf, uint32_t buflen)
++#if !defined(HAVE_GETRANDOM) && !defined(__NR_getrandom)
++static int random_fd = -1;
++static int open_random(void)
+ {
+-	ssize_t ret;
++	random_fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC);
++	if (0 > random_fd)
++		return random_fd;
+ 
+-	do {
+-		ret = read(fd, buf, buflen);
+-		if (0 < ret) {
+-			buflen -= ret;
+-			buf += ret;
+-		}
+-	} while ((0 < ret || EINTR == errno || ERESTART == errno)
+-		 && buflen > 0);
+-
+-	if (buflen == 0)
+-		return 0;
+-	return 1;
++	return 0;
+ }
+ 
+-static int read_random(uint8_t *buf, uint32_t buflen)
++static void close_random(void)
+ {
+-	int fd;
+-	int ret = 0;
+-
+-	fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC);
+-	if (0 > fd)
+-		return fd;
+-
+-	ret = read_complete(fd, buf, buflen);
+-	close(fd);
+-	return ret;
++	close(random_fd);
+ }
+ #endif
+ 
+ static int get_random(uint8_t *buf, uint32_t buflen)
+ {
++	ssize_t ret;
++
+ 	if (buflen > INT_MAX)
+ 		return 1;
+ 
++#if (!defined(HAVE_GETRANDOM) && !defined(__NR_getrandom))
++	ret = open_random();
++	if (ret)
++		return ret;
++#endif
++
++	do {
+ #ifdef HAVE_GETRANDOM
+-	return getrandom(buf, buflen, 0);
++		ret = getrandom(buf, buflen, 0);
++#elif defined __NR_getrandom
++		ret = syscall(__NR_getrandom, buf, buflen, 0);
+ #else
+-# ifdef __NR_getrandom
+-	do {
+-		int ret = syscall(__NR_getrandom, buf, buflen, 0);
+-
++		ret = read(random_fd, buf, buflen);
++#endif
+ 		if (0 < ret) {
+ 			buflen -= ret;
+ 			buf += ret;
+@@ -98,14 +92,13 @@ static int get_random(uint8_t *buf, uint32_t buflen)
+ 	} while ((0 < ret || EINTR == errno || ERESTART == errno)
+ 		 && buflen > 0);
+ 
++#if (!defined(HAVE_GETRANDOM) && !defined(__NR_getrandom))
++	close_random();
++#endif
++
+ 	if (buflen == 0)
+ 		return 0;
+-
+ 	return 1;
+-# else
+-	return read_random(buf, buflen);
+-# endif
+-#endif
+ }
+ 
+ static void usage(void)
diff --git a/package/libkcapi/0004-internal.h-make-inline-functions-static.patch b/package/libkcapi/0004-internal.h-make-inline-functions-static.patch
new file mode 100644
index 0000000..a050173
--- /dev/null
+++ b/package/libkcapi/0004-internal.h-make-inline-functions-static.patch
@@ -0,0 +1,103 @@
+From 2b9e01ee31c1b7596b19f0c89954e93e217b0479 Mon Sep 17 00:00:00 2001
+From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+Date: Thu, 21 Sep 2017 10:16:33 +0200
+Subject: [PATCH] internal.h: make inline functions static
+
+With some GCC configurations/build options it is possible for gcc to
+ignore the inline hint. As the methods are not declared static, gcc
+expects a definition to be provided elsewhere, which is not the case
+here resulting in the following linker error:
+
+libtool: link: /home/marcin/br-test-pkg/br-arm-cortex-a9-glibc/host/bin/arm-linux-gcc
+-fstack-protector-strong -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-D_FILE_OFFSET_BITS=64 -Os -Wl,-z -Wl,relro -Wl,-z -Wl,now -o bin/kcapi
+test/bin_kcapi-kcapi-main.o  ./.libs/libkcapi.so -Wl,-rpath
+-Wl,/home/marcin/br-test-pkg/br-arm-cortex-a9-glibc/build/libkcapi-0.14.0/.libs
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_vmsplice_iov'
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_read_data'
+./.libs/libkcapi.so: undefined reference to `_kcapi_aio_read_iov'
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_recv_data'
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_send_data'
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_vmsplice_chunk'
+./.libs/libkcapi.so: undefined reference to `_kcapi_common_send_meta'
+collect2: error: ld returned 1 exit status
+
+$ arm-linux-gcc --version
+arm-linux-gcc.br_real (Buildroot 2017.08-git-01078-g95b1dae) 7.1.0
+
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+
+[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/2b9e01ee31c1b7596b19f0c89954e93e217b0479]
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+---
+ lib/internal.h | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 0d98f24..addf450 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -233,7 +233,7 @@ void kcapi_dolog(int severity, const char *fmt, ...);
+ int32_t _kcapi_common_send_meta_fd(struct kcapi_handle *handle, int *fdptr,
+ 				   struct iovec *iov, uint32_t iovlen,
+ 				   uint32_t enc, uint32_t flags);
+-inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
+ 				       struct iovec *iov, uint32_t iovlen,
+ 				       uint32_t enc, uint32_t flags)
+ {
+@@ -244,7 +244,7 @@ inline int32_t _kcapi_common_send_meta(struct kcapi_handle *handle,
+ int32_t _kcapi_common_vmsplice_iov_fd(struct kcapi_handle *handle, int *fdptr,
+ 				      struct iovec *iov, unsigned long iovlen,
+ 				      uint32_t flags);
+-inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
+ 				   struct iovec *iov, unsigned long iovlen,
+ 				   uint32_t flags)
+ {
+@@ -255,7 +255,7 @@ inline int32_t _kcapi_common_vmsplice_iov(struct kcapi_handle *handle,
+ int32_t _kcapi_common_send_data_fd(struct kcapi_handle *handle, int *fdprt,
+ 				   struct iovec *iov, uint32_t iovlen,
+ 				   uint32_t flags);
+-inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
+ 				       struct iovec *iov, uint32_t iovlen,
+ 				       uint32_t flags)
+ {
+@@ -265,7 +265,7 @@ inline int32_t _kcapi_common_send_data(struct kcapi_handle *handle,
+ 
+ int32_t _kcapi_common_recv_data_fd(struct kcapi_handle *handle, int *fdptr,
+ 				   struct iovec *iov, uint32_t iovlen);
+-inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 				       struct iovec *iov, uint32_t iovlen)
+ {
+ 	return _kcapi_common_recv_data_fd(handle, &handle->opfd, iov, iovlen);
+@@ -273,7 +273,7 @@ inline int32_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 
+ int32_t _kcapi_common_read_data_fd(struct kcapi_handle *handle, int *fdptr,
+ 				   uint8_t *out, uint32_t outlen);
+-inline int32_t _kcapi_common_read_data(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_read_data(struct kcapi_handle *handle,
+ 				       uint8_t *out, uint32_t outlen)
+ {
+ 	return _kcapi_common_read_data_fd(handle, &handle->opfd, out, outlen);
+@@ -285,7 +285,7 @@ int _kcapi_common_close(struct kcapi_handle *handle, int fdptr);
+ int32_t _kcapi_common_vmsplice_chunk_fd(struct kcapi_handle *handle, int *fdptr,
+ 				        const uint8_t *in, uint32_t inlen,
+ 				        uint32_t flags);
+-inline int32_t _kcapi_common_vmsplice_chunk(struct kcapi_handle *handle,
++static inline int32_t _kcapi_common_vmsplice_chunk(struct kcapi_handle *handle,
+ 					    const uint8_t *in, uint32_t inlen,
+ 					    uint32_t flags)
+ {
+@@ -315,7 +315,7 @@ int _kcapi_aio_send_iov(struct kcapi_handle *handle, struct iovec *iov,
+ 
+ int32_t _kcapi_aio_read_iov_fd(struct kcapi_handle *handle, int *fdptr,
+ 			       struct iovec *iov, uint32_t iovlen);
+-inline int32_t _kcapi_aio_read_iov(struct kcapi_handle *handle,
++static inline int32_t _kcapi_aio_read_iov(struct kcapi_handle *handle,
+ 				   struct iovec *iov, uint32_t iovlen)
+ {
+ 	return _kcapi_aio_read_iov_fd(handle, &handle->opfd, iov, iovlen);
diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 453dc69..2b98177 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -9,6 +9,7 @@ if BR2_PACKAGE_LIBKCAPI
 
 config BR2_PACKAGE_LIBKCAPI_APPS
 	bool "build test applications"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Build additional test applications that can provide
 	  performance or algorithm tests.
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 00ee094..9873e66 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e2ebf660029a3565c17220530580d5579b8289bb41ea516a33bf86ef4941e05b	libkcapi-79cb80714ebcbae2b9de9bb5aca9a6a546f2f121.tar.gz
+sha256 411fc32b3e36ac0268837a8d4538eb8aef487b3a3e9b21a2b88b8ed2f926edf3	libkcapi-0.14.0.tar.xz
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 3c30891..d21c81b 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,17 +4,26 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 79cb80714ebcbae2b9de9bb5aca9a6a546f2f121
-LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
+LIBKCAPI_VERSION = 0.14.0
+LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
+LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
 LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
 LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_APPS),y)
-LIBKCAPI_CONF_OPTS += --enable-kcapi-speed --enable-kcapi-test --enable-apps
+LIBKCAPI_CONF_OPTS += \
+	--enable-kcapi-speed \
+	--enable-kcapi-test \
+	--enable-kcapi-hasher \
+	--enable-kcapi-rngapp
 else
-LIBKCAPI_CONF_OPTS += --disable-kcapi-speed --disable-kcapi-test --disable-apps
+LIBKCAPI_CONF_OPTS += \
+	--disable-kcapi-speed \
+	--disable-kcapi-test \
+	--disable-kcapi-hasher \
+	--disable-kcapi-rngapp
 endif
 
 $(eval $(autotools-package))
