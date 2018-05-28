From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 22:23:51 +0200
Subject: [Buildroot] [PATCH] package/utp_com: Tool used to send commands
 to hardware via NXP's UTP protocol.
In-Reply-To: <1526975064-12266-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1526975064-12266-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <20180528202351.GH2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

Thanks for this contribution! :-)

Here's just a very rough and very quick review because I spotted a few
minor issues...

On 2018-05-22 09:44 +0200, Vincent Prince spake thusly:
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
[--SNIP--]
> diff --git a/package/utp_com/Config.in b/package/utp_com/Config.in
> new file mode 100644
> index 0000000..e45555b
> --- /dev/null
> +++ b/package/utp_com/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_UTP_COM
> +	bool "utp_com"
> +	select BR2_PACKAGE_SG3_UTILS
> +	help
> +		This package is used to send commands to hardware
> +		via Freescale's UTP protocol.
> +
> +		https://github.com/ixonos/utp_com

Indentation of the help text should be 1 TAB and 2 spaces, not 2 TABs.

> diff --git a/package/utp_com/Config.in.host b/package/utp_com/Config.in.host
> new file mode 100644
> index 0000000..3e5319e
> --- /dev/null
> +++ b/package/utp_com/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_UTP_COM
> +	bool "host utp_com"
> +	help
> +		This package is used to send commands to hardware
> +		via Freescale's UTP protocol.
> +
> +		https://github.com/ixonos/utp_com

Indentation of the help text should be 1 TAB and 2 spaces, not 2 TABs.

[--SNIP--]
> diff --git a/package/utp_com/utp_com.mk b/package/utp_com/utp_com.mk
> new file mode 100644
> index 0000000..6fa94f2
> --- /dev/null
> +++ b/package/utp_com/utp_com.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# utp_com
> +#
> +################################################################################
> +
> +UTP_COM_VERSION = 7fe590fef812561cceb08aaa10b64e9bac8f542f
> +UTP_COM_SITE = $(call github,ixonos,utp_com,$(UTP_COM_VERSION))
> +UTP_COM_LICENSE = GPL-2.0+
> +UTP_COM_LICENSE_FILES = LICENSE
> +UTP_COM_DEPENDENCIES = sg3_utils
> +
> +define UTP_COM_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include"
> +endef

Please add separatig lines between the various macros. Also, please
group the target commands together and the host commands together:

    define UTP_COM_BUILD_CMDS
        Blabla
    endef

    define UTP_COM_INSTALL_TARGET_CMDS
        Blabla
    endef

    define HOST_UTP_COM_BUILD_CMDS
        Blabla
    endef

    define HOST_UTP_COM_INSTALL_CMDS
        Blabla
    endef

> +define HOST_UTP_COM_BUILD_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include"

We've dropped use of "/usr" as a sub-dir of $(HOST_DIR) now, so includes
are to be found directly in $(HOST_DIR)/include

> +endef
> +
> +define UTP_COM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 755 $(@D)/utp_com $(TARGET_DIR)/usr/bin/utp_com
> +endef
> +define HOST_UTP_COM_INSTALL_CMDS
> +	$(INSTALL) -m 755 $(@D)/utp_com $(HOST_DIR)/usr/bin/utp_com

Ditto, no "/usr" anymore, so install directly in $(HOST_DIR)/bin/utp_com

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.7.4
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
