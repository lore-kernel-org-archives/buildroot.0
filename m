From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jan 2018 18:31:04 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
In-Reply-To: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
References: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20180111173104.GB3559@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-01-10 23:14 +0100, Thomas Petazzoni spake thusly:
> When systemd is used as the init system, the
> BR2_TARGET_GENERIC_GETTY_TERM and BR2_TARGET_GENERIC_GETTY_OPTIONS are
> completely ignored, which might confuse the user, as reported in bug
> 
> For now, let's simply make those options visible only with busybox
> init and sysv init, as suggested by Yann E. Morin in the discussion of
> bug #10301.
> 
> Fixes #10301.
> 
> Reported-by: Michael Heinemann <posted@heine.so>
> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  system/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index b9714923c4..0fe0fb60b4 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -355,12 +355,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
>  config BR2_TARGET_GENERIC_GETTY_TERM
>  	string "TERM environment variable"
>  	default "vt100"
> +	# currently not observed by systemd
> +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV

Why not:
    depends on !BR2_INIT_SYSTEMD

because this is really want we want to express: this is not compatible
with systemd...

>  	help
>  	  Specify a TERM type.
>  
>  config BR2_TARGET_GENERIC_GETTY_OPTIONS
>  	string "other options to pass to getty"
>  	default ""
> +	# currently not observed by systemd
> +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV

Ditto...

Regards,
Yann E. MORIN.

>  	help
>  	  Any other flags you want to pass to getty,
>  	  Refer to getty --help for details.
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
