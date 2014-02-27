From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 08:16:50 +0100
Subject: [Buildroot] [PATCH 11/24] lua-iconv: new package
In-Reply-To: <1393227301-14874-12-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-12-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EE662.8050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |    1 +
>  package/lua-iconv/Config.in    |    9 +++++++++
>  package/lua-iconv/lua-iconv.mk |   13 +++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/lua-iconv/Config.in
>  create mode 100644 package/lua-iconv/lua-iconv.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 29a0245..5f3ef17 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -374,6 +374,7 @@ source "package/ljsyscall/Config.in"
>  source "package/lpeg/Config.in"
>  source "package/lua-cjson/Config.in"
>  source "package/lua-ev/Config.in"
> +source "package/lua-iconv/Config.in"
>  source "package/lua-msgpack-native/Config.in"
>  source "package/luasql-sqlite3/Config.in"
>  source "package/luabitop/Config.in"
> diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
> new file mode 100644
> index 0000000..2d9248c
> --- /dev/null
> +++ b/package/lua-iconv/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LUA_ICONV
> +	bool "lua-iconv"
> +	select BR2_PACKAGE_LIBICONV
> +	depends on !BR2_ENABLE_LOCALE

 Shouldn't this be
	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

> +	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER

 We don't repeat this for (most) other lua packages, and the condition is
already in package/Config.in, right? Actually, we do it for about half of
the lua modules - not very consistent... So, do we add the dependency
everywhere (like for python) or nowhere (like for perl)?


> +	help
> +	  Lua binding to the POSIX 'iconv' library
> +
> +	  http://ittner.github.io/lua-iconv/
> diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
> new file mode 100644
> index 0000000..edb901e
> --- /dev/null
> +++ b/package/lua-iconv/lua-iconv.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# lua-iconv
> +#
> +################################################################################
> +
> +LUA_ICONV_VERSION_UPSTREAM = 7
> +LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
> +LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
> +LUA_ICONV_LICENSE = MIT
> +LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING

 Doesn't it have a compile-time dependency on iconv at all? I.e.:

LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)



 Regards,
 Arnout

> +
> +$(eval $(luarocks-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
