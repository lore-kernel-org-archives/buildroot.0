From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Oct 2016 19:00:49 +0200
Subject: [Buildroot] [PATCH v2] package/linux-tools: add iio
In-Reply-To: <20161004160139.4614-1-m.niestroj@grinn-global.com>
References: <20161004160139.4614-1-m.niestroj@grinn-global.com>
Message-ID: <20161005170049.GC3751@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, All,

On 2016-10-04 18:01 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  * Use LINUX_MAKE_FLAGS instead of directly specifying CROSS_COMPILE
>    (suggested by Yann)
> 
>  package/linux-tools/Config.in         |  9 +++++++++
>  package/linux-tools/linux-tool-iio.mk | 27 +++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-iio.mk
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 61c196f..bde70de 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -20,6 +20,15 @@ comment "cpupower needs a toolchain w/ wchar"
>  	depends on !BR2_bfin
>  	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
>  
> +config BR2_PACKAGE_LINUX_TOOLS_IIO
> +	bool "iio"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	help
> +	  iio is a collection of tools to get information about,
> +	  control and monitor iio devices present on system.
> +
> +	  These tools are available only from kernel version 4.7.
> +
>  config BR2_PACKAGE_LINUX_TOOLS_PERF
>  	bool "perf"
>  	select BR2_PACKAGE_LINUX_TOOLS
> diff --git a/package/linux-tools/linux-tool-iio.mk b/package/linux-tools/linux-tool-iio.mk
> new file mode 100644
> index 0000000..60d6249
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-iio.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# iio
> +#
> +################################################################################
> +
> +LINUX_TOOLS += iio
> +
> +IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
> +
> +define IIO_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not have install section in the iio tools." ; \
> +		echo "At least kernel 4.7 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
> +		$(IIO_MAKE_OPTS)
> +endef
> +
> +define IIO_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
> +		$(IIO_MAKE_OPTS) \
> +		INSTALL_ROOT=$(TARGET_DIR) \
> +		install
> +endef
> -- 
> 2.10.0
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
