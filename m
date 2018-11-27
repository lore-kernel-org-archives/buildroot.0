From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 27 Nov 2018 00:29:31 -0200
Subject: [Buildroot] [PATCH/next 3/3] prosody: fix runtime dependencies
References: <20181124090754.14775-4-francois.perrad@gadz.org>
Message-ID: <5bfcac0be3b3_36673f99561622ac57251@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was reviewing/testing your test cases and I noticed in the cover letter [1]:
"note2: the patch 3/3 is a fix, and must be applied also in master"

+ Dushara (from 'utils/get-developers -f package/prosody/Config.in')
+ maintainers, to better decide whether it goes to master or it waits the
  release and later gets backported

I kept the full patch below.

[1] http://patchwork.ozlabs.org/cover/1002643/

On Sat, Nov 24, 2018 at 07:07 AM, Francois Perrad wrote:

> prosody is not available for Lua 5.3, but only 5.1 & 5.2.
> 
> prosody needs the module BitOp which is included in LuaJIT
> 
> note: the actual config is working only LuaJIT
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/prosody/Config.in b/package/prosody/Config.in
> index 133b0b134..c32ca20e2 100644
> --- a/package/prosody/Config.in
> +++ b/package/prosody/Config.in
> @@ -2,7 +2,9 @@ config BR2_PACKAGE_PROSODY
>  	bool "prosody"
>  	depends on BR2_USE_MMU # fork
>  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on !BR2_PACKAGE_LUA_5_3
>  	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
> +	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
>  	select BR2_PACKAGE_LUAEXPAT # runtime
>  	select BR2_PACKAGE_LUASEC # runtime
>  	select BR2_PACKAGE_LUASOCKET # runtime
> @@ -19,3 +21,6 @@ config BR2_PACKAGE_PROSODY
>  comment "prosody needs the lua interpreter, dynamic library"
>  	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU
> +
> +comment "prosody needs a Lua 5.1/5.2 interpreter"
> +	depends on BR2_PACKAGE_LUA_5_3
> -- 


Regards,
Ricardo
