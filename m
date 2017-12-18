From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Dec 2017 18:25:40 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: remove non-SMP build option
In-Reply-To: <1513616657-15667-1-git-send-email-fhunleth@troodon-software.com>
References: <1513616657-15667-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20171218172540.GB2903@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2017-12-18 12:04 -0500, Frank Hunleth spake thusly:
> The non-SMP scheduler is deprecated with the Erlang/OTP 20.0 release and
> slated for removal with the next major Erlang release. It also was hard
> to use in practice due to Erlang libraries calling APIs that were only
> available with the SMP scheduler. This change removes the non-SMP build
> option.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/Config.in | 10 ----------
>  package/erlang/erlang.mk |  4 ----
>  2 files changed, 14 deletions(-)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 1cd93ca..96af551 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -27,16 +27,6 @@ config BR2_PACKAGE_ERLANG
>  
>  if BR2_PACKAGE_ERLANG
>  
> -config BR2_PACKAGE_ERLANG_SMP
> -	bool "enable SMP support"

Removing an option usually involves adding it to the legacy:
    Config.in.legacy

with some help for users to understand why the option was removed and
how to fix their configurations if needed.

In this case, however, I don;t think this is needed: a user that had
BR2_PACKAGE_ERLANG_SMP=y will still get it, because it is always built
unless requested not to.

Yet, this would warant a comment in the commit log.

Regards,
Yann E. MORIN.

> -	help
> -	  Erlang provides both a UP and an SMP emulator. The UP
> -	  emulator is always built, and this option enables
> -	  compilation of the SMP emulator. The choice of which
> -	  emulator to use is made at runtime. If you do not need SMP
> -	  support, turning this option off reduces compile time and
> -	  the size of the Erlang installation.
> -
>  config BR2_PACKAGE_ERLANG_MEGACO
>  	bool "install megaco application"
>  	help
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 733c1d5..5705b98 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -74,10 +74,6 @@ ERLANG_CONF_OPTS += --enable-shared-zlib
>  ERLANG_DEPENDENCIES += zlib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
> -ERLANG_CONF_OPTS += --disable-smp-support
> -endif
> -
>  # Remove source, example, gs and wx files from staging and target.
>  ERLANG_REMOVE_PACKAGES = gs wx
>  
> -- 
> 2.7.4
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
