From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 21:44:09 +0200
Subject: [Buildroot] OLSR in buildroot - patch 04
In-Reply-To: <a63ecaf0709191224j2de0f3ci9529f83482434ea7@mail.gmail.com>
References: <a63ecaf0709191224j2de0f3ci9529f83482434ea7@mail.gmail.com>
Message-ID: <20070919194409.GE817@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 04:24:33PM -0300, Sushi Sensei wrote:


>Index: package/Config.in
>===================================================================
>--- package/Config.in	(revisi??n: 19893)
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
>@@ -0,0 +1,21 @@
>+#!/bin/sh
>+#
>+# Starts OLSRD daemon
>+#
>+
>+case "$1" in
>+  start)
>+  	echo -n "Starting OLSRd daemon: "
>+	/usr/sbin/olsrd -d 0 -nofork & 

Better, but it just _looks_ like you will then get a prompt like this:
Starting OLSRd daemon: me at there: >

So i ask you to carefully reread what i wrote in the previous mail :)
>+	;;
>+  stop)
>+  	echo -n "Stopping OLSRd daemon: "
>+	killall olsrd
>+	;;
>+  *)
>+	echo $"Usage: $0 {start|stop}"
>+	exit 1
>+esac
>+
>+exit $?
>+
>
>Cambios de propiedades en package/olsr/files/S50olsr
>___________________________________________________________________
>Nombre: svn:executable
>   + *
>
>Index: package/olsr/olsr.mk
>===================================================================
>--- package/olsr/olsr.mk	(revisi??n: 0)
>+++ package/olsr/olsr.mk	(revisi??n: 0)
>@@ -0,0 +1,59 @@
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
>+$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.unpacked
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd $(OLSR_PLUGINS)
>+
>+$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
>+	mkdir -p $(TARGET_DIR)/etc/init.d
>+	cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
>+	cp -u $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf

That's nearly ok. Now think about those pure Apple customers, that have
an odd cp(1) command. Will cp -u work there and on other systems that
don't use coreutils? I doubt it.
	test -r $(TARGET_DIR)/etc/olsrd.conf || \
		cp -dpf $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf

will do the trick in a portable manner.
>+
>+olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+
>+olsr-clean:
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so.*
>+	rm -f $(TARGET_DIR)/etc/init.d/S50olsr
>+	-$(MAKE) -C $(OLSR_DIR) clean

I think that I already asked you to rm the .config file, didn't I? ;)
Please rm the .config file.
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

please name this olsr, without the trailing 'd', for consistency with
most of the other packages.

Please send a version #06 of this patch (not #05) if you read this
message until this line, thanks and cheers,
