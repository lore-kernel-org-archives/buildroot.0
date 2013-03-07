From: John Stile <john@stilen.com>
Date: Wed, 06 Mar 2013 17:44:59 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
 <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
Message-ID: <1362620699.20183.193.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gilles Talis,
On Wed, 2013-03-06 at 15:48 -0800, Gilles Talis wrote:
> Hi John,
> 
> 2013/3/6 John Stile <john@stilen.com>:
> > +define DHCPD_CONFIGURE_CMDS
> > +       (cd $@D) && \
> > +       $(DHCPCD_PATH) $(DHCPCD_ENV) \
> > +       ./configure \
> > +       $(CONFIG_ARGS) )
> > +endef
> 
> I think there's a small typo here. It should be:
> define DHCPCD_CONFIGURE_CMDS
> instead of
> define DHCPD_CONFIGURE_CMDS
> 
> This might make the difference.
> 
That did help.  Thank you.
The build now fails because it can't find ifaddrs.h:
ipv6.c:34:21: error: ifaddrs.h: No such file or directory
net.c:56:21: error: ifaddrs.h: No such file or directory

But I do see the file here:
./output/toolchain/uClibc-0.9.32/include/ifaddrs.h

Is there a good way to specify the path in my .mk file?

----------------
patch
----------------

Adding pacakge dhcpcd to buildroot

signed-off-by: John Stile <john@stilen.com>

--- a/buildroot-2011.11/package/Config.in	2013-03-06 11:40:52.000000000
-0800
+++ b/buildroot-2011.11/package/Config.in	2013-02-28 14:59:32.000000000
-0800
@@ -409,6 +409,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
 source "package/dhcpdump/Config.in"
+source "package/dhcpcd/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"

--- a/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-06
11:44:03.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-06
07:55:53.000000000 -0800
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DHCPCD
+	bool "dhcpcd"
+	depends on BR2_INET_IPV6
+	help
+	an RFC2131 compliant DHCP client

--- a/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-06
17:41:03.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-06
17:38:29.000000000 -0800
@@ -0,0 +1,48 @@
+#############################################################
+#
+# dhcpcd
+#
+#############################################################
+
+DHCPCD_VERSION = 5.6.7
+DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
+DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
+DHCPCD_LICENSE = BSD-2c
+DHCPCD_INSTALL_STAGING = NO
+
+
+CONFIG_ARGS += --target=$(BR2_GCC_TARGET_ARCH)
+
+#CONFIG_ARGS += --with-cc=$(TARGET_CC)
+
+ifeq ($(BR2_USE_MMU),n)
+    CONFIG_ARGS += --disable-fork
+endif 
+
+ifeq ($(BR2_INET_IPV6),)
+    DHCPCD_CFLAGS += -UHASIPv6
+endif
+
+define DHCPCD_CONFIGURE_CMDS
+	(cd $(@D); \
+	./configure $(CONFIG_ARGS) )
+endef
+
+define DHCPCD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS)  CC="$(TARGET_CC)" LD="$(TARGET_LD)"
PATH=$(TARGET_PATH) $(DHCPCD_CFLAGS) -C $(@D) all
+endef
+
+define DHCPCD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin/dhcpcd
+	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf $(TARGET_DIR)/etc/dhcpcd.conf
+endef
+
+define DHCPCD_DEVICES
+	#/dev/foo  c  666  0  0  42  0  -  -  -
+endef
+
+define DHCPCD_PERMISSIONS
+	/usr/bin/dhcpcd  f  4755  0  0  -  -  -  -  -
+endef
+
+$(eval $(call GENTARGETS))
