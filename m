From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 09:22:43 +0100
Subject: [Buildroot] [git commit] httping: new package
Message-ID: <20130115082315.123D49A18F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96f6054ccd7edc9add815d44720563c998eca088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Httping is like 'ping' but for http-requests.
Give it an url, and it'll show you how long it takes to connect,
send a request and retrieve the reply (only the headers)

[Peter: Drop ssl option, use make install, misc cleanup]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                             |    1 +
 package/httping/Config.in                     |   17 ++++++++
 package/httping/httping-override-cflags.patch |   53 +++++++++++++++++++++++++
 package/httping/httping.mk                    |   29 +++++++++++++
 4 files changed, 100 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 42cde07..c59f342 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ source "package/ethtool/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
+source "package/httping/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
diff --git a/package/httping/Config.in b/package/httping/Config.in
new file mode 100644
index 0000000..dca68f3
--- /dev/null
+++ b/package/httping/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HTTPING
+       bool "httping"
+       help
+         Httping is like 'ping' but for http-requests.
+         Give it an url, and it'll show you how long it takes to connect,
+         send a request and retrieve the reply (only the headers).
+         Be aware that the transmission across the network also takes time!
+         So it measures the latency of the webserver + network.
+
+         http://www.vanheusden.com/httping/
+
+if BR2_PACKAGE_HTTPING
+
+config BR2_PACKAGE_HTTPING_TFO
+       bool "TCP Fast Open (TFO) support"
+
+endif
diff --git a/package/httping/httping-override-cflags.patch b/package/httping/httping-override-cflags.patch
new file mode 100644
index 0000000..a3cf59d
--- /dev/null
+++ b/package/httping/httping-override-cflags.patch
@@ -0,0 +1,53 @@
+From 66f5811dd45fa27a7bfacf946dfefd16d765bb4d Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Mon, 14 Jan 2013 11:48:00 -0800
+Subject: [PATCH] allow CFLAGS/LDFLAGS to be overriden from command line
+
+Ensure required CFLAGS/LDFLAGS are appended to those provided in command line
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ Makefile |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4c4f6a8..fdbb4cb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -19,7 +19,7 @@ TARGET=httping
+ DEBUG=yes
+ WFLAGS=-Wall -W
+ OFLAGS=-O3
+-CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\"
++override CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\"
+
+ PACKAGE=$(TARGET)-$(VERSION)
+ PREFIX=/usr
+@@ -48,19 +48,19 @@ DOCS=license.txt license.OpenSSL readme.txt
+ # TFO=yes
+
+ ifeq ($(SSL),no)
+-CFLAGS+=-DNO_SSL
++override CFLAGS+=-DNO_SSL
+ else
+ OBJS+=mssl.o
+-LDFLAGS+=-lssl -lcrypto
++override LDFLAGS+=-lssl -lcrypto
+ endif
+
+ ifeq ($(TFO),yes)
+-CFLAGS+=-DTCP_TFO
++override CFLAGS+=-DTCP_TFO
+ endif
+
+ ifeq ($(DEBUG),yes)
+-CFLAGS+=-D_DEBUG -ggdb
+-LDFLAGS+=-g
++override CFLAGS+=-D_DEBUG -ggdb
++override LDFLAGS+=-g
+ endif
+
+ ifeq ($(ARM),yes)
+--
+1.7.4.1
+
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
new file mode 100644
index 0000000..3ec1dae
--- /dev/null
+++ b/package/httping/httping.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# httping
+#
+#############################################################
+
+HTTPING_VERSION = 1.5.7
+HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
+HTTPING_SITE = http://www.vanheusden.com/httping
+HTTPING_LICENSE = GPLv2
+HTTPING_LICENSE_FILES = license.txt
+HTTPING_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+
+define HTTPING_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
+		TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
+		DEBUG=no -C $(@D)
+endef
+
+define HTTPING_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define HTTPING_CLEAN_CMDS
+       $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
