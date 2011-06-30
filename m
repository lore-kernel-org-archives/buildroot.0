From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 29 Jun 2011 19:18:42 -0600
Subject: [Buildroot] [PATCH] new package: ngrep
Message-ID: <20110630011839.GA9732@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 package/Config.in                          |    1 +
 package/ngrep/Config.in                    |    8 +++++++
 package/ngrep/ngrep-1.45-make-objs.patch   |   19 ++++++++++++++++++
 package/ngrep/ngrep-1.45-pcre-header.patch |   12 +++++++++++
 package/ngrep/ngrep.mk                     |   29 ++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/ngrep/Config.in
 create mode 100644 package/ngrep/ngrep-1.45-make-objs.patch
 create mode 100644 package/ngrep/ngrep-1.45-pcre-header.patch
 create mode 100644 package/ngrep/ngrep.mk

diff --git a/package/Config.in b/package/Config.in
index 8f1f030..dc07b58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,6 +421,7 @@ source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ngircd/Config.in"
+source "package/ngrep/Config.in"
 source "package/ntp/Config.in"
 source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
diff --git a/package/ngrep/Config.in b/package/ngrep/Config.in
new file mode 100644
index 0000000..cd91225
--- /dev/null
+++ b/package/ngrep/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NGREP
+	bool "ngrep"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_PCRE
+	help
+	  Network grep.
+
+	  http://ngrep.sourceforge.net/
diff --git a/package/ngrep/ngrep-1.45-make-objs.patch b/package/ngrep/ngrep-1.45-make-objs.patch
new file mode 100644
index 0000000..cf316d5
--- /dev/null
+++ b/package/ngrep/ngrep-1.45-make-objs.patch
@@ -0,0 +1,19 @@
+--- ngrep-1.45/Makefile.in.orig	2006-11-28 06:35:37.000000000 -0700
++++ ngrep-1.45/Makefile.in	2011-06-29 14:05:27.000000000 -0600
+@@ -32,13 +32,13 @@
+ 
+ INSTALL = ./install-sh
+ 
+-REGEX_DIR=@REGEX_DIR@
+-REGEX_OBJS=@REGEX_OBJS@
++REGEX_DIR=
++REGEX_OBJS=
+ 
+ 
+ all: $(TARGET) 
+ 
+-$(TARGET): $(REGEX_OBJS) $(OBJS) 
++$(TARGET): $(OBJS) 
+ 	$(CC) $(CFLAGS) $(LDFLAGS) $(STRIPFLAG) -o $(TARGET) $(OBJS) $(REGEX_OBJS) $(LIBS) 
+ 
+ debug: $(REGEX_OBJS) $(OBJS)
diff --git a/package/ngrep/ngrep-1.45-pcre-header.patch b/package/ngrep/ngrep-1.45-pcre-header.patch
new file mode 100644
index 0000000..3c878fb
--- /dev/null
+++ b/package/ngrep/ngrep-1.45-pcre-header.patch
@@ -0,0 +1,12 @@
+diff -ur ngrep-1.45/ngrep.c ngrep-1.45.mod/ngrep.c
+--- ngrep-1.45/ngrep.c  Tue Nov 28 15:38:43 2006
++++ ngrep-1.45.mod/ngrep.c      Sat May 19 10:21:27 2007
+@@ -92,7 +92,7 @@
+ #endif
+ 
+ #if USE_PCRE
+-#include "pcre-5.0/pcre.h"
++#include "pcre.h"
+ #else
+ #include "regex-0.12/regex.h"
+ #endif
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
new file mode 100644
index 0000000..1947edb
--- /dev/null
+++ b/package/ngrep/ngrep.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# ngrep
+#
+#############################################################
+
+NGREP_VERSION:=1.45
+NGREP_SOURCE:=ngrep-$(NGREP_VERSION).tar.bz2
+NGREP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ngrep/ngrep/$(NGREP_VERSION)
+# no install-strip/install-exec
+NGREP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" install
+NGREP_CONF_ENV:=LDFLAGS="-lpcre"
+NGREP_CONF_OPT:= \
+	--with-pcap-includes=$(STAGING_DIR)/usr/include \
+	--enable-pcre \
+	--with-pcre=$(STAGING_DIR)/usr \
+	--disable-dropprivs
+
+ifeq ($(BR2_INET_IPV6),y)
+NGREP_CONF_OPT += --enable-ipv6
+endif
+
+NGREP_DEPENDENCIES:=libpcap pcre
+
+$(eval $(call AUTOTARGETS,package,ngrep))
+
+$(NGREP_HOOK_POST_INSTALL): $(NGREP_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/ngrep
+	touch $@
-- 
1.7.0.4
