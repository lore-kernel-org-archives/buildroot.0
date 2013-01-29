From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 29 Jan 2013 08:14:13 +0100
Subject: [Buildroot] [PATCH v3] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <1359402723-5603-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1359402723-5603-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <CAHXCMMK69aYc=Hebivu1wPJOn0CXMn9SHQCA=-G4_JAdaw5Sjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan, all,

2013/1/28 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
> This patch will add <pkg>_CONFIG_FIXUP variable to buildroot infra.
>
> It's purpose is to inform buildroot that the package in question
> contains some $(STAGING_DIR)/usr/bin/*-config files and that we
> want to automatically fix prefixes of such files.
>
> It is often the case that many packages call these
> files during their configuration step to determine 3rd party
> library package locations and any flags needed to link against them.
>
> For example:
> Some package might try to check the existense and linking flags
> of NSPR package by calling $(STAGING_DIR)/usr/bin/nspr-config --prefix.
> Without this fix. NSPR would return /usr/ as it's prefix which is
> wrong when cross-compiling.
> Correct would be $(STAGING_DIR)/usr.
>
> All packages that have <pkg>_INSTALL_STAGING = YES defined and
> also install some config file(s) into $(STAGING_DIR)/usr/bin must
> hereafter also define <pkg>_CONFIG_FIXUP with the correspondig
> filename(s).
>
> For example:
>
> DIVINE_CONFIG_FIXUP = divine-config
>
> or for multiple files:
>
> IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config
>
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>
> Changelog v2 -> v3
> - added documentation of <pkg>_CONFIG_FIXUP variable (Stefan Fr?berg)
> - modified sed substitution of prefix/exec_prefix to be done in one
>   line instead of two (Samuel Martin)
> - added sed substitution of -I/usr/ to -I${prefix}/usr/ and
>   -L/usr/ to -L${exec_prefix}/usr/ (Samuel Martin)
>
>  docs/manual/adding-packages-generic.txt |   98 ++++++++++++++++++++++---------
>  package/pkg-generic.mk                  |    7 ++
>  2 files changed, 78 insertions(+), 27 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 7b8561a..41a94d7 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -25,32 +25,33 @@ system is based on hand-written Makefiles or shell scripts.
>  09: LIBFOO_LICENSE = GPLv3+
>  10: LIBFOO_LICENSE_FILES = COPYING
>  11: LIBFOO_INSTALL_STAGING = YES
> -12: LIBFOO_DEPENDENCIES = host-libaaa libbbb
> -13:
> -14: define LIBFOO_BUILD_CMDS
> -15:    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> -16: endef
> -17:
> -18: define LIBFOO_INSTALL_STAGING_CMDS
> -19:    $(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
> -20:    $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
> -21:    $(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
> -22: endef
> -23:
> -24: define LIBFOO_INSTALL_TARGET_CMDS
> -25:    $(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
> -26:    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
> -27: endef
> -28:
> -29: define LIBFOO_DEVICES
> -30:    /dev/foo  c  666  0  0  42  0  -  -  -
> -31: endef
> -32:
> -33: define LIBFOO_PERMISSIONS
> -34:    /bin/foo  f  4755  0  0  -  -  -  -  -
> -35: endef
> -36:
> -37: $(eval $(generic-package))
> +12: LIBFOO_CONFIG_FIXUP = libfoo-config
> +13: LIBFOO_DEPENDENCIES = host-libaaa libbbb
> +14:
> +15: define LIBFOO_BUILD_CMDS
> +16:    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +17: endef
> +18:
> +19: define LIBFOO_INSTALL_STAGING_CMDS
> +20:    $(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
> +21:    $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
> +22:    $(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
> +23: endef
> +24:
> +25: define LIBFOO_INSTALL_TARGET_CMDS
> +26:    $(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
> +27:    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
> +28: endef
> +29:
> +30: define LIBFOO_DEVICES
> +31:    /dev/foo  c  666  0  0  42  0  -  -  -
> +32: endef
> +33:
> +34: define LIBFOO_PERMISSIONS
> +35:    /bin/foo  f  4755  0  0  -  -  -  -  -
> +36: endef
> +37:
> +38: $(eval $(generic-package))
>  --------------------------------
>
>  The Makefile begins on line 6 to 10 with metadata information: the
> @@ -69,7 +70,45 @@ install header files and other development files in the staging space.
>  This will ensure that the commands listed in the
>  +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
>
> -On line 12, we specify the list of dependencies this package relies
> +On line 12, we specify that there is some fixing to be done to some
> +of the 'libfoo-config' files that were installed during
> ++LIBFOO_INSTALL_STAGING_CMDS+ phase.
> +These *-config files are executable shell script files that are
> +located in '$(STAGING_DIR)/usr/bin' directory and are executed
> +by other 3rd party packages to find out the location and the linking
> +flags of this particular package.
> +
> +The problem is that all these *-config files by default give wrong,
> +host system linking flags that are unsuitable for cross-compiling.
> +
> +For example:   '-I/usr/include' instead of '-I$(STAGING_DIR)/usr/include'
> +or:            '-L/usr/lib' instead of '-L$(STAGING_DIR)/usr/lib'
> +
> +So some sed magic is done to these scripts to make them give correct
> +flags.
> +The argument to be given to +LIBFOO_CONFIG_FIXUP+ is the file name(s)
> +of the shell script(s) needing fixing. All these names are relative to
> +'$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
> +
> +Example 1:
> +
> +Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
> +
> +So it's fixup would be:
> +
> +DIVINE_CONFIG = divine-config
> +
> +Example 2:
> +
> +Package imagemagick installs the following scripts:
> +'$(STAGING_DIR)/usr/bin/{Magick,Magick++,MagickCore,MagickWand,Wand}-config'
> +
> +So it's fixup would be:
> +
> +IMAGEMAGICK_CONFIG_FIXUP = Magick-config Magick++-config \
> +                          MagickCore-config MagickWand-config Wand-config
> +
> +On line 13, we specify the list of dependencies this package relies
>  on. These dependencies are listed in terms of lower-case package names,
>  which can be packages for the target (without the +host-+
>  prefix) or packages for the host (with the +host-+) prefix).
> @@ -245,6 +284,11 @@ information is (assuming the package name is +libfoo+) :
>    variables are executed to install the package into the target
>    directory.
>
> +* +LIBFOO_CONFIG_FIXUP+ lists the names of the files in
> +  '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
> +  cross-compiling friendly. Multiple file names separated by space can be
> +  given and all are relative to '$(STAGING_DIR)/usr/bin'.
> +
>  * +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
>    when using the static device table. The syntax to use is the
>    makedevs one. You can find some documentation for this syntax in the
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 59de0f0..2654fd2 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -128,6 +128,13 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>         @$(call MESSAGE,"Installing to staging directory")
>         $($(PKG)_INSTALL_STAGING_CMDS)
>         $(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
> +       $(Q)if test -n "$($(PKG)_CONFIG_FIXUP)" ; then \
> +               $(call MESSAGE,"Fixing package configuration files") ;\
> +                       $(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
> +                               -e "s,-I/usr/,-I\${prefix}/usr/,g" \
> +                               -e "s,-L/usr/,-L\${exec_prefix}/usr/,g" \
Well, just fixing the (exec_)?prefix may not be enough in some case:
Some quick grepping in the package directory will show that includedir
and libdir should be fixed as well.

The grep command I used:
$ git grep -iEC5 'sed.*?\$\(STAGING_DIR)/usr' package/
or:
$ git grep -iEA10 'define.*?(_FIXUP.*?_CONFIG|_CONFIG.*?_FIXUP)' package/

BTW, this will also standardize this hook name, and that's good! :-)

> +                               $(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_FIXUP)) ;\
> +       fi
>         $(Q)touch $@
>
>  # Install to images dir


Regards,


-- 
Samuel
