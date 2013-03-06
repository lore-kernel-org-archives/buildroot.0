From: John Stile <john@stilen.com>
Date: Wed, 06 Mar 2013 14:57:33 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <20130306222902.2d736c06@skate>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate>
Message-ID: <1362610654.20183.176.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,
On Wed, 2013-03-06 at 22:29 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
> 
> On Wed, 06 Mar 2013 13:20:28 -0800, John Stile wrote:
> 
> > The version that was downloaded was from the make file that you said
> > wasn't very good, so I tried to make a new makefile but it just doesn't
> > work.  
> > 
> > Could it be a problem that I am using buildroot-2011.11?
> > My project can't really upgrade right now, but I wonder if that could be
> > the cause.  
> 
> Aaaah, you're using 2011.11!
> 
> So, yes indeed that explains it all.
> 
> Change the last line from:
> 
> $(eval $(generic-package))
> 
> to:
> 
> $(eval $(call GENTARGETS))
> 
> Best regards,
> 
> Thomas
Aaaah,  that helps.  But it looks like it is not calling the configure
step.  I have attached the current version as a patch.

>>> dhcpcd 5.6.7 Downloading
--2013-03-06 14:50:35--  http://roy.marples.name/downloads/dhcpcd//dhcpcd-5.6.7.tar.bz2
Resolving roy.marples.name... 77.75.106.61, 2a01:348:31:2:209:5bff:fe84:887d
Connecting to roy.marples.name|77.75.106.61|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 85983 (84K) [application/octet-stream]
Saving to: ?/home/jstile/svn_rmserver/buildroot-2011.11/dl/dhcpcd-5.6.7.tar.bz2?

100%[==========================================================================================================================>] 85,983      76.5KB/s   in 1.1s   

2013-03-06 14:50:36 (76.5 KB/s) - ?/home/jstile/svn_rmserver/buildroot-2011.11/dl/dhcpcd-5.6.7.tar.bz2? saved [85983/85983]

>>> dhcpcd 5.6.7 Extracting
bzcat /home/jstile/svn_rmserver/buildroot-2011.11/dl/dhcpcd-5.6.7.tar.bz2 | tar --strip-components=1 -C /home/jstile/svn_rmserver/buildroot-2011.11/output/build/dhcpcd-5.6.7  -xf -
>>> dhcpcd 5.6.7 Patching package//dhcpcd
>>> dhcpcd 5.6.7 Configuring
>>> dhcpcd 5.6.7 Building
/usr/bin/make -j2  CC="/home/jstile/svn_rmserver/buildroot-2011.11/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" LD="/home/jstile/svn_rmserver/buildroot-2011.11/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"  -C /home/jstile/svn_rmserver/buildroot-2011.11/output/build/dhcpcd-5.6.7 all
make[1]: Entering directory `/home/jstile/svn_rmserver/buildroot-2011.11/output/build/dhcpcd-5.6.7'
Makefile:11: config.mk: No such file or directory
make[1]: *** No rule to make target `config.mk'.  Stop.
make[1]: Leaving directory `/home/jstile/svn_rmserver/buildroot-2011.11/output/build/dhcpcd-5.6.7'
make: *** [/home/jstile/svn_rmserver/buildroot-2011.11/output/build/dhcpcd-5.6.7/.stamp_built] Error 2


------------------
patch
------------------
Adding pacakge dhcpcd to buildroot

signed-off-by: John Stile <john@stilen.com>

--- a/buildroot-2011.11/package/Config.in	2013-03-06 11:40:52.000000000 -0800
+++ b/buildroot-2011.11/package/Config.in	2013-02-28 14:59:32.000000000 -0800
@@ -409,6 +409,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
 source "package/dhcpdump/Config.in"
+source "package/dhcpcd/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"

--- a/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-06 11:44:03.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-06 07:55:53.000000000 -0800
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DHCPCD
+	bool "dhcpcd"
+	depends on BR2_INET_IPV6
+	help
+	an RFC2131 compliant DHCP client

--- a/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-06 14:54:11.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-06 14:50:13.000000000 -0800
@@ -0,0 +1,45 @@
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
+DHCPCD_PATH	:= PATH=$(CROSS_PATH)
+DHCPCD_ENV 	:= $(CROSS_ENV)
+
+CONFIG_ARGS =: --target=$(BR2_GCC_TARGET_ARCH)
+
+ifeq ($(BR2_USE_MMU),n)
+    CONFIG_ARGS =: --disable-fork
+endif 
+
+define DHCPD_CONFIGURE_CMDS
+	(cd $@D) && \
+	$(DHCPCD_PATH) $(DHCPCD_ENV) \
+	./configure \
+	$(CONFIG_ARGS) )
+endef
+
+define DHCPCD_BUILD_CMDS
+	$(MAKE)  CC="$(TARGET_CC)" LD="$(TARGET_LD)"  -C $(@D) all
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
