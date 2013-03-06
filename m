From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Wed, 6 Mar 2013 20:05:49 +0000
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362599417.20183.159.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
Message-ID: <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In your patch, you should probably replace the place-holder "...some environment variables..." with setting some actual environment variables.

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of John Stile
Sent: Thursday, 7 March 2013 8:50 a.m.
To: Thomas Petazzoni
Cc: buildroot
Subject: Re: [Buildroot] adding dhcpcd

Dear Thomas,
On Wed, 2013-03-06 at 19:58 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
>
> On Wed, 06 Mar 2013 10:01:56 -0800, John Stile wrote:
>
> > If I'm going to rebuild a good package I might as well use the latest
> > version of dhcpcd, so I'll start with 5.6.7.
>
> Good idea.
>
> > I am not sure if
> > http://roy.marples.name/downloads/dhcpcd/dhcpcd-5.6.7.tar.bz2
> > uses cmake or automake.  The tarball contains a Makefile, and their
> > configure script has the comment, "Try and be like autotools configure,
> > but without autotools", so I assume it is just using gnu make.
>
> Your analysis is correct. It has an hand-crafted configure script that
> writes values into a config.mk, which presumably, gets read by the
> Makefile. So it's neither autotools nor CMake, so you have to use the
> "generic-package" infrastructure.
>
> >  It does
> > contain a Makefile... but I don't see how to use it from:
> > http://buildroot.org/downloads/manual/manual.html#generic-package-tutorial
> >
> > So I tried to make a pacakge using
> > $(eval $(generic-package))
>
> Good.
>
> Your file below has been line-wrapped by your e-mail client. Not a big
> issue just to discuss, but if you want to submit a patch, you'll have
> to fix your e-mail client, or better, use 'git send-email'.
>
> > When I run make in buildroot, the package is not downloaded, or built.
> > Below is my package file so far.
>
> Please send a complete patch. The main reason is usually that your
> BR2_PACKAGE_<foo> option is misnamed, or that the package is not
> located in the proper directory.
>
> When creating a package named "foo", it is very important that:
>
>  * The option in Config.in is BR2_PACKAGE_FOO.
>
>  * The package is located in package/foo/.
>
> > #############################################################
> > #
> > # dhcpcd
> > #
> > #############################################################
> >
> > DHCPCD_VERSION = 5.6.7
> > DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
> > DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
> > DHCPCD_LICENSE = GPLv3+
> > DHCPCD_LICENSE_FILES = COPYING
>
> The license is not GPLv3+, it's BSD-2c, and there is no COPYING file.
>
> > DHCPCD_INSTALL_STAGING = YES
>
> No, it's just installing an application, so setting
> DHCPD_INSTALL_STAGING to YES is not necessary.
>
> > DHCPCD_CONFIG_SCRIPTS = configure
>
> No, the configure script is not a <foo>-config script.
>
> > DHCPCD_DEPENDENCIES =
>
> Not needed, it is empty by default.
>
> > DHCPCD_SITE_METHOD = wget
>
> Not needed, it is guessed automatically from the URL (which starts by
> http://).
>
> Before the BUILD_CMDS, you should have a:
>
> define DHCPD_CONFIGURE_CMDS
>       (cd $(@D);
>               ...some environment variables...
>               ./configure
>               ...some options...)
> endef
>
> This will call the configure script.
>
> > define DHCPCD_BUILD_CMDS
> >     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> > endef
>
> If you run the configure script, then the CC and LD are defined in
> config.mk, so there should be no need to pass them in the environment
> anymore.
>
> > define DHCPCD_INSTALL_STAGING_CMDS
> >     $(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf
> > $(STAGING_DIR)/etc/dhcpcd.conf
> >     $(INSTALL) -D -m 0755 $(@D)/dhcpcd $(STAGING_DIR)/usr/bin/dhcpcd
> > endef
>
> Not needed as we should not be installing dhcpcd in the staging area.
>
> > define DHCPCD_INSTALL_TARGET_CMDS
> >     $(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin
>
> This should be:
>
>       $(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin/dhcpcd
>
> >     $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/dhcpcd.conf
>
> Are you you want to create the /etc/dhcpcd.conf file? It would have
> thought you wanted to copy the default dhcpcd.conf configuration file,
> no? If so:
>
>       $(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf $(TARGET_DIR)/etc/dhcpcd.conf
>
> > endef
> >
> > define DHCPCD_PERMISSIONS
> >     /usr/bin/dhcpcd  f  4755  0  0  -  -  -  -  -
> > endef
>
> I'm not sure, does dhcpcd needs to be installed setuid-root?
>
> Anyway, despite those comments, you are definitely on the right track
> to create a proper package!

> Thanks,
>
> Thomas

I think I have addressed the problem with the make file, but it still
silently does not build.  I am attaching a complete patch.

------------------
Begin dhcpcd.patch
------------------

Adding package dhcpcd to buildroot

signed-off-by: John Stile <john@stilen.com>

--- a/buildroot-2011.11/package/Config.in       2013-03-06 11:40:52.000000000 -0800
+++ b/buildroot-2011.11/package/Config.in       2013-02-28 14:59:32.000000000 -0800
@@ -409,6 +409,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
 source "package/dhcpdump/Config.in"
+source "package/dhcpcd/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"

--- a/buildroot-2011.11/package/dhcpcd/Config.in        2013-03-06 11:44:03.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/Config.in        2013-03-06 07:55:53.000000000 -0800
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DHCPCD
+       bool "dhcpcd"
+       depends on BR2_INET_IPV6
+       help
+       an RFC2131 compliant DHCP client

--- a/buildroot-2011.11/package/dhcpcd/dhcpcd.mk        2013-03-06 11:44:03.000000000 -0800
+++ b/buildroot-2011.11/package/dhcpcd/dhcpcd.mk        2013-03-06 11:38:17.000000000 -0800
@@ -0,0 +1,43 @@
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
+CONFIG_ARGS = $(BR2_GCC_TARGET_ARCH)
+
+ifeq ($(BR2_USE_MMU),n)
+    CONFIG_ARGS =: --disable-fork
+endif
+
+define DHCPD_CONFIGURE_CMDS
+       (cd $(@D);
+       ...some environment variables...
+       ./configure \
+       $(CONFIG_ARGS) )
+endef
+
+define DHCPCD_BUILD_CMDS
+       $(MAKE) -C $(@D) all
+endef
+
+define DHCPCD_INSTALL_TARGET_CMDS
+       $(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin/dhcpcd
+       $(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf $(TARGET_DIR)/etc/dhcpcd.conf
+endef
+
+define DHCPCD_DEVICES
+       #/dev/foo  c  666  0  0  42  0  -  -  -
+endef
+
+define DHCPCD_PERMISSIONS
+       /usr/bin/dhcpcd  f  4755  0  0  -  -  -  -  -
+endef
+
+$(eval $(generic-package))


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
