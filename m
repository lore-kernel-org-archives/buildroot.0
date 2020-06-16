From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Jun 2020 08:25:31 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/iwd: add basic configuration
 file
In-Reply-To: <871rmfofbo.fsf@tarshish>
References: <20200615184753.15197-1-ps.report@gmx.net>
 <871rmfofbo.fsf@tarshish>
Message-ID: <20200616082531.66780344@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, 16 Jun 2020 06:32:59 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
>
> On Mon, Jun 15 2020, Peter Seiderer wrote:
> > Add basic /etc/iwd/main.conf configuration file to enable
> > network configuration (use built-in dhcp client).
> >
> > For the non systemd-resolved case select the openresolv package
> > to fulfill the iwd resolvconf requirement (and adjust the
> > configuration file accordingly).
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - use printf insteadof echo (Yann E. MORIN)
> >
> > Changes v2 -> v3:
> >   - select openresolv in all cases but systemd-resloved is enabled
> >   - enable NameResolvingService=systemd in the configuration file only in
> >     case of systemd-resloved is enabled, enable NameResolvingService=resolvconf
> >     in the configuration file otherwise
> > ---
> >  package/iwd/Config.in |  1 +
> >  package/iwd/iwd.mk    | 21 +++++++++++++++++++++
> >  package/iwd/main.conf |  3 +++
> >  3 files changed, 25 insertions(+)
> >  create mode 100644 package/iwd/main.conf
> >
> > diff --git a/package/iwd/Config.in b/package/iwd/Config.in
> > index ec53d13047..4e85fb4fd7 100644
> > --- a/package/iwd/Config.in
> > +++ b/package/iwd/Config.in
> > @@ -8,6 +8,7 @@ config BR2_PACKAGE_IWD
> >  	depends on BR2_USE_WCHAR # ell
> >  	select BR2_PACKAGE_DBUS # runtime
> >  	select BR2_PACKAGE_ELL
> > +	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
> >  	help
> >  	  iNet Wireless daemon (iwd)
> >
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index 32ff175933..c58e795f99 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -46,4 +46,25 @@ else
> >  IWD_CONF_OPTS += --disable-systemd-service
> >  endif
> >
> > +define IWD_INSTALL_CONFIG_FILE
> > +	mkdir -p $(TARGET_DIR)/etc/iwd
> > +	$(INSTALL) -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> > +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > +	print "[Network]\nNameResolvingService=systemd\n" \
>
> print? Are you sure this does what you expect? It is surely not
> portable. On my system (Debian) /usr/bin/print is a symlink to
> run-mailcap.

Your are right, I completely messed up this patch version...and is
definitely not the one I tested with..., update follows, thanks
for review....

Regards,
Peter

>
> > +		>> $(TARGET_DIR)/etc/iwd/main.conf
> > +endef
> > +else
> > +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > +	echo -e "[Network]\nNameResolvingService=resolvconf\n" \
>
> You still use 'echo' here.
>
> baruch
>
> > +		>> $(TARGET_DIR)/etc/iwd/main.conf
> > +endef
> > +endif
> > +
> > +IWD_POST_INSTALL_TARGET_HOOKS += \
> > +	IWD_INSTALL_CONFIG_FILE \
> > +	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > +
> >  $(eval $(autotools-package))
> > diff --git a/package/iwd/main.conf b/package/iwd/main.conf
> > new file mode 100644
> > index 0000000000..c26a50d302
> > --- /dev/null
> > +++ b/package/iwd/main.conf
> > @@ -0,0 +1,3 @@
> > +# use built-in dhcp client
> > +[General]
> > +EnableNetworkConfiguration=true
>
