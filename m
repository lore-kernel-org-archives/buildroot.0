From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 18 Sep 2007 22:23:17 +0200
Subject: [Buildroot] OLSR in buildroot
In-Reply-To: <a63ecaf0709181141m7434fe87tc4061e69e6c4ff0d@mail.gmail.com>
References: <a63ecaf0709181141m7434fe87tc4061e69e6c4ff0d@mail.gmail.com>
Message-ID: <20070918202317.GQ20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 18, 2007 at 03:41:06PM -0300, Sushi Sensei wrote:
>I don't understand why isn't in the main line source the olsr package!!
>
>This routing algorithm is very usefull and used spread around the world in
>(quasi)every free wifi comunity for route mesh nets.

Well, because i don't need wifi and because there is zcip and quagga,
depending on what your primary target is supposed to do, or combinations
thereof ;P

>
>This is a working package file for this packet:

Please resubmit considering the notes below.

>package/olsr/Config.in
>
>config BR2_PACKAGE_OLSR
>        bool "OLSR mesh networking Deamon"
>        default n
>        help
>          OLSR
>
>          A mesh networking protocol
>
>          http://www.olsr.org/
>
>package/olsr/olsr.mk
>
>#############################################################
>#
># olsr

Does this conflict with the quagga suite?
I don't have a need for olsr, so this question is just for the sake of others..
>#
>#############################################################
>
>OLSR_VERSION_MAYOR=0.5

a mayor != major.
www.dict.org or ask your dict client, if in doubt.

>OLSR_VERSION_MINOR=3
>OLSR_VERSION:=$(OLSR_VERSION_MAYOR).$(OLSR_VERSION_MINOR)
>OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
>OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAYOR)
>OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
>OLSR_CAT:=$(BZCAT)
>OLSR_BINARY:=olsrd
>OLSR_TARGET_BINARY:=usr/bin/olsrd
>#OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph
>bmf quagga secure

hehe. See?

>OLSR_PLUGINS=dot_draw dyn_gw secure
>OLSR_TARGET_PLUGIN=usr/lib/
>
>$(DL_DIR)/$(OLSR_SOURCE):
>         $(WGET) -P $(DL_DIR) $(OLSR_SITE)/$(OLSR_SOURCE)
>
>olsr-source: $(DL_DIR)/$(OLSR_SOURCE)
>
>olsr-unpacked: $(OLSR_DIR)/.unpacked
>$(OLSR_DIR)/.unpacked: $(DL_DIR)/$(OLSR_SOURCE)
>        $(OLSR_CAT) $(DL_DIR)/$(OLSR_SOURCE) | tar -C $(BUILD_DIR)
>$(TAR_OPTIONS) -
>        touch $(OLSR_DIR)/.unpacked

Nowadays we touch the target. I'll adjust the docs accordingly ASAP.

>$(OLSR_DIR)/.configured: $(OLSR_DIR)/.unpacked
>        touch $(OLSR_DIR)/.configured

ditto.

>$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.configured
>        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd
>$(OLSR_PLUGINS)
>
>$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
>        rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>        cp -a $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)

cp -a doesn't work on MAC-OS-BSD. See other packages for the portable
equivalent.

>        cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.*
>$(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
>        mkdir -p $(TARGET_DIR)/etc/init.d
>        cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
>        chmod a+x $(TARGET_DIR)/etc/init.d/S50olsr
>        cp $(OLSR_DIR)/files/olsrd.conf.default.lq
>$(TARGET_DIR)/etc/olsrd.conf
>
>olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>
>olsr-clean:
>        rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>        -$(MAKE) -C $(OLSR_DIR) clean

I prefer the other way round, personally
>
>olsr-dirclean:
>        rm -rf $(OLSR_DIR)
>
>#############################################################
>#
># Toplevel Makefile options
>#
>#############################################################
>ifeq ($(strip $(BR2_PACKAGE_OLSR)),y)
>TARGETS+=olsrd $(OLSR_PLUGINS)
>endif
>
>package/olsr/files/S50olsr
>
>#!/bin/sh
>#
># Starts OLSRD deamon
>#
>
>start() {
>        echo -n "Starting OLSRd deamon: "
>        start-stop-daemon --start --quiet --pidfile /var/run/olsrd.pid
>--exec /usr/sbin/olsrd

This is supposed to work with busybox's start-stop-daemon with long
options _turned off_. Please fix.

>        echo "OK"
>}
>stop() {
>        echo -n "Stopping OLSRd deamon: "
>        start-stop-daemon --stop --quiet --pidfile /var/run/olsrd.pid

likewise.

>        echo "OK"
>}
>restart() {
>        stop
>        start
>}

Superfluous wasting space. Invoke start and stop directly.
>
>case "$1" in
>  start)
>        start
Superfluous wasting space. Invoke start and stop directly.
>        ;;
>  stop)
>        stop
Superfluous wasting space. Invoke start and stop directly.
>        ;;
>  restart|reload)
>        restart
Superfluous wasting space. Invoke start and stop directly.
>        ;;
>  *)
>        echo $"Usage: $0 {start|stop|restart}"
>        exit 1
>esac
>
>exit $?

Please send a patch (svn add package/olsrd;svn diff package > \
~/br2-add-olsrd.01.patch) that can be applied.

thanks in advance,
