From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 22:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: add host-gawk dependency
In-Reply-To: <20200508162803.2151838-1-fontaine.fabrice@gmail.com>
References: <20200508162803.2151838-1-fontaine.fabrice@gmail.com>
Message-ID: <20200508202653.GQ12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-08 18:28 +0200, Fabrice Fontaine spake thusly:
> host-gawk is used by brltty to build brlapi_constants.h, the build will
> fail if mawk is used instead of gawk
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It seemed like a simple patch, but I can't reproduce the error with mawk
on my machine:

    $ update-alternatives --get-selections |grep awk
    awk                            manual   /usr/bin/mawk
    $ awk --version
    awk: not an option: --version
    $ wget -O .config http://autobuild.buildroot.org/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743/config
    $ make olddefconfig
    $ make brltty

Success...

So, there is something else lurking in the darkness... :-/

Regards,
Yann E. MORIN.

> ---
>  package/brltty/brltty.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
> index e34b9b2b76..4f40e65fc6 100644
> --- a/package/brltty/brltty.mk
> +++ b/package/brltty/brltty.mk
> @@ -12,7 +12,11 @@ BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
>  BRLTTY_LICENSE = LGPL-2.1+
>  BRLTTY_LICENSE_FILES = LICENSE-LGPL README
>  
> -BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
> +BRLTTY_DEPENDENCIES = \
> +	$(TARGET_NLS_DEPENDENCIES) \
> +	host-autoconf \
> +	host-gawk \
> +	host-pkgconf \
>  	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
>  
>  BRLTTY_CONF_ENV = \
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
