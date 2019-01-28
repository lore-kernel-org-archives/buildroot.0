From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:04:17 +0100
Subject: [Buildroot] [git commit] package/gnutls: bump to version 3.6.6
Message-ID: <20190128210844.5A32B81062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da17aef2e00774fae4a4fa983b11899869504bb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now upstreamed 0001-configure.ac-check-if-libatomic-is-needed.patch and
autoreconf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure.ac-check-if-libatomic-is-needed.patch | 60 ----------------------
 package/gnutls/gnutls.hash                         |  4 +-
 package/gnutls/gnutls.mk                           |  4 +-
 3 files changed, 3 insertions(+), 65 deletions(-)

diff --git a/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch b/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch
deleted file mode 100644
index 15c1893b01..0000000000
--- a/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From cce372f10a755d59ccf09fb7dc6e87b416f63a6f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 17 Jan 2019 10:50:00 +0100
-Subject: [PATCH] configure.ac: check if libatomic is needed
-
-gnutls source code uses the C++11 <atomic> functionality since
-https://github.com/gnutls/gnutls/commit/7978a733460f92b31033affd0e487c86d66c643d,
-which internally is implemented using the __atomic_*() gcc built-ins
-
-On certain architectures, the __atomic_*() built-ins are implemented in
-the libatomic library that comes with the rest of the gcc runtime. Due
-to this, code using <atomic> might need to link against libatomic,
-otherwise one hits build issues such as:
-
-../lib/.libs/libgnutls.so: undefined reference to `__atomic_fetch_sub_4'
-
-on an architecture like SPARC.
-
-To solve this, a configure.ac check is added to know if we need to
-link against libatomic or not. The library is also added to gnutls.pc.
-
-Fixes:
- - http://autobuild.buildroot.org/results/6c749bd592ceffeacadd2ab570d127936cce64b2
- - http://autobuild.buildroot.org/results/30aa83d3cf3482af8a59250c196c85f4a278d343
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.com/gnutls/gnutls/merge_requests/878]
----
- configure.ac     | 2 ++
- lib/gnutls.pc.in | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e81ff8970..b2c0c2b3d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -207,6 +207,8 @@ dnl Need netinet/tcp.h for TCP_FASTOPEN
- AC_CHECK_HEADERS([netinet/tcp.h])
- AC_CHECK_HEADERS([stdatomic.h])
- 
-+AC_SEARCH_LIBS([__atomic_load_4], [atomic], [AC_SUBST([LIBATOMIC_LIBS], [-latomic])])
-+
- dnl We use its presence to detect C11 threads
- AC_CHECK_HEADERS([threads.h])
- 
-diff --git a/lib/gnutls.pc.in b/lib/gnutls.pc.in
-index 9f26852cc..68be2d110 100644
---- a/lib/gnutls.pc.in
-+++ b/lib/gnutls.pc.in
-@@ -19,6 +19,6 @@ Description: Transport Security Layer implementation for the GNU system
- URL: http://www.gnutls.org/
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls
--Libs.private: @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LIBUNISTRING@ @LIBIDN2_LIBS@
-+Libs.private: @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LIBUNISTRING@ @LIBIDN2_LIBS@ @LIBATOMIC_LIBS@
- @GNUTLS_REQUIRES_PRIVATE@
- Cflags: -I${includedir}
--- 
-2.14.1
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 89e8b14597..1af0e2d45d 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.5.tar.xz.sig
-sha256	073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35	gnutls-3.6.5.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz.sig
+sha256	bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7	gnutls-3.6.6.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d9befa1612..c6d2d72771 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).5
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
@@ -27,8 +27,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no) \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
-# We're patching configure.ac
-GNUTLS_AUTORECONF = YES
 
 # libpthread autodetection poison the linkpath
 GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
