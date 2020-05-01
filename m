From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:55:56 +0200
Subject: [Buildroot] [PATCH 02/22] core/pkg-utils: kconfig mangling
 defaults to current package's .config
In-Reply-To: <14c3b30890f0dbccd6954e9e6c88de483b321b65.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <14c3b30890f0dbccd6954e9e6c88de483b321b65.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <20200501155556.09733746@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Apr 2020 14:10:14 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The kconfig mangling macros currently operate on the caller-supplied
> .config file, on the assumption that the caller will always know what
> file to mangle.
> 
> This was correct so far, as packages would indeed only mangle their own
> .config files.
> 
> However, the linux kernel does its mangling based on whether some
> packages are enabled or not. That list of conditional mangling is
> getting bigger and bigger with each new package that needs such
> mangling, culminating with the pending firewalld one [0]. Furthermore,
> this mangling is not accessible to packages in br2-external trees. So
> we'll want to have packages provide the mangling commands.
> 
> So we'll want the mangling to be done on the linux' .config file,,i.e.
> and the expanding package context, not in the package calling the
> macros.

I fixed up this paragraph.

> This has the added benefit that we do not have to repeat in the
> exp[anding package context the knowledge of how the .config file is
> named:
> 
>     FOO_KCONFIG_DOTCONFIG = .config
>     define FOO_KCONFIG_FIXUPS_CMDS
>         $(call KCONFIG_ENABLE_OPT,BLA,$(@D)/.config)

And dropped $(@D)/.config from this example.. because it's precisely
what you're explaining: we no longer need to specify it explicitly.


> -# KCONFIG_MUNGE_DOT_CONFIG (option, newline, file)
> +# KCONFIG_DOT_CONFIG ([file])

I've added a comment here that explains what this macro is doing.

> +KCONFIG_DOT_CONFIG = $(strip \
> +	$(if $(strip $(1)), $(1), \
> +		$($(PKG)_BUILDDIR)/$($(PKG)_KCONFIG_DOTCONFIG) \
> +	) \
> +)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
