From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 May 2018 21:45:07 +0200
Subject: [Buildroot] [PATCH] package/ncurses: enable widechar for host
 build
In-Reply-To: <20180503075808.26367-1-arnout@mind.be>
References: <20180426190845.21415-1-arnout@mind.be>
 <20180503075808.26367-1-arnout@mind.be>
Message-ID: <20180503194507.GB2453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-05-03 09:58 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Kconfig uses either pkg-config or hard-coded /usr/include paths to find
> the ncurses or ncursesw library. If ncursesw is found, it will include
> <ncursesw.h>. Since Buildroot's host-ncurses doesn't install a .pc file,
> and linux.mk anyway doesn't pass the pkg-config options to find the host
> pkg-config files, Kconfig will always find the system's ncursesw.h.
> 
> However, since commit dde090c299 (linux: fix passing of host CFLAGS and
> LDFLAGS) HOST_LDFLAGS is passed to the linux build system. Thus, if
> host-ncurses was already built before 'make linux-menuconfig' is called,
> the build will pick up libncurses from the host directory, which is NOT
> widechar. Thus, two different ncurses configurations are mixed into the
> final mconf program. This will result in serious breakage in the
> rendering of the menus (lots of @ and question mark characters).

What about overriding HOSTCC when calling linux-menuconfig:

    diff --git a/linux/linux.mk b/linux/linux.mk
    index 9e646baffc..75a256ff9e 100644
    --- a/linux/linux.mk
    +++ b/linux/linux.mk
    @@ -235,7 +235,7 @@ LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
     endif
     LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
     LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
    -LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
    +LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC)"
     
     # If no package has yet set it, set it from the Kconfig option
     LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)

We should not need any library from HOST_DIR when we run menuconfig.

Note: we may still want to enable widechar in host-ncurses for other
reasons, though. But with the proposdal above, there is no lopnger any
mix of system ncurses vs our own.

Regards,
Yann E. MORIN.

> As a workaround, just build host-ncurses with widechar support. That
> makes it compatible with ncursesw.h picked up from the host. Clearly,
> this is not a robust solution. But it's simple, it works, and it
> shouldn't hurt to build host-ncurses with widechar support (we can
> safely assume that the system doesn't have a non-widechar uClibc
> library...).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: David De Grave <david.degrave@essensium.com>
> Cc: Scott Fan <fancp2007@gmail.com>
> ---
> v2:
>  - fix typo in commit message;
>  - extend commit message;
>  - keep alphabetic ordering of configure options (Scott)
> 
> Note: I haven't tested what happens on a system which doesn't have
> ncursesw.h. But I guess such a system is so exotic that it's not
> worthwhile to do something special for it.
> ---
>  package/ncurses/ncurses.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 90cf4a4dc5..f9cd0d3fbd 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -147,6 +147,7 @@ define HOST_NCURSES_BUILD_CMDS
>  endef
>  
>  HOST_NCURSES_CONF_OPTS = \
> +	--enable-widec \
>  	--with-shared \
>  	--without-gpm \
>  	--without-manpages \
> -- 
> 2.17.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
