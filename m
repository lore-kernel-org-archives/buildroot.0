From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Apr 2014 07:34:25 +0200
Subject: [Buildroot] [PATCH v2] DCMTK: new package
In-Reply-To: <535EEB16.4090906@gmail.com>
References: <535EEB16.4090906@gmail.com>
Message-ID: <20140429073425.3e5ddfc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Frost,

On Tue, 29 Apr 2014 08:58:14 +0900, William Frost wrote:
> It works fine but still every time I type "make all" in Buildroot dcmtk 
> make the configure process again. Any idea on how to solve this?

This message shouldn't be part of the commit log. If you want to give
such "side" messages, do it below the "---" sign with the changelog, or
in a separate cover letter.

The title of the patch should have DCMTK in lower case, for consistency
with what we do for other packages.

Also, you're still using Thunderbird to post your patches, and they are
badly line-wrapped. It might also be the reason why the Config.in file
indentation is wrong, so I won't comment on this for now, waiting for
you to resend a new version with git send-email.


> +if BR2_PACKAGE_DCMTK
> +
> +choice
> +    prompt "DCMTK Version"
> +    default BR2_PACKAGE_DCMTK_VERSION_3_6_0
> +    help
> +      Select the version of DCMTK you wish to use.
> +
> +    config BR2_PACKAGE_DCMTK_VERSION_3_6_0
> +        bool "DCMTK 3.6.0"
> +
> +    config BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2012
> +        bool "DCMTK 3.6.1 snapshot (2012.11.02)"
> +
> +    config BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2013
> +        bool "DCMTK 3.6.1 snapshot (2013.11.14)"
> +
> +endchoice
> +
> +config BR2_PACKAGE_DCMTK_VERSION
> +    string
> +    default "3.6.0"    if BR2_PACKAGE_DCMTK_VERSION_3_6_0
> +    default "3.6.1_20121102" if BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2012
> +    default "3.6.1_20131114" if BR2_PACKAGE_DCMTK_VERSION_SNAPSHOT_2013

Do we really need to make the version configurable? There are *very*
few packages for which we support that, and we generally try to avoid
this as much as possible.

> diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
> new file mode 100644
> index 0000000..5c9a851
> --- /dev/null
> +++ b/package/dcmtk/dcmtk.mk
> @@ -0,0 +1,85 @@
> +################################################################################
> +#
> +# dcmtk
> +#
> +################################################################################
> +DCMTK_VERSION = $(call qstrip,$(BR2_PACKAGE_DCMTK_VERSION))

One empty new line between the comment header and the first variable
definition.

> +
> +ifeq ($(BR2_PACKAGE_DCMTK_VERSION), "3.6.0")
> +DCMTK_SITE = http://dicom.offis.de/download/dcmtk/dcmtk360/
> +endif
> +ifeq ($(BR2_PACKAGE_DCMTK_VERSION),"3.6.1_20121102")
> +DCMTK_SITE = http://dicom.offis.de/download/dcmtk/snapshot/old
> +endif
> +ifeq ($(BR2_PACKAGE_DCMTK_VERSION),"3.6.1_20131114")
> +DCMTK_SITE = http://dicom.offis.de/download/dcmtk/snapshot
> +endif
> +
> +DCMTK_LICENSE = BSD

The license looks more complex than that. Maybe you want to seek the
input of Luca and/or Yann on this.

> +DCMTK_LICENSE_FILES = COPYING

There is no file named 'COPYING' in the source code, so this cannot
work. Maybe you want to use the 'COPYRIGHT' file instead.

> +DCMTK_INSTALL_STAGING = YES
> +
> +DCMTK_CFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR) -O -D_REENTRANT \
> +        -D_XOPEN_SOURCE_EXTENDED -D_XOPEN_SOURCE=500 -D_BSD_SOURCE \
> +        -D_BSD_COMPAT -D_OSF_SOURCE -D_POSIX_C_SOURCE=199506L -Wall \
> +        -Wno-psabi

This looks suspicious. First, the --sysroot option is for sure not
needed. And all the other -D options look weird. Why are they needed?

> +DCMTK_CXXFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR) -O 

So you start of TARGET_CFLAGS to define CXXFLAGS ?

> -D_REENTRANT \
> +        -D_XOPEN_SOURCE_EXTENDED -D_XOPEN_SOURCE=500 -D_BSD_SOURCE \
> +        -D_BSD_COMPAT -D_OSF_SOURCE -D_POSIX_C_SOURCE=199506L -Wall \
> +        -Wno-psabi
> +
> +DCMTK_CPPFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)
> +DCMTK_LDFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)

Not needed, and actually wrong: you use TARGET_CFLAGS to derive your
CPPFLAGS and LDFLAGS.

> +DCMTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) \
> +                install
> +
> +DCMTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) 
> install

This is probably not needed.

> +
> +DCMTK_CONF_OPT = --without-libtiff --without-openssl --without-libxml \
> +          --without-libpng --without-libsndfile --disable-debug \
> +          --without-private-tags --enable-std-includes --disable-rpath
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +    DCMTK_DEPENDENCIES += zlib

DCMTK_CONF_OPT += --with-zlib

> +else
> +    DCMTK_CONF_OPT += --without-zlib
> +endif
> +VERBOSE=1

Huh?

> +
> +define DCMTK_CONFIG_SET
> +    $(CAT) $(@D)/config/Makefile.def | $(SED) 's%^$(1).*%$(1) = $(2)%g' \
> +    $(@D)/config/Makefile.def
> +endef

This would probably require a comment on top of it.

> +
> +define DCMTK_CONFIGURE_CMDS
> +    (cd $(@D); \
> +        CFLAGS="$(DCMTK_CFLAGS)" \
> +        CXXFLAGS="$(DCMTK_CXXFLAGS)" \
> +        CPPFLAGS="$(DCMTK_CPPFLAGS)" \
> +        LDFLAGS="$(DCMTK_LDFLAGS)" \
> +        ARFLAGS=cru \
> +        CC=$(TARGET_CC) \
> +        CXX=$(TARGET_CXX) \
> +        RANLIB=$(TARGET_RANLIB) \
> +        AR=$(TARGET_AR) \
> +        STRIP=$(TARGET_STRIP) \
> +        PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
> +        PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
> +        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +        MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
> +        $(if $(VERBOSE),-verbose,-silent) \
> +        $(DCMTK_CONF_OPT) \
> +        ac_cv_my_c_rightshift_unsigned=no --prefix=$(STAGING_DIR)/usr \
> +        --with-zlibinc=$(STAGING_DIR)/usr \
> +        --host=$(GNU_TARGET_NAME) \
> +    )
> +endef

Clearly, no. If your package uses the autotools build system, the
default configure command of the autotools-package infrastructure should
work fine, there's no need to duplicate it here. You can pass
environment variables using DCMTK_CONF_ENV, and configuration options
through DCMTK_CONF_OPT.

That being said, the dcmtk build system looks weird: the main configure
script is not the one generated by autoconf. So you're maybe not in the
canonical case of an autotools based package.

> +
> +define DCMTK_BUILD_CMDS
> +    $(call DCMTK_CONFIG_SET,"CC =",$(TARGET_CC))
> +    $(MAKE) -C $(@D) install-lib
> +endef

Same thing here, we normally don't want to duplicate the build command
definition, unless there's a really strong reason to do this.

> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
