From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Apr 2021 22:30:20 +0200
Subject: [Buildroot] [PATCH] package/ace: new package
In-Reply-To: <20210412165524.17793-1-matthew.weber@rockwellcollins.com>
References: <20210412165524.17793-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210412223020.7c1ffc76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

Thanks for this submission. Please see below some comments.

On Mon, 12 Apr 2021 11:55:24 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> diff --git a/package/ace/Config.in b/package/ace/Config.in
> new file mode 100644
> index 0000000000..7755327b21
> --- /dev/null
> +++ b/package/ace/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_ACE
> +	bool "ace"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_STATIC_LIBS

These means a Config.in comment is needed.

> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  The ADAPTIVE Communication Environment (ACE(TM))
> +	  An OO Network Programming Toolkit in C++.
> +
> +	  See http://www.dre.vanderbilt.edu/~schmidt/ACE.html

Drop the "See " at the beginning, we want the last thing in the help
text to be just the URL of upstream project home page.

> diff --git a/package/ace/ace.mk b/package/ace/ace.mk
> new file mode 100644
> index 0000000000..80d50665d9
> --- /dev/null
> +++ b/package/ace/ace.mk
> @@ -0,0 +1,63 @@
> +################################################################################
> +#
> +# ace
> +#
> +################################################################################
> +
> +ACE_VERSION=7.0.1
> +ACE_SOURCE=ACE-$(ACE_VERSION).tar.gz
> +ACE_SITE=http://download.dre.vanderbilt.edu/previous_versions
> +ACE_DEPENDENCIES=openssl

Spaces around = sign. I think this is reported by "make check-package".

> +ACE_LICENSE = DOC

I checked, this is indeed a valid SPDX identifier. Interesting special
license...

> +ACE_LICENSE_FILES = COPYING
> +ACE_INSTALL_STAGING=YES

Spaces around =.

> +ACE_CPE_ID_VENDOR = vanderbilt
> +ACE_CPE_ID_PRODUCT = adaptive_communication_environment
> +
> +# configure the target build
> +# refer: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
> +define ACE_CONFIGURE_CMDS
> +	# create a config file
> +	echo ' #include "ace/config-linux.h" ' > $(@D)/ace/config.h
> +	# fix link error with ARM EABI tools
> +	# http://list.isis.vanderbilt.edu/pipermail/ace-users/2008-January/002742.html
> +	echo 'no_hidden_visibility = 1' > $(@D)/include/makeinclude/platform_macros.GNU
> +	# create a platform macros file
> +	echo 'include $(@D)/include/makeinclude/platform_linux.GNU' \
> +		>> $(@D)/include/makeinclude/platform_macros.GNU
> +	# enable ssl
> +	echo 'ssl = 1' >> $(@D)/include/makeinclude/platform_macros.GNU

Does that mean OpenSSL is an optional dependency ? :-)

> +	# disable RPATH
> +	echo 'install_rpath = 0' >> $(@D)/include/makeinclude/platform_macros.GNU
> +	# set the installation prefix
> +	echo 'INSTALL_PREFIX = /usr' >> $(@D)/include/makeinclude/platform_macros.GNU

Why not just provide platform_macros.GNU in package/ace/ instead ? All
values are hardcoded at least as it is now.

The EABI stuff from 2008 is odd though...

> +endef
> +
> +# Note: We are excluding examples, apps and tests
> +# Only compiling ACE libraries (no TAO)
> +ACE_LIBARIES = ace ace/SSL ACEXML Kokyu netsvcs protocols/ace
> +
> +# compile ace,ACEXML, Kokyu, netsvcs & protocols/ace
> +define ACE_BUILD_CMDS
> +	for dir in $(ACE_LIBARIES) ; do \
> +		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" all || exit 1 ; \
> +	done

Use a make $(foreach ...) loop.

> +endef
> +
> +define  ACE_INSTALL_STAGING_CMDS
> +	# create below folder required by ACE makefiles during install
> +	mkdir -p $(STAGING_DIR)/usr/share/ace
> +	for dir in $(ACE_LIBARIES) ; do \
> +		$(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" DESTDIR=$(STAGING_DIR) install || exit 1 ; \
> +	done

Same a make $(foreach ...) loop. Will avoid the need for the || exit 1

> +endef
> +
> +define  ACE_INSTALL_TARGET_CMDS
> +	# create below folder required by ACE makefiles during install
> +	mkdir -p $(TARGET_DIR)/usr/share/ace
> +	for dir in $(ACE_LIBARIES) ; do \
> +		$(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" DESTDIR=$(TARGET_DIR) install || exit 1 ; \
> +	done

Well, same.

Other than that, looks pretty straightforward.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
