From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Oct 2014 23:51:34 +0200
Subject: [Buildroot] [PATCH] squidguard: new package
In-Reply-To: <1412800692-17755-1-git-send-email-guillaume.gardet@oliseo.fr>
 (Guillaume GARDET's message of "Wed, 8 Oct 2014 22:38:12 +0200")
References: <1412800692-17755-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <87eguf8uft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume GARDET <guillaume.gardet@oliseo.fr> writes:

 > Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
 > ---
 >  package/Config.in                                  |   1 +
 >  package/squidguard/Config.in                       |  24 +++++
 >  package/squidguard/fix-for-db5.patch               |  11 ++
 >  package/squidguard/squidGuard-CVE-2009-3700.patch  |  46 +++++++++
 >  package/squidguard/squidGuard-CVE-2009-3826.patch  |  26 +++++
 >  package/squidguard/squidGuard-Makefile.patch       | 115 +++++++++++++++++++++
 >  package/squidguard/squidGuard.conf                 |  20 ++++
 >  .../squidguard/squidguard-1.4-cross-compile.patch  |  38 +++++++
 >  package/squidguard/squidguard.mk                   |  41 ++++++++
 >  9 files changed, 322 insertions(+)
 >  create mode 100644 package/squidguard/Config.in
 >  create mode 100644 package/squidguard/fix-for-db5.patch
 >  create mode 100644 package/squidguard/squidGuard-CVE-2009-3700.patch
 >  create mode 100644 package/squidguard/squidGuard-CVE-2009-3826.patch
 >  create mode 100644 package/squidguard/squidGuard-Makefile.patch
 >  create mode 100644 package/squidguard/squidGuard.conf
 >  create mode 100644 package/squidguard/squidguard-1.4-cross-compile.patch
 >  create mode 100644 package/squidguard/squidguard.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index ea89c96..9c1f282 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1083,6 +1083,7 @@ endif
 >  	source "package/spice/Config.in"
 >  	source "package/spice-protocol/Config.in"
 >  	source "package/squid/Config.in"
 > +	source "package/squidguard/Config.in"
 >  	source "package/sshpass/Config.in"
 >  	source "package/strongswan/Config.in"
 >  	source "package/stunnel/Config.in"
 > diff --git a/package/squidguard/Config.in b/package/squidguard/Config.in
 > new file mode 100644
 > index 0000000..8d3c28e
 > --- /dev/null
 > +++ b/package/squidguard/Config.in
 > @@ -0,0 +1,24 @@
 > +comment "squidguards needs Squid"
 > +	depends on !BR2_PACKAGE_SQUID

squid should not be capitalized. I don't know much about squid and these
plugins, but would anybody needing this NOT enable squid just above
already? Perhaps the comment isn't really needed?

 > +
 > +config BR2_PACKAGE_SQUIDGUARD
 > +	bool "squidguard"
 > +	select BR2_PACKAGE_BISON

BR2_PACKAGE_BISON has a number of toolchain dependencies that you need
to reproduce here (wchar, mmu). With that said, are you sure you need
bison on the TARGET and not host-bison?

 > +	select BR2_PACKAGE_FLEX


 > +	select BR2_PACKAGE_BERKELEYDB
 > +	depends on BR2_PACKAGE_SQUID
 > +	help
 > +	  SquidGuard is a free (GPL), flexible and ultra-fast filter,
 > +	  redirector, and access controller plugin for squid.


 > +
 > +	  http://www.squidguard.org/
 > +
 > +if BR2_PACKAGE_SQUIDGUARD
 > +	config BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF

This 'config' line should not be indented.

 > +	bool "squidguard default blacklists and configuration"
 > +	help
 > +	  Add default blacklists provided by squidGuard and associated
 > +	  configuration file.
 > +
 > +	  http://www.squidguard.org/
 > +endif
 > diff --git a/package/squidguard/fix-for-db5.patch b/package/squidguard/fix-for-db5.patch
 > new file mode 100644
 > index 0000000..29fd19b
 > --- /dev/null
 > +++ b/package/squidguard/fix-for-db5.patch

All patches should contain a git-style header with description and your
signed-off-by tag. They should also be prefixed with <pkg>-<number>-,
E.G squidguard-01-fix-for-db5.patch.

 > +++ b/package/squidguard/squidguard.mk
 > @@ -0,0 +1,41 @@
 > +###############################################################################
 > +#
 > +# squidguard
 > +#
 > +###############################################################################
 > +
 > +SQUIDGUARD_VERSION = 1.4
 > +SQUIDGUARD_SOURCE = squidGuard-$(SQUIDGUARD_VERSION).tar.gz
 > +SQUIDGUARD_SITE = http://www.squidguard.org/Downloads/
 > +SQUIDGUARD_LICENCE = GPLv2+
 > +SQUIDGUARD_LICENCE_FILE = COPYING
 > +SQUIDGUARD_CONF_OPTS += --with-sg-config=/etc/squidGuard.conf \
 > +			--with-sg-logdir=/var/log/squidGuard \
 > +			--with-sg-dbhome=/var/lib/squidGuard/db \
 > +			--with-db-inc=$(STAGING_DIR)/usr/include \
 > +			--with-db-lib=$(STAGING_DIR)/usr/lib

Are these --with-db-* needed? The cross compiler should automatically
look there for headers/libraries.


 > +SQUIDGUARD_DEPENDENCIES = bison flex berkeleydb
 > +
 > +
 > +ifeq ($(BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF),y)
 > +
 > +define DEFAULT_BLACKLIST
 > +	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/domains \
 > +		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/domains
 > +	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/expressions \
 > +		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/expressions
 > +	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/urls \
 > +		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/urls
 > +endef
 > +
 > +define DEFAULT_CONF
 > +	$(INSTALL) -m 0644 -D package/squidguard/squidGuard.conf \
 > +		$(TARGET_DIR)/etc/squidGuard.conf
 > +endef
 > +
 > +SQUIDGUARD_POST_INSTALL_TARGET_HOOKS = DEFAULT_BLACKLIST DEFAULT_CONF

Buildroot uses a global namespace, so these should be prefixed with SQUIDGUARD_.

Care to fix these issues and resend? Thanks.

-- 
Bye, Peter Korsgaard
