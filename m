From: Eric Limpens <limpens@gmail.com>
Date: Mon, 28 Jul 2014 20:06:17 +0200
Subject: [Buildroot] [PATCH v6] toolchain: add option to copy the gconv
	libraries
In-Reply-To: <1406489312-32491-1-git-send-email-yann.morin.1998@free.fr>
References: <1406489312-32491-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CABGWzsRrmYo6xFUWnBaF-Qg0dtt6Yip7NwvqUqVFDn8q6QJfUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 27, 2014 at 9:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The gconv libraries are used to translate between different character sets
> ('charsets', even 'csets' sometimes). Some packages need them to present
> text to the user (eg. XBMC Gotham).
>
> In (e)glibc they are implemented by the internal implemenation of iconv,
> called gconv, and are provided as dlopen-able libraries.
>
> Note that some gconv modules need extra libraries (shared by more than
> one gconv module), so we must, when adding a subset of modules, scan the
> installed modules in search of the missing libraries.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Eric Limpens <limpens@gmail.com>
>

Tested-by: Eric Limpens <limpens@gmail.com>

Using raspberrypi_defconfig, glibc, rpi_userland and xbmc. Solved the
empty labels in xbmc.

Eric.

> ---
> Notes (kept from previous submission):
>
>   - this is getting a bit urgent, as without it, XBMC is basically
>     unusable, as it does not render the labels on the menus.
>
>     I would really appreciate a review on this, so I have time to
>     respin it before -rc1 if changes are required.
>
>   - contrary to what Thomas asked, I did not provide a minimalist
>     list of default gconv modules to install. Thomas was concerned
>     about the size of the installed modules. But those modules are
>     probably only used in GUIs, which would probably already pull
>     one of the graphical frameworks such as Qt or GTK, which are
>     already huge beasts. So, I still think that the default should
>     be to install all modules.
>
> Changes v5 -> v6:
>   - move the finalise hook to its own .mk file  (Thomas)
>     all other toolchain-related finalise-hooks should eventually
>     be moved to that file; can be done in -next
>   - also install dependable libraries
>   - generate the expunged gconv-modules file in one shot, by calling
>     the support script only once with all modules (instead of many
>     calls with a single module)
>   - remove unused variable in the gawk script
>
> Changes v4 -> v5;
>   - expunge gconv-module from not-installed modules  (Thomas)
>
> Change v3 -> v4:
>   - fix superfluous semi-colon before '||'
>
> Changes v2 -> v3:
>   - properly fail if a specified lib is missing (e.g. typo)
>
> Changes v1 -> v2:
>   - add option to install only a select list of gconv libs (Thomas)
>   - rename the option (Thomas)
> ---
>  Makefile                              |  2 +-
>  support/scripts/expunge-gconv-modules | 52 +++++++++++++++++++++++++++++++++++
>  toolchain/toolchain-common.in         | 22 +++++++++++++++
>  toolchain/toolchain.mk                | 36 ++++++++++++++++++++++++
>  4 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100755 support/scripts/expunge-gconv-modules
>  create mode 100644 toolchain/toolchain.mk
>
> diff --git a/Makefile b/Makefile
> index 6bd18e3..d4ef081 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -369,7 +369,7 @@ include support/dependencies/dependencies.mk
>  # We also need the various per-package makefiles, which also add
>  # each selected package to TARGETS if that package was selected
>  # in the .config file.
> -include toolchain/helpers.mk
> +include toolchain/*.mk
>  include toolchain/*/*.mk
>
>  # Include the package override file if one has been provided in the
> diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
> new file mode 100755
> index 0000000..7810246
> --- /dev/null
> +++ b/support/scripts/expunge-gconv-modules
> @@ -0,0 +1,52 @@
> +#!/bin/bash
> +
> +# The format of gconv-modules is precisely documented in the
> +# file itself. It consists of two different directives:
> +#   module  FROMSET  TOSET  FILENAME  COST
> +#   alias   ALIAS  REALNAME
> +# and that's what this script parses and generates.
> +#
> +# There are two kinds of 'module' directives:
> +#   - the first defines conversion of a charset to/from INTERNAL representation
> +#   - the second defines conversion of a charset to/from another charset
> +# we handle each with slightly different code, since the second never has
> +# associated aliases.
> +
> +gawk -v files="${1}" '
> +$1 == "alias" {
> +    aliases[$3] = aliases[$3] " " $2;
> +}
> +$1 == "module" && $2 != "INTERNAL" && $3 == "INTERNAL" {
> +    file2internals[$4] = file2internals[$4] " " $2;
> +    mod2cost[$2] = $5;
> +}
> +$1 == "module" && $2 != "INTERNAL" && $3 != "INTERNAL" {
> +    file2cset[$4] = file2cset[$4] " " $2 ":" $3;
> +    mod2cost[$2] = $5;
> +}
> +
> +END {
> +    nb_files = split( files, all_files );
> +    for( f=1; f<=nb_files; f++ ) {
> +        file = all_files[f];
> +        printf( "# Modules and aliases for: %s\n", file );
> +        nb_mods = split( file2internals[file], mods );
> +        for( i=1; i<=nb_mods; i++ ) {
> +            nb_aliases = split( aliases[mods[i]], mod_aliases );
> +            for( j=1; j<=nb_aliases; j++ ) {
> +                printf( "alias\t%s\t%s\n", mod_aliases[j], mods[i] );
> +            }
> +            printf( "module\t%s\t%s\t%s\t%d\n", mods[i], "INTERNAL", file, mod2cost[mods[i]] );
> +            printf( "module\t%s\t%s\t%s\t%d\n", "INTERNAL", mods[i], file, mod2cost[mods[i]] );
> +            printf( "\n" );
> +        }
> +        printf( "%s", nb_mods!=0?"\n":"" );
> +        nb_csets = split( file2cset[file], csets );
> +        for( i=1; i<=nb_csets; i++ ) {
> +            split( csets[i], cs, ":" );
> +            printf( "module\t%s\t%s\t%s\t%d\n", cs[1], cs[2], file, mod2cost[cs[1]] );
> +        }
> +        printf( "%s", nb_csets!=0?"\n\n":"" );
> +    }
> +}
> +'
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index a91d247..13de9e5 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -77,6 +77,28 @@ config BR2_GENERATE_LOCALE
>           specified, UTF-8 is assumed. Examples of locales: en_US,
>           fr_FR.UTF-8.
>
> +config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
> +       bool "Copy gconv libraries"
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         The gconv libraries are used to convert between different
> +         character sets (charsets).
> +
> +         Say 'y' if you need to store and/or display different charsets.
> +
> +config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
> +       string "Gconv libraries to copy"
> +       depends on BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
> +       help
> +         Set to the list of gconv libraries to copy.
> +         Leave empty to copy all gconv libraries.
> +
> +         Specify only the basename of the libraries, leave
> +         out the .so extension. Eg.:
> +           IBM850 ISO8859-15 UNICODE
> +
> +         Note: the full set of gconv libs are ~8MiB (on ARM).
> +
>  # glibc and eglibc directly include gettext, so a separatly compiled
>  # gettext isn't needed and shouldn't be built to avoid conflicts. Some
>  # packages always need gettext, other packages only need gettext when
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> new file mode 100644
> index 0000000..8fe06ff
> --- /dev/null
> +++ b/toolchain/toolchain.mk
> @@ -0,0 +1,36 @@
> +# This file contains toolchain-related customisation of the content
> +# of the target/ directory. Those customisations are added to the
> +# TARGET_FINALIZE_HOOKS, to be applied just after all packages
> +# have been built.
> +
> +# Install the gconv modules
> +ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
> +GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
> +define COPY_GCONV_LIBS
> +       $(Q)if [ -z "$(GCONV_LIBS)" ]; then \
> +               $(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
> +                                     $(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
> +               $(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
> +                                  $(TARGET_DIR)/usr/lib/gconv \
> +               || exit 1; \
> +       else \
> +               for l in $(GCONV_LIBS); do \
> +                       $(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${l}.so \
> +                                             $(TARGET_DIR)/usr/lib/gconv/$${l}.so \
> +                       || exit 1; \
> +                       $(TARGET_READELF) -d $(STAGING_DIR)/usr/lib/gconv/$${l}.so |\
> +                       sort -u |\
> +                       sed -e '/.*(NEEDED).*\[\(.*\.so\)\]$$/!d; s//\1/;' |\
> +                       while read lib; do \
> +                                $(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${lib} \
> +                                                      $(TARGET_DIR)/usr/lib/gconv/$${lib} \
> +                                || exit 1; \
> +                       done; \
> +               done; \
> +               ./support/scripts/expunge-gconv-modules "$(GCONV_LIBS)" \
> +                       <$(STAGING_DIR)/usr/lib/gconv/gconv-modules \
> +                       >$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
> +       fi
> +endef
> +TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
> +endif
> --
> 1.9.1
>
