From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Jun 2014 00:09:07 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: rework network.service
 installation
In-Reply-To: <20140616210616.GA572@free.fr>
References: <1402951952-31334-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140616210616.GA572@free.fr>
Message-ID: <20140616220907.GB29444@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!  On Mon, Jun 16, 2014 at 11:06:16PM +0200, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-06-16 22:52 +0200, Eric Le Bihan spake thusly:
> > The installation of the network.service file is now performed via the
> > <pkg>_INIT_SYSTEMD mechanism instead of an installation hook.
>
> Would mind also switching the other hooks over to use _INIT_SYSTEMD while
> you are at it? ;-)
I thought _INIT_SYSTEMD was for installing services only, as was _INIT_SYSV,
so IMHO only SYSTEMD_INSTALL_TTY_HOOK could be converted to
SYSTEMD_INSTALL_SERVICE_TTY.  The other installation hooks are real clean up
operations, not services.

> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/systemd/systemd.mk | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index f3874db..97fa61a 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -101,6 +101,13 @@ ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
> >  SYSTEMD_CONF_OPT += --enable-networkd
> >  else
> >  SYSTEMD_CONF_OPT += --disable-networkd
> > +define SYSTEMD_INSTALL_SERVICE_NETWORK
> > +	$(INSTALL) -D -m 644 package/systemd/network.service \
> > +		$(TARGET_DIR)/etc/systemd/system/network.service
> > +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +	ln -fs ../network.service \
> > +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> > +endef
>
> So, if networkd is disabled, you still install the network units?
>
> Should that block not go in the non-else part of the condition instead?
No, because systemd-networkd and network.service are mutually exclusive
solutions for managing the network.

When systemd is compiled with systemd-networkd support, another service
(systemd-networkd.service, of course) is installed and enabled. This is a
recent addition to systemd (v212).

The patch provided by Ivan dates from v44 and provides an alternative to
systemd-networkd, based on ifupdown (as /etc/init.d/S40network).

If systemd-networkd is selected, I chose not to install network.service to
avoid confusing the end user, who will have only one way to manage the
network.

Perhaps I should also make BR2_PACKAGE_SYSTEMD_NETWORKD depends on
!BR2_PACKAGE_NETWORK_MANAGER as systemd-networkd and NetworKManager both
manages the network. But they do not play in the same category, and it looks
like the developpers of NetworKManager are trying to make them coexist in
peace [1].

Best regards,
ELB

[1] https://www.mail-archive.com/systemd-devel at lists.freedesktop.org/msg18419.html
