From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 09:59:13 +0200
Subject: [Buildroot] OLSR in buildroot - patch
In-Reply-To: <46F061BB.1070604@gmail.com>
References: <46F061BB.1070604@gmail.com>
Message-ID: <20070919075913.GA11856@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 18, 2007 at 08:39:39PM -0300, Rex Luscus wrote:
> this is a possible patch to discuss

>Index: package/olsr/files/S50olsr
>===================================================================
>--- package/olsr/files/S50olsr	(revisi??n: 0)
>+++ package/olsr/files/S50olsr	(revisi??n: 0)
>@@ -0,0 +1,22 @@
>+#!/bin/sh
>+#
>+# Starts OLSRD deamon
>+#
>+case "$1" in
>+  start)
>+  	echo -n "Starting OLSRd deamon: "
>+	start-stop-daemon --start --quiet --pidfile /var/run/olsrd.pid --exec /usr/sbin/olsrd

As said, long options are a nono. Please fix.

>+	echo "OK"
>+	;;
>+  stop)
>+  	echo -n "Stopping OLSRd deamon: "
>+	start-stop-daemon --stop --quiet --pidfile /var/run/olsrd.pid
>+	echo "OK"
>+	;;
>+  *)
>+	echo $"Usage: $0 {start|stop}"
>+	exit 1
>+esac
>+
>+exit $?
>+
>Index: package/olsr/olsr.mk
>===================================================================
>--- package/olsr/olsr.mk	(revisi??n: 0)
>+++ package/olsr/olsr.mk	(revisi??n: 0)
>@@ -0,0 +1,61 @@
>+#############################################################
>+#
>+# olsr
>+#
>+#############################################################
>+
>+OLSR_VERSION_MAJOR=0.5
>+OLSR_VERSION_MINOR=3
>+OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
>+OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
>+OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
>+OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
>+OLSR_CAT:=$(BZCAT)
>+OLSR_BINARY:=olsrd
>+OLSR_TARGET_BINARY:=usr/bin/olsrd
>+#OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
>+OLSR_PLUGINS=dot_draw dyn_gw secure
>+OLSR_TARGET_PLUGIN=usr/lib/
>+
>+$(DL_DIR)/$(OLSR_SOURCE):
>+	 $(WGET) -P $(DL_DIR) $(OLSR_SITE)/$(OLSR_SOURCE)
>+
>+olsr-source: $(DL_DIR)/$(OLSR_SOURCE)
>+
>+olsr-unpacked: $(OLSR_DIR)/.unpacked
>+$(OLSR_DIR)/.unpacked: $(DL_DIR)/$(OLSR_SOURCE)
>+	$(OLSR_CAT) $(DL_DIR)/$(OLSR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	touch $@
>+
>+$(OLSR_DIR)/.configured: $(OLSR_DIR)/.unpacked
>+	touch $@
>+
>+$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.configured
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd $(OLSR_PLUGINS)
>+
>+$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
>+	mkdir -p $(TARGET_DIR)/etc/init.d
>+	cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
>+	chmod a+x $(TARGET_DIR)/etc/init.d/S50olsr

S50olsr will be executable in the repository, so this is not needed.

>+	cp $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf

Only do this if $(TARGET_DIR)/etc/olsrd.conf doesn't exist. Otherwise
you cannot have a premade conf.

>+
>+olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+
>+olsr-clean:
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	-$(MAKE) -C $(OLSR_DIR) clean

This has to rm the S50olsr and the libs too.

>+
>+olsr-dirclean:
>+	rm -rf $(OLSR_DIR)
>+
>+#############################################################
>+#
>+# Toplevel Makefile options
>+#
>+#############################################################
>+ifeq ($(strip $(BR2_PACKAGE_OLSR)),y)
>+TARGETS+=olsrd $(OLSR_PLUGINS)
>+endif
>Index: package/olsr/Config.in
>===================================================================
>--- package/olsr/Config.in	(revisi??n: 0)
>+++ package/olsr/Config.in	(revisi??n: 0)
>@@ -0,0 +1,10 @@
>+config BR2_PACKAGE_OLSR
>+	bool "OLSR mesh networking Deamon"

you probably mean daemon.

>+	default n
>+	help
>+	  olsr
>+	  
>+	  A mesh networking protocol

A bit more description would be nice.

>+
>+	  http://www.olsr.org/
>+
