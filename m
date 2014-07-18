From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 22:47:29 +0200
Subject: [Buildroot] [PATCH] libuv: new package
In-Reply-To: <1405715058-4629-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405715058-4629-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140718204729.GD3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-07-18 17:24 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a small comment...

[--SNIP--]
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> new file mode 100644
> index 0000000..6074e9c
> --- /dev/null
> +++ b/package/libuv/libuv.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libuv
> +#
> +################################################################################
> +
> +LIBUV_VERSION = v0.11.26
> +LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
> +LIBUV_DEPENDENCIES = host-pkgconf
> +LIBUV_INSTALL_STAGING = YES
> +LIBUV_AUTORECONF = YES
> +LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
> +LIBUV_LICENSE_FILES = LICENSE
> +
> +# Tweaked autogen.sh

This is pretty terse, and slightly recondite. What about:

    # Upstream needs tests to be run sequentially. This is the default
    # in automake 1.11 and before, but not starting in 1.12. To maintain
    # sequentiality in 1.12 and later, the automake option 'serial-tests'
    # must be used, Unfortunately, it is not recognised by 1.11 and
    # before. So upstream only adds it conditionally. We use automake
    # 1.14, so we need it.

Alternatively, I'm OK with adding that in the commit log instead of in a
comment.

Regards,
Yann E. MORIN.

> +define LIBUV_FIXUP_AUTOGEN
> +	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
> +	        >$(@D)/m4/libuv-extra-automake-flags.m4
> +endef
> +LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
> +
> +$(eval $(autotools-package))
> -- 
> 1.8.5.5
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
