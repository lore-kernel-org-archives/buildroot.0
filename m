From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Mar 2017 06:30:58 +0200
Subject: [Buildroot] [PATCH v2] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170323031609.GA23599@waldemar-brodkorb.de>
References: <20170323031609.GA23599@waldemar-brodkorb.de>
Message-ID: <20170323043058.rx44a5q2bzc6yvtk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Mar 23, 2017 at 04:16:09AM +0100, Waldemar Brodkorb wrote:
> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> index 23e6836..f2f153c 100644
> --- a/package/autofs/autofs.mk
> +++ b/package/autofs/autofs.mk
> @@ -10,6 +10,9 @@ AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
>  AUTOFS_LICENSE = GPLv2+
>  AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
>  AUTOFS_DEPENDENCIES = host-flex host-bison
> +ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)

Why not 'ifeq ($(BR2_PACKAGE_LIBTIRPC),y)' like we usually do?

> +AUTOFS_DEPENDENCIES += libtirpc host-pkgconf
> +endif
>  # For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch and
>  # 0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch.
>  AUTOFS_AUTORECONF = YES
> @@ -32,6 +35,10 @@ AUTOFS_CONF_OPTS = \
>  	--with-path="$(BR_PATH)" \
>  	--with-hesiod=no
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)

Ditto.

Also, the usual convention is to have a single 'ifeq' for optional 
dependencies combining the dependency listing and the configure option.

> +AUTOFS_CONF_OPTS += --with-libtirpc
> +endif
> +
>  AUTOFS_MAKE_ENV = DONTSTRIP=1
>  
>  $(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
