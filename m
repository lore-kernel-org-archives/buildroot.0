From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 18:36:54 +0100
Subject: [Buildroot] [PATCH 3/3] lua-modules: choice between Lua 5.1.x &
 Lua 5.2.x
In-Reply-To: <1389705298-27263-4-git-send-email-francois.perrad@gadz.org>
References: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
 <1389705298-27263-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <52D575B6.3050401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/01/14 14:14, Francois Perrad wrote:
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
> ---
>   package/lbase64/Config.in                        |    4 ++++
>   package/lua-ev/lua-ev.mk                         |    2 +-
>   package/lua-msgpack-native/Config.in             |    4 ++++
>   package/lua-msgpack-native/lua-msgpack-native.mk |    3 ++-
>   package/luaexpat/Config.in                       |    4 ++++
>   package/luaexpatutils/Config.in                  |    4 ++++
>   package/luaexpatutils/luaexpatutils.mk           |    2 +-
>   package/luaposix/Config.in                       |    2 +-
>   package/luaposix/luaposix.mk                     |    2 +-
>   package/luarocks/luarocks.mk                     |    4 ++--
>   package/luasec/Config.in                         |    4 ++++

  I wonder if this patch shouldn't be squashed with the first one - I 
guess without this patch, all these packages are broken when 5.2 is selected.

>   11 files changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
> index ca9dd5d..9cc2e2b 100644
> --- a/package/lbase64/Config.in
> +++ b/package/lbase64/Config.in
> @@ -1,7 +1,11 @@
>   config BR2_PACKAGE_LBASE64
>   	bool "lbase64"
>   	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
> +	depends on !BR2_PACKAGE_LUA_5_2

  I think this should be "depends on BR2_PACKAGE_LUA_5_1", because this 
package most likely still won't work when a Lua 5.3 is added in the 
future. But of course, to make that possible you need a 
BR2_PACKAGE_LUAINTERPRETER_ABI_5_1 symbol.

>   	help
>   	  A base64 library for Lua
>
>   	http://luaforge.net/projects/lbase64/
> +
> +comment "lbase64 only with Lua 5.1"
> +	depends on BR2_PACKAGE_LUA_5_2

  To make it consistent with the toolchain comments, I'd write:

comment "lbase64 needs a Lua 5.1 interpreter"


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
