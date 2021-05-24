From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:56:12 +0200
Subject: [Buildroot] [PATCH 3/4] package/python-pillow: add webpmux
 support
In-Reply-To: <20210522174159.278657-3-fontaine.fabrice@gmail.com>
References: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
 <20210522174159.278657-3-fontaine.fabrice@gmail.com>
Message-ID: <20210524085612.GJ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 19:41 +0200, Fabrice Fontaine spake thusly:
> webpmux is an optional dependency since version 2.2.0 and
> https://github.com/python-pillow/Pillow/commit/b4735f7829bb88c99071cd91b208aa6ffd2cba24
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This is not fixing a hidden dependency, however;
  - I have not checked what the default is, so maybe it does fix a
    hidden dependency after all,
  - it got pulled as pat of the rest of the series,
  - and I had to do some changes, see below...

> ---
>  package/python-pillow/python-pillow.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index ab52f38df1..61f386df07 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -63,6 +63,12 @@ else
>  PYTHON_PILLOW_BUILD_OPTS += --disable-webp
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
> +PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
> +else
> +PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
> +endif

I was confused to not see a dependency on webp itself, but it is already
there. It;s just that this new conditional was not in the existing
webp-conditional block.

So, I moved the new check inside the existing webp-conditional block,
added an explicit disable for webpmux in the else clause, and applied
to master, thanks.

Regards,
Yann E. MORIN.

>  define PYTHON_PILLOW_BUILD_CMDS
>  	cd $(PYTHON_PILLOW_BUILDDIR); \
>  		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
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
