From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 23:22:06 +0200
Subject: [Buildroot] [PATCH 3/7 v4] core/pkg-kconfig: allow dependencies
 before configurators
In-Reply-To: <77bbf4b5b25bb26a7ffe57cee1df194cae6113c4.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
 <77bbf4b5b25bb26a7ffe57cee1df194cae6113c4.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <20180818232206.113c3b19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 18:06:49 +0200, Yann E. MORIN wrote:
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
>     scripts/Makefile.lib:196: recipe for target 'scripts/kconfig/zconf.tab.c' failed
>     make[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
>     make[3]: *** Waiting for unfinished jobs....
>     /bin/sh: flex: command not found
>     scripts/Makefile.lib:188: recipe for target 'scripts/kconfig/zconf.lex.c' failed
>     make[3]: *** [scripts/kconfig/zconf.lex.c] Error 127
>     Makefile:528: recipe for target 'rpc_defconfig' failed
>     make[2]: *** [rpc_defconfig] Error 2
>     linux/linux.mk:511: recipe for target '/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config' failed
>     make[1]: *** [/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config] Error 2
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
> Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
> Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  docs/manual/adding-packages-kconfig.txt | 4 ++++
>  package/pkg-kconfig.mk                  | 9 +++++++++
>  2 files changed, 13 insertions(+)

Applied to master, thanks. If anybody wonders why this gets into
master: I believe people are going to hit this problem, either because
of the bison or flex dependency, or because of the toolchain
dependency, and this is something we should fix in our upcoming 2018.08
release.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
