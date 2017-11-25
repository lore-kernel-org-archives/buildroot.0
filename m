From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Nov 2017 23:34:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] freerdp: fix wayland client
 dependency chain failure
In-Reply-To: <20171125193305.9655-1-Adamduskett@outlook.com>
References: <20171125193305.9655-1-Adamduskett@outlook.com>
Message-ID: <20171125223413.GA30353@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2017-11-25 14:33 -0500, Adam Duskett spake thusly:
> If the wayland client is selected, freerdp depends on libxkbcommon without
> depending on it in the mk file.

The explanations above are wrong. When the wayland client is enabled,
then libxkbcommon is correctly enabled.

What fails is when the wayland client is disabled, but the wayland
package is enabled. In that case, nothing selects libxkbcommon.

So, a good commit log would be:

    package/freerdp: fix dependency on walyand

    Currently, wayland support is enabled when the wayland package is
    enabled, not when the FreeRDP wayland client is enabled.

    But the dependency on libxkbcomon is only enforced from Config.in
    when the FreeRDP wayland client is enabled., but is added to build
    dependencies when the wayland package is enabled.

    As such, we can end up in a situation where the FreeRDP wayland
    client is disabled, the wayland package is enabled, and the
    libxkbcommon package is also disabled, which casues the build to
    fail with:

        Makefile:539: *** libxkbcommon is in the dependency chain of
        freerdp that has added it to its _DEPENDENCIES variable without
        selecting it or depending on it from Config.in.  Stop.

    Change the build dependency to actually be on the FreeRDP client
    being enabled.

    Fixes;
        http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd

Otherwise:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Changed dependency logic (Yann)
> 
>  package/freerdp/freerdp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 29c35164c3..7415b8a299 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -198,7 +198,7 @@ else
>  FREERDP_CONF_OPTS += -DWITH_XV=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
>  FREERDP_DEPENDENCIES += wayland libxkbcommon
>  FREERDP_CONF_OPTS += \
>  	-DWITH_WAYLAND=ON \
> -- 
> 2.14.3
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
