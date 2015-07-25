From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 12:01:50 +0200
Subject: [Buildroot] [PATCH v7 1/1] rtl8821au: new package
In-Reply-To: <1437777122-28383-1-git-send-email-christian@paral.in>
References: <1437777122-28383-1-git-send-email-christian@paral.in>
Message-ID: <20150725100150.GA3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-24 15:32 -0700, Christian Stewart spake thusly:
> This patch adds the rtl8821au wifi driver. The driver is sourced from
> ulli-kroll's work on GitHub, which includes various fixes and better LED
> handling. Currently USB3 support is broken in this driver - it will
> only connect to the EHCI controller in a USB3 port.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> index 0000000..de6fc62
> --- /dev/null
> +++ b/package/rtl8821au/0001-disable-default-debug.patch
> @@ -0,0 +1,24 @@
> +Comment out the hardcoded debug defines. If extra debug is needed, we can add it
> +as a define in the make flags.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>

I see that Ulli has already accepted to change that in his tree. Great
that you guys can work together on this! :-)

> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> new file mode 100644
> index 0000000..d54d3c3
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -0,0 +1 @@
> +sha256 93beaf608880ecbca03bbeb8251b91d16e17724b36158b0571d1cebb7b4e5914  rtl8821au-f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d.tar.gz

No hash when using a git sha1, see:
    http://buildroot.net/downloads/manual/manual.html#adding-packages-hash

    Note. If libfoo is from GitHub (see Section 17.17.2, "How to add a
    package from GitHub" for details), we can only accept a .hash file
    if the package is a released (e.g. uploaded by the maintainer)
    tarball. Otherwise, the automatically generated tarball may change
    over time, and thus its hashes may be different each time it is
    downloaded, causing a .hash mismatch for that tarball.

> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> new file mode 100644
> index 0000000..42f4cdd
> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# rtl8821au
> +#
> +################################################################################
> +
> +RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
> +RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
> +
> +RTL8821AU_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8812AU_8821AU=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	USER_EXTRA_CFLAGS=$(RTL8821AU_CFLAGS_ENDIAN)
> +
> +define RTL8821AU_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware/rtlwifi/

You must create the target directory first, otherwise you'd get an error
like:

    install: target '....lib/firmware/rtlwifi/' is not a directory: No
    such file or directory

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))
> -- 
> 2.1.4
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
