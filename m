From: John Stile <john@stilen.com>
Date: Sun, 10 Mar 2013 15:09:42 -0700
Subject: [Buildroot] add dhcpcd package
In-Reply-To: <20130309165832.703b4b0d@skate>
References: <1362733696.30287.145.camel@genx> <20130309165832.703b4b0d@skate>
Message-ID: <1362953382.30287.216.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,
On Sat, 2013-03-09 at 16:58 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
> 
> On Fri, 08 Mar 2013 01:08:16 -0800, John Stile wrote:
> > dhcpcd: new package
> 
> This line should be the title of the e-mail, as it will become the
> title of the patch once applied. Please use 'git send-email' to send
> your patches, it will make sure that everything is done properly, and
> will save you a lot of issues.
> 

I wasn't able to figure out how to get this working with my email
server, but I'll give it another shot.  I simply tried to save the
email, and then use my normal client to send it.

> > Dhcpcd is an RFC2131 compliant DHCP client.
> > 
> > Signed-off-by: John Stile <john@stilen.com>
> > ---
> >  package/Config.in        |  1 +
> >  package/dhcpcd/Config.in |  5 +++++
> >  package/dhcpcd/dhcpcd.mk | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 54 insertions(+)
> >  create mode 100644 package/dhcpcd/Config.in
> >  create mode 100644 package/dhcpcd/dhcpcd.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index 22e64f8..924b464 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -633,6 +633,7 @@ source "package/cups/Config.in"
> >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> >  source "package/dhcp/Config.in"
> >  endif
> > +source "package/dhcpcd/Config.in"
> >  source "package/dhcpdump/Config.in"
> >  source "package/dnsmasq/Config.in"
> >  source "package/dropbear/Config.in"
> > diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> > new file mode 100644
> > index 0000000..3855c6a
> > --- /dev/null
> > +++ b/package/dhcpcd/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_DHCPCD
> > +	bool "dhcpcd"
> > +	help
> > +	  An RFC2131 compliant DHCP client
> > +	  NOTE: If uClibc, depends on  UCLIBC_SUPPORT_AI_ADDRCONFIG=y
> 
> As Gilles said, this note is useless, since AI_ADDRCONFIG is enabled by
> default.
> 

My particular configuration did not have this enabled, and my particular
uclibc configuration was simply copied from something I got from an
atmel site.  Since I tripped over this ladder in a dark room, I thought
a note could be enlightening for the next person, since I can't make a
dependency in the kconfig.

Should I still remove it?

> Also, after this help text, leave one blank line, and add the upstream
> URL of the project. See all other Config.in files for packages in
> Buildroot's tree. See also
> http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file
> 

Sounds good.

> > diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> > new file mode 100644
> > index 0000000..c7aa82e
> > --- /dev/null
> > +++ b/package/dhcpcd/dhcpcd.mk
> > @@ -0,0 +1,48 @@
> > +#############################################################
> > +#
> > +# dhcpcd
> > +#
> > +#############################################################
> > +
> > +DHCPCD_VERSION = 5.6.7
> > +DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
> > +DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
> > +DHCPCD_LICENSE = BSD-2c
> > +
> > +ifeq ($(BR2_USE_MMU),n)
> 
> I already told you this would have no effect. BR2_USE_MMU is either 'y'
> or empty. So it should be:
> 
> ifeq ($(BR2_USE_MMU),)
> 

Whoops.  My regression. Sorry.

> > +	DHCPCD_CONFIG_OPT += --disable-fork
> > +endif 
> > +
> > +ifeq ($(BR2_INET_IPV6),)
> > +	DHCPCD_CFLAGS += -UHASIPv6
> > +endif
> 
> I grepped through the entire dhcpcd source tree, and I haven't seen
> this HASIPv6 thing mentioned anywhere. Where did you get this from?
> 

I used the package lsof-4.85 as an example, but I guess it's used of
HASIPv6 is isolated, so I will remove it.

> > +
> > +define DHCPCD_CONFIGURE_CMDS
> > +	(cd $(@D); \
> > +	./configure \
> > +	--target=$(BR2_GCC_TARGET_ARCH) \
> > +	--os=linux \
> > +	$(DHCPCD_CONFIG_OPT) )
> 
> We usually indent the subsequent lines with one more tab:
> 
> 	(cd $(@D); \
> 		./configure \
> 		--target=$(BR2_GCC_TARGET_ARCH) \
> 		--os=linux \
> 		$(DHCPCD_CONFIG_OPT))
> 
> > +endef
> > +
> > +define DHCPCD_BUILD_CMDS
> > +	$(MAKE) \
> > +	$(TARGET_CONFIGURE_OPTS) \
> > +	$(DHCPCD_CFLAGS) \
> > +	-C $(@D) all
> 
> Ditto here.
> 
> Also, as Gilles noted, if DHPCD_FLAGS expands to -UHASIPv6, then your
> build will break: -UHASIPv6 is not a valid option for make.
> 
> > +define DHCPCD_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
> > +	$(TARGET_DIR)/usr/bin/dhcpcd
> 
> Intend the subsequent line with one tab.
> 
> 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
> 		$(TARGET_DIR)/usr/bin/dhcpcd
> 
> > +	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
> > +	$(TARGET_DIR)/etc/dhcpcd.conf
> > +	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
> > +	$(TARGET_DIR)/libexec/dhcpcd-run-hooks
> > +endef
> > +
> > +# NOTE: Even though this package has a configure script, it is not generated
> > +# using the autotools, so we have to use the generic package infrastructure.
> > +
> > +$(eval $(call generic-package))
> > +
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
