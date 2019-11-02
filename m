From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2019 19:02:49 +0100
Subject: [Buildroot] [PATCH] package/dtc: do not install headers for the
 host version
In-Reply-To: <20191102122947.8231-1-unixmania@gmail.com>
References: <20191102122947.8231-1-unixmania@gmail.com>
Message-ID: <20191102180249.GC2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-11-02 09:29 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> None of the packages that depend on host-dtc need the headers and they

That's not the case with host-qemu, with system emulation enabled:

    $ cat defconfig
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_PACKAGE_HOST_QEMU=y
    BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

    $ make >build.log 2>&1

    $ grep 'fdt support'

With master:
    fdt support       system

With your patch:
    fdt support       git

So this patch means that host-qemu now uses its bundled copy rather than
the one installed by host-dtc.

Now, whether we prefer that to the current mess, let's see...

Regards,
Yann E. MORIN.

> interfere with the build of the kernel, as in beaglebone:
> 
> 2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts
> 2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts/dtc need-builtin=
> 2019-11-01T22:23:16 (cat /dev/null; ) > scripts/dtc/modules.order
> 2019-11-01T22:23:16 /usr/bin/gcc -O2 -I/work/beaglebone/host/include -L/work/beaglebone/host/lib -Wl,-rpath,/work/beaglebone/host/lib -Wp,-MD,scripts/dtc/libfdt/.fdt_ro.o.d -Wall -Wmissing-prototypes -Wstrict-p>
> 2019-11-01T22:23:16 scripts/dtc/libfdt/fdt_ro.c:92:10: error: redefinition of ?fdt_get_max_phandle?
> 2019-11-01T22:23:16 uint32_t fdt_get_max_phandle(const void *fdt)
> 2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
> 2019-11-01T22:23:16 In file included from scripts/dtc/libfdt/fdt_ro.c:54:
> 2019-11-01T22:23:16 /work/beaglebone/host/include/libfdt.h:384:24: note: previous definition of ?fdt_get_max_phandle? was here
> 2019-11-01T22:23:16 static inline uint32_t fdt_get_max_phandle(const void *fdt)
> 2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
> 2019-11-01T22:23:16 make[4]: *** [scripts/Makefile.host:107: scripts/dtc/libfdt/fdt_ro.o] Error 1
> 2019-11-01T22:23:16 make[3]: *** [scripts/Makefile.build:544: scripts/dtc] Error 2
> 2019-11-01T22:23:16 make[2]: *** [Makefile:1066: scripts] Error 2
> 2019-11-01T22:23:16 make[1]: *** [package/pkg-generic.mk:241: /work/beaglebone/build/linux-4dae378bbe721277b08699d1d88ffae12acc9b09/.stamp_built] Error 2
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/dtc/dtc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 7fde0dc968..35ac0b332b 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -68,7 +68,7 @@ define HOST_DTC_BUILD_CMDS
>  endef
>  
>  define HOST_DTC_INSTALL_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install-bin install-lib
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.18.1
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
