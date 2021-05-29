From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 10:29:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: alsa needs ucm
In-Reply-To: <20210528201528.2287085-1-fontaine.fabrice@gmail.com>
References: <20210528201528.2287085-1-fontaine.fabrice@gmail.com>
Message-ID: <20210529082959.GL2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-28 22:15 +0200, Fabrice Fontaine spake thusly:
> alsa unconditionally uses ucm since version 0.3.7 and
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/1612f5e4d215bd5edf7d649d220b53ff1ed7c098
> which will result in the following build failure since commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> 
> ../spa/plugins/alsa/acp/alsa-ucm.h:26:10: fatal error: alsa/use-case.h: No such file or directory
>    26 | #include <alsa/use-case.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ef53534daf84397b4e22392f2a6be2c335819ab5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index e5185aeb8c..847798e6f8 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -52,7 +52,7 @@ endif
>  ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
>  PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
>  PIPEWIRE_DEPENDENCIES += alsa-lib
> -ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +ifeq ($(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yy)
>  PIPEWIRE_CONF_OPTS += -Dalsa=enabled
>  else
>  PIPEWIRE_CONF_OPTS += -Dalsa=disabled
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
