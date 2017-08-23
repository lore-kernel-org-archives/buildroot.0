From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:42:52 +0200
Subject: [Buildroot] [PATCH] util-linux: add menu items for login
 utilities
In-Reply-To: <20170819235533.18373-1-casantos@datacom.ind.br>
References: <20170819235533.18373-1-casantos@datacom.ind.br>
Message-ID: <20170823154252.03f70fea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Aug 2017 20:55:33 -0300, Carlos Santos wrote:

> +config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
> +	bool "login utilities"
> +	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
> +	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
> +	select BR2_PACKAGE_UTIL_LINUX_LAST
> +	select BR2_PACKAGE_UTIL_LINUX_LOGIN
> +	select BR2_PACKAGE_UTIL_LINUX_RUNUSER
> +	select BR2_PACKAGE_UTIL_LINUX_SU
> +	select BR2_PACKAGE_UTIL_LINUX_SULOGIN

I don't really see the need to keep this option. We have
BR2_PACKAGE_UTIL_LINUX_BINARIES, because it matches the upstream
--enable-all-programs option. But here,
BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS doesn't match anything provided by
upstream, it's just a random category created by Buildroot.

So let's get rid of this option, with appropriate Config.in.legacy
handling selecting all the individual tools, and only have sub-options
per tools, matching the --enable-<foo> options provided by util-linux
configure script.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
