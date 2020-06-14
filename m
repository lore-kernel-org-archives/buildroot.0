From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Jun 2020 21:07:40 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration
 file
In-Reply-To: <20200614095628.GJ2346@scaer>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-2-ps.report@gmx.net>
 <20200614095628.GJ2346@scaer>
Message-ID: <20200614210740.0d39d95d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 14 Jun 2020 11:56:29 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-06-13 01:24 +0200, Peter Seiderer spake thusly:
> > Add basic /etc/iwd/main.conf configuration file to enable
> > network configuration (use built-in dhcp client).
> >
> > For the non systemd case select the openresolv package to
> > fulfill the iwd resolvconf requirement.
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/iwd/Config.in |  1 +
> >  package/iwd/iwd.mk    | 19 +++++++++++++++++++
> >  package/iwd/main.conf |  3 +++
> >  3 files changed, 23 insertions(+)
> >  create mode 100644 package/iwd/main.conf
> >
> > diff --git a/package/iwd/Config.in b/package/iwd/Config.in
> > index 4501017630..6d42cac35c 100644
> > --- a/package/iwd/Config.in
> > +++ b/package/iwd/Config.in
> > @@ -8,6 +8,7 @@ config BR2_PACKAGE_IWD
> >  	depends on BR2_USE_WCHAR # ell
> >  	select BR2_PACKAGE_DBUS # runtime
> >  	select BR2_PACKAGE_ELL
> > +	select BR2_PACKAGE_OPENRESOLV if !BR2_INIT_SYSTEMD
>
> I think this is preferable to use BR2_PACKAGE_SYSTEMD as the dependency,
> rather than BR2_INIT_SYSTEMD, even if the two are currently tightly
> intertwinned.

I would prefer the !BR2_INIT_SYSTEMD as I believe iwd needs
an service of the running systemd (or an alternative implementation)
and not a feature/library of the systemd package (only runtime not
a compile time dependency)...

>
> >  	help
> >  	  iNet Wireless daemon (iwd)
> >
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index 32ff175933..d105d3b128 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -46,4 +46,23 @@ else
> >  IWD_CONF_OPTS += --disable-systemd-service
> >  endif
> >
> > +define IWD_INSTALL_CONFIG_FILE
> > +	mkdir -p $(TARGET_DIR)/etc/iwd
> > +	$(INSTALL) -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
> > +endef
> > +
> > +ifeq ($(BR2_INIT_SYSTEMD),y)
> > +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > +	echo -e "[Network]\nNameResolvingService=systemd" >> $(TARGET_DIR)/etc/iwd/main.conf
>
> Do not use 'echo -e' but use printf. Also the line is too long:
>
>     printf '[Network]\nNameResolvingService=systemd\n' \
>         >>$(TARGET_DIR)/etc/iwd/main.conf
>
> However, this will not be working nicely on rebuilds, as it will keep
> appending this to the file. See below for a better approach (I think):

On re-builds the common IWD_INSTALL_CONFIG_FILE (copy plain main.conf will
be executed first, so no problem...

>
> Also, the condiotion on BR2_INIT_SYSTEMD is already handled by the
> infra, by using the appropriate INIT_INSTALL hooks:
>
>     define IWD_INSTALL_INIT_SYSV
>         sed -r -e '$s/$/\n[Network]\nNameResolvingService=resolvconf/' \
>             $(IWD_PKGDIR)main.conf \
>             >$(TARGET_DIR)/etc/iwd/main.conf
>     endef

Does not work, gives:

	sed: -e expression #1, char 46: missing command

And did not figure out what would be the right sed exprecssion (the leading $
seems to be wrong, but without another error occures)...

>
>     define IWD_INSTALL_INIT_SYSTEMD
>         sed -r -e '$s/$/\n[Network]\nNameResolvingService=systemd/' \
>             $(IWD_PKGDIR)main.conf \
>             >$(TARGET_DIR)/etc/iwd/main.conf
>     endef

Nice shortcut, but misses the enable-the-one-option-for-systemd and
enable-the-other-option-for-all-other-init-systems...

>
> > +endef
> > +else
> > +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > +	echo -e "[Network]\nNameResolvingService=resolvconf" >> $(TARGET_DIR)/etc/iwd/main.conf
> > +endef
> > +endif
> > +
> > +IWD_POST_INSTALL_TARGET_HOOKS += \
> > +	IWD_INSTALL_CONFIG_FILE \
> > +	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
>
> And thus those post-install hooks are not longer required.

Nice, but see downside above...

Thanks for review,
Peter

>
> Regards,
> Yann E. MORIN.
>
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
> > --
> > 2.26.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
