From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 23 Dec 2014 13:18:45 +0100
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 23, 2014 at 1:06 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> We used to specify explicitly serial port with all its settings
> for init to instantiate getty.
>
> This limits usecases when the same one rootfs could be used.
>
> For example following cases won't work well with hardcoded
> serial console settings:
>  * On the same board other serial port is expected to be used
>  * The same rootfs is intended to be used on different boards with
>    different serial ports (like ttySx vs ttyAMAx or even ttyx)
>
> With this change by default we rely on "console" specified in
> kernel's boot command line.
>
> What is important getty will be set on the last console
> specified in bootargs.
>
> For example is a kernel comand line:
> --->---
> bootargs="... console=tty0 console=ttyS3,115200n8..."
> --->---
>
> This now will instantiate serial console on ttyS3 but not on tty0.
>
> Tested with both Busybox and SysV init.

But can you login as root via /dev/console? AFAIK it was the main
problem by this approach. There is also another alternative: cttyhack

Yegor

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  system/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/system/Config.in b/system/Config.in
> index 0fa0dc6..6447be8 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -263,13 +263,13 @@ if BR2_TARGET_GENERIC_GETTY
>  menu "getty options"
>  config BR2_TARGET_GENERIC_GETTY_PORT
>         string "TTY port"
> -       default "ttyS0"
> +       default "console"
>         help
>           Specify a port to run a getty on.
>
>  choice
>         prompt "Baudrate"
> -       default BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
> +       default BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
>         help
>           Select a baudrate to use.
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
