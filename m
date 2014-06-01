From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 23:57:18 +0200
Subject: [Buildroot] [PATCH v2] dillo: new package
In-Reply-To: <1401393875-11832-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 29 May 2014 22:04:35 +0200")
References: <1401393875-11832-1-git-send-email-ps.report@gmx.net>
Message-ID: <8738fo1ef5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - remove empty line and jpeg/png hint from Config.in (as suggested
 >     by Thomas Petazzoni)
 >   - add dillo configure.ac patch and give explicitly pathes for
 >     fltk-config and libpng-config (as suggested by Thomas Petazzoni)
 > ---
 >  package/Config.in                                  |  1 +
 >  package/dillo/Config.in                            | 17 +++++++
 >  ...c-change-fltk-config-test-to-be-more-cros.patch | 40 ++++++++++++++++
 >  package/dillo/dillo.mk                             | 54 ++++++++++++++++++++++
 >  4 files changed, 112 insertions(+)
 >  create mode 100644 package/dillo/Config.in
 >  create mode 100644 package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
 >  create mode 100644 package/dillo/dillo.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 3bc8d24..5a92032 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -224,6 +224,7 @@ source "package/x11r7/Config.in"
 >  comment "X applications"
 >  source "package/alsamixergui/Config.in"
 >  source "package/apitrace/Config.in"
 > +source "package/dillo/Config.in"
 >  source "package/docker/Config.in"
 >  source "package/feh/Config.in"
 >  source "package/freerdp/Config.in"
 > diff --git a/package/dillo/Config.in b/package/dillo/Config.in
 > new file mode 100644
 > index 0000000..b90d151
 > --- /dev/null
 > +++ b/package/dillo/Config.in
 > @@ -0,0 +1,17 @@
 > +config BR2_PACKAGE_DILLO
 > +	bool "dillo"
 > +	depends on BR2_PACKAGE_XORG7
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	depends on BR2_USE_MMU # fltk fork()
 > +	select BR2_PACKAGE_FLTK
 > +	help
 > +	  Dillo is a multi-platform graphical web browser known
 > +	  for its speed and small footprint. 

Trailing space.

 > +++ b/package/dillo/dillo.mk
 > @@ -0,0 +1,54 @@
 > +################################################################################
 > +#
 > +# dillo
 > +#
 > +################################################################################
 > +
 > +DILLO_VERSION = 3.0.4
 > +DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
 > +DILLO_SITE = http://www.dillo.org/download
 > +DILLO_LICENSE = GPLv3+
 > +DILLO_LICENSE_FILES = COPYING
 > +# dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
 > +# touches configure.ac
 > +DILLO_AUTORECONF = YES
 > +
 > +DILLO_DEPENDENCIES = fltk
 > +
 > +DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 > +
 > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > +	DILLO_CONF_OPT += --enable-ssl
 > +	DILLO_DEPENDENCIES += openssl
 > +else
 > +	DILLO_CONF_OPT += --disable-ssl
 > +endif
 > +
 > +ifeq ($(BR2_INET_IPV6),y)
 > +	DILLO_CONF_OPT += --enable-ipv6
 > +else
 > +	DILLO_CONF_OPT += --disable-ipv6
 > +endif

package/Makefile.in already takes care of this, so this can be dropped.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
