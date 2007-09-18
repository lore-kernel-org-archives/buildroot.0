From: Sushi Sensei <sinestado@gmail.com>
Date: Tue, 18 Sep 2007 15:41:06 -0300
Subject: [Buildroot] OLSR in buildroot
Message-ID: <a63ecaf0709181141m7434fe87tc4061e69e6c4ff0d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't understand why isn't in the main line source the olsr package!!

This routing algorithm is very usefull and used spread around the world in
(quasi)every free wifi comunity for route mesh nets.

This is a working package file for this packet:

package/olsr/Config.in

config BR2_PACKAGE_OLSR
        bool "OLSR mesh networking Deamon"
        default n
        help
          OLSR

          A mesh networking protocol

          http://www.olsr.org/

package/olsr/olsr.mk

#############################################################
#
# olsr
#
#############################################################

OLSR_VERSION_MAYOR=0.5
OLSR_VERSION_MINOR=3
OLSR_VERSION:=$(OLSR_VERSION_MAYOR).$(OLSR_VERSION_MINOR)
OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAYOR)
OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
OLSR_CAT:=$(BZCAT)
OLSR_BINARY:=olsrd
OLSR_TARGET_BINARY:=usr/bin/olsrd
#OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph
bmf quagga secure
OLSR_PLUGINS=dot_draw dyn_gw secure
OLSR_TARGET_PLUGIN=usr/lib/

$(DL_DIR)/$(OLSR_SOURCE):
         $(WGET) -P $(DL_DIR) $(OLSR_SITE)/$(OLSR_SOURCE)

olsr-source: $(DL_DIR)/$(OLSR_SOURCE)

olsr-unpacked: $(OLSR_DIR)/.unpacked
$(OLSR_DIR)/.unpacked: $(DL_DIR)/$(OLSR_SOURCE)
        $(OLSR_CAT) $(DL_DIR)/$(OLSR_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
        touch $(OLSR_DIR)/.unpacked

$(OLSR_DIR)/.configured: $(OLSR_DIR)/.unpacked
        touch $(OLSR_DIR)/.configured

$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.configured
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd
$(OLSR_PLUGINS)

$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
        rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
        cp -a $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
        cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.*
$(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
        mkdir -p $(TARGET_DIR)/etc/init.d
        cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
        chmod a+x $(TARGET_DIR)/etc/init.d/S50olsr
        cp $(OLSR_DIR)/files/olsrd.conf.default.lq
$(TARGET_DIR)/etc/olsrd.conf

olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)

olsr-clean:
        rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
        -$(MAKE) -C $(OLSR_DIR) clean

olsr-dirclean:
        rm -rf $(OLSR_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_OLSR)),y)
TARGETS+=olsrd $(OLSR_PLUGINS)
endif

package/olsr/files/S50olsr

#!/bin/sh
#
# Starts OLSRD deamon
#

start() {
        echo -n "Starting OLSRd deamon: "
        start-stop-daemon --start --quiet --pidfile /var/run/olsrd.pid
--exec /usr/sbin/olsrd
        echo "OK"
}
stop() {
        echo -n "Stopping OLSRd deamon: "
        start-stop-daemon --stop --quiet --pidfile /var/run/olsrd.pid
        echo "OK"
}
restart() {
        stop
        start
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart|reload)
        restart
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
esac

exit $?





-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070918/749b783b/attachment.htm 
