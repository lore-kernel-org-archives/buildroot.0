From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 May 2016 21:02:01 +0200
Subject: [Buildroot] [PATCH v2] package/net-tools: fix static linking issue
	with lintl
Message-ID: <1464462121-24585-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When net-tools are build with uClibc-ng and statically linked,
some tools like hostname and route needs to link with -lintl.

Adding -lintl in LDFLAGS place the library before object files:
arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o

Add $(LIBS) after object files in the Makefile to place -lintl correctly.

Rework NET_TOOLS_BUILD_CMDS to set LDFLAGS with only TARGET_LDFLAGS and
set LIBS with -lintl when needed.

Fixes:
http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8

Ref:
http://lists.busybox.net/pipermail/buildroot/2016-May/162216.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: Remove -lintl from LDFLAGS add add LIBS in the Makefile after object files
    (ThomasP)
---
 ...efile-fix-static-linking-issue-with-lintl.patch | 79 ++++++++++++++++++++++
 package/net-tools/net-tools.mk                     |  6 +-
 2 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100644 package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch

diff --git a/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch b/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
new file mode 100644
index 0000000..a2d674e
--- /dev/null
+++ b/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
@@ -0,0 +1,79 @@
+From a2076079a409141704701ec17a205d89e5b24052 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 28 May 2016 20:45:02 +0200
+Subject: [PATCH] Makefile: fix static linking issue with lintl
+
+When net-tools are build with uClibc-ng and statically linked,
+some tools like hostname and route needs to link with -lintl.
+
+Adding -lintl in LDFLAGS place the library before object files:
+arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o
+
+Add $(LIBS) after object files in the Makefile to place -lintl correctly.
+
+Fixes:
+http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8
+
+Ref:
+http://lists.busybox.net/pipermail/buildroot/2016-May/162216.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 171123d..a2baf79 100644
+--- a/Makefile
++++ b/Makefile
+@@ -158,37 +158,37 @@ subdirs:	libdir
+ 		@for i in $(SUBDIRS:$(NET_LIB_PATH)/=); do $(MAKE) -C $$i || exit $$? ; done
+ 
+ ifconfig:	$(NET_LIB) ifconfig.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ifconfig.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ifconfig.o $(LIBS) $(NLIB)
+ 
+ nameif:		$(NET_LIB) nameif.o
+ 		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ nameif.o $(NLIB)
+ 
+ hostname:	hostname.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ hostname.o $(DNLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ hostname.o $(LIBS) $(DNLIB)
+ 
+ route:		$(NET_LIB) route.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ route.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ route.o $(LIBS) $(NLIB)
+ 
+ arp:		$(NET_LIB) arp.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ arp.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ arp.o $(LIBS) $(NLIB)
+ 
+ rarp:		$(NET_LIB) rarp.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ rarp.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ rarp.o $(LIBS) $(NLIB)
+ 
+ slattach:	$(NET_LIB) slattach.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ slattach.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ slattach.o $(LIBS) $(NLIB)
+ 
+ plipconfig:	$(NET_LIB) plipconfig.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ plipconfig.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ plipconfig.o $(LIBS) $(NLIB)
+ 
+ netstat:	$(NET_LIB) netstat.o statistics.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ netstat.o statistics.o $(NLIB) $(SELIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ netstat.o statistics.o $(LIBS) $(NLIB) $(SELIB)
+ 
+ iptunnel:	$(NET_LIB) iptunnel.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iptunnel.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iptunnel.o $(LIBS) $(NLIB)
+ 
+ ipmaddr:	$(NET_LIB) ipmaddr.o
+-		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ipmaddr.o $(NLIB)
++		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ipmaddr.o $(LIBS) $(NLIB)
+ 
+ mii-tool:	$(NET_LIB) mii-tool.o
+ 		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ mii-tool.o $(NLIB)
+-- 
+2.5.5
+
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 184c50e..08d55bb 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -7,8 +7,6 @@
 NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-NET_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
 NET_TOOLS_LICENSE = GPLv2+
 NET_TOOLS_LICENSE_FILES = COPYING
 
@@ -37,7 +35,9 @@ NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
-		LDFLAGS="$(NET_TOOLS_LDFLAGS)" $(MAKE) -C $(@D)
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)" \
+		$(MAKE) -C $(@D)
 endef
 
 # install renames conflicting binaries, update does not
-- 
2.5.5
