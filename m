From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Sep 2017 08:30:32 +0300
Subject: [Buildroot] [PATCH 1/2] shairport-sync: fix static link with
 mbedtls
In-Reply-To: <20170905214447.7e75c2da@windsurf.lan>
References: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
 <20170905214447.7e75c2da@windsurf.lan>
Message-ID: <20170906053032.tdj2seviftc5dbxz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 05, 2017 at 09:44:47PM +0200, Thomas Petazzoni wrote:
> On Tue,  5 Sep 2017 22:05:25 +0300, Baruch Siach wrote:
> 
> >  # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
> >  # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
> >  # and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
> > @@ -38,6 +40,10 @@ SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
> >  else
> >  SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
> >  SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
> > +SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
> > +ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
> > +SHAIRPORT_SYNC_CONF_LIBS += -lz
> > +endif
> >  endif
> 
> This is crazy. Can we submit a mbedtls patch adding a pkg-config file ?
> They are open to it it seems:
> https://github.com/ARMmbed/mbedtls/issues/228. Of course,
> shairport-sync would have to be modified to use it.

Crazy indeed. I'll see if I can do something about mbedtls pkg-config as time 
permits. But I think we'll need this workaround for now.

BTW, this fix is independent of the mbedtls security bump, since the static 
build issue affects the current mbedtls version as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
