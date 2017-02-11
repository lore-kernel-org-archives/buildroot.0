From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Feb 2017 16:13:33 +0100
Subject: [Buildroot] [PATCH 1/2] augeas: new package
In-Reply-To: <20170210110013.30448-1-joerg.krause@embedded.rocks>
References: <20170210110013.30448-1-joerg.krause@embedded.rocks>
Message-ID: <289e8922-ab01-115e-9f15-680e0d53e101@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Le 10/02/2017 ? 12:00, J?rg Krause a ?crit :
> Augeas is a configuration editing tool. It parses configuration files in
> their native formats and transforms them into a tree. Configuration
> changes are made by manipulating this tree and saving it back into
> native config files.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/Config.in          |  1 +
>  package/augeas/Config.in   | 11 +++++++++++
>  package/augeas/augeas.hash |  2 ++
>  package/augeas/augeas.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 36 insertions(+)
>  create mode 100644 package/augeas/Config.in
>  create mode 100644 package/augeas/augeas.hash
>  create mode 100644 package/augeas/augeas.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 114a5ad5f..6956a788a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1409,6 +1409,7 @@ menu "Security"
>  endmenu
>  
>  menu "Text and terminal handling"
> +	source "package/augeas/Config.in"
>  	source "package/enchant/Config.in"
>  	source "package/icu/Config.in"
>  	source "package/libcli/Config.in"
> diff --git a/package/augeas/Config.in b/package/augeas/Config.in
> new file mode 100644
> index 000000000..efbc19b43
> --- /dev/null
> +++ b/package/augeas/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_AUGEAS
> +	bool "augeas"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  Augeas is a configuration editing tool. It parses configuration
> +	  files in their native formats and transforms them into a tree.
> +	  Configuration changes are made by manipulating this tree and
> +	  saving it back into native config files.

"The help text should be wrapped to fit 72 columns." see [1]

Note: one Tab count as 8 characters.

[1] http://nightly.buildroot.org/#writing-rules-config-in

> +
> +	  http://augeas.net
> diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
> new file mode 100644
> index 000000000..9640757eb
> --- /dev/null
> +++ b/package/augeas/augeas.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  b9315575d07f7ba28ca2f9f60b4987dfe77b5970c98b59dc6ca7873fc4979763  augeas-1.7.0.tar.gz
> diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
> new file mode 100644
> index 000000000..7a1f2f8ce
> --- /dev/null
> +++ b/package/augeas/augeas.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# augeas
> +#
> +################################################################################
> +
> +AUGEAS_VERSION = 1.7.0
> +AUGEAS_SITE = http://download.augeas.net
> +AUGEAS_INSTALL_STAGING = YES
> +AUGEAS_LICENSE = LGPLv2.1+
> +AUGEAS_LICENSE_FILES = COPYING
> +AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
> +
> +AUGEAS_CONF_OPTS = --disable-gnulib-tests
> +
> +# Remove the test lenses which occupy about 1.4 MB on the target
> +define AUGEAS_REMOVE_TEST_LENSES
> +	rm -rf $(TARGET_DIR)/usr/share/augeas/lenses/dist/tests
> +endef
> +AUGEAS_POST_INSTALL_TARGET_HOOKS += AUGEAS_REMOVE_TEST_LENSES

The packaging looks good but augeas fail to build with some toolchain/arch:

./support/scripts/test-pkg -c pkg-config -d test-pkg/ -p augeas

br-arcle-hs38: download config, olddefconfig, dirclean, build: FAILED

/tmp/ccQRgMGk.s: Assembler messages:
/tmp/ccQRgMGk.s:1159: Error: Bad expression: @pcl + , at .LANCHOR0@pcl-24.
/tmp/ccQRgMGk.s:1159: Error: extra comma
/tmp/ccQRgMGk.s:1159: Error: syntax error

Maybe report this one to ARC people...

br-arm-basic: download config, olddefconfig, dirclean, build: FAILED

./.libs/libaugeas.so: undefined reference to `wctomb'
./.libs/libaugeas.so: undefined reference to `mbtowc'

br-arm-cortex-m4-full: download config, olddefconfig, dirclean, build: FAILED
br-arm-full-static: download config, olddefconfig, dirclean, build: FAILED
br-m68k-5208-full: download config, olddefconfig, dirclean, build: FAILED

./.libs/libaugeas.a(internal.o): In function `xasprintf':
internal.c:(.text+0x64c): multiple definition of `xasprintf'
augtool.o:augtool.c:(.text+0x5d8): first defined here

Can you take a look?

Best regards,
Romain

> +
> +$(eval $(autotools-package))
> 
