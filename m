From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 22:27:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/lzlib: remove it
In-Reply-To: <20210613154240.2877974-2-francois.perrad@gadz.org>
References: <20210613154240.2877974-1-francois.perrad@gadz.org>
 <20210613154240.2877974-2-francois.perrad@gadz.org>
Message-ID: <20210614202744.GI2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-06-13 17:42 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Removing a package should dully explained in the commit log.

lua-zlib that you taunt as a replcement, adertises that it is not 100%
percent compatible:

    https://github.com/brimworks/lua-zlib/blob/master/README#L172

    NOTE: This library ships with an "lzlib" compatibility shim.
    However, the following things are not compatible:

     * zlib.version() in lzlib returns a string, but this library
       returns a numeric tuple (see above).

     * zlib.{adler,crc}32() in lzlib returns the {adler,crc}32
       initial value, however if this value is used with calls
       to adler32 it works in compatibility mode.

Furthermore, this limited comp[atibility can only be achieved if a
package requests it:

    To use this shim add the -DLZLIB_COMPAT compiler flag.

So, lua-zlib is not a drop-in replacement for lzlib.

As such, we can't remove lzlib (yet).

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                            |  7 +++++++
>  package/Config.in                           |  1 -
>  package/lzlib/Config.in                     | 10 ----------
>  package/lzlib/lzlib.hash                    |  3 ---
>  package/lzlib/lzlib.mk                      | 15 ---------------
>  support/testing/tests/package/test_lzlib.py | 14 --------------
>  6 files changed, 7 insertions(+), 43 deletions(-)
>  delete mode 100644 package/lzlib/Config.in
>  delete mode 100644 package/lzlib/lzlib.hash
>  delete mode 100644 package/lzlib/lzlib.mk
>  delete mode 100644 support/testing/tests/package/test_lzlib.py
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a0c1a6898..adfacecd3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -236,6 +236,13 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
>  	  of the official Kodi github repo and its build is broken
>  	  with Kodi 19.x, so it was removed.
>  
> +config BR2_PACKAGE_LZLIB
> +	bool "lzlib package was removed"
> +	select BR2_PACKAGE_LUA_ZLIB
> +	select BR2_LEGACY
> +	help
> +	  The lzlib package was removed, use lua-zlib instead.
> +
>  comment "Legacy options removed in 2021.02"
>  
>  config BR2_PACKAGE_MPD_AUDIOFILE
> diff --git a/package/Config.in b/package/Config.in
> index 1abfd787f..66978ec45 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -708,7 +708,6 @@ menu "Lua libraries/modules"
>  	source "package/lutok/Config.in"
>  	source "package/luv/Config.in"
>  	source "package/luvi/Config.in"
> -	source "package/lzlib/Config.in"
>  	source "package/orbit/Config.in"
>  	source "package/rings/Config.in"
>  	source "package/turbolua/Config.in"
> diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
> deleted file mode 100644
> index 59a2e6d5c..000000000
> --- a/package/lzlib/Config.in
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -config BR2_PACKAGE_LZLIB
> -	bool "lzlib"
> -	depends on BR2_PACKAGE_LUA
> -	select BR2_PACKAGE_ZLIB
> -	help
> -	  This package provides a library to access zlib library
> -	  functions and also to read/write gzip files using an
> -	  interface similar to the base io package.
> -
> -	  https://github.com/LuaDist/lzlib
> diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
> deleted file mode 100644
> index 4bb4c52c8..000000000
> --- a/package/lzlib/lzlib.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb  lzlib-0.4.3.tar.gz
> -sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib.c
> diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
> deleted file mode 100644
> index 74624d501..000000000
> --- a/package/lzlib/lzlib.mk
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -################################################################################
> -#
> -# lzlib
> -#
> -################################################################################
> -
> -LZLIB_VERSION = 0.4.3
> -LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
> -LZLIB_DEPENDENCIES = lua zlib
> -LZLIB_LICENSE = MIT
> -LZLIB_LICENSE_FILES = lzlib.c
> -LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
> -	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
> -
> -$(eval $(cmake-package))
> diff --git a/support/testing/tests/package/test_lzlib.py b/support/testing/tests/package/test_lzlib.py
> deleted file mode 100644
> index 84e767913..000000000
> --- a/support/testing/tests/package/test_lzlib.py
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -from tests.package.test_lua import TestLuaBase
> -
> -
> -class TestLuaLzlib(TestLuaBase):
> -    config = TestLuaBase.config + \
> -        """
> -        BR2_PACKAGE_LUA=y
> -        BR2_PACKAGE_LZLIB=y
> -        """
> -
> -    def test_run(self):
> -        self.login()
> -        self.module_test("zlib")
> -        self.module_test("gzip")
> -- 
> 2.30.2
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
