From: Jonathan Liu <net147@gmail.com>
Date: Mon, 13 Aug 2012 11:02:40 +1000
Subject: [Buildroot] [PATCH v3 2/2] nodejs: new package
In-Reply-To: <20120812182909.4988214d@skate>
References: <1344761525-532-1-git-send-email-net147@gmail.com>
 <1344761525-532-3-git-send-email-net147@gmail.com>
 <20120812182909.4988214d@skate>
Message-ID: <CANwerB3M_qD7Ly8jsTzXvABx7pMdGpASiEicy+_mzi27Vyg9bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 August 2012 02:29, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Sun, 12 Aug 2012 18:52:05 +1000,
> Jonathan Liu <net147@gmail.com> a ?crit :
>
> > --- /dev/null
> > +++ b/package/nodejs/Config.in
> > @@ -0,0 +1,38 @@
> > +config BR2_PACKAGE_NODEJS
> > +     bool "nodejs"
> > +     help
> > +       Event-driven I/O server-side JavaScript environment based on V8.
> > +
> > +       http://nodejs.org/
> > +
> > +if BR2_PACKAGE_NODEJS
> > +
> > +config BR2_PACKAGE_NODEJS_SSL
> > +     bool "enable SSL support"
> > +     default y
> > +     help
> > +       Enable SSL support.
>
> In general, we don't add a suboption to enable OpenSSL support: is the
> openssl package is enabled, we automatically enable openssl support in
> the package.
>
Ok.

>
> > +if BR2_PACKAGE_NODEJS_SSL
> > +
> > +config BR2_PACKAGE_NODEJS_SHARED_OPENSSL
> > +     bool "use shared OpenSSL"
> > +     default y
> > +     select BR2_PACKAGE_OPENSSL
> > +     help
> > +       Use shared OpenSSL library instead of statically linked
> > +       OpenSSL bundled with node.js.
> > +
> > +endif
>
> I think this should always be the case: use the Buildroot openssl
> package if enabled, otherwise disable ssl support. Is there any
> advantage to using the built-in version?
>
Not much advantage I guess. I can remove it.

>
> > +define NODEJS_CONFIGURE_CMDS
> > +     (cd $(@D); rm -rf config.cache; \
> > +             $(TARGET_CONFIGURE_ARGS) \
> > +             $(TARGET_CONFIGURE_OPTS) \
> > +             PATH="$(HOST_DIR)/usr/bin:$(PATH)" \
> > +             ./configure \
> > +             --prefix=/usr \
> > +             --without-snapshot \
> > +             $(if
> $(BR2_PACKAGE_NODEJS_SHARED_OPENSSL),--shared-openssl,) \
> > +             $(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
> > +             $(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
> > +             $(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
> > +             --without-dtrace \
> > +             --without-etw \
> > +     )
> > +endef
>
> You're using the autotools-package infrastructure, so don't override
> the _CONFIGURE_CMDS. You should simply need to do:
>
> NODEJS_CONF_OPT =
>         --without-snapshot \
>         $(if $(BR2_PACKAGE_NODEJS_SHARED_OPENSSL),--shared-openssl,) \
>         $(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
>         $(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>         $(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
>         --without-dtrace \
>         --without-etw
>
> > +NODEJS_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
>
The make command needs have CC, CXX, etc. set again because node.js isn't
using a real autotools based configure. It doesn't remember the variables.
I am thinking I should probably change it back to generic package because
it isn't a real autotools based system but just a Python-based configure
behaves similar to autotools.


> > +NODEJS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
>
> And you can get rid of this as well.
>
Ok.

>
> > +define NODEJS_INSTALL_TARGET_CMDS
> > +       $(INSTALL) -D -m 775 $(@D)/out/Release/node
> $(TARGET_DIR)/usr/bin/node
> > +endef
> > +
> > +define NODEJS_UNINSTALL_TARGET_CMDS
> > +       rm -f $(TARGET_DIR)/usr/bin/node
> > +endef
> > +
> > +$(eval $(autotools-package))
>

Regards,
Jonathan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120813/dd6130a1/attachment-0001.html>
