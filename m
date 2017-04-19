From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 19 Apr 2017 12:08:14 -0400
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
In-Reply-To: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
Message-ID: <CANxTyt4uGKF9vz=mSWkgBp8OGZHSE=qt2ZwccmXaBmN9uhc7-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, Apr 19, 2017 at 3:56 AM, Stefan S?rensen
<stefan.sorensen@spectralink.com> wrote:
...snip...
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# cracklib
> +#
> +################################################################################
> +
> +CRACKLIB_VERSION = 2.9.6
> +CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
> +CRACKLIB_LICENSE = LGPL-2.1
> +CRACKLIB_LICENSE_FILES = COPYING.LIB
> +CRACKLIB_INSTALL_STAGING = YES
> +CRACKLIB_DEPENDENCIES = host-cracklib

It looks like cracklib's configure is checking for zlib.h.  To make
the build reproducible, maybe you should add:

ifeq ($(BR2_PACKAGE_ZLIB),y)
CRACKLIB_CONF_OPTS += --with-zlib
CRACKLIB_DEPENDENCIES += zlib
else
CRACKLIB_CONF_OPTS += --without-zlib
endif

HOST_CRACKLIB_CONF_OPTS += --without-zlib

Regards,
Danomi -


> +
> +ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
> +CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
> +CRACKLIB_DICT_SOURCE = $(DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
> +else
> +CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
> +define CRACKLIB_REMOVE_TOOLS
> +       rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
> +endef
> +CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_REMOVE_TOOLS
> +endif
> +
> +define CRACKLIB_BUILD_DICT
> +       $(HOST_MAKE_ENV) cracklib-format $(CRACKLIB_DICT_SOURCE) | \
> +               $(HOST_MAKE_ENV) cracklib-packer $(TARGET_DIR)/usr/share/cracklib/pw_dict
> +       rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
> +endef
> +CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_BUILD_DICT
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
