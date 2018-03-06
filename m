From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 5 Mar 2018 20:15:34 -0500
Subject: [Buildroot] [PATCH 03/23] linux: fix passing of host CFLAGS and
 LDFLAGS
In-Reply-To: <20180304213137.24681-4-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
 <20180304213137.24681-4-thomas.petazzoni@bootlin.com>
Message-ID: <CA+-urNSm0WpW6Jigr8GCmOMFeBLBnxb2d3+Ti9HczRMmwszq2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 4, 2018 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> We were passing HOSTCFLAGS="$(HOSTCFLAGS)" to Linux. However:
>
>  - HOSTCFLAGS in Buildroot doesn't exist, and is empty, so this
>    assignment never did anything. The name of the variable in
>    Buildroot in HOST_CFLAGS.
>
>  - HOSTCFLAGS in Linux isn't used everywhere, and passing it overrides
>    the default HOSTCFLAGS value defined in the main Linux kernel
>    Makefile.
>
> In addition, there is no way to pass additional host LDFLAGS in the
> Linux kernel build system.
>
> Therefore, we simply shoehorn our HOST_CFLAGS and HOST_LDFLAGS while
> passing HOSTCC to the Linux kernel build system. This has been tested
> to work fine with host OpenSSL and host libelf only available in
> $(HOST_DIR).
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

I ran into the ORC/libelf issue when upgrading to 2018.02 on a custom
x86_64 defconfig, and this patch plus the previous one fixed the issue
for me.

Thanks,
Frank


> ---
>  linux/linux.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 76bf2c2ea7..bedc89cad8 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -103,8 +103,7 @@ LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
>  endif
>
>  LINUX_MAKE_FLAGS = \
> -       HOSTCC="$(HOSTCC)" \
> -       HOSTCFLAGS="$(HOSTCFLAGS)" \
> +       HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
>         ARCH=$(KERNEL_ARCH) \
>         INSTALL_MOD_PATH=$(TARGET_DIR) \
>         CROSS_COMPILE="$(TARGET_CROSS)" \
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
