From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 23:13:00 +0100
Subject: [Buildroot] [PATCH] systemd: fix build with uClibc toolchains
Message-ID: <1392243180-23730-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the build of systemd is broken with the internal toolchain
backend, because we have uClibc patches that add support for
execvpe(), but we also have a patch for systemd that adds execvpe(),
which was added when the internal uClibc didn't support execvpe().

However, simply dropping the patch is not a solution, as it would
break the build of systemd with any other uClibc than the ones built
with Buildroot. For example, a Crosstool-NG uClibc toolchain would
fail.

Beyond this execvpe() problem, there are also other problems that
prevented systemd from being built with unpatched uClibc.

This patch does the following:

 * Add sequence numbers of systemd patches.
 * Regenerate them to avoid fuzz.
 * Improve the uClibc compatibility patch so that it:
   - Detects whether execvpe() is available or not, and if not
     available provide an implementation.
   - Detects if dup3() is available or not, and if not available
     provide an implementation.
   - Detects if MSG_CMSG_CLOEXEC is defined or not, and if not, define
     it to the appropriate value.

This has been tested with uClibc internal toolchain, uClibc external
toolchain built with Buildroot, uClibc external toolchain built with
Crosstool-NG, and glibc external toolchain.

Fixes bug #6776.

Fixes:

  http://autobuild.buildroot.org/results/591/591c6055430da334bd1e46e7d01497add45da837/build-end.log
  http://autobuild.buildroot.org/results/e58/e5851939d2837d4e35a4c1d9ca6df3c93ed5a34b/build-end.log
  http://autobuild.buildroot.org/results/92e/92e4c40c69a3feb4046b2fe5a0d8c69d5a44a157/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Obviously, this patch is for the master branch. On the next branch,
systemd has been bumped to a much newer version of systemd, which is
now restricted to glibc. I however believe that it is worth having
systemd-44 working in 2014.02.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-unit.patch => systemd-01-fix-getty-unit.patch} | 16 ++++-----
 ...e-size.patch => systemd-02-fix-page-size.patch} |  6 ++--
 ...clibc-fix.patch => systemd-03-uclibc-fix.patch} | 41 +++++++++++++++++-----
 package/systemd/systemd.mk                         |  2 ++
 4 files changed, 46 insertions(+), 19 deletions(-)
 rename package/systemd/{systemd-fix-getty-unit.patch => systemd-01-fix-getty-unit.patch} (70%)
 rename package/systemd/{systemd-fix-page-size.patch => systemd-02-fix-page-size.patch} (91%)
 rename package/systemd/{systemd-uclibc-fix.patch => systemd-03-uclibc-fix.patch} (60%)

diff --git a/package/systemd/systemd-fix-getty-unit.patch b/package/systemd/systemd-01-fix-getty-unit.patch
similarity index 70%
rename from package/systemd/systemd-fix-getty-unit.patch
rename to package/systemd/systemd-01-fix-getty-unit.patch
index 6df54b1..9008e43 100644
--- a/package/systemd/systemd-fix-getty-unit.patch
+++ b/package/systemd/systemd-01-fix-getty-unit.patch
@@ -6,11 +6,11 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  units/serial-getty at .service.m4 |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-37/units/getty at .service.m4
+Index: b/units/getty at .service.m4
 ===================================================================
---- systemd-37.orig/units/getty at .service.m4
-+++ systemd-37/units/getty at .service.m4
-@@ -32,7 +32,7 @@
+--- a/units/getty at .service.m4
++++ b/units/getty at .service.m4
+@@ -35,7 +35,7 @@
  
  [Service]
  Environment=TERM=linux
@@ -19,11 +19,11 @@ Index: systemd-37/units/getty at .service.m4
  Restart=always
  RestartSec=0
  UtmpIdentifier=%I
-Index: systemd-37/units/serial-getty at .service.m4
+Index: b/units/serial-getty at .service.m4
 ===================================================================
---- systemd-37.orig/units/serial-getty at .service.m4
-+++ systemd-37/units/serial-getty at .service.m4
-@@ -32,7 +32,7 @@
+--- a/units/serial-getty at .service.m4
++++ b/units/serial-getty at .service.m4
+@@ -35,7 +35,7 @@
  
  [Service]
  Environment=TERM=vt100
diff --git a/package/systemd/systemd-fix-page-size.patch b/package/systemd/systemd-02-fix-page-size.patch
similarity index 91%
rename from package/systemd/systemd-fix-page-size.patch
rename to package/systemd/systemd-02-fix-page-size.patch
index 241ceb8..a8b351a 100644
--- a/package/systemd/systemd-fix-page-size.patch
+++ b/package/systemd/systemd-02-fix-page-size.patch
@@ -6,8 +6,8 @@ Date:   Wed Mar 21 23:47:44 2012 +0100
     
     Let's use NAME_MAX, as suggested by Dan Walsh
 
-diff --git a/src/journal/journald.c b/src/journal/journald.c
-index d27cb60..87390bd 100644
+Index: b/src/journal/journald.c
+===================================================================
 --- a/src/journal/journald.c
 +++ b/src/journal/journald.c
 @@ -29,7 +29,6 @@
@@ -18,7 +18,7 @@ index d27cb60..87390bd 100644
  
  #include <systemd/sd-journal.h>
  #include <systemd/sd-login.h>
-@@ -2149,10 +2148,20 @@ static int process_event(Server *s, struct epoll_event *ev) {
+@@ -2141,10 +2140,20 @@
                          size_t label_len = 0;
                          union {
                                  struct cmsghdr cmsghdr;
diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-03-uclibc-fix.patch
similarity index 60%
rename from package/systemd/systemd-uclibc-fix.patch
rename to package/systemd/systemd-03-uclibc-fix.patch
index 9a20845..f3b41c1 100644
--- a/package/systemd/systemd-uclibc-fix.patch
+++ b/package/systemd/systemd-03-uclibc-fix.patch
@@ -13,18 +13,23 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  src/macro.h                |   15 +++++++++++++++
  2 files changed, 17 insertions(+)
 
-Index: systemd-44/src/macro.h
+Index: b/src/macro.h
 ===================================================================
---- systemd-44.orig/src/macro.h
-+++ systemd-44/src/macro.h
-@@ -28,6 +28,21 @@
+--- a/src/macro.h
++++ b/src/macro.h
+@@ -28,6 +28,33 @@
  #include <sys/uio.h>
  #include <inttypes.h>
  
 +#ifdef __UCLIBC__
 +/* uclibc does not implement mkostemp GNU extension */
 +#define mkostemp(x,y) mkstemp(x)
++/* uclibc may not define MSG_CMSG_CLOEXEC */
++#if defined HAVE_DECL_MSG_CMSG_CLOEXEC && !HAVE_DECL_MSG_CMSG_CLOEXEC
++#define MSG_CMSG_CLOEXEC 0x40000000
++#endif
 +/* uclibc does not implement execvpe GNU extension */
++#ifndef HAVE_EXECVPE
 +#ifndef _GNU_SOURCE
 +#define _GNU_SOURCE
 +#endif
@@ -35,14 +40,21 @@ Index: systemd-44/src/macro.h
 +        environ = (char **)envp;
 +        return execvp(file, argv);
 +}
-+#endif
++#endif /* HAVE_EXECVPE */
++#ifndef HAVE_DUP3
++#include <asm/unistd.h>
++static inline int dup3(int oldfd, int newfd, int flags) {
++        return syscall(__NR_dup3, oldfd, newfd, flags);
++}
++#endif /* HAVE_DUP3 */
++#endif /* __UCLIBC__ */
  #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
  #define _sentinel_ __attribute__ ((sentinel))
  #define _noreturn_ __attribute__((noreturn))
-Index: systemd-44/src/journal/journal-file.c
+Index: b/src/journal/journal-file.c
 ===================================================================
---- systemd-44.orig/src/journal/journal-file.c
-+++ systemd-44/src/journal/journal-file.c
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
 @@ -229,11 +229,13 @@
                  }
          }
@@ -57,3 +69,16 @@ Index: systemd-44/src/journal/journal-file.c
  
          if (fstat(f->fd, &f->last_stat) < 0)
                  return -errno;
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -111,6 +111,8 @@
+ 
+ AC_SEARCH_LIBS([clock_gettime], [rt], [], [AC_MSG_ERROR([*** POSIX RT library not found])])
+ AC_SEARCH_LIBS([dlsym], [dl], [], [AC_MSG_ERROR([*** Dynamic linking loader library not found])])
++AC_CHECK_FUNCS([execvpe dup3])
++AC_CHECK_DECLS([MSG_CMSG_CLOEXEC], [], [], [#include <sys/socket.h>])
+ 
+ save_LIBS="$LIBS"
+ LIBS=
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a5dc8e5..bd90101 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -22,6 +22,8 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	SYSTEMD_DEPENDENCIES += busybox
 endif
 
+SYSTEMD_AUTORECONF = YES
+
 SYSTEMD_CONF_OPT += \
 	--with-distro=other \
 	--disable-selinux \
-- 
1.8.3.2
