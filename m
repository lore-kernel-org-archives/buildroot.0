From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 07 Aug 2018 12:22:21 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/3_v3=5D_core/pkg-kconfig?=
 =?iso-8859-1?q?=3A_allow_dependencies_before_configurators?=
In-Reply-To: <15ce2a326c94d0609cc2fe1d92707b691fa4fa3e.1533327111.git.yann.morin.1998@free.fr>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <15ce2a326c94d0609cc2fe1d92707b691fa4fa3e.1533327111.git.yann.morin.1998@free.fr>
Message-ID: <0c1cbe9e-75ae-4122-8bd5-0d765eec0e3e@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 3. srpna 2018 22:16:54 CEST, Yann E. MORIN wrote:
> Some users of kconfig need some packages to be built before their
> kconfig infra be used.
>
> For example, the linux kernel, starting with 4.16, needs flex and bison
> to generate the parser code. Furthermore, starting with 4.18, it will
> also need the cross-compiler before parsing the kconfig stuff, because
> that calls the compiler to check its features.
>
> Currently, this is broken, even the flex/bison ones, even though they
> are listed, because there is no way to define dependencie that are
> guaranteed before the (visual) configurators. For example:
>
>     $ make distclean
>     $ make menuconfig
>       --> enable the linux kernel, choose a defconfig, save, exit
>     $ make linux-menuconfig
>     [...]
>       HOSTCC  scripts/basic/fixdep
>       HOSTCC  scripts/kconfig/conf.o
>       YACC    scripts/kconfig/zconf.tab.c
>     /bin/sh: bison: command not found
>       LEX     scripts/kconfig/zconf.lex.c
>     scripts/Makefile.lib:196: recipe for target 
> 'scripts/kconfig/zconf.tab.c' failed
>     make[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
>     make[3]: *** Waiting for unfinished jobs....
>     /bin/sh: flex: command not found
>     scripts/Makefile.lib:188: recipe for target 
> 'scripts/kconfig/zconf.lex.c' failed
>     make[3]: *** [scripts/kconfig/zconf.lex.c] Error 127
>     Makefile:528: recipe for target 'rpc_defconfig' failed
>     make[2]: *** [rpc_defconfig] Error 2
>     linux/linux.mk:511: recipe for target 
> '/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config' 
> failed
>     make[1]: *** 
> [/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config] 
> Error 2
>     Makefile:79: recipe for target '_all' failed
>     make: *** [_all] Error 2
>
> So, we introduce a new type of dependencies for kconfig-based packages,
> that are guaranteed to be built and installed before the (visual)
> configurators are called.
>
> Since those dependencies are phony targets and therefore always out of
> date, a normal dependency would cause the .config target to be rebuilt
> on each invocation of make. So we use an order-only pre-requisite, like
> is done for the patch dependency.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/adding-packages-kconfig.txt | 4 ++++
>  package/pkg-kconfig.mk                  | 9 +++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/docs/manual/adding-packages-kconfig.txt 
> b/docs/manual/adding-packages-kconfig.txt
> index d4d8630a79..982c1229ea 100644
> --- a/docs/manual/adding-packages-kconfig.txt
> +++ b/docs/manual/adding-packages-kconfig.txt
> @@ -81,3 +81,7 @@ be set to suit the needs of the package under 
> consideration:
>    be well suited for all packages that use the standard kconfig
>    infrastructure as inherited from the Linux kernel; some packages use
>    a derivative of kconfig that use a different location.
> +
> +* +FOO_KCONFIG_DEPENDENCIES+: the list of packages (most probably, host
> +  packages) that need to be built before this package's kconfig is
> +  interpreted. Seldom used. By default, empty.
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 81bba5220c..d6c95b897e 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -41,6 +41,10 @@ endef
>  
>  define inner-kconfig-package
>  
> +# Register the kconfig dependencies as regular dependencies, so that
> +# they are also accounted for in the generated graphs.
> +$(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
> +
>  # Call the generic package infrastructure to generate the necessary
>  # make targets.
>  # Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
> @@ -121,6 +125,11 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): 
> $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_F
>  # it explicitly. It doesn't hurt to always have it though.
>  $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
>  
> +# Some packages may need additional tools to be present by the time their
> +# kconfig structure is parsed (e.g. the linux kernel may need to call to
> +# the compiler to test its features).
> +$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
> +
>  # In order to get a usable, consistent configuration, some 
> fixup may be needed.
>  # The exact rules are specified by the package .mk file.
>  define $(2)_FIXUP_DOT_CONFIG

Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
