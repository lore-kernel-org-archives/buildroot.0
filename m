From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2021 21:41:12 +0100
Subject: [Buildroot] [git commit] package/sudo: security bump to version
 1.9.5p2
Message-ID: <20210127202307.73860815EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fea71ac785cc4a9c914aabfc5b8cd837b94b367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Major changes between sudo 1.9.5p2 and 1.9.5p1

 * Buildroot: dropped a patch that was included in the release.

 * Fixed sudo's setprogname(3) emulation on systems that don't
   provide it.

 * Fixed a problem with the sudoers log server client where a partial
   write to the server could result the sudo process consuming large
   amounts of CPU time due to a cycle in the buffer queue. Bug #954.

 * Added a missing dependency on libsudo_util in libsudo_eventlog.
   Fixes a link error when building sudo statically.

 * The user's KRB5CCNAME environment variable is now preserved when
   performing PAM authentication.  This fixes GSSAPI authentication
   when the user has a non-default ccache.

 * When invoked as sudoedit, the same set of command line options
   are now accepted as for "sudo -e".  The -H and -P options are
   now rejected for sudoedit and "sudo -e" which matches the sudo
   1.7 behavior.  This is part of the fix for CVE-2021-3156.

 * Fixed a potential buffer overflow when unescaping backslashes
   in the command's arguments.  Normally, sudo escapes special
   characters when running a command via a shell (sudo -s or sudo
   -i).  However, it was also possible to run sudoedit with the -s
   or -i flags in which case no escaping had actually been done,
   making a buffer overflow possible.  This fixes CVE-2021-3156.

https://www.sudo.ws/stable.html#1.9.5p2

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...g-Makefile.in-fix-static-build-without-cl.patch | 55 ----------------------
 package/sudo/sudo.hash                             |  2 +-
 package/sudo/sudo.mk                               |  2 +-
 3 files changed, 2 insertions(+), 57 deletions(-)

diff --git a/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch b/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch
deleted file mode 100644
index e4e27678d2..0000000000
--- a/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 80f86618db50fa5b55c7fdcdc83461a7d6d5f4ea Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 22 Jan 2021 07:33:47 +0100
-Subject: [PATCH] lib/eventlog/Makefile.in: fix static build without closefrom
-
-Since version 1.9.4 and
-https://github.com/sudo-project/sudo/commit/bd1ca79cca827a92e904f022e49df121931d4ff5,
-when closefrom is not available, libsudo_eventlog.a depends on
-libsudo_util.a. So reflect this dependency in the libtool file to avoid
-the following static build failure of logsrvd:
-
-/bin/bash ../libtool --tag=disable-static --mode=link /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_logsrvd logsrv_util.o iolog_writer.o logsrvd.o logsrvd_conf.o -static -Wl,--enable-new-dtags -Wl,-z,relro    ../lib/iolog/libsudo_iolog.la ../lib/eventlog/libsudo_eventlog.la ../lib/logsrv/liblogsrv.la
-/bin/bash ../libtool --tag=disable-static --mode=link /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_sendlog logsrv_util.o sendlog.o -static -Wl,--enable-new-dtags -Wl,-z,relro    ../lib/iolog/libsudo_iolog.la ../lib/eventlog/libsudo_eventlog.la ../lib/logsrv/liblogsrv.la
-libtool: link: /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_logsrvd logsrv_util.o iolog_writer.o logsrvd.o logsrvd_conf.o -static -Wl,--enable-new-dtags -Wl,-z -Wl,relro  ../lib/iolog/.libs/libsudo_iolog.a /home/buildroot/autobuild/instance-1/output-1/build/sudo-1.9.5p1/lib/util/.libs/libsudo_util.a -lpthread -lz ../lib/eventlog/.libs/libsudo_eventlog.a ../lib/logsrv/.libs/liblogsrv.a
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../lib/eventlog/.libs/libsudo_eventlog.a(eventlog.o): in function `send_mail.constprop.1':
-eventlog.c:(.text+0x149c): undefined reference to `sudo_closefrom'
-collect2: error: ld returned 1 exit status
-
-Fixes:
- - http://autobuild.buildroot.org/results/515b45f876fa9de03c9235f86017f4dc10eb3b54
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sudo-project/sudo/commit/c05fe93669e60dba1e290d448254503bd84c8ca3]
----
- lib/eventlog/Makefile.in | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/eventlog/Makefile.in b/lib/eventlog/Makefile.in
-index a9a279378..134a5d222 100644
---- a/lib/eventlog/Makefile.in
-+++ b/lib/eventlog/Makefile.in
-@@ -46,8 +46,9 @@ LDFLAGS = @LDFLAGS@
- # Flags to pass to libtool
- LTFLAGS = @LT_STATIC@
- 
--# Libraries for test programs
--LIBS = $(top_builddir)/lib/util/libsudo_util.la
-+# Libraries
-+LT_LIBS = $(top_builddir)/lib/util/libsudo_util.la
-+LIBS = $(LT_LIBS)
- 
- # Address sanitizer flags
- ASAN_CFLAGS = @ASAN_CFLAGS@
-@@ -132,7 +133,7 @@ $(devdir)/log_server.pb-c.c: $(srcdir)/log_server.proto
- 	fi
- 
- libsudo_eventlog.la: $(LIBEVENTLOG_OBJS)
--	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(LIBEVENTLOG_OBJS)
-+	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(LIBEVENTLOG_OBJS) $(LT_LIBS)
- 
- check_wrap: $(CHECK_WRAP_OBJS) $(LIBUTIL)
- 	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(CHECK_WRAP_OBJS) $(LDFLAGS) $(ASAN_LDFLAGS) $(PIE_LDFLAGS) $(SSP_LDFLAGS) $(LIBS)
--- 
-2.29.2
-
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 3a0ff46838..ee30b32265 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256  4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882  sudo-1.9.5p1.tar.gz
+sha256  539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978  sudo-1.9.5p2.tar.gz
 # Locally calculated
 sha256  505c5955c373514e2533a24a8346f44038e29cba874f5ca83beb171a7409089f  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 88a1274b34..7a6320e7e4 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -10,7 +10,7 @@ SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 SUDO_CPE_ID_VALID = YES
 SUDO_CPE_ID_VERSION = 1.9.5
-SUDO_CPE_ID_VERSION_MINOR = p1
+SUDO_CPE_ID_VERSION_MINOR = p2
 # We're patching lib/eventlog/Makefile.in
 SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
