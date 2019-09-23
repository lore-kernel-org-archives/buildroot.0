From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Mon, 23 Sep 2019 15:03:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/xdebug: new package
In-Reply-To: <0c8218be-8091-e801-cee8-c256a6a67205@mind.be>
References: <20190923101651.3721-1-nicolas.carrier@orolia.com>
 <0c8218be-8091-e801-cee8-c256a6a67205@mind.be>
Message-ID: <e18ca2f9a4f2e6b0eb3a446532c9c362126085b8.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
First of all, thank you for taking the time to review my patch.

On Mon, 2019-09-23 at 15:27 +0200, Arnout Vandecappelle wrote:
>  Hi Nicolas,
> 
> On 23/09/2019 12:17, Nicolas Carrier wrote:
> > Extension for PHP to assist with debugging and development.
> > 
> > Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> > ---
> >  package/Config.in          |  1 +
> >  package/xdebug/Config.in   |  7 +++++++
> >  package/xdebug/xdebug.hash |  3 +++
> >  package/xdebug/xdebug.mk   | 25 +++++++++++++++++++++++++
> >  4 files changed, 36 insertions(+)
> >  create mode 100644 package/xdebug/Config.in
> >  create mode 100644 package/xdebug/xdebug.hash
> >  create mode 100644 package/xdebug/xdebug.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index 2fc11065f6..95115ec469 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -141,6 +141,7 @@ menu "Debugging, profiling and benchmark"
> >       source "package/valgrind/Config.in"
> >       source "package/vmtouch/Config.in"
> >       source "package/whetstone/Config.in"
> > +     source "package/xdebug/Config.in"
> 
>  Hm. IIUC, this is really a PHP extension, *not* a debugger that
> happens to use
> PHP internally. Therefore, I would think that it fits more in the
> "External php
> extensions" menu.
> 
>  But others may disagree...

Ok, originally, I was wondering whether it should go to Debugging or
Development tools ^^

I'll put it in "External php extensions" then.

> 
> 
> >  endmenu
> > 
> >  menu "Development tools"
> > diff --git a/package/xdebug/Config.in b/package/xdebug/Config.in
> > new file mode 100644
> > index 0000000000..c0abb71896
> > --- /dev/null
> > +++ b/package/xdebug/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_XDEBUG
> > +     bool "xdebug"
> > +     select BR2_PACKAGE_PHP
> 
>  If you select a package, you have to copy its dependencies.
> 
>  However, for a PHP package, it's more appropriate to depend on it I
> think. Note
> that if you move it to the external php extensions menu that
> dependency will be
> implicit.
> 

Ok

>  Note also that normally, PHP extensions can only be built for
> !STATIC. Did you
> run test-pkg?

No, I didn't, it seems that I read the contributor documentation too
fast...
I'm going to fix that.

> 
> 
> > +
> 
>  As check-package will tell you, there should be no empty line here.
> 
> > +     help
> > +       Extension for PHP to assist with debugging and development.
> > +       Web page: http://xdebug.org
> 
>  As check-package will tell you, there should be an empty line before
> the URL,
> and there's shouldn't be a "Web page: " in front of it.
> 

Ok, will fix

> > diff --git a/package/xdebug/xdebug.hash
> > b/package/xdebug/xdebug.hash
> > new file mode 100644
> > index 0000000000..a477a41d80
> > --- /dev/null
> > +++ b/package/xdebug/xdebug.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256
> > 86df1c16f31a11ed242adbaba7f13290af23ac57e1095a02faceb41ea833f729  x
> > debug-2.7.0.tar.gz
> > +sha256
> > ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  L
> > ICENSE
> > diff --git a/package/xdebug/xdebug.mk b/package/xdebug/xdebug.mk
> > new file mode 100644
> > index 0000000000..8c156c4297
> > --- /dev/null
> > +++ b/package/xdebug/xdebug.mk
> > @@ -0,0 +1,25 @@
> > +##################################################################
> > ##############
> > +#
> > +# xdebug
> > +#
> > +##################################################################
> > ##############
> > +
> > +XDEBUG_VERSION = 2.7.0
> 
>  There is a 2.7.2 version since May...

Well, the thing is that the 2.7.0 version is what's in use at Orolia
ATM, so I'm quite confident that this version would work properly.
I was also thinking that a later patch could bump the version once it'd
be properly tested.

So you think that I should bump to 2.7.2 directly?

> 
> > +XDEBUG_SITE = $(call github,xdebug,xdebug,$(XDEBUG_VERSION))
> > +XDEBUG_INSTALL_STAGING = YES
> > +XDEBUG_LICENSE = xdebug-license
> 
> XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
> 
> > +XDEBUG_LICENSE_FILES = LICENSE
> > +XDEBUG_DEPENDENCIES = php host-autoconf
> > +XDEBUG_CONF_OPTS = --enable-xdebug --with-php-
> > config=$(STAGING_DIR)/usr/bin/php-config\
> > +     --with-xdebug=$(STAGING_DIR)/usr
> 
>  Nowadays, we prefer to have one option per line in most cases, so:
> 
> XDEBUG_CONF_OPTS = \
>         --enable-xdebug \
>         --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
>         --with-xdebug=$(STAGING_DIR)/usr
> 
>  Also note the space before the backslash.

Ok, thank you, I'm going to fix that too.

> 
>  Regards,
>  Arnout
> 
> > +
> > +define XDEBUG_PHPIZE
> > +     (cd $(@D); \
> > +             PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
> > +             PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
> > +             $(STAGING_DIR)/usr/bin/phpize)
> > +endef
> > +
> > +XDEBUG_PRE_CONFIGURE_HOOKS += XDEBUG_PHPIZE
> > +
> > +$(eval $(autotools-package))
> > 
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.

Regards.
