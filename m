From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2015 23:22:40 +0100
Subject: [Buildroot] [PATCH v4 1/3] dtc: add host build
In-Reply-To: <1421793790-32237-1-git-send-email-ps.report@gmx.net>
References: <1421793790-32237-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150320222240.GD3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-20 23:43 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>   - fix host build/install commands (use PREFIX=$(HOST_DIR)/usr)
>     (suggested by Yann E. MORIN)
> 
> Changes v2 -> v3:
>   - remove extra HOST_DTC_DEPENDENCIES (suggested by Thomas Petazzoni)
>   - no need for extra CFLAGS setting (suggested by Thomas Petazzoni)
> 
> Changes v1 -> v2:
>   - fix host build command (use native compiler instead of
>     cross compiler)
> ---
>  package/Config.in.host     |  1 +
>  package/dtc/Config.in.host |  9 +++++++++
>  package/dtc/dtc.mk         | 10 ++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/dtc/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 94981ad..6a63e57 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -5,6 +5,7 @@ menu "Host utilities"
>  	source "package/dfu-util/Config.in.host"
>  	source "package/dos2unix/Config.in.host"
>  	source "package/dosfstools/Config.in.host"
> +	source "package/dtc/Config.in.host"
>  	source "package/e2fsprogs/Config.in.host"
>  	source "package/e2tools/Config.in.host"
>  	source "package/genext2fs/Config.in.host"
> diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
> new file mode 100644
> index 0000000..cbabf0a
> --- /dev/null
> +++ b/package/dtc/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_DTC
> +	bool "host dtc"
> +	help
> +	  The Device Tree Compiler, dtc, takes as input a device-tree in
> +	  a given format and outputs a device-tree in another format.
> +
> +	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
> +
> +	  https://git.kernel.org/cgit/utils/dtc/dtc.git
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index e094f7b..f3b6f3b 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -44,4 +44,14 @@ define DTC_INSTALL_TARGET_CMDS
>  	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
>  endef
>  
> +# host build
> +define HOST_DTC_BUILD_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
> +endef
> +
> +define HOST_DTC_INSTALL_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.1.2
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
