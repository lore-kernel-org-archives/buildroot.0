From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2020 18:54:07 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/jpeg-turbo: fix build with SIMD
In-Reply-To: <20200211204034.266999-1-fontaine.fabrice@gmail.com>
References: <20200211204034.266999-1-fontaine.fabrice@gmail.com>
Message-ID: <20200305175407.GJ5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-11 21:40 +0100, Fabrice Fontaine spake thusly:
> Add -fPIC as requested by upstream in
> https://github.com/libjpeg-turbo/libjpeg-turbo/pull/366

The comment from upstream does not seem entirely correct, as I can
understand...

> Fixes:
>  - http://autobuild.buildroot.org/results/5b7ce0a8f8d1f485bd7104ac2b40257bb17b284b

I was unable to reproduce this build failure on current master...

It seems that 37f3d09d46a (package/jpeg-turbo: force fPIC for shared
libraries) fixed it in a different manner (I reverted said commit, and
got the faillure back).

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix typo in title: without -> with
> 
>  package/jpeg-turbo/jpeg-turbo.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
> index 2767ce6de4..1d24406e0f 100644
> --- a/package/jpeg-turbo/jpeg-turbo.mk
> +++ b/package/jpeg-turbo/jpeg-turbo.mk
> @@ -13,7 +13,9 @@ JPEG_TURBO_INSTALL_STAGING = YES
>  JPEG_TURBO_PROVIDES = jpeg
>  JPEG_TURBO_DEPENDENCIES = host-pkgconf
>  
> -JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
> +JPEG_TURBO_CONF_OPTS = \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -fPIC" \
> +	-DWITH_JPEG8=ON
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
> -- 
> 2.24.1
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
