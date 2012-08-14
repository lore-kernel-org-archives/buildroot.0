From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:23:40 +0200
Subject: [Buildroot] [PATCH 03/36] package/libfdt: new package
In-Reply-To: <1344815664-28138-3-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-3-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120814152340.1d4ce6fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 13 Aug 2012 01:53:51 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> libfdt allows one to manipulate a Flat Device Tree.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in                                  |    1 +
>  package/libfdt/Config.in                           |    6 ++
>  .../libfdt/libfdt-install-missing-headers.patch    |   22 ++++++++
>  package/libfdt/libfdt-separate-lib-install.patch   |   22 ++++++++
>  package/libfdt/libfdt.mk                           |   56 ++++++++++++++++++++
>  5 files changed, 107 insertions(+), 0 deletions(-)

The upstream package is called "dtc", shouldn't we be calling this
package "dtc" as well even though it only installs libfdt for now?

> diff --git a/package/libfdt/libfdt.mk b/package/libfdt/libfdt.mk
> new file mode 100644
> index 0000000..6824576
> --- /dev/null
> +++ b/package/libfdt/libfdt.mk
> @@ -0,0 +1,56 @@
> +#-----------------------------------------------------------------------------
> +# Package description

While this headers are nice, they are not consistent with all other
packages in Buildroot. Do we want to move all packages in this
direction?

> +LIBFDT_VERSION         = v1.3.0
> +LIBFDT_SITE            = git://git.jdl.com/software/dtc.git
> +LIBFDT_LICENSE         = GPLv2+/BSD-2c
> +LIBFDT_LICENSE_FILES   = README.license GPL
> +# Note: the dual-license only applies to the library.
> +#       The DT compiler (dtc) is GPLv2+, but we do not install it (yet?).

Argh, this is getting complicated, and shows again that our lack of
separation between "source package" and "binary package" is a bit
problematic.

> +LIBFDT_INSTALL_STAGING = YES
> +
> +#----------------------------------------------------------------------------
> +# Package build process
> +
> +define LIBFDT_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> +	                 AR="$(TARGET_AR)" \

What about using $(TARGET_CONFIGURE_OPTS) instead?

> +	                 PREFIX=/usr       \
> +	                 libfdt
> +endef
> +
> +#?libfdt_install is our own install rule added by our patch
> +define LIBFDT_INSTALL_STAGING_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D) \

Do you really need to repeat CC and AR for the installation?

> +	        DESTDIR=$(STAGING_DIR) PREFIX=/usr           \
> +	        libfdt_install
> +endef
> +
> +# libfdt does not have any uninstall rule
> +define LIBFDT_UNINSTALL_STAGING_CMDS
> +	rm -f $(STAGING_DIR)/usr/lib/libfdt.a
> +	rm -f $(STAGING_DIR)/usr/lib/libfdt*.so*
> +	rm -f $(STAGING_DIR)/usr/include/libfdt*.h
> +	rm -f $(STAGING_DIR)/usr/include/fdt.h
> +endef
> +
> +# Usually, mode 0644 is enough for libraries (shared or static), but the
> +# buildroot documentation dsays 0755, so be dumb and follow the docs. ;-p
> +# And on target, we only require the SONAME-named library, not all the
> +# symlinks, but:
> +#   - libfdt's Makefile does not offer such a rule,
> +#   - other buildroot packages do install lib symlinks,
> +# so do as all others do.
> +define LIBFDT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libfdt/libfdt*.so* $(TARGET_DIR)/usr/lib
> +endef

Not possible to use 'make libfdt_install' here? Remember that Buildroot
automatically .a files, header files and other documentation, so you
don't have to do this "filtered" installation yourself. And worse than
that: if you have BR2_HAVE_DEVFILES enabled, your INSTALL_TARGET_CMDS
is incorrect.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
