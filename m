From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:24:03 +0200
Subject: [Buildroot] [PATCH 1/2] util-linux: add menu items for login
 utilities
In-Reply-To: <20170824035838.14466-1-casantos@datacom.ind.br>
References: <20170823154252.03f70fea@windsurf>
 <20170824035838.14466-1-casantos@datacom.ind.br>
Message-ID: <20170824232403.1a196068@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 00:58:37 -0300, Carlos Santos wrote:

> +config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
> +	bool "login utilities option removed"

	bool "util-linux login utilities option removed"

> +	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
> +	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam

All those "depends on" can be dropped.

> +	select BR2_LEGACY
> +	select BR2_PACKAGE_UTIL_LINUX_LAST
> +	select BR2_PACKAGE_UTIL_LINUX_LOGIN
> +	select BR2_PACKAGE_UTIL_LINUX_RUNUSER
> +	select BR2_PACKAGE_UTIL_LINUX_SU
> +	select BR2_PACKAGE_UTIL_LINUX_SULOGIN
> +	help
> +	  Login utilities (last, login, runuser, su, sulogin) now have
> +	  their own selecion items in the configuration menu.

selecion -> selection

Perhaps you can say "in the util-linux package configuration options" or
something like this.

> -comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
> -	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
> -		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
> -
>  config BR2_PACKAGE_UTIL_LINUX_LOGGER
>  	bool "logger"
>  	help
>  	  Enter messages into the system log
>  
> +config BR2_PACKAGE_UTIL_LINUX_LOGIN
> +	bool "login"
> +	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam

Should be split on two lines, one per depends on. I know it wasn't like
that before, but let's take this opportunity to fix it.

> +	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
> +	depends on BR2_USE_MMU # fork(), linux-pam
> +	select BR2_PACKAGE_LINUX_PAM
> +	help
> +	  Begin a session on the system

Missing Config.in comment.

Otherwise, looks OK to me. So, by the time you send the next iteration,
if nobody else complains, I'll apply.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
