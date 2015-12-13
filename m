From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 22:00:08 +0100
Subject: [Buildroot] [PATCH] gptfdisk: Add host package
In-Reply-To: <1449617254.26955.31.camel@rtred1test09.kymeta.local>
References: <1449617254.26955.31.camel@rtred1test09.kymeta.local>
Message-ID: <20151213210008.GC18449@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2015-12-08 23:27 +0000, Trent Piepho spake thusly:
> This tool is useful for scripts that create flash images with
> multiple partitions.  The host-parted package can do this too, but is
> missing a number of features that the gptfdisk program has for dealing
> with GPT.
> 
> The interactive gdisk and curses based sgdisk aren't built.  Just the
> scriptable tool sgdisk.  The target package allows configuring which
> tools are built, but this seem unnecessarily complex for the host
> package.

I agree. We normally do not have configurable options for host packages.
And since in this case only the scriptable sgdisj is really of any
interest, that's totally OK with me.

However, I have a few comments, see below...

> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  package/Config.in.host          |  1 +
>  package/gptfdisk/Config.in.host |  9 +++++++++
>  package/gptfdisk/gptfdisk.mk    | 11 +++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/gptfdisk/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index ce1b6bc..d757316 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -12,6 +12,7 @@ menu "Host utilities"
>  	source "package/genext2fs/Config.in.host"
>  	source "package/genimage/Config.in.host"
>  	source "package/genpart/Config.in.host"
> +	source "package/gptfdisk/Config.in.host"
>  	source "package/imx-usb-loader/Config.in.host"
>  	source "package/jq/Config.in.host"
>  	source "package/lpc3250loader/Config.in.host"
> diff --git a/package/gptfdisk/Config.in.host b/package/gptfdisk/Config.in.host
> new file mode 100644
> index 0000000..7bdfd00
> --- /dev/null
> +++ b/package/gptfdisk/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_GPTFDISK
> +	bool "host gptfdisk"

The target variant needs libuuid from util-linux, so I guess you also
want to select BR2_PACKAGE_HOST_UTIL_LINUX.

I see below that you just added a build-time dependency. Although this
is usually enough for most host packages, you still need to do the
select in Kconfig since util-linux does have an entry in Kconfig.

Otherwise, that's good for me. Care to fix and respin, please? Thanks!

Regards,
Yann E. MORIN.

> +	help
> +          GPT fdisk (consisting of the gdisk and sgdisk programs) is a
> +          text-mode partitioning tool that works on Globally Unique Identifier
> +          (GUID) Partition Table (GPT) disks, rather than on the more common
> +          (through 2010) Master Boot Record (MBR) partition tables.
> +
> +          http://www.rodsbooks.com/gdisk/
> diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
> index abfddfb..089e862 100644
> --- a/package/gptfdisk/gptfdisk.mk
> +++ b/package/gptfdisk/gptfdisk.mk
> @@ -46,4 +46,15 @@ define GPTFDISK_INSTALL_TARGET_CMDS
>  	done
>  endef
>  
> +HOST_GPTFDISK_DEPENDENCIES = host-util-linux host-popt
> +define HOST_GPTFDISK_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
> +		sgdisk
> +endef
> +
> +define HOST_GPTFDISK_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/usr/sbin/sgdisk
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 1.8.3.1
> 
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
