From: Petr Kulhavy <brain@jikos.cz>
Date: Mon, 15 May 2017 10:26:29 +0200
Subject: [Buildroot] [PATCH v3 1/1] linuxptp: new package
Message-ID: <1494836789-26058-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux PTP Project package.
http://linuxptp.sourceforge.net/

The sysV and systemd init scripts start the daemon in automatic mode on eth0.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
--
Changes v2 -> v3:
	- add patches to fix build issues and enable compilation on all targets

Changes v1 -> v2:
	- rename package from ptp4l to linuxptp
	- add EXTRA_LDFLAGS to the build cmd (suggested by Danomi Manchego)
	- sysV startup script: add restart/reload code, use PID file
	- clean-up empty lines and formatting issues
	- license uses SPDX license code
	- update DEVELOPERS file
---
 DEVELOPERS                                      |  3 +
 package/Config.in                               |  1 +
 package/linuxptp/0001-adjtime-fix.patch         | 12 ++++
 package/linuxptp/0002-ethhdr-fix.patch          | 10 ++++
 package/linuxptp/0003-time_t-fix.patch          | 10 ++++
 package/linuxptp/0004-clock_nanosleep-fix.patch | 74 +++++++++++++++++++++++++
 package/linuxptp/Config.in                      | 13 +++++
 package/linuxptp/S65ptp4l                       | 36 ++++++++++++
 package/linuxptp/linuxptp.hash                  |  2 +
 package/linuxptp/linuxptp.mk                    | 38 +++++++++++++
 package/linuxptp/ptp4l.service                  | 10 ++++
 11 files changed, 209 insertions(+)
 create mode 100644 package/linuxptp/0001-adjtime-fix.patch
 create mode 100644 package/linuxptp/0002-ethhdr-fix.patch
 create mode 100644 package/linuxptp/0003-time_t-fix.patch
 create mode 100644 package/linuxptp/0004-clock_nanosleep-fix.patch
 create mode 100644 package/linuxptp/Config.in
 create mode 100755 package/linuxptp/S65ptp4l
 create mode 100644 package/linuxptp/linuxptp.hash
 create mode 100644 package/linuxptp/linuxptp.mk
 create mode 100644 package/linuxptp/ptp4l.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fbb69a..524a655 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1267,6 +1267,9 @@ F:	package/sdl2_gfx/
 F:	package/sdl2_image/
 F:	package/sdl2_ttf/
 
+N:	Petr Kulhavy <brain@jikos.cz>
+F:	package/linuxptp/
+
 N:	Petr Vorel <petr.vorel@gmail.com>
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
diff --git a/package/Config.in b/package/Config.in
index d57813c..200ae00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1597,6 +1597,7 @@ menu "Networking applications"
 	source "package/links/Config.in"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
+	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/linuxptp/0001-adjtime-fix.patch b/package/linuxptp/0001-adjtime-fix.patch
new file mode 100644
index 0000000..a892220
--- /dev/null
+++ b/package/linuxptp/0001-adjtime-fix.patch
@@ -0,0 +1,12 @@
+diff -u linuxptp-1.8.old/incdefs.sh linuxptp-1.8/incdefs.sh
+--- linuxptp-1.8.old/incdefs.sh	2017-05-14 22:19:25.526966749 +0200
++++ linuxptp-1.8/incdefs.sh	2017-05-14 22:22:19.185971919 +0200
+@@ -31,7 +31,7 @@
+ 
+ 	# Look for clock_adjtime().
+ 	for d in $dirs; do
+-		files=$(find $d -type f -name time.h)
++		files=$(find $d -type f -name time.h -o -name timex.h)
+ 		for f in $files; do
+ 			if grep -q clock_adjtime $f; then
+ 				printf " -DHAVE_CLOCK_ADJTIME"
diff --git a/package/linuxptp/0002-ethhdr-fix.patch b/package/linuxptp/0002-ethhdr-fix.patch
new file mode 100644
index 0000000..127384e
--- /dev/null
+++ b/package/linuxptp/0002-ethhdr-fix.patch
@@ -0,0 +1,10 @@
+--- linuxptp-1.8/raw.c.old	2016-11-04 19:38:56.000000000 +0100
++++ linuxptp-1.8/raw.c	2017-05-14 17:55:20.653736273 +0200
+@@ -20,7 +20,6 @@
+ #include <fcntl.h>
+ #include <linux/filter.h>
+ #include <linux/if_ether.h>
+-#include <net/ethernet.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <netpacket/packet.h>
diff --git a/package/linuxptp/0003-time_t-fix.patch b/package/linuxptp/0003-time_t-fix.patch
new file mode 100644
index 0000000..3fbc99b
--- /dev/null
+++ b/package/linuxptp/0003-time_t-fix.patch
@@ -0,0 +1,10 @@
+--- linuxptp-1.8/util.h.old	2017-05-14 17:22:52.228898091 +0200
++++ linuxptp-1.8/util.h	2017-05-14 17:23:15.988761979 +0200
+@@ -22,6 +22,7 @@
+ 
+ #include "ddt.h"
+ #include "ether.h"
++#include <time.h>
+ 
+ /**
+  * Table of human readable strings, one for each port state.
diff --git a/package/linuxptp/0004-clock_nanosleep-fix.patch b/package/linuxptp/0004-clock_nanosleep-fix.patch
new file mode 100644
index 0000000..c463293
--- /dev/null
+++ b/package/linuxptp/0004-clock_nanosleep-fix.patch
@@ -0,0 +1,74 @@
+diff -u -r linuxptp-1.8.old/incdefs.sh linuxptp-1.8/incdefs.sh
+--- linuxptp-1.8.old/incdefs.sh	2017-05-14 20:17:19.724933608 +0200
++++ linuxptp-1.8/incdefs.sh	2017-05-14 20:18:15.440614433 +0200
+@@ -40,6 +40,20 @@
+ 		done
+ 	done
+ 
++	# Look for clock_nanosleep().
++	echo '
++#include <time.h>
++
++void test(void)
++{
++        clock_nanosleep(CLOCK_REALTIME, 0, NULL, NULL);
++}
++	' > .incdefs-test.c
++	if ${CC} -c -Werror .incdefs-test.c 2> /dev/null ; then
++		printf " -DHAVE_CLOCK_NANOSLEEP"
++	fi
++	rm -f .incdefs-test.c .incdefs-test.o
++
+ 	# Look for posix_spawn().
+ 	for d in $dirs; do
+ 		files=$(find $d -type f -name spawn.h)
+--- linuxptp-1.8/missing.h.old	2017-05-14 22:58:55.000000000 +0200
++++ linuxptp-1.8/missing.h	2017-05-14 23:01:09.964619736 +0200
+@@ -69,18 +69,21 @@
+ }
+ #endif
+ 
+-#ifndef __uClinux__
+-
+-#include <sys/timerfd.h>
+-
+-#else
+-
++#if !defined ( HAVE_CLOCK_NANOSLEEP ) || defined ( __uClinux__ )
+ static inline int clock_nanosleep(clockid_t clock_id, int flags,
+ 				  const struct timespec *request,
+ 				  struct timespec *remain)
+ {
+ 	return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
+ }
++#endif
++
++
++#ifndef __uClinux__
++
++#include <sys/timerfd.h>
++
++#else
+ 
+ static inline int timerfd_create(int clockid, int flags)
+ {
+--- linuxptp-1.8/makefile.old	2017-05-15 00:41:33.370113834 +0200
++++ linuxptp-1.8/makefile	2017-05-15 00:41:03.710283744 +0200
+@@ -20,7 +20,7 @@
+ DEBUG	=
+ CC	= $(CROSS_COMPILE)gcc
+ VER     = -DVER=$(version)
+-CFLAGS	= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
++CFLAGS	+= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
+ LDLIBS	= -lm -lrt $(EXTRA_LDFLAGS)
+ PRG	= ptp4l pmc phc2sys hwstamp_ctl phc_ctl timemaster
+ OBJ     = bmc.o clock.o clockadj.o clockcheck.o config.o fault.o \
+@@ -33,7 +33,7 @@
+ SRC	= $(OBJECTS:.o=.c)
+ DEPEND	= $(OBJECTS:.o=.d)
+ srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
+-incdefs := $(shell $(srcdir)/incdefs.sh)
++incdefs := $(shell CC="$(CC)" $(srcdir)/incdefs.sh)
+ version := $(shell $(srcdir)/version.sh $(srcdir))
+ VPATH	= $(srcdir)
+ 
diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
new file mode 100644
index 0000000..7e4a77b
--- /dev/null
+++ b/package/linuxptp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LINUXPTP
+	bool "Linux PTP"
+	help
+	  The Linux PTP Project is the Precision Time Protocol
+	  implementation according to IEEE standard 1588 for Linux.
+
+	  The dual design goals are to provide a robust implementation
+	  of the standard and to use the most relevant and modern
+	  Application Programming Interfaces (API) offered by the Linux
+	  kernel. Supporting legacy APIs and other platforms is not a
+	  goal.
+
+	  http://linuxptp.sourceforge.net/
diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
new file mode 100755
index 0000000..50b9e96
--- /dev/null
+++ b/package/linuxptp/S65ptp4l
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Start ptp4l
+#
+
+start() {
+	printf "Starting ptp4l: "
+	start-stop-daemon -S -b -q -p /var/run/ptp4l.pid \
+		-x /usr/sbin/ptp4l -- -A -i eth0
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping ptp4l: "
+	start-stop-daemon -K -q -p /var/run/ptp4l.pid \
+		-x /usr/sbin/ptp4l
+	echo "OK"
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
new file mode 100644
index 0000000..1ac9443
--- /dev/null
+++ b/package/linuxptp/linuxptp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	fa8e00f6ec73cefa7bb313dce7f60dfe5eb9e2bde3353594e9ac18edc93e5165  linuxptp-1.8.tgz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
new file mode 100644
index 0000000..6f8094a
--- /dev/null
+++ b/package/linuxptp/linuxptp.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# Linux PTP
+#
+################################################################################
+
+LINUXPTP_VERSION = 1.8
+LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
+LINUXPTP_SITE = http://sourceforge.net/projects/linuxptp/files/v$(LINUXPTP_VERSION)
+LINUXPTP_LICENSE = GPL-2.0+
+LINUXPTP_LICENSE_FILES = COPYING
+
+define LINUXPTP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" \
+		-C $(@D) all
+endef
+
+define LINUXPTP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) -C $(@D) install
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(@D)/package/linuxptp/S65ptp4l \
+		$(TARGET_DIR)/etc/init.d/S65ptp4l
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/ptp4l.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/ptp4l.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptp4l.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/linuxptp/ptp4l.service b/package/linuxptp/ptp4l.service
new file mode 100644
index 0000000..ec6bbc5
--- /dev/null
+++ b/package/linuxptp/ptp4l.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptp4l -A -i eth0
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
