From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 23:03:11 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180509164412.31596-2-petr.vorel@gmail.com>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
Message-ID: <20180519230311.6a3652fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

Thanks for looking at the kconfig code update.

On Wed,  9 May 2018 18:44:12 +0200, Petr Vorel wrote:
> This kernel commit required to rename target in Makefile:
> 911a91c39cab kconfig: rename silentoldconfig to syncconfig
> 
> Differences from upstrem (kernel):
> * Tests are not included. IMHO we don't need them.
> * kernel added new tool requirement: flex & bison, added in commit
> 29c833061c1d kconfig: generate lexer and parser during build instead of shipping
> but atm we still use generated files (zconf.lex.c_shipped and zconf.tab.c_shipped).
> 
> User visible changes (incomplete list):
> * make "Selected by:" and "Implied by:" readable:
> d9119b5925a0 kconfig: Print reverse dependencies in groups
> 9a47ceec543b kconfig: clean-up reverse dependency help implementation
> 1ccb27143360 kconfig: make "Selected by:" and "Implied by:" readable
> 
> Old version of help:
> Symbol: BR2_ARCH_HAS_MMU_MANDATORY [=y]
> Type  : boolean
>   Defined at arch/Config.in:12
>   Selected by: BR2_arcle [=n] && <choice> || BR2_arceb [=n] && <choice> || BR2_aarch64 [=n] && <choice> || BR2_aarch64_be [=n] && <choice> || BR2_csky [=n] && <choice> ...
> 
> New version of help:
> Symbol: BR2_ARCH_HAS_MMU_MANDATORY [=y]
> Type  : bool
>   Defined at arch/Config.in:12
>   Selected by [y]:
>   - BR2_x86_64 [=y] && <choice>
>   Selected by [n]:
>   - BR2_arcle [=n] && <choice>
>   - BR2_arceb [=n] && <choice>
>   - BR2_aarch64 [=n] && <choice>
>   - BR2_aarch64_be [=n] && <choice>

This change is really great!

> * 2c37e08464a8 kconfig: Warn if choice default is not in choice
> toolchain/toolchain-buildroot/Config.in:25:warning: choice default symbol 'BR2_TOOLCHAIN_UCLIBC' is not contained in the choice
> package/libmediaart/Config.in:21:warning: choice default symbol 'BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE' is not contained in the choice
> NOTE: fixes for these errors has already been posted to ML.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

I tested this here, but unfortunately "make menuconfig" fails, because
it wants <glade/glade.h>, which it shouldn't need as I don't want the
Gtk-based gconfig. Here is what happens:

thomas at windsurf:~/projets/buildroot (next)$ make menuconfig
mkdir -p /home/thomas/projets/buildroot/output/build/buildroot-config/lxdialog
PKG_CONFIG_PATH="" make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" \
    obj=/home/thomas/projets/buildroot/output/build/buildroot-config -C support/kconfig -f Makefile.br mconf
/usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"  -MM *.c > /home/thomas/projets/buildroot/output/build/buildroot-config/.depend 2>/dev/null || :
/usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"   -c conf.c -o /home/thomas/projets/buildroot/output/build/buildroot-config/conf.o
/usr/bin/gcc -D_GNU_SOURCE -D_DEFAULT_SOURCE  -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE  -I/home/thomas/projets/buildroot/output/build/buildroot-config -DCONFIG_=\"\"  `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` -Wno-missing-prototypes -c gconf.c -o /home/thomas/projets/buildroot/output/build/buildroot-config/gconf.o
Package libglade-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libglade-2.0.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libglade-2.0', required by 'virtual:world', not found
gconf.c:17:10: fatal error: glade/glade.h: No such file or directory
 #include <glade/glade.h>
          ^~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile.br:34: /home/thomas/projets/buildroot/output/build/buildroot-config/gconf.o] Error 1
make[1]: *** [Makefile:876: /home/thomas/projets/buildroot/output/build/buildroot-config/mconf] Error 2
make: *** [Makefile:79: _all] Error 2

I did not investigate at all, just observed that it didn't work.

> Changes v1->v2:
> * Fix building packages (v1 didn't address change in kernel
> 911a91c39cab kconfig: rename silentoldconfig to syncconfig)
> 
> NOTE: I think I should stop using *shipped files (zconf.hash.c_shipped
> and zconf.lex.c_shipped), to have the same behavior as kernel.
> What do you think?

If we were to drop the *shipped files, it means we would have to build
host-flex and host-bison prior to running any "make *config" command.
This would be really annoying. Alternatively, we could decide to make
"flex" and "bison" mandatory dependencies of Buildroot, and rely on the
user to install them on the system rather than building them ourselves.
The drawback of this is that we would no longer control which version
of flex/bison gets used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
