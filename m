From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Jan 2020 23:08:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: drop package
Message-ID: <20200112220839.3720326-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BlueZ 4.x is deprecated since a long time (BlueZ 5.x has been released
in 2012) so drop it.

For cwwiid, sconeserver and ussp-push, replace bluez_utils by
bluez5_utils. All other packages already support bluez5_utils so just
drop bluez_utils.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  10 ++
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 package/asterisk/asterisk.mk                  |   5 +-
 package/bluez-alsa/Config.in                  |   2 -
 package/bluez-tools/Config.in                 |   4 +-
 package/bluez-tools/bluez-tools.mk            |  22 +---
 package/bluez5_utils/Config.in                |   4 -
 .../0001-enable_cg2900_on_upstream_4.91.patch | 106 -----------------
 ...0002-tools-hciconfig-include-fcntl.h.patch |  27 -----
 ...003-fix-compilation-issues-with-musl.patch |  61 ----------
 .../0004-test-add-missing-header.patch        |  34 ------
 ...avoid-conflict-with-encrypt-function.patch | 107 ------------------
 ...x-build-after-y2038-changes-in-glibc.patch |  68 -----------
 .../0007-fix-lib-bluetooth-h-with-c99.patch   |  31 -----
 package/bluez_utils/Config.in                 |  48 --------
 package/bluez_utils/bluez_utils.hash          |   5 -
 package/bluez_utils/bluez_utils.mk            |  61 ----------
 package/cwiid/Config.in                       |  10 +-
 package/cwiid/cwiid.mk                        |   2 +-
 package/gpsd/gpsd.mk                          |   4 +-
 package/gstreamer1/gst1-plugins-bad/Config.in |   4 -
 package/kodi/Config.in                        |   1 -
 package/libsigrok/libsigrok.mk                |   5 +-
 package/ofono/ofono.mk                        |   5 +-
 package/openobex/openobex.mk                  |   4 -
 package/qt5/qt5connectivity/Config.in         |   7 +-
 .../qt5/qt5connectivity/qt5connectivity.mk    |   5 +-
 package/sconeserver/Config.in                 |  10 +-
 package/sconeserver/sconeserver.mk            |   2 +-
 package/ussp-push/Config.in                   |   4 +-
 package/ussp-push/ussp-push.mk                |   2 +-
 32 files changed, 37 insertions(+), 625 deletions(-)
 delete mode 100644 package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch
 delete mode 100644 package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch
 delete mode 100644 package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
 delete mode 100644 package/bluez_utils/0004-test-add-missing-header.patch
 delete mode 100644 package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
 delete mode 100644 package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch
 delete mode 100644 package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
 delete mode 100644 package/bluez_utils/Config.in
 delete mode 100644 package/bluez_utils/bluez_utils.hash
 delete mode 100644 package/bluez_utils/bluez_utils.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1801ec06da..8247cbf476 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_BLUEZ_UTILS
+	bool "bluez-utils was removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS
+	help
+	  The bluez-utils (BlueZ 4.x) package was removed as it is
+	  deprecated since a long time. As an alternative, the
+	  bluez5-utils (BlueZ 5.x) has been automatically selected in
+	  your configuration.
+
 config BR2_PACKAGE_WIREGUARD
 	bool "wireguard package renamed"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
diff --git a/DEVELOPERS b/DEVELOPERS
index d7b14d14b4..5a6c1cd076 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2584,7 +2584,6 @@ F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/acl/
 F:	package/attr/
-F:	package/bluez_utils/
 F:	package/boost/
 F:	package/bootstrap/
 F:	package/cannelloni/
diff --git a/package/Config.in b/package/Config.in
index 1049e3735f..4c6eeb0ae5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,7 +1949,6 @@ menu "Networking applications"
 	source "package/bind/Config.in"
 	source "package/bird/Config.in"
 	source "package/bluez-tools/Config.in"
-	source "package/bluez_utils/Config.in"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index bfdcb49e8f..cea287f0d7 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -136,10 +136,7 @@ else
 ASTERISK_CONF_OPTS += --without-asound
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-ASTERISK_DEPENDENCIES += bluez_utils
-ASTERISK_CONF_OPTS += --with-bluetooth
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 ASTERISK_DEPENDENCIES += bluez5_utils
 ASTERISK_CONF_OPTS += --with-bluetooth
 else
diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index e52933f07c..2f103f409c 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BLUEZ_ALSA
 	bool "bluez-alsa"
 	depends on !BR2_STATIC_LIBS # bluez5
-	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
@@ -39,4 +38,3 @@ comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic li
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/bluez-tools/Config.in b/package/bluez-tools/Config.in
index 5a1b7d0412..6db874b23a 100644
--- a/package/bluez-tools/Config.in
+++ b/package/bluez-tools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BLUEZ_TOOLS
 	bool "bluez-tools"
-	depends on BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
+	depends on BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
@@ -14,6 +14,6 @@ config BR2_PACKAGE_BLUEZ_TOOLS
 	  https://github.com/khvzak/bluez-tools
 
 comment "bluez-tools needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
+	depends on BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez-tools/bluez-tools.mk b/package/bluez-tools/bluez-tools.mk
index 49891bd2d1..c58701981a 100644
--- a/package/bluez-tools/bluez-tools.mk
+++ b/package/bluez-tools/bluez-tools.mk
@@ -4,33 +4,13 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-# this is the last version compatible with BlueZ 4 API
-BLUEZ_TOOLS_VERSION = 171181b6ef6c94aefc828dc7fd8de136b9f97532
-else
 BLUEZ_TOOLS_VERSION = 97efd293491ad7ec96a655665339908f2478b3d1
-endif
 BLUEZ_TOOLS_SITE = $(call github,khvzak,bluez-tools,$(BLUEZ_TOOLS_VERSION))
 
 # sources fetched from github, no configure script)
 BLUEZ_TOOLS_AUTORECONF = YES
-BLUEZ_TOOLS_DEPENDENCIES = host-pkgconf dbus dbus-glib
+BLUEZ_TOOLS_DEPENDENCIES = host-pkgconf dbus dbus-glib bluez5_utils readline
 BLUEZ_TOOLS_LICENSE = GPL-2.0+
 BLUEZ_TOOLS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-BLUEZ_TOOLS_DEPENDENCIES += bluez_utils
-# readline is an optional dependency when used with bluez_utils
-# obex support depends on readline so enable it optionally
-ifeq ($(BR2_PACKAGE_READLINE),y)
-BLUEZ_TOOLS_CONF_OPTS += --enable-obex
-BLUEZ_TOOLS_DEPENDENCIES += readline
-else
-BLUEZ_TOOLS_CONF_OPTS += --disable-obex
-endif
-else
-# readline is a hard dependency when used with bluez5_utils
-BLUEZ_TOOLS_DEPENDENCIES += bluez5_utils readline
-endif
-
 $(eval $(autotools-package))
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index c5e8dfbcf7..488a2f79c8 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	depends on !BR2_STATIC_LIBS # uses dlfcn
-	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DBUS
@@ -100,6 +99,3 @@ comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4, dynam
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-
-comment "bluez5-utils conflicts with older bluez-utils version"
-	depends on BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch b/package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch
deleted file mode 100644
index e80af5fd90..0000000000
--- a/package/bluez_utils/0001-enable_cg2900_on_upstream_4.91.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From ac7992081abba87627c9e91735b3309584b48585 Mon Sep 17 00:00:00 2001
-From: Gregory Hermant <gregory.hermant@calao-systems.com>
-Date: Wed, 14 Nov 2012 14:27:02 +0100
-Subject: [PATCH] add support for the ST-Ericsson CG2900 GPS FM Bluetooth
- combo controller
-
-
-Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
----
- tools/hciattach.c |   22 +++++++++++++++-------
- tools/hciattach.h |    1 +
- 2 files changed, 16 insertions(+), 7 deletions(-)
-
-diff --git a/tools/hciattach.c b/tools/hciattach.c
-index e4d5aa1..7f08243 100644
---- a/tools/hciattach.c
-+++ b/tools/hciattach.c
-@@ -1066,6 +1066,11 @@ struct uart_t uart[] = {
- 	{ "texasalt",   0x0000, 0x0000, HCI_UART_LL,   115200, 115200,
- 				FLOW_CTL, DISABLE_PM, NULL, texasalt, NULL   },
- 
-+	/* ST-Ericsson CG2900 GPS FM Bluetooth combo controller */
-+	{ "cg2900",     0x0000, 0x0000, HCI_UART_STE,  115200, 115200,
-+				FLOW_CTL, DISABLE_PM, NULL, NULL     },
-+
-+
- 	/* ST Microelectronics minikits based on STLC2410/STLC2415 */
- 	{ "st",         0x0000, 0x0000, HCI_UART_H4,    57600, 115200,
- 				FLOW_CTL, DISABLE_PM,  NULL, st       },
-@@ -1157,10 +1162,10 @@ static struct uart_t * get_by_type(char *type)
- }
- 
- /* Initialize UART driver */
--static int init_uart(char *dev, struct uart_t *u, int send_break, int raw)
-+static int init_uart(char *dev, struct uart_t *u, int send_break, int raw, int line_disc)
- {
- 	struct termios ti;
--	int fd, i;
-+	int fd;
- 	unsigned long flags = 0;
- 
- 	if (raw)
-@@ -1217,8 +1222,7 @@ static int init_uart(char *dev, struct uart_t *u, int send_break, int raw)
- 	}
- 
- 	/* Set TTY to N_HCI line discipline */
--	i = N_HCI;
--	if (ioctl(fd, TIOCSETD, &i) < 0) {
-+	if (ioctl(fd, TIOCSETD, &line_disc) < 0) {
- 		perror("Can't set line discipline");
- 		return -1;
- 	}
-@@ -1243,7 +1247,7 @@ static void usage(void)
- {
- 	printf("hciattach - HCI UART driver initialization utility\n");
- 	printf("Usage:\n");
--	printf("\thciattach [-n] [-p] [-b] [-r] [-t timeout] [-s initial_speed] <tty> <type | id> [speed] [flow|noflow] [bdaddr]\n");
-+	printf("\thciattach [-n] [-p] [-a line_disc_nr] [-b] [-r] [-t timeout] [-s initial_speed] <tty> <type | id> [speed] [flow|noflow] [bdaddr]\n");
- 	printf("\thciattach -l\n");
- }
- 
-@@ -1252,6 +1256,7 @@ int main(int argc, char *argv[])
- 	struct uart_t *u = NULL;
- 	int detach, printpid, raw, opt, i, n, ld, err;
- 	int to = 10;
-+	int line_disc = N_HCI;
- 	int init_speed = 0;
- 	int send_break = 0;
- 	pid_t pid;
-@@ -1264,8 +1269,11 @@ int main(int argc, char *argv[])
- 	printpid = 0;
- 	raw = 0;
- 
--	while ((opt=getopt(argc, argv, "bnpt:s:lr")) != EOF) {
-+	while ((opt=getopt(argc, argv, "bnpt:s:lra:")) != EOF) {
- 		switch(opt) {
-+		case 'a':
-+                        line_disc = atoi(optarg);
-+                        break;
- 		case 'b':
- 			send_break = 1;
- 			break;
-@@ -1381,7 +1389,7 @@ int main(int argc, char *argv[])
- 	alarm(to);
- 	bcsp_max_retries = to;
- 
--	n = init_uart(dev, u, send_break, raw);
-+	n = init_uart(dev, u, send_break, raw, line_disc);
- 	if (n < 0) {
- 		perror("Can't initialize device");
- 		exit(1);
-diff --git a/tools/hciattach.h b/tools/hciattach.h
-index fed0d11..09b534d 100644
---- a/tools/hciattach.h
-+++ b/tools/hciattach.h
-@@ -39,6 +39,7 @@
- #define HCI_UART_H4DS	3
- #define HCI_UART_LL	4
- #define HCI_UART_ATH3K  5
-+#define HCI_UART_STE	6
- 
- #define HCI_UART_RAW_DEVICE	0
- 
--- 
-1.7.9.5
-
diff --git a/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch b/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch
deleted file mode 100644
index 7d0763ff03..0000000000
--- a/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ae607756a5f2a09bce1fc3a52e74b5f471245e33 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 6 Apr 2015 23:54:19 +0200
-Subject: [PATCH] tools/hciconfig: include <fcntl.h>
-
-Needed to get the definition of mode_t in musl.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/hciconfig.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/hciconfig.c b/tools/hciconfig.c
-index f1458b9..6776d62 100644
---- a/tools/hciconfig.c
-+++ b/tools/hciconfig.c
-@@ -34,6 +34,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <getopt.h>
-+#include <fcntl.h>
- #include <sys/param.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
--- 
-2.1.0
-
diff --git a/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch b/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
deleted file mode 100644
index d8b48eaad2..0000000000
--- a/package/bluez_utils/0003-fix-compilation-issues-with-musl.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 8aa6aa4ba2d9d00c91e36e146895af20cbc00d17 Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Wed, 2 Sep 2015 12:10:58 +0100
-Subject: [PATCH 1/1] fix compilation issues with musl.
-
-- sys/time.h needed for struct timeval
-- unistd.h should not be included due to clash with encrypt(3)
-- sys/types.h needed for mode_t
-
-Note that this version of bluez is 3 years old. Recent fixes have gone
-into the upstream to address musl compatibility issues, but the upstream
-has changed so much that it makes little sense to try to backport these.
-This patch is really a stopgap until we move to the latest upstream.
-
-Upstream-Status: not needed
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- compat/bnep.c  | 1 +
- compat/dund.c  | 1 -
- src/textfile.h | 1 +
- 3 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/compat/bnep.c b/compat/bnep.c
-index 281350b..49226c1 100644
---- a/compat/bnep.c
-+++ b/compat/bnep.c
-@@ -32,6 +32,7 @@
- #include <stdlib.h>
- #include <sys/socket.h>
- #include <sys/ioctl.h>
-+#include <sys/time.h>
- 
- #include <bluetooth/bluetooth.h>
- #include <bluetooth/bnep.h>
-diff --git a/compat/dund.c b/compat/dund.c
-index af1b536..c2f085f 100644
---- a/compat/dund.c
-+++ b/compat/dund.c
-@@ -29,7 +29,6 @@
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <unistd.h>
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
-diff --git a/src/textfile.h b/src/textfile.h
-index dc5fc2b..0148b30 100644
---- a/src/textfile.h
-+++ b/src/textfile.h
-@@ -24,6 +24,7 @@
- #ifndef __TEXTFILE_H
- #define __TEXTFILE_H
- 
-+#include <sys/types.h>
- int create_dirs(const char *filename, const mode_t mode);
- int create_file(const char *filename, const mode_t mode);
- int create_name(char *buf, size_t size, const char *path,
--- 
-2.4.3
-
diff --git a/package/bluez_utils/0004-test-add-missing-header.patch b/package/bluez_utils/0004-test-add-missing-header.patch
deleted file mode 100644
index c74afb8304..0000000000
--- a/package/bluez_utils/0004-test-add-missing-header.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d3c098c2fde55ddf0c7d56eae56925103d35da73 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 13 May 2017 18:56:51 +0200
-Subject: [PATCH] test: add missing header
-
-test/attest.c: In function 'at_command':
-test/attest.c:43:2: error: unknown type name 'fd_set'
-  fd_set rfds;
-  ^
-
-Fixes:
-http://autobuild.buildroot.net/results/06c/06c930d9c5299b79500d018ac3fb2861ce834c7c/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- test/attest.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/test/attest.c b/test/attest.c
-index 12ba682..2626cf1 100644
---- a/test/attest.c
-+++ b/test/attest.c
-@@ -35,6 +35,8 @@
- #include <sys/ioctl.h>
- #include <sys/socket.h>
- 
-+#include <sys/select.h>
-+
- #include <bluetooth/bluetooth.h>
- #include <bluetooth/rfcomm.h>
- 
--- 
-2.9.3
-
diff --git a/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch b/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
deleted file mode 100644
index 438da97cb1..0000000000
--- a/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From d8056252d0c99bfb2482f0a420dcf9a36019ddf8 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 13 May 2017 18:58:51 +0200
-Subject: [PATCH] test: avoid conflict with encrypt function
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With a musl based toolchain:
-
-test/l2test.c:110:12: error: ?encrypt? redeclared as different kind of symbol
- static int encrypt = 0;
-            ^
-In file included from test/l2test.c:34:0:
-[...]/sysroot/usr/include/unistd.h:145:6: note: previous declaration of ?encrypt? was here
- void encrypt(char *, int);
-      ^
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- test/l2test.c | 8 ++++----
- test/rctest.c | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/test/l2test.c b/test/l2test.c
-index f66486d..9ef6faf 100644
---- a/test/l2test.c
-+++ b/test/l2test.c
-@@ -107,7 +107,7 @@ static char *filename = NULL;
- static int rfcmode = 0;
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int _encrypt = 0;
- static int secure = 0;
- static int socktype = SOCK_SEQPACKET;
- static int linger = 0;
-@@ -340,7 +340,7 @@ static int do_connect(char *svr)
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (_encrypt)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(int sk))
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (_encrypt)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			_encrypt = 1;
- 			break;
- 
- 		case 'S':
-diff --git a/test/rctest.c b/test/rctest.c
-index 4d7c90a..7ad5a0b 100644
---- a/test/rctest.c
-+++ b/test/rctest.c
-@@ -79,7 +79,7 @@ static char *filename = NULL;
- 
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int _encrypt = 0;
- static int secure = 0;
- static int socktype = SOCK_STREAM;
- static int linger = 0;
-@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (_encrypt)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(int sk))
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (_encrypt)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			_encrypt = 1;
- 			break;
- 
- 		case 'S':
--- 
-2.9.3
-
diff --git a/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch b/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch
deleted file mode 100644
index fd81a93ba2..0000000000
--- a/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f36f71f60b1e68c0f12e615b9b128d089ec3dd19 Mon Sep 17 00:00:00 2001
-From: Bastien Nocera <hadess@hadess.net>
-Date: Fri, 7 Jun 2019 09:51:33 +0200
-Subject: tools: Fix build after y2038 changes in glibc
-
-The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
-to fix the build.
-[Retrieved (and backported) from:
-https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/tools/?id=f36f71f60b1e68c0f12e615b9b128d089ec3dd19]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- test/l2test.c | 6 +++++-
- test/rctest.c | 6 +++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-(limited to 'tools')
-
-diff --git a/test/l2test.c b/test/l2test.c
-index e755ac881..e787c2ce2 100644
---- a/test/l2test.c
-+++ b/test/l2test.c
-@@ -55,6 +55,10 @@
- #define BREDR_DEFAULT_PSM	0x1011
- #define LE_DEFAULT_PSM		0x0080
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -907,7 +911,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
-diff --git a/test/rctest.c b/test/rctest.c
-index 94490f462..bc8ed875d 100644
---- a/test/rctest.c
-+++ b/test/rctest.c
-@@ -50,6 +50,10 @@
- 
- #include "src/shared/util.h"
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -505,7 +509,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
--- 
-cgit 1.2-0.3.lf.el7
-
diff --git a/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch b/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
deleted file mode 100644
index 3738baf1f5..0000000000
--- a/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-http://permalink.gmane.org/gmane.linux.bluez.kernel/22306
-
-[Retrieved from:
-https://428282.bugs.gentoo.org/attachment.cgi?id=319374]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff --git a/lib/bluetooth.h b/lib/bluetooth.h
-index 0541842..5b2153d 100644
---- a/lib/bluetooth.h
-+++ b/lib/bluetooth.h
-@@ -140,16 +140,16 @@ enum {
- #define bt_get_unaligned(ptr)			\
- ({						\
- 	struct __attribute__((packed)) {	\
--		typeof(*(ptr)) __v;		\
--	} *__p = (typeof(__p)) (ptr);		\
-+		__typeof__(*(ptr)) __v;		\
-+	} *__p = (__typeof__(__p)) (ptr);	\
- 	__p->__v;				\
- })
- 
- #define bt_put_unaligned(val, ptr)		\
- do {						\
- 	struct __attribute__((packed)) {	\
--		typeof(*(ptr)) __v;		\
--	} *__p = (typeof(__p)) (ptr);		\
-+		__typeof__(*(ptr)) __v;		\
-+	} *__p = (__typeof__(__p)) (ptr);	\
- 	__p->__v = (val);			\
- } while(0)
- 
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
deleted file mode 100644
index 327d26bce3..0000000000
--- a/package/bluez_utils/Config.in
+++ /dev/null
@@ -1,48 +0,0 @@
-config BR2_PACKAGE_BLUEZ_UTILS
-	bool "bluez-utils"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
-	select BR2_PACKAGE_CHECK
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  bluez utils
-
-	  http://www.kernel.org/pub/linux/bluetooth
-
-if BR2_PACKAGE_BLUEZ_UTILS
-
-config BR2_PACKAGE_BLUEZ_UTILS_COMPAT
-	bool "BlueZ 3.x compatibility binaries"
-	help
-	  BlueZ 3.x compatibility binaries like pand, hidd, sdp
-
-config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
-	bool "audio support"
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_LIBSNDFILE
-	help
-	  Audio support
-
-config BR2_PACKAGE_BLUEZ_UTILS_USB
-	bool "USB support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  USB support
-
-config BR2_PACKAGE_BLUEZ_UTILS_GATT
-	bool "GATT support"
-	select BR2_PACKAGE_READLINE
-	help
-	  Generic Attribute Profile (GATT) support. This provides
-	  profile discovery and description services for Bluetooth Low
-	  Energy.
-	  This will install the gatttool utility.
-endif
-
-comment "bluez-utils needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/bluez_utils/bluez_utils.hash b/package/bluez_utils/bluez_utils.hash
deleted file mode 100644
index 39e750eacc..0000000000
--- a/package/bluez_utils/bluez_utils.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256	41f9578bef39b8c94a2d6ddeaa556afd22d136936d0f03100e422fe970a45a7d  bluez-4.101.tar.xz
-# License files, locally calculated
-sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
-sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
deleted file mode 100644
index 256f012df9..0000000000
--- a/package/bluez_utils/bluez_utils.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# bluez_utils
-#
-################################################################################
-
-BLUEZ_UTILS_VERSION = 4.101
-BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
-BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
-BLUEZ_UTILS_INSTALL_STAGING = YES
-BLUEZ_UTILS_DEPENDENCIES = host-pkgconf check dbus libglib2
-BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
-BLUEZ_UTILS_AUTORECONF = YES
-BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
-BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
-
-# BlueZ 3.x compatibility
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
-BLUEZ_UTILS_CONF_OPTS += \
-	--enable-hidd \
-	--enable-pand \
-	--enable-sdp \
-	--enable-dund
-endif
-
-# audio support
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_AUDIO),y)
-BLUEZ_UTILS_DEPENDENCIES += \
-	alsa-lib \
-	libsndfile
-BLUEZ_UTILS_CONF_OPTS += \
-	--enable-alsa \
-	--enable-audio
-else
-BLUEZ_UTILS_CONF_OPTS += \
-	--disable-alsa \
-	--disable-audio
-endif
-
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
-BLUEZ_UTILS_DEPENDENCIES += readline
-BLUEZ_UTILS_CONF_OPTS += --enable-gatt
-else
-BLUEZ_UTILS_CONF_OPTS += --disable-gatt
-endif
-
-# USB support
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
-BLUEZ_UTILS_DEPENDENCIES += libusb
-BLUEZ_UTILS_CONF_OPTS += \
-	--enable-usb
-else
-BLUEZ_UTILS_CONF_OPTS += \
-	--disable-usb
-endif
-
-ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-BLUEZ_UTILS_CONF_OPTS += --disable-pie
-endif
-
-$(eval $(autotools-package))
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 7ee8117355..35e0c45557 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_CWIID
 	bool "cwiid"
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
-	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
-	select BR2_PACKAGE_BLUEZ_UTILS
+	depends on !BR2_STATIC_LIBS # bluez5_utils
+	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, alsa-lib, libglib2
+	depends on BR2_USE_MMU # bluez5_utils -> dbus, libglib2
+	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index c092e401df..a11c56c0aa 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -12,7 +12,7 @@ CWIID_LICENSE_FILES = COPYING
 CWIID_AUTORECONF = YES
 CWIID_INSTALL_STAGING = YES
 
-CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez_utils
+CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez5_utils
 
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 93f1aeeb73..49de4b256c 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -56,9 +56,7 @@ GPSD_SCONS_OPTS += usb=no
 endif
 
 # If bluetooth is available build it before so the package can use it
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-GPSD_DEPENDENCIES += bluez_utils
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 GPSD_DEPENDENCIES += bluez5_utils
 else
 GPSD_SCONS_OPTS += bluez=no
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d831f8072e..08de5d2188 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -314,7 +314,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
 	depends on BR2_USE_MMU # bluez5_utils -> dbus
 	depends on !BR2_STATIC_LIBS # bluez5_utils -> uses dlfcn
-	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils -> conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
@@ -327,9 +326,6 @@ comment "bluez plugin needs a toolchain w/ wchar, threads, headers >= 3.4, dynam
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 
-comment "bluez plugin conflicts with older bluez-utils version"
-	depends on BR2_PACKAGE_BLUEZ_UTILS
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index db6931ed8a..05e680ab08 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -109,7 +109,6 @@ config BR2_PACKAGE_KODI_AVAHI
 config BR2_PACKAGE_KODI_BLUEZ
 	bool "bluetooth"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
-	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 3495878db0..b7e777a916 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -16,10 +16,7 @@ LIBSIGROK_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check)
 LIBSIGROK_CONF_OPTS = --disable-java --disable-python --disable-ruby
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-LIBSIGROK_CONF_OPTS += --with-libbluez
-LIBSIGROK_DEPENDENCIES += bluez_utils
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 LIBSIGROK_CONF_OPTS += --with-libbluez
 LIBSIGROK_DEPENDENCIES += bluez5_utils
 else
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 2a6cc80719..57d6cab470 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -38,10 +38,7 @@ else
 OFONO_CONF_OPTS += --disable-udev
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-OFONO_CONF_OPTS += --enable-bluetooth
-OFONO_DEPENDENCIES += bluez_utils
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 OFONO_CONF_OPTS += --enable-bluetooth
 OFONO_DEPENDENCIES += bluez5_utils
 else
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index ea41f65a80..bc4a47e3d7 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -15,10 +15,6 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_INSTALL_STAGING = YES
 OPENOBEX_CONF_OPTS = -DBUILD_DOCUMENTATION=OFF
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-OPENOBEX_DEPENDENCIES += bluez_utils
-endif
-
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 OPENOBEX_DEPENDENCIES += bluez5_utils
 endif
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 8bda8de66a..182fe3ea9c 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
-	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
@@ -14,6 +14,5 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	  http://doc.qt.io/qt-5/qtbluetooth-index.html
 	  http://doc.qt.io/qt-5/qtnfc-index.html
 
-comment "qt5connectivity needs neard and/or bluez(5)_utils"
-	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ_UTILS && \
-		!BR2_PACKAGE_BLUEZ5_UTILS
+comment "qt5connectivity needs neard and/or bluez5_utils"
+	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ5_UTILS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 8e4e4669b9..0ade9876de 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -22,7 +22,6 @@ QT5CONNECTIVITY_LICENSE += , BSD-3-Clause (examples)
 endif
 
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarative)
-QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
@@ -39,7 +38,7 @@ define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
+ifneq ($(BR2_PACKAGE_BLUEZ5_UTILS),)
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
 endef
@@ -51,7 +50,7 @@ endef
 endif
 endif
 
-ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
+ifneq ($(BR2_PACKAGE_BLUEZ5_UTILS),)
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index e984801de5..049d98123e 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -44,11 +44,11 @@ config BR2_PACKAGE_SCONESERVER_MYSQL
 
 config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
-	depends on BR2_USE_WCHAR # bluez->libglib2
-	depends on BR2_USE_MMU # bluez->dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	select BR2_PACKAGE_BLUEZ_UTILS
+	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
+	depends on BR2_USE_MMU # bluez5_utils -> dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
+	depends on !BR2_STATIC_LIBS # bluez5_utils
+	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Bluetooth module for Sconeserver
 
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 6914599a21..9d4713afea 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -62,7 +62,7 @@ SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez_utils
+SCONESERVER_DEPENDENCIES += bluez5_utils
 SCONESERVER_CONF_OPTS += --with-bluetooth
 else
 SCONESERVER_CONF_OPTS += --without-bluetooth
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index aefec85a20..ef40ae7a53 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_USSP_PUSH
 	bool "ussp-push"
-	depends on !BR2_STATIC_LIBS # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez5_utils
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_OPENOBEX
-	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
 	  BlueTooth stack.
diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
index 0c45c291ac..c0479270a4 100644
--- a/package/ussp-push/ussp-push.mk
+++ b/package/ussp-push/ussp-push.mk
@@ -9,6 +9,6 @@ USSP_PUSH_SITE = http://www.xmailserver.org
 USSP_PUSH_LICENSE = GPL-2.0+
 USSP_PUSH_LICENSE_FILES = COPYING
 
-USSP_PUSH_DEPENDENCIES = bluez_utils openobex
+USSP_PUSH_DEPENDENCIES = bluez5_utils openobex
 
 $(eval $(autotools-package))
-- 
2.24.1
