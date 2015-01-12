From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 23:07:54 +0100
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150112230754.65993daf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 23 Dec 2014 15:06:13 +0300, Alexey Brodkin wrote:

> diff --git a/system/Config.in b/system/Config.in
> index 0fa0dc6..6447be8 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -263,13 +263,13 @@ if BR2_TARGET_GENERIC_GETTY
>  menu "getty options"
>  config BR2_TARGET_GENERIC_GETTY_PORT
>  	string "TTY port"
> -	default "ttyS0"
> +	default "console"
>  	help
>  	  Specify a port to run a getty on.
>  
>  choice
>  	prompt "Baudrate"
> -	default BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
> +	default BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
>  	help
>  	  Select a baudrate to use.

I've just tested with agetty from util-linux, and while "console" as
the default getty works fine, having 0 as the baudrate doesn't work.
You have to specify a correct serial port speed apparently.

You can try with the following config:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSV=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_IFUPDOWN=y
BR2_PACKAGE_AT=y
BR2_PACKAGE_COREUTILS=y
BR2_PACKAGE_START_STOP_DAEMON=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_BINARIES=y
BR2_PACKAGE_UTIL_LINUX_AGETTY=y
BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y

which you can boot using an ARM Vexpress kernel under Qemu.

Though, this does not say I'm not fine with the current situation. I
believe the current situation (with your patch) works fine in the
normal cases. People using agetty probably know what they are doing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
