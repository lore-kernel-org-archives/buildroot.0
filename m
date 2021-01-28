From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:54:52 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sudo: fix static
 build without closefrom
Message-ID: <20210128200057.EE85D81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c68c46440254305d670d98d1d730e769c69952c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes:
 - http://autobuild.buildroot.org/results/515b45f876fa9de03c9235f86017f4dc10eb3b54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b6eeb2fdda3b40f8aa8127d38e661b77afbbced8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...g-Makefile.in-fix-static-build-without-cl.patch | 55 ++++++++++++++++++++++
 package/sudo/sudo.mk                               |  2 +
 2 files changed, 57 insertions(+)

diff --git a/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch b/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch
new file mode 100644
index 0000000000..e4e27678d2
--- /dev/null
+++ b/package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch
@@ -0,0 +1,55 @@
+From 80f86618db50fa5b55c7fdcdc83461a7d6d5f4ea Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Jan 2021 07:33:47 +0100
+Subject: [PATCH] lib/eventlog/Makefile.in: fix static build without closefrom
+
+Since version 1.9.4 and
+https://github.com/sudo-project/sudo/commit/bd1ca79cca827a92e904f022e49df121931d4ff5,
+when closefrom is not available, libsudo_eventlog.a depends on
+libsudo_util.a. So reflect this dependency in the libtool file to avoid
+the following static build failure of logsrvd:
+
+/bin/bash ../libtool --tag=disable-static --mode=link /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_logsrvd logsrv_util.o iolog_writer.o logsrvd.o logsrvd_conf.o -static -Wl,--enable-new-dtags -Wl,-z,relro    ../lib/iolog/libsudo_iolog.la ../lib/eventlog/libsudo_eventlog.la ../lib/logsrv/liblogsrv.la
+/bin/bash ../libtool --tag=disable-static --mode=link /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_sendlog logsrv_util.o sendlog.o -static -Wl,--enable-new-dtags -Wl,-z,relro    ../lib/iolog/libsudo_iolog.la ../lib/eventlog/libsudo_eventlog.la ../lib/logsrv/liblogsrv.la
+libtool: link: /home/buildroot/autobuild/instance-1/output-1/host/bin/powerpc-linux-gcc -o sudo_logsrvd logsrv_util.o iolog_writer.o logsrvd.o logsrvd_conf.o -static -Wl,--enable-new-dtags -Wl,-z -Wl,relro  ../lib/iolog/.libs/libsudo_iolog.a /home/buildroot/autobuild/instance-1/output-1/build/sudo-1.9.5p1/lib/util/.libs/libsudo_util.a -lpthread -lz ../lib/eventlog/.libs/libsudo_eventlog.a ../lib/logsrv/.libs/liblogsrv.a
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../lib/eventlog/.libs/libsudo_eventlog.a(eventlog.o): in function `send_mail.constprop.1':
+eventlog.c:(.text+0x149c): undefined reference to `sudo_closefrom'
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.org/results/515b45f876fa9de03c9235f86017f4dc10eb3b54
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/sudo-project/sudo/commit/c05fe93669e60dba1e290d448254503bd84c8ca3]
+---
+ lib/eventlog/Makefile.in | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/eventlog/Makefile.in b/lib/eventlog/Makefile.in
+index a9a279378..134a5d222 100644
+--- a/lib/eventlog/Makefile.in
++++ b/lib/eventlog/Makefile.in
+@@ -46,8 +46,9 @@ LDFLAGS = @LDFLAGS@
+ # Flags to pass to libtool
+ LTFLAGS = @LT_STATIC@
+ 
+-# Libraries for test programs
+-LIBS = $(top_builddir)/lib/util/libsudo_util.la
++# Libraries
++LT_LIBS = $(top_builddir)/lib/util/libsudo_util.la
++LIBS = $(LT_LIBS)
+ 
+ # Address sanitizer flags
+ ASAN_CFLAGS = @ASAN_CFLAGS@
+@@ -132,7 +133,7 @@ $(devdir)/log_server.pb-c.c: $(srcdir)/log_server.proto
+ 	fi
+ 
+ libsudo_eventlog.la: $(LIBEVENTLOG_OBJS)
+-	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(LIBEVENTLOG_OBJS)
++	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(LIBEVENTLOG_OBJS) $(LT_LIBS)
+ 
+ check_wrap: $(CHECK_WRAP_OBJS) $(LIBUTIL)
+ 	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(CHECK_WRAP_OBJS) $(LDFLAGS) $(ASAN_LDFLAGS) $(PIE_LDFLAGS) $(SSP_LDFLAGS) $(LIBS)
+-- 
+2.29.2
+
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 6faccfa25b..806d344737 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -8,6 +8,8 @@ SUDO_VERSION = 1.9.5p1
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
+# We're patching lib/eventlog/Makefile.in
+SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
