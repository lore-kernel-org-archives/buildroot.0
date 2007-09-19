From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 19:38:24 +0200
Subject: [Buildroot] OLSR in buildroot - patch 03
In-Reply-To: <a63ecaf0709190726n5caa5817m7aab911b9490a6d6@mail.gmail.com>
References: <a63ecaf0709190726n5caa5817m7aab911b9490a6d6@mail.gmail.com>
Message-ID: <20070919173824.GA30560@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 11:26:45AM -0300, Sushi Sensei wrote:
>Some minor changes in S50olsr
>
>-- 
>------------------------------------------------------
>--- Timeo Danaos et dona ferentes ---
>------------------------------------------------------

>Index: package/Config.in
>===================================================================
>--- package/Config.in	(revisi??n: 19874)
>+++ package/Config.in	(copia de trabajo)
>@@ -122,6 +122,7 @@
> 	  Support for networking and related packages
> 
> if BR2_NETWORK_SUPPORT
>+source "package/olsr/Config.in"
> source "package/argus/Config.in"
> source "package/avahi/Config.in"
> source "package/boa/Config.in"
>Index: package/olsr/files/S50olsr
>===================================================================
>--- package/olsr/files/S50olsr	(revisi??n: 0)
>+++ package/olsr/files/S50olsr	(revisi??n: 0)
>@@ -0,0 +1,23 @@
>+#!/bin/sh
>+#
>+# Starts OLSRD daemon
>+#
>+
>+case "$1" in
>+  start)
>+  	echo -n "Starting OLSRd daemon: "
>+	/usr/sbin/olsrd -d 0 -nofork & 
>+	echo "OK"

These "OK" are superfluous since they are printed even if starting olsrd
fails. Either just echo "" or remove all echoing or echo the correct
thing like OK or FAILED.
>+	;;
>+  stop)
>+  	echo -n "Stopping OLSRd daemon: "
>+	killall olsrd
>+	echo "OK"
Ditto.
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

This .unpacked is useless, please remove it..

>+
>+$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.configured

.. and adjust this prerequisite.

>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd $(OLSR_PLUGINS)
>+
>+$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
>+	mkdir -p $(TARGET_DIR)/etc/init.d
>+	cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
>+	cp -u $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
>+
>+olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+
>+olsr-clean:
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so.*
>+	-$(MAKE) -C $(OLSR_DIR) clean

I already said this, IIRC. So lemme repeat:
Please rm _all files_ that you copied. This includes but is not limited
to the runlevel script and the .conf

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
>@@ -0,0 +1,12 @@
>+config BR2_PACKAGE_OLSR
>+	bool "OLSR mesh networking Daemon"
>+	default n
>+	help
>+	  olsr
>+	  
>+	  The Optimized Link State Routing protocol (OLSR) is a routing protocol that is optimised
>+	  for mobile ad-hoc networks, sometimes called wireless mesh networks. It is a proactive
>+	  link-state routing protocol that floods a full topology table to all nodes in the network
>+	  which then compute optimal forwarding paths locally.
>+
>+	  http://www.olsr.org/

Much better otherwise :)
Please fix the stuff i pointed out above and resend.
TIA and cheers,
Bernhard
