From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 23:14:19 +0200
Subject: [Buildroot] [git commit] vpnc: convert to generic-package
	infrastructure
Message-ID: <20121009073904.0A9079980B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a4b25408294c9c82d7c1e25cb16a7467e3d9088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor fixes]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vpnc/vpnc-0.5.3-fix-build.patch |   71 +++++++++++++++++++++++++++++++
 package/vpnc/vpnc.mk                    |   71 +++++++-----------------------
 2 files changed, 88 insertions(+), 54 deletions(-)

diff --git a/package/vpnc/vpnc-0.5.3-fix-build.patch b/package/vpnc/vpnc-0.5.3-fix-build.patch
new file mode 100644
index 0000000..e21348b
--- /dev/null
+++ b/package/vpnc/vpnc-0.5.3-fix-build.patch
@@ -0,0 +1,71 @@
+Misc. Makefile cleanup and fix the VERSION definition.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+diff -purN vpnc-0.5.3.orig/Makefile vpnc-0.5.3/Makefile
+--- vpnc-0.5.3.orig/Makefile	2012-08-06 00:03:22.677914146 +0200
++++ vpnc-0.5.3/Makefile	2012-08-06 00:06:58.506744901 +0200
+@@ -19,21 +19,19 @@
+ #
+ # $Id: Makefile 312 2008-06-15 18:09:42Z Joerg Mayer $
+ 
+-DESTDIR=
+-PREFIX=/usr/local
+-ETCDIR=/etc/vpnc
+-BINDIR=$(PREFIX)/bin
+-SBINDIR=$(PREFIX)/sbin
+-MANDIR=$(PREFIX)/share/man
+-DOCDIR=$(PREFIX)/share/doc/vpnc
+-
+-SRCS = sysdep.c vpnc-debug.c isakmp-pkt.c tunip.c config.c dh.c math_group.c supp.c decrypt-utils.c
+-BINS = vpnc cisco-decrypt
+-OBJS = $(addsuffix .o,$(basename $(SRCS)))
++DESTDIR =
++PREFIX ?= /usr/local
++ETCDIR  = /etc/vpnc
++BINDIR  = $(PREFIX)/bin
++SBINDIR = $(PREFIX)/sbin
++MANDIR  = $(PREFIX)/share/man
++DOCDIR  = $(PREFIX)/share/doc/vpnc
++
++SRCS    = sysdep.c vpnc-debug.c isakmp-pkt.c tunip.c config.c dh.c math_group.c supp.c decrypt-utils.c
++BINS    = vpnc cisco-decrypt
++OBJS    = $(addsuffix .o,$(basename $(SRCS)))
+ BINOBJS = $(addsuffix .o,$(BINS))
+ BINSRCS = $(addsuffix .c,$(BINS))
+-VERSION := $(shell sh mk-version)
+-RELEASE_VERSION := $(shell cat VERSION)
+ 
+ # The license of vpnc (Gpl >= 2) is quite likely incompatible with the
+ # openssl license. Openssl is currently used to provide certificate
+@@ -50,13 +48,13 @@ RELEASE_VERSION := $(shell cat VERSION)
+ #OPENSSL_GPL_VIOLATION = -DOPENSSL_GPL_VIOLATION
+ #OPENSSLLIBS = -lcrypto
+ 
+-CC=gcc
+-CFLAGS ?= -O3 -g
+-CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
+-CFLAGS +=  $(shell libgcrypt-config --cflags)
+-CPPFLAGS += -DVERSION=\"$(VERSION)\" $(OPENSSL_GPL_VIOLATION)
+-LDFLAGS ?= -g
+-LDFLAGS += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
++CC       ?= gcc
++CFLAGS   ?= -O3 -g
++CFLAGS   += -W -Wall -Wmissing-declarations -Wwrite-strings
++CFLAGS   += $(shell libgcrypt-config --cflags)
++CPPFLAGS += $(OPENSSL_GPL_VIOLATION)
++LDFLAGS  ?= -g
++LDFLAGS  += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
+ 
+ ifeq ($(shell uname -s), SunOS)
+ LDFLAGS += -lnsl -lresolv -lsocket
+@@ -84,7 +82,7 @@ cisco-decrypt : cisco-decrypt.o decrypt-
+ 	$(CC) -o $@ $^ $(LDFLAGS)
+ 
+ .depend: $(SRCS) $(BINSRCS)
+-	$(CC) -MM $(SRCS) $(BINSRCS) $(CFLAGS) $(CPPFLAGS) > $@
++	$(CC) -MM $(SRCS) $(BINSRCS) $(CPPFLAGS) $(CFLAGS) > $@
+ 
+ vpnc-debug.c vpnc-debug.h : isakmp.h enum2debug.pl
+ 	LC_ALL=C perl -w ./enum2debug.pl isakmp.h >vpnc-debug.c 2>vpnc-debug.h
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index f585dc4..8d03300 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,62 +4,25 @@
 #
 #############################################################
 
-VPNC_VERSION=0.5.3
-VPNC_SOURCE=vpnc-$(VPNC_VERSION).tar.gz
-VPNC_SITE=http://www.unix-ag.uni-kl.de/~massar/vpnc
-VPNC_DIR=$(BUILD_DIR)/vpnc-$(VPNC_VERSION)
-VPNC_CAT:=$(ZCAT)
-VPNC_BINARY:=$(VPNC_DIR)/vpnc
-VPNC_DEST_DIR:=$(TARGET_DIR)/usr/local/sbin
-VPNC_TARGET_BINARY:=$(VPNC_DEST_DIR)/vpnc
-VPNC_TARGET_SCRIPT:=$(TARGET_DIR)/etc/vpnc/default.conf
+VPNC_VERSION       = 0.5.3
+VPNC_SITE          = http://www.unix-ag.uni-kl.de/~massar/vpnc
+VPNC_LICENSE       = GPLv2+
+VPNC_LICENSE_FILES = COPYING
 
-$(DL_DIR)/$(VPNC_SOURCE):
-	$(call DOWNLOAD,$(VPNC_SITE)/$(VPNC_SOURCE))
+VPNC_DEPENDENCIES  = libgcrypt libgpg-error
 
-$(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
-	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(VPNC_DIR) package/vpnc vpnc-$(VPNC_VERSION)\*.patch
-	touch $@
+VPNC_LDFLAGS  = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
+VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
 
-$(VPNC_BINARY): $(VPNC_DIR)/.unpacked
-	rm -f $@
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/usr/include \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS+=-lgcrypt LDFLAGS+=-lgpg-error LDFLAGS+="$(TARGET_CFLAGS)" \
-		CC="$(TARGET_CC)" -C $(VPNC_DIR)
+define VPNC_BUILD_CMDS
+	$(MAKE)	-C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)"
+endef
 
-$(VPNC_TARGET_BINARY): $(VPNC_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
-		BINDIR=/usr/local/bin \
-		SBINDIR=/usr/local/sbin \
-		ETCDIR=/etc/vpnc \
-		MANDIR=/usr/share/man \
-		VERSION=$(VPNC_VERSION) \
-		INCLUDE=$(STAGING_DIR)/usr/include \
-		LDFLAGS="-lgcrypt -lgpg-error $(TARGET_CFLAGS)" \
-		-C $(VPNC_DIR) install
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
+define VPNC_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)" \
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr
+endef
 
-vpnc-legal-info:
-	@$(call legal-warning-pkg,vpnc,legal-info not yet implemented)
-
-vpnc: libgcrypt $(VPNC_TARGET_BINARY)
-
-vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
-
-vpnc-clean:
-	-$(MAKE) -C $(VPNC_DIR) clean
-	rm -f $(STAGING_DIR)/usr/bin/vpnc
-
-vpnc-dirclean:
-	rm -rf $(VPNC_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VPNC),y)
-TARGETS+=vpnc
-endif
+$(eval $(generic-package))
