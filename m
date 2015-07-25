From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:44:27 +0200
Subject: [Buildroot] [PATCH v8 1/1] rtl8821au: new package
In-Reply-To: <1437844543-5935-1-git-send-email-christian@paral.in>
References: <1437844543-5935-1-git-send-email-christian@paral.in>
Message-ID: <20150725174427.GS3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-25 10:15 -0700, Christian Stewart spake thusly:
> This patch adds the rtl8821au wifi driver. The driver is sourced from
> ulli-kroll's work on GitHub, which includes various fixes and better LED
> handling. Currently USB3 support is broken in this driver - it will
> only connect to the EHCI controller in a USB3 port.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> new file mode 100644
> index 0000000..509306b
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# rtl8821au
> +#
> +################################################################################
> +
> +RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
> +RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

Ideally, there's no need for this inermediate variable, ...

> +RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
> +RTL8821AU_LICENSE_FILES = COPYING
> +
> +RTL8821AU_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8812AU_8821AU=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	USER_EXTRA_CFLAGS=$(RTL8821AU_CFLAGS_ENDIAN)

... since you could directly do it here:

    USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

But ultimately, this should be check for directly in the code, with:

    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    #define CONFIG_LITTLE_ENDIAN
    #else
    #define CONFIG_BIG_ENDIAN
    #endif

(Sorry, I forgot to say so in my previous review.)

Otherwise;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
