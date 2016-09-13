From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Sep 2016 23:13:40 +0200
Subject: [Buildroot] [PATCH v4,4/4] php: add apache support
In-Reply-To: <f2e1cea4-eda0-7c44-c5a6-a2d27499dfe3@mind.be>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
 <1473632768-53238-4-git-send-email-fabrice.fontaine@orange.com>
 <f2e1cea4-eda0-7c44-c5a6-a2d27499dfe3@mind.be>
Message-ID: <CAPi7W83YyYFDXDr_QAHtaijwJmvAZ+d0eFrSqj73Acqq_P+Vzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

You're right that the issue is linked to apxs however adding apxs to
APACHE_CONFIG_SCRIPTS does not solve the issue.

I'll try to explain the problem. At the moment, the configuration file of
apxs, config_vars.mk, is patched in APACHE_FIX_STAGING_APACHE_CONFIG to add
STAGING_DIR as a prefix so apxs adds the correct LoadModule directive in
output/staging/etc/apache2/httpd.conf through the following command:

output/staging/usr/bin/apxs -S
LIBEXECDIR='/home/fabrice/buildroot-qemu/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/modules'
-S
SYSCONFDIR='/home/fabrice/buildroot-qemu/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/etc/apache2'
-i -a -n php7 output/build/php-7.0.9/libs/libphp7.so

However, the same apxs in staging directory is also used to update the
output/target/etc/apache2/httpd.conf through the following command:
output/staging/usr/bin/apxs -S
LIBEXECDIR='/home/fabrice/buildroot-qemu/output/staging/usr/modules' -S
SYSCONFDIR='/home/fabrice/buildroot-qemu/output/staging/etc/apache2' -i -a
-n php7 output/build/php-7.0.9/libs/libphp7.so

In this case, the prefix is wrong and apxs adds a wrong path in the
LoadModule directive.
We could fix the issue by updating APACHE_FIX_STAGING_APACHE_CONFIG to use
the TARGET_DIR instead of the STAGING_DIR. However, Yann's point of view
was that php package should not update apache configuration file. So, I
will let you decide what should be done.

Best Regards,

 he binary is correctly patched to install

2016-09-12 1:30 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 12-09-16 00:26, Fabrice Fontaine wrote:
> > Continue work started by Bernd Kuhls in
> > https://patchwork.ozlabs.org/patch/437544/
> >
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> > ---
> > Changes v3 -> v4 (after review of Yann Morin):
> >  - Do not select apache but depends on it
> >  - Move pthread detection fix in a separate patch
> >  - Remove unneeded configuration options such as --with-config-file-path
> >  - Do not allow php to update apache configuration file by removing -a
> >    argument from apxs call
> >
> > Changes v2 -> v3 (after review of Thomas Petazzoni):
> >  - Remove unneeded php-04-apache.patch
> >  - Fix pthread detection if Apache MPM is event or worker
> >  - Update pthread detection mechanism (--enable-pthreads does not exist
> >    anymore)
> >  - Remove unneeded --oldincludedir
> >  - Fix php module path
> >
> >  package/php/Config.in |  7 +++++++
> >  package/php/php.mk    | 22 ++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/package/php/Config.in b/package/php/Config.in
> > index c90ad4f..e195fd4 100644
> > --- a/package/php/Config.in
> > +++ b/package/php/Config.in
> > @@ -14,6 +14,13 @@ if BR2_PACKAGE_PHP
> >  config BR2_PACKAGE_PHP_HAS_SAPI
> >       bool
> >
> > +config BR2_PACKAGE_PHP_SAPI_APACHE
> > +     bool "Apache"
> > +     depends on BR2_PACKAGE_APACHE
> > +     select BR2_PACKAGE_PHP_HAS_SAPI
> > +     help
> > +       Apache module
> > +
> >  config BR2_PACKAGE_PHP_SAPI_CGI
> >       bool "CGI"
> >       # CGI uses fork()
> > diff --git a/package/php/php.mk b/package/php/php.mk
> > index c4ff249..7abd012 100644
> > --- a/package/php/php.mk
> > +++ b/package/php/php.mk
> > @@ -95,6 +95,28 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),,-
> -disable-cli)
> >  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),,--disable-cgi)
> >  PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--
> enable-fpm,--disable-fpm)
> >
> > +ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
> > +PHP_DEPENDENCIES += apache
> > +PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
> > +
> > +# Enable thread safety option if Apache MPM is event or worker
> > +ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT)$(BR2_PACKAGE_APACHE_
> MPM_WORKER),y)
> > +PHP_CONF_OPTS += --enable-maintainer-zts
> > +endif
> > +
> > +# php uses apxs from staging directory to install libphp dynamic
> library and
> > +# update /etc/apache2/httpd.conf through the -a option, here is the full
> > +# command line: "apxs -S LIBEXECDIR='$(INSTALL_ROOT)/usr/modules'
> > +# -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2' -i -a -n php7
> > +# This does not work as apxs sets the full path of the library and not
> the
> > +# relative one so remove -a option from apxs call
>
>  Isn't the proper solution to add apxs to APACHE_CONFIG_SCRIPTS? Or is the
> staging dir encoded in a way that our sed script doesn't find it?
>
>  Regards,
>  Arnout
>
> > +define PHP_REMOVE_APXS_UPDATE_CONF
> > +     $(SED) 's/-i -a -n php/-i -n php/' $(@D)/configure
> > +endef
> > +
> > +PHP_PRE_CONFIGURE_HOOKS += PHP_REMOVE_APXS_UPDATE_CONF
> > +endif
> > +
> >  ### Extensions
> >  PHP_CONF_OPTS += \
> >       $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160913/8128dead/attachment-0001.html>
