From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 11:41:15 +0200
Subject: [Buildroot] [PATCH] package/libcgroup: allow to build
 cgroup-tools
In-Reply-To: <1440407584-5538-1-git-send-email-bgolaszewski@baylibre.com>
References: <1440407584-5538-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150824094115.GA3601@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2015-08-24 11:13 +0200, Bartosz Golaszewski spake thusly:
> Add a new config option that allows to build cgroup-tools - a set of
> command-line utils for managing cgroups.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libcgroup/Config.in    | 6 ++++++
>  package/libcgroup/libcgroup.mk | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> index b7a84e0..2d7a808 100644
> --- a/package/libcgroup/Config.in
> +++ b/package/libcgroup/Config.in
> @@ -9,5 +9,11 @@ config BR2_PACKAGE_LIBCGROUP
>  
>  	  http://libcg.sourceforge.net/
>  
> +config BR2_PACKAGE_CGROUP_TOOLS

Options should be prefixed with the package name:

    config BR2_PACKAGE_LIBCGROUP_TOOLS

> +	bool "build cgroup-tools"
> +	depends on BR2_PACKAGE_LIBCGROUP

That's technically correct, but I think we'd prefer an enclosing
if-endif construct, like so:

    if BR2_PACKAGE_LIBCGROUP

    config BR2_PACKAGE_LIBCGROUP_TOOLS
        bool "cgroup tools"
        help
          Include a set of command-line tools for managing cgroups.

    endif

> +	help
> +	  Include a set of command-line tools for managing cgroups.
> +
>  comment "libcgroup needs an (e)glibc toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index ace2744..f3dbf18 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -20,10 +20,15 @@ LIBCGROUP_CONF_ENV = \
>  	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
>  
>  LIBCGROUP_CONF_OPTS = \
> -	--disable-tools \
>  	--disable-daemon \
>  	--disable-initscript-install
>  
> +ifeq ($(BR2_PACKAGE_CGROUP_TOOLS),y)

Of course, fix the variable name above, too.

Regards,
Yann E. MORIN.

> +LIBCGROUP_CONF_OPTS += --enable-tools
> +else
> +LIBCGROUP_CONF_OPTS += --disable-tools
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  LIBCGROUP_DEPENDENCIES += linux-pam
>  LIBCGROUP_CONF_OPTS += --enable-pam
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
