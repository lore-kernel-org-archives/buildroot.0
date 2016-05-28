From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 May 2016 16:02:51 +0200
Subject: [Buildroot] [PATCH] package/net-tools: fix static linking issue
	with lintl
Message-ID: <1464444171-12033-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When net-tools are build with uClibc-ng and statically linked,
some tools like hostname and route needs to link with -lintl.

Adding -lintl in LDFLAGS place the library before object files:
arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o

Move $(LDFLAGS) after object files in the Makefile.

Fixes:
http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...efile-fix-static-linking-issue-with-lintl.patch | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch

diff --git a/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch b/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
new file mode 100644
index 0000000..9259c20
--- /dev/null
+++ b/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
@@ -0,0 +1,81 @@
+From 1df81dbba3c7809ab345133a2409c49befc31e95 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 28 May 2016 15:51:31 +0200
+Subject: [PATCH] Makefile: fix static linking issue with lintl
+
+When net-tools are build with uClibc-ng and statically linked,
+some tools like hostname and route needs to link with -lintl.
+
+Adding -lintl in LDFLAGS place the library before object files:
+arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o
+
+Move $(LDFLAGS) after object files in the Makefile.
+
+Fixes:
+http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 171123d..4d8d5fc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -158,40 +158,40 @@ subdirs:	libdir
+ 		@for i in $(SUBDIRS:$(NET_LIB_PATH)/=); do $(MAKE) -C $$i || exit $$? ; done
+ 
+ ifconfig:	$(NET_LIB) ifconfig.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ifconfig.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ ifconfig.o $(LDFLAGS) $(NLIB)
+ 
+ nameif:		$(NET_LIB) nameif.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ nameif.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ nameif.o $(LDFLAGS) $(NLIB)
+ 
+ hostname:	hostname.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ hostname.o $(DNLIB)
++		$(CC) $(CFLAGS) -o $@ hostname.o $(LDFLAGS) $(DNLIB)
+ 
+ route:		$(NET_LIB) route.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ route.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ route.o $(LDFLAGS) $(NLIB)
+ 
+ arp:		$(NET_LIB) arp.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ arp.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ arp.o $(LDFLAGS) $(NLIB)
+ 
+ rarp:		$(NET_LIB) rarp.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ rarp.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ rarp.o $(LDFLAGS) $(NLIB)
+ 
+ slattach:	$(NET_LIB) slattach.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ slattach.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ slattach.o $(LDFLAGS) $(NLIB)
+ 
+ plipconfig:	$(NET_LIB) plipconfig.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ plipconfig.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ plipconfig.o $(LDFLAGS) $(NLIB)
+ 
+ netstat:	$(NET_LIB) netstat.o statistics.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ netstat.o statistics.o $(NLIB) $(SELIB)
++		$(CC) $(CFLAGS) -o $@ netstat.o statistics.o $(LDFLAGS) $(NLIB) $(SELIB)
+ 
+ iptunnel:	$(NET_LIB) iptunnel.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iptunnel.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ iptunnel.o $(LDFLAGS) $(NLIB)
+ 
+ ipmaddr:	$(NET_LIB) ipmaddr.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ipmaddr.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ ipmaddr.o $(LDFLAGS) $(NLIB)
+ 
+ mii-tool:	$(NET_LIB) mii-tool.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ mii-tool.o $(NLIB)
++		$(CC) $(CFLAGS) -o $@ mii-tool.o $(LDFLAGS) $(NLIB)
+ 
+ installbin:
+ 	@echo
+-- 
+2.5.5
+
-- 
2.5.5
