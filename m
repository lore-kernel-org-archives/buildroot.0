From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:18:28 +0200
Subject: [Buildroot] [git commit] package/dovecot: not available on
	static-only build
Message-ID: <20150425083008.89F5680E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfb5d066fc8a4a5f4be4e0f99dd75b62f32ec787
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/53f/53fd9003a4cf7d128f4d64d43209fe26d859a829/

http://autobuild.buildroot.net/results/53f/53fd9003a4cf7d128f4d64d43209fe26d859a829/dovecot-2.2.16/config.log
shows this pthread related link error during configure

sqlite3.c:(.text+0x5106): undefined reference to `pthread_mutex_trylock'
/home/test/autobuild/instance-2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libsqlite3.a(sqlite3.o): In function `pthreadMutexAlloc':
sqlite3.c:(.text+0x91fb): undefined reference to `pthread_mutexattr_init'
sqlite3.c:(.text+0x9205): undefined reference to `pthread_mutexattr_settype'
sqlite3.c:(.text+0x920e): undefined reference to `pthread_mutex_init'
sqlite3.c:(.text+0x9216): undefined reference to `pthread_mutexattr_destroy'
sqlite3.c:(.text+0x9234): undefined reference to `pthread_mutex_init'

Trying to fix it in dovecot.mk by

+# dovecot forgets to compile/link with -pthread breaking static linking
+DOVECOT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -pthread" LIBS="-pthread"

results in a build error later on
setresgid.c:(.text+0x0): multiple definition of `setresgid'

which might be fixed in uclibc by porting
http://git.buildroot.net/buildroot/tree/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch

but, at the end, I think it is better to not build Dovecot as a static
binary since it is heavy modularized and not worth the effort. Therefore
remove two patches fixing static linking, since they are not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/0002-fix-static-build.patch |   24 ------------------------
 package/dovecot/0003-fix-static-build.patch |   24 ------------------------
 package/dovecot/Config.in                   |    5 +++++
 3 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/package/dovecot/0002-fix-static-build.patch b/package/dovecot/0002-fix-static-build.patch
deleted file mode 100644
index be646bc..0000000
--- a/package/dovecot/0002-fix-static-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix static build
-
-MODULE_SUFFIX is undefined when building statically; don't used it.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: sent upstream
-(http://dovecot.org/pipermail/dovecot/2014-November/098694.html)
-
-diff -Nuar dovecot-2.2.15-orig/src/lib/module-dir.c dovecot-2.2.15/src/lib/module-dir.c
---- dovecot-2.2.15-orig/src/lib/module-dir.c	2014-10-18 00:10:15.000000000 +0300
-+++ dovecot-2.2.15/src/lib/module-dir.c	2014-11-13 19:27:29.417786313 +0200
-@@ -621,7 +621,11 @@
- 	if (*p == '_')
- 		fname = p + 1;
- 
-+#ifdef MODULE_SUFFIX
- 	p = strstr(fname, MODULE_SUFFIX);
-+#else
-+	p = NULL;
-+#endif
- 	if (p == NULL)
- 		return fname;
- 
diff --git a/package/dovecot/0003-fix-static-build.patch b/package/dovecot/0003-fix-static-build.patch
deleted file mode 100644
index c5dd9d1..0000000
--- a/package/dovecot/0003-fix-static-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix symbol conflict in static build with MySQL enabled
-
-Compile error log:
-http://autobuild.buildroot.net/results/9b5/9b536926b3b2bf82c683b48e9697a220f1b4bf33/build-end.log
-
-Patch suggested by Timo Sirainen:
-http://www.dovecot.org/list/dovecot/2014-November/098787.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr dovecot-2.2.15.org/src/lib/strnum.h dovecot-2.2.15/src/lib/strnum.h
---- dovecot-2.2.15.org/src/lib/strnum.h	2014-07-02 17:21:24.000000000 +0200
-+++ dovecot-2.2.15/src/lib/strnum.h	2014-11-21 19:26:42.316225982 +0100
-@@ -1,6 +1,10 @@
- #ifndef STRNUM_H
- #define STRNUM_H
- 
-+/* libmysqlclient really should try to keep its internal stuff internal so
-+   they won't conflict with the actual programs that are trying to use it. */
-+#define str_to_time str_to_time_libmysqlclient_craps_all_over
-+
- /* Return TRUE if all characters in string are numbers.
-    Stop when `end_char' is found from string. */
- bool str_is_numeric(const char *str, char end_char) ATTR_PURE;
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 5fd1714..9c242fc 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	help
 	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
@@ -51,3 +52,7 @@ config BR2_PACKAGE_DOVECOT_ZLIB
 source package/dovecot-pigeonhole/Config.in
 
 endif # BR2_PACKAGE_DOVECOT
+
+comment "dovecot needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
