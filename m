From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 19:34:51 +0200
Subject: [Buildroot] [PATCH next 1/4] toolchain: add common binutils
 version hidden config options
In-Reply-To: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160527173451.GA3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-05-27 13:25 +0100, Vicente Olivert Riera spake thusly:
> This commit adds a number of hidden Config.in options, that will be used
> to handle dependencies on the binutils version. We mimic the model that
> was used for the kernel headers dependency mechanism.
> 
> These hidden options will be selected by the internal and external
> toolchain backend logic respectively, in follow-up commits.

I'm not arguing whether the patches are good or not, but I'd like to
understand why we need those options.

As far as I can see, none of your patches make any package depend on any
of those new options.

Would you care to explain (in the commit log) why these are needed,
please?

Are you planning on making any existing package use them? If not, are
you planning to send new packages that will use them?

Thanks! ;-)

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-common.in | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 1fe28a9..deede7b 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -327,6 +327,45 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
>  	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
>  	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20
> +	bool

Any specific reason, except it is a "round" number and more than 6-year
old, to pick 2.20 as the oldest we know of?

> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_21
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20
> +
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_22
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_21
> +
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_22
> +
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
> +
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
> +
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
> +	bool
> +	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
> +
> +# This order guarantees that the highest version is set, as kconfig
> +# stops affecting a value on the first matching default.
> +config BR2_TOOLCHAIN_BINUTILS_AT_LEAST
> +	string
> +	default "2.26" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
> +	default "2.25" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
> +	default "2.24" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
> +	default "2.23" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
> +	default "2.22" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_22
> +	default "2.21" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_21
> +	default "2.20" if BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  config BR2_TOOLCHAIN_HAS_SYNC_1
>  	bool
>  	default y
> -- 
> 2.7.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
