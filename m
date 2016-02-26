From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2016 09:39:39 +0100
Subject: [Buildroot] [PATCH] linux-firmware: Allow selection of bnx2x fw
 version
In-Reply-To: <1456461093-10202-1-git-send-email-joel@jms.id.au>
References: <1456461093-10202-1-git-send-email-joel@jms.id.au>
Message-ID: <20160226093939.26819401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joel Stanley,

On Fri, 26 Feb 2016 15:01:33 +1030, Joel Stanley wrote:
> Linux kernel 4.2 moved the driver to a newer firmware version.
> 
> Instead of hard coding for 4.2+'s behaviour, introduce a selection
> mechanism where the user specifies which version to use based on
> the kernel they have.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/linux-firmware/Config.in         | 22 ++++++++++++++++++++++
>  package/linux-firmware/linux-firmware.mk | 11 ++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index d8389864adaa..b28064b9e45c 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -243,6 +243,28 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
>  	help
>  	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
>  
> +if BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
> +
> +choice
> +	bool "Broadcom bnx2x revision to use"
> +	help
> +	  Use revision 7.12.30.0 for kernel 4.2 onward.
> +	  Use revision 7.10.51.0 for kernel 3.16 to 4.1.
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_12_30_0
> +	prompt "revision 7.12.30.0"
> +	help
> +	  Use revision 7.12.30.0 for kernel 4.2 onwards.
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_10_51_0
> +	prompt "revision 7.10.51.0"
> +	help
> +	  Use revision 7.10.51.0 for kernel 3.16 to 4.1.
> +
> +endchoice

I think adding new config to chose between different versions of a
given firmware is going a bit too far. If we were to do that for all
firmwares in linux-firmware, it would really increase the number of
Config.in options too much.

Shall I suggest to install both versions of the firmware? The firmware
files are not that large, and if filesystem size is really a strong
issue, it is always possible to clean up the non-required firmware
files in a post-build script.

What do you think?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
