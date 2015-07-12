From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 18:51:20 +0200
Subject: [Buildroot] [lua V4 4/4] lua-iconv: new package
In-Reply-To: <1405780738-31323-5-git-send-email-francois.perrad@gadz.org>
References: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
 <1405780738-31323-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150712185120.42e3fea5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 19 Jul 2014 16:38:58 +0200, Francois Perrad wrote:

> diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
> new file mode 100644
> index 0000000..cad7c7c
> --- /dev/null
> +++ b/package/lua-iconv/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LUA_ICONV
> +	bool "lua-iconv"
> +	select BR2_PACKAGE_LIBICONV
> +	depends on !BR2_ENABLE_LOCALE

As Arnout told you in February 2014, this needs to be:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

Back then, you replied:

""
I don't think,
lua-iconv is binding of iconv, so iconv is not an optional dependency
""

But what you're missing is that when the toolchain has locale support,
the iconv() function is provided by the C library itself. libiconv is
only needed to provide iconv() for toolchains that don't have locale
support.

So basically, if BR2_ENABLE_LOCALE=y, the C library provides iconv()
and lua-iconv doesn't need any dependency on libiconv. However, when
BR2_ENABLE_LOCALE is not set, the C library does *not* provide iconv(),
and lua-iconv needs to depend on libiconv.

> diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
> new file mode 100644
> index 0000000..22f66de
> --- /dev/null
> +++ b/package/lua-iconv/lua-iconv.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lua-iconv
> +#
> +################################################################################
> +
> +LUA_ICONV_VERSION_UPSTREAM = 7
> +LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
> +LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)

Remove redundant space before =. However, isn't this SUBDIR thing
already handled by the luarocks-package infrastructure?

> +LUA_ICONV_DEPENDENCIES = luainterpreter libiconv

The dependency on libiconv should be:

	$(if $(BR2_PACKAGE_LIBICONV),libiconv)

as already suggested by Arnout. And the luainterpreter dependency is
also already handled by the luarocks-package infra.

Could you fix those issues and resend? In the mean time, we'll mark
your patch as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
