From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 15:30:07 +0200
Subject: [Buildroot] [PATCH v2 08/13] package/Config.in: fix packages
 ordering
In-Reply-To: <20191005122227.7297-9-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
 <20191005122227.7297-9-jerzy.m.grzegorek@gmail.com>
Message-ID: <38a72d15-feb7-bed8-6920-b67c5df02004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jerzy,

On 05/10/2019 14:22, Jerzy Grzegorek wrote:
> Fixes:
> package/Config.in:594: Packages in: menu "Interpreter languages and scripting",
>                        are not alphabetically ordered;
>                        first incorrect package: luajit ;
>                        this package, placed just before if statement,
>                        should match the one used in
>                        if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index b52b2a96e3..d540ac00bf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -591,7 +591,6 @@ endif
>  	source "package/jimtcl/Config.in"
>  	source "package/lua/Config.in"
>  	source "package/luainterpreter/Config.in"
> -	source "package/luajit/Config.in"

 This change is not good. After this change, the Lua modules will appear *above*
luajit when luajit is selected, instead of below luajit like they should. In
other words, this patch should not be applied.

 Which also implies that the preceding patch (adding the check for conditions to
follow there 'source' statement) should be removed. I anyway don't think it's
that valuable: this is something that is easily caught during review (unlike the
alphabetical ordering in general).

 Regards,
 Arnout


>  if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
>  # lua modules are dynamically loaded, so not available on static builds
>  menu "Lua libraries/modules"
> @@ -671,6 +670,7 @@ menu "Lua libraries/modules"
>  	source "package/xavante/Config.in"
>  endmenu
>  endif
> +	source "package/luajit/Config.in"
>  	source "package/micropython/Config.in"
>  	source "package/micropython-lib/Config.in"
>  	source "package/moarvm/Config.in"
> 
