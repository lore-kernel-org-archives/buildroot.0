From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 18:34:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libass: Fix fontconfig detection
In-Reply-To: <1450025851-2594-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450025851-2594-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213173443.GF3679@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, all,

On 2015-12-13 17:57 +0100, Bernd Kuhls spake thusly:
> This patch is a combination of the approaches by Vicente and Yann
> discussed in http://patchwork.ozlabs.org/patch/553448/ to fix the
> configure bug due to fontconfig being disabled.

Thanks for your patch! :-)

however, see my comments, below...

> Fixes
> http://autobuild.buildroot.net/results/923/923e8688ab6a294b51fa146cd2ed23db20fe7341/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libass/libass.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> index 83939e2..72770e2 100644
> --- a/package/libass/libass.mk
> +++ b/package/libass/libass.mk
> @@ -24,6 +24,15 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
>  LIBASS_DEPENDENCIES += host-yasm
>  endif
>  
> +# libass uses the concept of a "system font provider", in the linux case
> +# this is currently only fontconfig. If fontconfig is disabled we need
> +# the following configure option to avoid a configure error. This option
> +# can be appended in the future when other linux packages are taking care
> +# of the role as "system font provider".
> +ifneq ($(BR2_PACKAGE_FONTCONFIG),y)
> +LIBASS_CONF_OPTS = --disable-require-system-font-provider
> +endif

Again, I'm not too happy with this. We already have a fontconfig
conditional block, below. So this code should go strainght in the else
clause.

Then, when/if (and *only* then) libass gains support for another system
font provider, we can think of changing it.

At worse, I'd prefer Vicente's solution.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
>  LIBASS_DEPENDENCIES += fontconfig
>  LIBASS_CONF_OPTS += --enable-fontconfig
> -- 
> 2.6.2
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
