From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Apr 2018 11:22:28 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180423092228.GO12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-22 14:23 +0200, Thomas Petazzoni spake thusly:
> binutils installs its binaries both as bin/<tuple>-<tool> and as
> <tuple>/bin/<tool>, and hardlinks are used to reduce disk space
> consumption. This causes a problem for host-binutils with our rpath
> fixing logic done by "make sdk".
> 
> Indeed, the fix-rpath script starts by fixing up the rpath of
> bin/<tuple>-<tool>, and sets the RPATH to $ORIGIN/../lib/. Then
> fix-rpath moves on to <tuple>/bin/<tool>, and doesn't find the library
> the tool depends on, and clears the RPATH. The result is that the
> binutils tool are not usable.
> 
> Note that this is only visible currently on the ARC architecture,
> because on this architecture, binutils is fetched from git, which
> causes host-flex to be built, and some binutils tools to use the libfl
> shared library. Therefore, the binutils tools don't use just the
> standard C library (which is provided by the system) but also libfl
> from $(HOST_DIR)/lib, and therefore if the RPATH isn't set correctly,
> those tools don't work properly.

So I wanted to test this, and it does what's on the can.

However, I wanted to reproduce the build failures, and here, with
current master, so I built a toolchain with buildroot [0], but none
of binutils programs is linked with libfl:

    $ for i in host/arc-buildroot-linux-uclibc/bin/*; do
        readelf -d "${i}" |grep NEEDED
    done |sort -u
     0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
     0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]

I checked, and I don't have libfl on my system, neither static not
shared, so it cant even have picked the static one from my system.

And indeed, libnl can build:

    checking the archiver (/home/ymorin/dev/buildroot/O/host/bin/arc-buildroot-linux-uclibc-ar)interface... ar

So, I don't see the point...

[0] with this defconfig:
BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

Regards,
Yann E. MORIN.

> In order to address this, this comit adds a post-install hook to
> host-binutils that replaces those hard links by symbolic links. It is
> worth mentioning that library loading and RPATH usage occurs *after*
> resolving the symbolic links, which makes this solution work.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/binutils/binutils.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 13cd02b491..b24e4334c2 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -130,5 +130,17 @@ ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
>  HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
>  endif
>  
> +# Hardlinks between binaries in different directories cause a problem
> +# with rpath fixup, so we de-hardlink those binaries, and replace them
> +# with symbolic links.
> +BINUTILS_TOOLS = ar as ld ld.bfd nm objcopy objdump ranlib readelf strip
> +define HOST_BINUTILS_FIXUP_HARDLINKS
> +	$(foreach tool,$(BINUTILS_TOOLS),\
> +		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) ; \
> +		ln -s ../../bin/$(GNU_TARGET_NAME)-$(tool) $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
> +	)
> +endef
> +HOST_BINUTILS_POST_INSTALL_HOOKS += HOST_BINUTILS_FIXUP_HARDLINKS
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.14.3
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
