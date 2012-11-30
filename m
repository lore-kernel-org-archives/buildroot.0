From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Fri, 30 Nov 2012 13:39:15 +0100
Subject: [Buildroot] [PATCH v5 5/6] bluez-utils: add support for the
	ST-Ericsson cg2900 combo controller
In-Reply-To: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1354279156-20649-6-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 ...tils-4.101-enable_cg2900_on_upstream_4.91.patch |  106 ++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch

diff --git a/package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch b/package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch
new file mode 100644
index 0000000..e80af5f
--- /dev/null
+++ b/package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch
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
-- 
1.7.9.5
