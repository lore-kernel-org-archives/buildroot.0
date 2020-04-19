From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 12:42:39 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/dmraid: use modules-load to
 load the kernel module
In-Reply-To: <20200418221411.1549783-4-unixmania@gmail.com>
References: <20200418221411.1549783-1-unixmania@gmail.com>
 <20200418221411.1549783-4-unixmania@gmail.com>
Message-ID: <20200419104239.GV5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CArlos, All,

On 2020-04-18 19:14 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> This is compatible with BusyBox/sysvinit (via S02modules-load), OpenRC
> and systemd. It also prevents trying to load the module each time the
> init script is executed.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Tested on QEMU with a kernel config with MD=y and DM_<FOO>=m. Only the
> module loading was tested, since there is no RAID device.
> ---
>  package/dmraid/S20dmraid |  3 ---
>  package/dmraid/dmraid.mk | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
> index b3bfdcc84b..ff325154c6 100644
> --- a/package/dmraid/S20dmraid
> +++ b/package/dmraid/S20dmraid
> @@ -2,9 +2,6 @@
>  
>  set -e
>  
> -# try to load module in case that hasn't been done yet
> -modprobe dm-mod >/dev/null 2>&1
> -
>  case "$1" in
>  	start|"")
>  		echo "Setting up DMRAID devices..."
> diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
> index 0382cd4d99..c8facbdabd 100644
> --- a/package/dmraid/dmraid.mk
> +++ b/package/dmraid/dmraid.mk
> @@ -21,4 +21,16 @@ define DMRAID_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S20dmraid
>  endef
>  
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +define DMRAID_GEN_MODULES_CONF
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/modules-load.d
> +	{ \
> +		find $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/md -name 'dm[_-]mod.ko*'; \
> +	} 2> /dev/null | { \
> +		sed 's:^.*/::; s:\.ko[^ ]*::'; \
> +	} > $(TARGET_DIR)/etc/modules-load.d/20-dmraid.conf
> +endef
> +DMRAID_TARGET_FINALIZE_HOOKS += DMRAID_GEN_MODULES_CONF
> +endif

Why do we need this complex code? Furthermore, we'll have to repeat that
complexity in all packages that want to provide modules; that's not
nice... :-(

Can't we simply have a modules table, like we have the device amd user
tables? Something like:

    define DMRAID_MODULES
        dm-stuff
        dm-blurb
        dm-blabla
    endef

And then have the package and rootfs infrastructures handle that like
the other tables?

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
