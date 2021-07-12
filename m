From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 12 Jul 2021 22:43:12 +0200
Subject: [Buildroot] [RFC] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <CAOMZO5Dw6=v5ndry8AWgmx0iX_kFDsKPVeqRAhAbLEscuAfAEQ@mail.gmail.com>
References: <20210712162703.2937572-1-festevam@gmail.com>
 <CAB0FRstB6+32=F-JmTs4RS70A3uUt0feCa9VtF3rgX2GD1tOjw@mail.gmail.com>
 <CAOMZO5Dw6=v5ndry8AWgmx0iX_kFDsKPVeqRAhAbLEscuAfAEQ@mail.gmail.com>
Message-ID: <CAB0FRsvr-Cre6ZvOCY7NR+ccy_o9JrQaGeKkC=nQ1gYVFFzY3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 12 juil. 2021 ? 22:03, Fabio Estevam <festevam@gmail.com> a ?crit :

> Hi Fran?ois,
>
> On Mon, Jul 12, 2021 at 4:55 PM Fran?ois Perrad
> <francois.perrad@gadz.org> wrote:
>
> > Hi Fabio,
> >
> > Currently, I got a kernel panic after:
> > [    6.761962] VFS: Cannot open root device "PARTUUID=" or
> unknown-block(0,0): error -6
> > [    6.899508] Kernel panic - not syncing: VFS: Unable to mount root fs
> on unknown-block(0,0)
> >
> > looks like, ${uuid} was not correct.
> > boot.scr.txt starts with:
> >     setenv finduuid "part uuid mmc 1:1 uuid"
> >     run finduuid
>
> Thanks for testing.
>
> It seems that this change in U-Boot would fix it:
>
> --- a/include/configs/mx6cuboxi.h
> +++ b/include/configs/mx6cuboxi.h
> @@ -57,7 +57,7 @@
>         "console=" CONSOLE_DEV ",115200\0" \
>         "bootm_size=0x10000000\0" \
>         "mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
> -       "finduuid=part uuid mmc 0:1 uuid\0" \
> +       "finduuid=part uuid mmc 1:1 uuid\0" \
>         "update_sd_firmware=" \
>                 "if test ${ip_dyn} = yes; then " \
>                         "setenv get_cmd dhcp; " \
>
> If possible, could you please manually change finduuid in the U-Boot
> prompt?
>
> => setenv finduuid 'part uuid mmc 1:1 uuid'
> => saveenv
> => reset
>
>
OK fixed within interactive mode.

after fully booted:
    # cat /boot/extlinux/extlinux.conf
    Label imx6qdl-cubox Buildroot
            kernel ../zImage
            fdtdir ../
            append root=PARTUUID=${uuid} rootwait rw
console=${console},${baudrate}

Fran?ois

Thanks,
>
> Fabio Estevam
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210712/c60939d2/attachment.html>
