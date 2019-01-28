From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 16:54:59 +0100
Subject: [Buildroot] [git commit] gnutls: fix build on sparc
Message-ID: <20190128155451.C908381367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2f606a646b9836eb29177a5e92eeb50675699c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls source code uses the C++11 <atomic> functionality since
https://github.com/gnutls/gnutls/commit/7978a733460f92b31033affd0e487c86d66c643d,
which internally is implemented using the __atomic_*() gcc built-ins

On certain architectures, the __atomic_*() built-ins are implemented in
the libatomic library that comes with the rest of the gcc runtime. Due
to this, code using <atomic> might need to link against libatomic,
otherwise one hits build issues such as:

../lib/.libs/libgnutls.so: undefined reference to `__atomic_fetch_sub_4'

on an architecture like SPARC.

To solve this, a configure.ac check is added to know if we need to
link against libatomic or not. The library is also added to gnutls.pc.

Fixes:
 - http://autobuild.buildroot.org/results/6c749bd592ceffeacadd2ab570d127936cce64b2
 - http://autobuild.buildroot.org/results/30aa83d3cf3482af8a59250c196c85f4a278d343

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure.ac-check-if-libatomic-is-needed.patch | 60 ++++++++++++++++++++++
 package/gnutls/gnutls.mk                           |  2 +
 2 files changed, 62 insertions(+)

diff --git a/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch b/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch
new file mode 100644
index 0000000000..15c1893b01
--- /dev/null
+++ b/package/gnutls/0001-configure.ac-check-if-libatomic-is-needed.patch
@@ -0,0 +1,60 @@
+From cce372f10a755d59ccf09fb7dc6e87b416f63a6f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 17 Jan 2019 10:50:00 +0100
+Subject: [PATCH] configure.ac: check if libatomic is needed
+
+gnutls source code uses the C++11 <atomic> functionality since
+https://github.com/gnutls/gnutls/commit/7978a733460f92b31033affd0e487c86d66c643d,
+which internally is implemented using the __atomic_*() gcc built-ins
+
+On certain architectures, the __atomic_*() built-ins are implemented in
+the libatomic library that comes with the rest of the gcc runtime. Due
+to this, code using <atomic> might need to link against libatomic,
+otherwise one hits build issues such as:
+
+../lib/.libs/libgnutls.so: undefined reference to `__atomic_fetch_sub_4'
+
+on an architecture like SPARC.
+
+To solve this, a configure.ac check is added to know if we need to
+link against libatomic or not. The library is also added to gnutls.pc.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6c749bd592ceffeacadd2ab570d127936cce64b2
+ - http://autobuild.buildroot.org/results/30aa83d3cf3482af8a59250c196c85f4a278d343
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.com/gnutls/gnutls/merge_requests/878]
+---
+ configure.ac     | 2 ++
+ lib/gnutls.pc.in | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e81ff8970..b2c0c2b3d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -207,6 +207,8 @@ dnl Need netinet/tcp.h for TCP_FASTOPEN
+ AC_CHECK_HEADERS([netinet/tcp.h])
+ AC_CHECK_HEADERS([stdatomic.h])
+ 
++AC_SEARCH_LIBS([__atomic_load_4], [atomic], [AC_SUBST([LIBATOMIC_LIBS], [-latomic])])
++
+ dnl We use its presence to detect C11 threads
+ AC_CHECK_HEADERS([threads.h])
+ 
+diff --git a/lib/gnutls.pc.in b/lib/gnutls.pc.in
+index 9f26852cc..68be2d110 100644
+--- a/lib/gnutls.pc.in
++++ b/lib/gnutls.pc.in
+@@ -19,6 +19,6 @@ Description: Transport Security Layer implementation for the GNU system
+ URL: http://www.gnutls.org/
+ Version: @VERSION@
+ Libs: -L${libdir} -lgnutls
+-Libs.private: @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LIBUNISTRING@ @LIBIDN2_LIBS@
++Libs.private: @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LIBUNISTRING@ @LIBIDN2_LIBS@ @LIBATOMIC_LIBS@
+ @GNUTLS_REQUIRES_PRIVATE@
+ Cflags: -I${includedir}
+-- 
+2.14.1
+
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index e6ddc3dbec..d9befa1612 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -27,6 +27,8 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no) \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
+# We're patching configure.ac
+GNUTLS_AUTORECONF = YES
 
 # libpthread autodetection poison the linkpath
 GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
