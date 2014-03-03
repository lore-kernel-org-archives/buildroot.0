From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 23:20:26 +0100
Subject: [Buildroot] [PATCH 7/7] system: allow setting the local
	timezone for uClibc
In-Reply-To: <8d077cf232f771f415eb591b285ced22711fba9d.1393884458.git.yann.morin.1998@free.fr>
References: <cover.1393884458.git.yann.morin.1998@free.fr>
 <8d077cf232f771f415eb591b285ced22711fba9d.1393884458.git.yann.morin.1998@free.fr>
Message-ID: <20140303222026.GA14940@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre, All,

Reviewing our own patch here:

On 2014-03-03 23:10 +0100, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  system/Config.in | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 008369f..cea9429 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -267,8 +267,10 @@ endif
>  
>  config BR2_TARGET_TZ_INFO
>  	bool "Install timezone info"
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	select BR2_PACKAGE_TZDATA
> +	# No timezone for musl; only for uClibc or (e)glibc.
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
>  	help
>  	  Say 'y' here to install timezone info.
>  
> @@ -276,11 +278,13 @@ if BR2_TARGET_TZ_INFO
>  
>  config BR2_TARGET_TZ_ZONELIST
>  	string "timezone list"
> +	# Only valid for uClibc or (e)glibc
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC

Unneeded, it already 'depends on' BR2_TARGET_TZ_INFO (in an if-block),
so we do not need to repeat this here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
