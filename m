From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Jun 2017 21:29:20 +0200
Subject: [Buildroot] [FYI 1/2] WIP:pcre2: new package
In-Reply-To: <b8596705-462f-3228-1b53-e65eb0bc2565@melcoinc.co.jp>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <b8596705-462f-3228-1b53-e65eb0bc2565@melcoinc.co.jp>
Message-ID: <20170629212920.6ec6cd11@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Naoki,

On Wed, 28 Jun 2017 16:40:36 +0900, Naoki Matsumoto <n-matsumoto@melcoinc.co.jp> wrote:

> Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
> ---
>   package/Config.in        |  1 +
>   package/pcre2/Config.in  | 22 ++++++++++++++++++++++
>   package/pcre2/pcre2.hash |  2 ++
>   package/pcre2/pcre2.mk   | 20 ++++++++++++++++++++
>   4 files changed, 45 insertions(+)
>   create mode 100644 package/pcre2/Config.in
>   create mode 100644 package/pcre2/pcre2.hash
>   create mode 100644 package/pcre2/pcre2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f69f67f..bf75594 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1488,6 +1488,7 @@ menu "Text and terminal handling"
>   	source "package/ncurses/Config.in"
>   	source "package/newt/Config.in"
>   	source "package/pcre/Config.in"
> +	source "package/pcre2/Config.in"
>   	source "package/popt/Config.in"
>   	source "package/readline/Config.in"
>   	source "package/slang/Config.in"
> diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
> new file mode 100644
> index 0000000..b49d306
> --- /dev/null
> +++ b/package/pcre2/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PCRE2
> +	bool "pcre2"
> +	help
> +	  Perl Compatible Regular Expressions. By default, only the
> +	  8-bits libpcre2 is built. To get the 16-bits and/or 32-bits
> +	  variants libpcre2-16/libpcre2-32, use the package sub-options.
> +
> +	  http://www.pcre.org/
> +
> +if BR2_PACKAGE_PCRE2
> +
> +config BR2_PACKAGE_PCRE2_16
> +	bool "16-bit pcre2"
> +	help
> +	  This option builds the 16-bits pcre2 library, i.e 'libpcre2-16'
> +
> +config BR2_PACKAGE_PCRE2_32
> +	bool "32-bit pcre2"
> +	help
> +	  This option builds the 32-bits pcre2 library, i.e 'libpcre2-32'
> +
> +endif
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> new file mode 100644
> index 0000000..1232cf9
> --- /dev/null
> +++ b/package/pcre2/pcre2.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e	pcre2-10.23.tar.bz2
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> new file mode 100644
> index 0000000..5b7a163
> --- /dev/null
> +++ b/package/pcre2/pcre2.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# pcre2
> +#
> +################################################################################
> +
> +PCRE2_VERSION = 10.23
> +PCRE2_SITE = https://ftp.pcre.org/pub/pcre
> +PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
> +PCRE2_LICENSE = BSD-3-Clause
> +PCRE2_LICENSE_FILES = LICENCE
> +PCRE2_INSTALL_STAGING = YES
> +PCRE2_CONFIG_SCRIPTS = pcre2-config
> +
> +PCRE2_CONF_OPTS += --enable-pcre2-8

Nitpick: no '+=' needed at the first CONF_OPTS statement (maybe a matter  of taste)...



> +PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
> +PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre2-32)
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

...and no host version needed (as long as there is no (in-tree) user...

Regards,
Peter
