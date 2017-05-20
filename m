From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 May 2017 12:40:31 +0200
Subject: [Buildroot] [RFC] package/gnutls: Don't use a full library path in
	gnutls.pc
Message-ID: <20170520104031.6841-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported upstream [1].

Fixes:
[ffmpeg] http://autobuild.buildroot.net/results/6cf/6cf90177a444882ad37017bccf41dea6bf752d31
[taskd]  http://autobuild.buildroot.net/results/b8c18a2cc5e7170695c273e8017a4771096167b6

[1] https://gitlab.com/gnutls/gnutls/issues/203

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...use-LTLIBUNISTRING-instead-of-LIBUNISTRIN.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/gnutls/0001-gnutils.pc-use-LTLIBUNISTRING-instead-of-LIBUNISTRIN.patch

diff --git a/package/gnutls/0001-gnutils.pc-use-LTLIBUNISTRING-instead-of-LIBUNISTRIN.patch b/package/gnutls/0001-gnutils.pc-use-LTLIBUNISTRING-instead-of-LIBUNISTRIN.patch
new file mode 100644
index 0000000..d171932
--- /dev/null
+++ b/package/gnutls/0001-gnutils.pc-use-LTLIBUNISTRING-instead-of-LIBUNISTRIN.patch
@@ -0,0 +1,72 @@
+From c029ca6fdcde628b1631d6e09a07116169f27ef4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 19 May 2017 21:39:07 +0200
+Subject: [PATCH] gnutils.pc: use LTLIBUNISTRING instead of LIBUNISTRING.
+
+gnutls.pc contain the full path to libunistring library which trigger
+an issue when compiling with "gcc -c" (Compile and assemble, but do not
+link). When compiling with "gcc -c", a full path is not accepted, while
+-lfoo is.
+
+gnutls.pc for static libraries build:
+Libs.private:  -lintl      -lgmp [...]sysroot/usr/lib/libunistring.a
+
+gnutls.pc for shared libraries build:
+Libs.private:        -lgmp [...]/sysroot/usr/lib/libunistring.so
+
+That's because gnutls use AC_LIB_HAVE_LINKFLAGS [2] witch return the
+full library path in LIBUNISTRING. If LTLIBUNISTRING is used in
+gnutls.pc.in then the issue is "fixed":
+
+Libs.private:  -lintl      -lgmp -lunistring
+
+But it's probably a hack...
+
+We don't have a problem with zlib since gnutls build system use zlib.pc
+thanks to pkg-config (otherwise we have the same issue with zlib...).
+
+For LIBINTL the AM_GNU_GETTEXT macro is used and return
+LIBINTL='-lintl'.
+GMP_LIBS is set from LIBGNUTLS_HOOKS (m4/hooks.m4) which use
+AC_CHECK_LIB and return -lgmp.
+
+The remaining libraries LIBSOCKET, LIBNSL, LIBPTHREAD, LIB_SELECT,
+TSS_LIBS and LIBIDN2_LIBS are empty.
+
+We can't use PKG_CHECK_MODULES for libunistring since it doesn't
+provide a .pc file. The remaining solution is AC_CHECK_LIB() instead of
+AC_LIB_HAVE_LINKFLAGS, it could work since libunistring doesn't link
+with other libraries (-lunistring is enough). But we have to do an
+"invasive" change in the build system.
+
+Reported upstream [4].
+
+Fixes:
+[ffmpeg] http://autobuild.buildroot.net/results/6cf/6cf90177a444882ad37017bccf41dea6bf752d31
+[taskd]  http://autobuild.buildroot.net/results/b8c18a2cc5e7170695c273e8017a4771096167b6
+
+[1] http://autobuild.buildroot.net/results/6cf/6cf90177a444882ad37017bccf41dea6bf752d31/ffmpeg-3.3.1/config.log
+[2] https://www.gnu.org/software/gnulib/manual/html_node/Searching-for-Libraries.html
+[3] http://lists.busybox.net/pipermail/buildroot/2017-March/187695.html
+[4] https://gitlab.com/gnutls/gnutls/issues/203
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ lib/gnutls.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnutls.pc.in b/lib/gnutls.pc.in
+index f656d12..0ca3558 100644
+--- a/lib/gnutls.pc.in
++++ b/lib/gnutls.pc.in
+@@ -19,6 +19,6 @@ Description: Transport Security Layer implementation for the GNU system
+ URL: http://www.gnutls.org/
+ Version: @VERSION@
+ Libs: -L${libdir} -lgnutls
+-Libs.private: @LIBZ_PC@ @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LIBUNISTRING@ @LIBIDN2_LIBS@
++Libs.private: @LIBZ_PC@ @LIBINTL@ @LIBSOCKET@ @LIBNSL@ @LIBPTHREAD@ @LIB_SELECT@ @TSS_LIBS@ @GMP_LIBS@ @LTLIBUNISTRING@ @LIBIDN2_LIBS@
+ @GNUTLS_REQUIRES_PRIVATE@
+ Cflags: -I${includedir}
+-- 
+2.9.4
+
-- 
2.9.4
