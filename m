From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Tue, 19 Jan 2016 09:52:08 -0600
Subject: [Buildroot] [PATCH v3 1/4] package/dhcp: bump version to
	4.3.3-P1
In-Reply-To: <569D26AD.40000@mind.be>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
 <1453131741-1613-2-git-send-email-rdkehn@yahoo.com>
 <569D26AD.40000@mind.be>
Message-ID: <20160119155208.GB4492@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jan 18, 2016 at 06:53:49PM +0100, Arnout Vandecappelle wrote:
>  Hi Doug,
> 
> Generic feedback on this series: it should be a single patch. The package will
> not build for some configurations that currently work if you apply just patch 1,
> so we would end up with a non-bisectable situation. We want patches to be split
> up into single-function pieces, but at the same time we want to maintain
> "correctness" after each individual patch.

Okay, I wasn't sure which would be better. I will resubmit as single patch.
> 
> 
> On 18-01-16 16:42, Doug Kehn wrote:
> > Parallel builds are not supported because the bind libraries must be
> > built first.
> 
>  That could maybe be worked around by building the bind libraries explicitly in
> a PRE_BUILD_HOOK. But that's something that can be done in a follow-up patch.
> 

Digging further, it's bind that needs -j1. A PRE_BUILD_HOOK can be
added for bind that uses $(MAKE1). If a PRE_BUILD_HOOK is added,
then bind potentially ends up with a POST_CONFIGURE_HOOK (see below)
and a PRE_BUILD_HOOK.

Since I'm resubmitting the patch, it's not that big of a deal to add
a PRE_BUILD_HOOK to prevent all of dhcp being built with -j1. Which
do you prefer?

> > 
> > The embedded bind configure is called as part of dhcp make instead of
> > dhcp configure. dhcp make environment is expanded to ensure bind
> > configure has the proper information.
> 
>  You wrote earlier that it also worked if we explicitly configure in a
> POST_CONFIGURE_HOOK, didn't you? That would be better because then we can
> control the bind configure as well, see my comments in 0001-bind-configure.patch

It's not an explicit call to bind's configure. dhcp configure
creates a bind Makefile. This Makefile is called from dhcp make to
un-tar, configure, and make the embedded bind source. The bind
Makefile created by dhcp configure contains configure options for
bind's configure. For a POST_CONFIGURE_HOOK, it would be better to
call:
   $(DHCP_BIND_CONF_ENV) $(DHCP_MAKE) -C $(@D)/bind bind1
as suggested by Ricardo. The bind1 target is responsible for
configuring bind.

As mentioned in response to 0001-bind-configure.patch, bind
configure options can be controlled with dhcp configure BINDCONFIG
variable.

I'll resubmit the patch with POST_CONFIGURE_HOOK.

> > 
> > The embedded bind tar-ball is extracted after the source so patches can
> > be applied to dhcp and bind before the package is built.
> > 
> > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > ---
> > Changes v2 -> v3
> >   - removed RFC tag
> >   - updated version from 4.3.3 to 4.3.3-P1 (suggested by Richardo)
> >   - external toolchain support (suggested by Richardo)
> > Changes v1 -> v2
> >   - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
> > ---
> >  package/dhcp/dhcp.hash |  4 ++--
> >  package/dhcp/dhcp.mk   | 17 ++++++++++++++++-
> >  2 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
> > index 84e3c63..e2bb6d9 100644
> > --- a/package/dhcp/dhcp.hash
> > +++ b/package/dhcp/dhcp.hash
> > @@ -1,2 +1,2 @@
> > -# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
> > -sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
> > +# Verified from ftp://ftp.isc.org/isc/dhcp/4.3-3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
> > +sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
> > diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> > index c05e694..1bc088e 100644
> > --- a/package/dhcp/dhcp.mk
> > +++ b/package/dhcp/dhcp.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -DHCP_VERSION = 4.1-ESV-R12
> > +DHCP_VERSION = 4.3.3-P1
> >  DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
> >  DHCP_INSTALL_STAGING = YES
> >  DHCP_LICENSE = ISC
> > @@ -25,6 +25,21 @@ DHCP_CONF_OPTS = \
> >  	--with-relay-pid-file=/var/run/dhcrelay.pid \
> >  	--with-relay6-pid-file=/var/run/dhcrelay6.pid
> >  
> > +DHCP_MAKE=$(MAKE1)
> > +
> > +# Embedded bind configure is called as part of dhcp make instead of dhcp
> > +# configure. Pass configure env to make so bind configure has what it needs.
> 
>  So this wouldn't be needed with a POST_CONFIGURE_HOOK, right?

Yes, it is still needed. However, it would change from DHCP_MAKE_ENV
to DHCP_BIND_CONF_ENV.

I've attached an example dhcp.mk based on the discussion here.
Hopefully, it will help add clarity to the discussion.

Thanks,
...doug
-------------- next part --------------
################################################################################
#
# dhcp
#
################################################################################

DHCP_VERSION = 4.3.3-P1
DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
DHCP_INSTALL_STAGING = YES
DHCP_LICENSE = ISC
DHCP_LICENSE_FILES = LICENSE
DHCP_CONF_ENV = \
	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
	ac_cv_file__dev_random=yes \
	BINDCONFIG='--with-randomdev=/dev/random'
DHCP_CONF_OPTS = \
	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
	--with-cli6-lease-file=/var/lib/dhcp/dhclient6.leases \
	--with-srv-pid-file=/var/run/dhcpd.pid \
	--with-srv6-pid-file=/var/run/dhcpd6.pid \
	--with-cli-pid-file=/var/run/dhclient.pid \
	--with-cli6-pid-file=/var/run/dhclient6.pid \
	--with-relay-pid-file=/var/run/dhcrelay.pid \
	--with-relay6-pid-file=/var/run/dhcrelay6.pid

define DHCP_EXTRACT_BIND
	cd $(@D)/bind; tar -xvf bind.tar.gz
endef
DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND

DHCP_BIND_CONF_ENV = \
	$(TARGET_CONFIGURE_OPTS) \
	BUILD_CC="$(HOSTCC)"

define DHCP_BIND_CONFIGURE
	$(DHCP_BIND_CONF_ENV) $(MAKE1) -C $(@D)/bind bind1
endef
DHCP_POST_CONFIGURE_HOOKS += DHCP_BIND_CONFIGURE

define DHCP_BIND_MAKE
	$(DHCP_MAKE_ENV) $(MAKE1) -C $(@D)/bind
endef
DHCP_PRE_BUILD_HOOKS += DHCP_BIND_MAKE

ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
DHCP_CONF_OPTS += --enable-delayed-ack
endif

ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
define DHCP_INSTALL_SERVER
	mkdir -p $(TARGET_DIR)/var/lib
	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
endef
endif

ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
define DHCP_INSTALL_RELAY
	mkdir -p $(TARGET_DIR)/var/lib
	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
		$(TARGET_DIR)/usr/sbin/dhcrelay
endef
endif

ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
define DHCP_INSTALL_CLIENT
	mkdir -p $(TARGET_DIR)/var/lib
	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
		$(TARGET_DIR)/sbin/dhclient
	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
		$(TARGET_DIR)/etc/dhcp/dhclient.conf
	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
		$(TARGET_DIR)/sbin/dhclient-script
endef
endif

# Options don't matter, scripts won't start if binaries aren't there
define DHCP_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
		$(TARGET_DIR)/etc/init.d/S80dhcp-server
	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
endef

ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
define DHCP_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
		$(TARGET_DIR)/usr/lib/systemd/system/dhcpd.service

	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants

	ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service

	echo "d /var/lib/dhcp 0755 - - - -" > \
		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
endef
endif

define DHCP_INSTALL_TARGET_CMDS
	$(DHCP_INSTALL_RELAY)
	$(DHCP_INSTALL_SERVER)
	$(DHCP_INSTALL_CLIENT)
endef

$(eval $(autotools-package))
