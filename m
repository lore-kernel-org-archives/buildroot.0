From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 23 Dec 2013 10:37:24 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
Message-ID: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/Config.in                                  |   1 +
 package/bluez5_utils/Config.in                     |  16 ++++
 .../bluez5_utils-5.12-enable_cg2900.patch          | 106 +++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  31 ++++++
 package/bluez_utils/Config.in                      |   8 +-
 5 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 package/bluez5_utils/Config.in
 create mode 100644 package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch
 create mode 100644 package/bluez5_utils/bluez5_utils.mk

diff --git a/package/Config.in b/package/Config.in
index 490bef87a2eb..ff39f32b9b0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -770,6 +770,7 @@ source "package/axel/Config.in"
 source "package/bcusdk/Config.in"
 source "package/bind/Config.in"
 source "package/bluez_utils/Config.in"
+source "package/bluez5_utils/Config.in"
 source "package/bmon/Config.in"
 source "package/boa/Config.in"
 source "package/bridge-utils/Config.in"
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
new file mode 100644
index 000000000000..f0a71125e2ad
--- /dev/null
+++ b/package/bluez5_utils/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_BLUEZ5_UTILS
+	bool "bluez5-utils"
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
+	depends on BR2_USE_MMU # dbus, libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  bluez utils
+
+	  http://www.kernel.org/pub/linux/bluetooth
+
+comment "bluez5-utils needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32 && BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch b/package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch
new file mode 100644
index 000000000000..e80af5fd9006
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch
@@ -0,0 +1,106 @@
+From ac7992081abba87627c9e91735b3309584b48585 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Wed, 14 Nov 2012 14:27:02 +0100
+Subject: [PATCH] add support for the ST-Ericsson CG2900 GPS FM Bluetooth
+ combo controller
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ tools/hciattach.c |   22 +++++++++++++++-------
+ tools/hciattach.h |    1 +
+ 2 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/tools/hciattach.c b/tools/hciattach.c
+index e4d5aa1..7f08243 100644
+--- a/tools/hciattach.c
++++ b/tools/hciattach.c
+@@ -1066,6 +1066,11 @@ struct uart_t uart[] = {
+ 	{ "texasalt",   0x0000, 0x0000, HCI_UART_LL,   115200, 115200,
+ 				FLOW_CTL, DISABLE_PM, NULL, texasalt, NULL   },
+ 
++	/* ST-Ericsson CG2900 GPS FM Bluetooth combo controller */
++	{ "cg2900",     0x0000, 0x0000, HCI_UART_STE,  115200, 115200,
++				FLOW_CTL, DISABLE_PM, NULL, NULL     },
++
++
+ 	/* ST Microelectronics minikits based on STLC2410/STLC2415 */
+ 	{ "st",         0x0000, 0x0000, HCI_UART_H4,    57600, 115200,
+ 				FLOW_CTL, DISABLE_PM,  NULL, st       },
+@@ -1157,10 +1162,10 @@ static struct uart_t * get_by_type(char *type)
+ }
+ 
+ /* Initialize UART driver */
+-static int init_uart(char *dev, struct uart_t *u, int send_break, int raw)
++static int init_uart(char *dev, struct uart_t *u, int send_break, int raw, int line_disc)
+ {
+ 	struct termios ti;
+-	int fd, i;
++	int fd;
+ 	unsigned long flags = 0;
+ 
+ 	if (raw)
+@@ -1217,8 +1222,7 @@ static int init_uart(char *dev, struct uart_t *u, int send_break, int raw)
+ 	}
+ 
+ 	/* Set TTY to N_HCI line discipline */
+-	i = N_HCI;
+-	if (ioctl(fd, TIOCSETD, &i) < 0) {
++	if (ioctl(fd, TIOCSETD, &line_disc) < 0) {
+ 		perror("Can't set line discipline");
+ 		return -1;
+ 	}
+@@ -1243,7 +1247,7 @@ static void usage(void)
+ {
+ 	printf("hciattach - HCI UART driver initialization utility\n");
+ 	printf("Usage:\n");
+-	printf("\thciattach [-n] [-p] [-b] [-r] [-t timeout] [-s initial_speed] <tty> <type | id> [speed] [flow|noflow] [bdaddr]\n");
++	printf("\thciattach [-n] [-p] [-a line_disc_nr] [-b] [-r] [-t timeout] [-s initial_speed] <tty> <type | id> [speed] [flow|noflow] [bdaddr]\n");
+ 	printf("\thciattach -l\n");
+ }
+ 
+@@ -1252,6 +1256,7 @@ int main(int argc, char *argv[])
+ 	struct uart_t *u = NULL;
+ 	int detach, printpid, raw, opt, i, n, ld, err;
+ 	int to = 10;
++	int line_disc = N_HCI;
+ 	int init_speed = 0;
+ 	int send_break = 0;
+ 	pid_t pid;
+@@ -1264,8 +1269,11 @@ int main(int argc, char *argv[])
+ 	printpid = 0;
+ 	raw = 0;
+ 
+-	while ((opt=getopt(argc, argv, "bnpt:s:lr")) != EOF) {
++	while ((opt=getopt(argc, argv, "bnpt:s:lra:")) != EOF) {
+ 		switch(opt) {
++		case 'a':
++                        line_disc = atoi(optarg);
++                        break;
+ 		case 'b':
+ 			send_break = 1;
+ 			break;
+@@ -1381,7 +1389,7 @@ int main(int argc, char *argv[])
+ 	alarm(to);
+ 	bcsp_max_retries = to;
+ 
+-	n = init_uart(dev, u, send_break, raw);
++	n = init_uart(dev, u, send_break, raw, line_disc);
+ 	if (n < 0) {
+ 		perror("Can't initialize device");
+ 		exit(1);
+diff --git a/tools/hciattach.h b/tools/hciattach.h
+index fed0d11..09b534d 100644
+--- a/tools/hciattach.h
++++ b/tools/hciattach.h
+@@ -39,6 +39,7 @@
+ #define HCI_UART_H4DS	3
+ #define HCI_UART_LL	4
+ #define HCI_UART_ATH3K  5
++#define HCI_UART_STE	6
+ 
+ #define HCI_UART_RAW_DEVICE	0
+ 
+-- 
+1.7.9.5
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
new file mode 100644
index 000000000000..23244221df80
--- /dev/null
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# bluez5_utils
+#
+################################################################################
+
+BLUEZ5_UTILS_VERSION = 5.12
+BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
+BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+BLUEZ5_UTILS_INSTALL_STAGING = YES
+BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 readline libical
+BLUEZ5_UTILS_CONF_OPT = --enable-test --enable-tools --disable-android
+BLUEZ5_UTILS_AUTORECONF = YES
+BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-udev
+BLUEZ5_UTILS_DEPENDENCIES += udev
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+BLUEZ5_UTILS_CONF_OPT += --enable-systemd
+BLUEZ5_UTILS_DEPENDENCIES += systemd
+else
+BLUEZ5_UTILS_CONF_OPT += --disable-systemd
+endif
+
+$(eval $(autotools-package))
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 1315b9ef4166..a4ca3977d29d 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
+	depends on !BR2_PACKAGE_BLUEZ5_UTILS
 	depends on !BR2_avr32
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2, libical
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_LIBICAL
 	help
 	  bluez utils
 
@@ -48,3 +51,6 @@ endif
 comment "bluez-utils needs a toolchain w/ wchar, threads"
 	depends on !BR2_avr32 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "bluez 4.x is not compatible with bluez 5.x"
+    depends on BR2_PACKAGE_BLUEZ5_UTILS
-- 
1.8.3.2
