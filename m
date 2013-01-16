From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 22:54:40 +0100
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
Message-ID: <20130116225440.1d45f78c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jenkins, Lee (ISS Houston),

On Wed, 16 Jan 2013 21:30:31 +0000, Jenkins, Lee (ISS Houston) wrote:

> I expected make to pick up the new package, but that's clearly not
> happening. What am I missing?

Gustavo gave the explanation for this.

I'm however going to add a few more comments below, as I hope you'll be
submitting this package to Buildroot once it works.

> ----- buildroot/package/apache/Config.in -----
> 
> config BR2_PACKAGE_APACHE
>      bool "apache"
>      help
>        Apache web server software

You should add the upstream URL of the project here, separated from the
main description by an empty newline. (See how other packages do it).

> 
> ----- buildroot/package/apache/apache.mk -----
> 
> #############################################################
> #
> # apache
> #
> #############################################################
> APACHE_VERSION    = 2.2.19

We usually put an empty new line between the header and the first
variable declaration.

> #APACHE_SITE       = http://mir2.ovh.net/ftp.apache.org/dist/httpd/

Please remove unneeded comments if you want to submit this package to
Buildroot.

> APACHE_SITE       = http://archive.apache.org/dist/httpd/
> APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
> APACHE_INSTALL_STAGING = YES
> APACHE_INSTALL_TARGET = YES

This line is not needed, as it is the default.

> APACHE_AUTORECONF = YES

This is generally not needed, as releases shipped as tarballs usually
have the configure script and the Makefile.in pre-generated. So there
should be a comment above this line that explains why it is needed.

> 
> APACHE_CONF_ENV += \
>         ac_cv_file__dev_zero=yes \
>         ac_cv_func_setpgrp_void=yes \
>         apr_cv_tcp_nodelay_with_cork=yes \
>         ac_cv_sizeof_struct_iovec=8 \
>         apr_cv_process_shared_works=yes \
>         apr_cv_mutex_robust_shared=no \
>         ac_cv_struct_rlimit=yes \
>         ap_cv_void_ptr_lt_long=no \
>         CC="$(TARGET_CC)" \
>         CFLAGS="$(TARGET_CFLAGS)" \
>         LDFLAGS="$(TARGET_LDFLAGS)" \

The CC, CFLAGS and LDFLAGS are not needed here, they are already passed
by the Buildroot autotools infrastructure.

> APACHE_CONF_OPT += \
>         --host="$(REAL_GNU_TARGET_NAME)" \

--host is already passed by Buildroot.

>         --prefix="/apacheSW/" \

--prefix is already passed by Buildroot (and /apacheSW/ is not a
standard and appropriate location).

>         --enable-so \
>         --enable-module=all
> 
> 
> 
> 
> 

Please remove useless empty lines.

> define APACHE_CONFIGURE_CMDS
>         (cd $(@D) && rm -rf config.cache; \
>                 $(APACHE_CONF_ENV) \
>                 ./configure \
>                 $(APACHE_CONF_OPT) \
>         )
> endef

This is not needed, Buildroot already has a default
<pkg>_CONFIGURE_CMDS for autotools packages that does the right thing.
If it doesn't then please add a comment above that explains why we need
to override the CONFIGURE_CMDS.

> define ADD_INIT_SCRIPT
> 	$(INSTALL) -m 0755 -D $(APACHE_DIR_PREFIX)/$(APACHE_NAME)/Apache_InitScript $(TARGET_DIR)/etc/init.d/S90Apache;
> endef
> APACHE_POST_INSTALL_STAGING_HOOKS += ADD_INIT_SCRIPT

You should use APACHE_INSTALL_INIT_SYSV to install an init script. See
package/lighttpd/lighttpd.mk for an example. Also, please name your
script S90apache in package/apache/. So in the end, it should look like:

define APACHE_INSTALL_INIT_SYSV
	[ -f $(TARGET_DIR)/etc/init.d/S50apache ] || \
		$(INSTALL) -D -m 755 package/apache/S50apache \
			$(TARGET_DIR)/etc/init.d/S50apache
endef

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
