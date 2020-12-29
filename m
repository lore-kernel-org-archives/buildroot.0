From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 17:18:51 +0100
Subject: [Buildroot] [PATCH v2 03/12] package/pkg-download.mk: add
 <pkg>_DL_ENV variable
In-Reply-To: <20201219153525.1361175-4-thomas.petazzoni@bootlin.com>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-4-thomas.petazzoni@bootlin.com>
Message-ID: <20201229161851.GQ1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-19 16:35 +0100, Thomas Petazzoni spake thusly:
> This variable can be used by package to pass extra environment
> variables to the download logic. It will be used for the Go/Cargo
> vendoring.
> 
> The <pkg>_DL_ENV variable is intentionally not documented: at this
> point, it is not meant to be used by packages directly, but only by
> package infrastructures.
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Although it's not much off your chest on this series: applied to
master, with a little tweak, see below...

> ---
>  package/pkg-download.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 175b9d7dba..c914d016e2 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -99,7 +99,9 @@ endif
>  
>  define DOWNLOAD
>  	$(Q)mkdir -p $($(2)_DL_DIR)
> -	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
> +	$(Q)$(EXTRA_ENV) \
> +		$($(2)_DL_ENV) \
> +		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \

I find this code to be ugly to look at. But I could not come up with
something that is nice to look at. So I moved the two _ENV variables
expansions to the same line, and it looks less-ugly now...

Thanks.

Regards,
Yann E. MORIN.

>  		-c '$($(2)_DL_VERSION)' \
>  		-d '$($(2)_DL_DIR)' \
>  		-D '$(DL_DIR)' \
> -- 
> 2.29.2
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
