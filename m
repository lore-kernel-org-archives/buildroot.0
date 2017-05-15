From: Petr Kulhavy <brain@jikos.cz>
Date: Mon, 15 May 2017 23:47:21 +0200
Subject: [Buildroot] [PATCH v5 1/1] linuxptp: new package
Message-ID: <1494884841-20639-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux PTP Project package.
http://linuxptp.sourceforge.net/

The SysV and systemd init scripts start the daemon in slave-only mode on eth0
and synchronize the system clock to PTP.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
--
Changes v4 -> v5:
	- move ptp4l parameters into a config file /etc/linuxptp.cfg
	- add step threshold of 1 second into the configuration to quickly correct large errors
	- add systemd service for phc2sys to sync the system clock

Changes v3 -> v4:
	- rename init scripts to linuxptp
	- use git format of the additional patches
	- use the package name in menuconfig 
	- clean-up the clock_nanosleep patch

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
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 .../linuxptp/0001-Add-missing-time.h-header.patch  | 27 +++++++
 .../0002-Remove-conflicting-netinet-ether.h.patch  | 32 ++++++++
 .../0003-Fix-detection-of-clock_adjtime.patch      | 30 +++++++
 ...0004-Improve-detection-of-clock_nanosleep.patch | 94 ++++++++++++++++++++++
 package/linuxptp/Config.in                         | 13 +++
 package/linuxptp/S65linuxptp                       | 46 +++++++++++
 package/linuxptp/linuxptp-system-clock.service     | 11 +++
 package/linuxptp/linuxptp.cfg                      | 19 +++++
 package/linuxptp/linuxptp.hash                     |  2 +
 package/linuxptp/linuxptp.mk                       | 43 ++++++++++
 package/linuxptp/linuxptp.service                  | 11 +++
 13 files changed, 332 insertions(+)
 create mode 100644 package/linuxptp/0001-Add-missing-time.h-header.patch
 create mode 100644 package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch
 create mode 100644 package/linuxptp/0003-Fix-detection-of-clock_adjtime.patch
 create mode 100644 package/linuxptp/0004-Improve-detection-of-clock_nanosleep.patch
 create mode 100644 package/linuxptp/Config.in
 create mode 100755 package/linuxptp/S65linuxptp
 create mode 100644 package/linuxptp/linuxptp-system-clock.service
 create mode 100644 package/linuxptp/linuxptp.cfg
 create mode 100644 package/linuxptp/linuxptp.hash
 create mode 100644 package/linuxptp/linuxptp.mk
 create mode 100644 package/linuxptp/linuxptp.service

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
diff --git a/package/linuxptp/0001-Add-missing-time.h-header.patch b/package/linuxptp/0001-Add-missing-time.h-header.patch
new file mode 100644
index 0000000..35eeb0c
--- /dev/null
+++ b/package/linuxptp/0001-Add-missing-time.h-header.patch
@@ -0,0 +1,27 @@
+From f0288b9b29f7642c8d9dcaa90a382ede2ed7a1c4 Mon Sep 17 00:00:00 2001
+From: Petr Kulhavy <brain@jikos.cz>
+Date: Mon, 15 May 2017 09:34:12 +0200
+Subject: [PATCH] Add missing time.h header
+
+On some targets the time_t structure was missing and the compilation was failing.
+
+Signed-off-by: Petr Kulhavy <brain@jikos.cz>
+---
+ util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/util.h b/util.h
+index e912f19..3efde5c 100644
+--- a/util.h
++++ b/util.h
+@@ -22,6 +22,7 @@
+ 
+ #include "ddt.h"
+ #include "ether.h"
++#include <time.h>
+ 
+ /**
+  * Table of human readable strings, one for each port state.
+-- 
+2.7.4
+
diff --git a/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch b/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch
new file mode 100644
index 0000000..28ddb15
--- /dev/null
+++ b/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch
@@ -0,0 +1,32 @@
+From 8e8db2a5b90a611be39922694c7bdacbffbabcd5 Mon Sep 17 00:00:00 2001
+From: Petr Kulhavy <brain@jikos.cz>
+Date: Mon, 15 May 2017 09:36:30 +0200
+Subject: [PATCH] Remove conflicting netinet/ether.h
+
+On some platforms like br-arm-cortex-a9-musl struct ethhdr was defined twice
+due to including of both linux/if_ether.h and netinet/ether.h. Which lead
+to a compilation error.
+
+Remove netinet/ether.h as the official header for struct ethhdr is
+linux/if_ether.h
+
+Signed-off-by: Petr Kulhavy <brain@jikos.cz>
+---
+ raw.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/raw.c b/raw.c
+index f51c829..73e45b4 100644
+--- a/raw.c
++++ b/raw.c
+@@ -20,7 +20,6 @@
+ #include <fcntl.h>
+ #include <linux/filter.h>
+ #include <linux/if_ether.h>
+-#include <net/ethernet.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <netpacket/packet.h>
+-- 
+2.7.4
+
diff --git a/package/linuxptp/0003-Fix-detection-of-clock_adjtime.patch b/package/linuxptp/0003-Fix-detection-of-clock_adjtime.patch
new file mode 100644
index 0000000..d646344
--- /dev/null
+++ b/package/linuxptp/0003-Fix-detection-of-clock_adjtime.patch
@@ -0,0 +1,30 @@
+From bb4acc0411667e3250b874d987db502318e25d46 Mon Sep 17 00:00:00 2001
+From: Petr Kulhavy <brain@jikos.cz>
+Date: Mon, 15 May 2017 10:03:53 +0200
+Subject: [PATCH] Fix detection of clock_adjtime
+
+On some platforms clock_adjtime is defined in timex.h instead of time.h
+Due to this fact the detection in incdefs.sh was failing.
+Add timex.h into the list of searched files.
+
+Signed-off-by: Petr Kulhavy <brain@jikos.cz>
+---
+ incdefs.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/incdefs.sh b/incdefs.sh
+index 34e227f..8232b5c 100755
+--- a/incdefs.sh
++++ b/incdefs.sh
+@@ -31,7 +31,7 @@ user_flags()
+ 
+ 	# Look for clock_adjtime().
+ 	for d in $dirs; do
+-		files=$(find $d -type f -name time.h)
++		files=$(find $d -type f -name time.h -o -name timex.h)
+ 		for f in $files; do
+ 			if grep -q clock_adjtime $f; then
+ 				printf " -DHAVE_CLOCK_ADJTIME"
+-- 
+2.7.4
+
diff --git a/package/linuxptp/0004-Improve-detection-of-clock_nanosleep.patch b/package/linuxptp/0004-Improve-detection-of-clock_nanosleep.patch
new file mode 100644
index 0000000..7f106e1
--- /dev/null
+++ b/package/linuxptp/0004-Improve-detection-of-clock_nanosleep.patch
@@ -0,0 +1,94 @@
+From 66ef9389a7f22c922cb3eef3e5b0f85a6abb0345 Mon Sep 17 00:00:00 2001
+From: Petr Kulhavy <brain@jikos.cz>
+Date: Mon, 15 May 2017 10:07:18 +0200
+Subject: [PATCH] Improve detection of clock_nanosleep
+
+On some platforms compilation issues due to clock_nanosleep were occuring. The
+simple test for __uClinux__ was not sufficient.
+
+Implement full detection of clock_nanosleep in incdefs.sh by compiling a short C
+file.  incdefs.sh now sets a new HAVE_CLOCK_NANOSLEEP literal. missing.h is
+changed accordingly.
+
+For proper cross-compilation makefile passes the CC variable to incdefs.sh.
+
+Signed-off-by: Petr Kulhavy <brain@jikos.cz>
+---
+ incdefs.sh | 14 ++++++++++++++
+ makefile   |  2 +-
+ missing.h  | 15 +++++++++------
+ 3 files changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/incdefs.sh b/incdefs.sh
+index 8232b5c..9a870ac 100755
+--- a/incdefs.sh
++++ b/incdefs.sh
+@@ -40,6 +40,20 @@ user_flags()
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
+diff --git a/makefile b/makefile
+index f898336..70d2651 100644
+--- a/makefile
++++ b/makefile
+@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
+ SRC	= $(OBJECTS:.o=.c)
+ DEPEND	= $(OBJECTS:.o=.d)
+ srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
+-incdefs := $(shell $(srcdir)/incdefs.sh)
++incdefs := $(shell CC="$(CC)" $(srcdir)/incdefs.sh)
+ version := $(shell $(srcdir)/version.sh $(srcdir))
+ VPATH	= $(srcdir)
+ 
+diff --git a/missing.h b/missing.h
+index f7efd92..7279ece 100644
+--- a/missing.h
++++ b/missing.h
+@@ -69,18 +69,21 @@ static inline int clock_adjtime(clockid_t id, struct timex *tx)
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
+-- 
+2.7.4
+
diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
new file mode 100644
index 0000000..a5604ed
--- /dev/null
+++ b/package/linuxptp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LINUXPTP
+	bool "linuxptp"
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
diff --git a/package/linuxptp/S65linuxptp b/package/linuxptp/S65linuxptp
new file mode 100755
index 0000000..46b8921
--- /dev/null
+++ b/package/linuxptp/S65linuxptp
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# Start linuxptp
+#
+
+start() {
+	printf "Starting linuxptp daemon: "
+	start-stop-daemon -S -b -q -p /var/run/linuxptp-ptp4l.pid \
+		-x /usr/sbin/ptp4l -- -f /etc/linuxptp.cfg
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+
+	printf "Starting linuxptp system clock synchronization: "
+	start-stop-daemon -S -b -q -p /var/run/linuxptp-phc2sys.pid \
+		-x /usr/sbin/phc2sys -- -s eth0 -c CLOCK_REALTIME -w -S 1.0
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping linuxptp system clock synchronization: "
+	start-stop-daemon -K -q -p /var/run/linuxptp-phc2sys.pid \
+		-x /usr/sbin/phc2sys
+	echo "OK"
+
+	printf "Stopping linuxptp daemon: "
+	start-stop-daemon -K -q -p /var/run/linuxptp-ptp4l.pid \
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
diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
new file mode 100644
index 0000000..7327254
--- /dev/null
+++ b/package/linuxptp/linuxptp-system-clock.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Precision Time Protocol system clock synchronization
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
+WantedBy=linuxptp.service
diff --git a/package/linuxptp/linuxptp.cfg b/package/linuxptp/linuxptp.cfg
new file mode 100644
index 0000000..f9d02e8
--- /dev/null
+++ b/package/linuxptp/linuxptp.cfg
@@ -0,0 +1,19 @@
+# LinuxPTP configuration file for synchronizing the system clock to
+# a remote PTP master in slave-only mode.
+#
+# By default synchronize time in slave-only mode using UDP and hardware time
+# stamps on eth0. If the difference to master is >1.0 second correct by
+# stepping the clock instead of adjusting the frequency.
+#
+# If you change the configuration don't forget to update the phc2sys
+# parameters accordingly in linuxptp-system-clock.service (systemd)
+# or the linuxptp SysV init script.
+
+[global]
+slaveOnly		1
+delay_mechanism		Auto
+network_transport	UDPv4
+time_stamping		hardware
+step_threshold		1.0
+
+[eth0]
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
index 0000000..d7b470d
--- /dev/null
+++ b/package/linuxptp/linuxptp.mk
@@ -0,0 +1,43 @@
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
+
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
+		$(TARGET_DIR)/etc/linuxptp.cfg
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(@D)/package/linuxptp/S65linuxptp \
+		$(TARGET_DIR)/etc/init.d/S65linuxptp
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/linuxptp.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/linuxptp.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/linuxptp/linuxptp.service b/package/linuxptp/linuxptp.service
new file mode 100644
index 0000000..f690430
--- /dev/null
+++ b/package/linuxptp/linuxptp.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+Wants=linuxptp-system-clock.service
+
+[Service]
+ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp.cfg
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
