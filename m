From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 26 Nov 2019 22:35:03 +0100
Subject: [Buildroot] [PATCH] package/glibc: install locale utility when
 nls is enabled
In-Reply-To: <20191126085541.2688-1-p.debruijn@unilogic.nl>
References: <20191126085541.2688-1-p.debruijn@unilogic.nl>
Message-ID: <20191126223503.58c9d9a4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Tue, 26 Nov 2019 09:55:41 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/glibc/Config.in | 2 +-
>  package/glibc/glibc.mk  | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 323767f..b8c2573 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_GLIBC_UTILS
>  	depends on BR2_PACKAGE_BASH
>  	help
>  	  Enabling this option will compile and install the getconf,
> -	  ldconfig and ldd glibc utilities for the target.
> +	  ldconfig, ldd and locale glibc utilities for the target.
>
>  comment "glibc utilities need bash"
>  	depends on !BR2_PACKAGE_BASH
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 5da0b06..e366134 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -146,7 +146,10 @@ endif
>  ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
>  GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
>  GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
> +endif
>
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +GLIBC_TARGET_UTILS_USR_BIN += locale/locale
>  endif

Short question regarding your patch: Why install the locale command
only in case BR2_SYSTEM_ENABLE_NLS is enabled?

Background: The postgresql initialize startup script emits the following
warning:

	performing post-bootstrap initialization ... sh: locale: not found
	1970-01-01 00:10:13.173 UTC [398] WARNING:  no usable system locales were found

Which can be fixed by:

  - install the locale command (fixes 'sh: locale: not found')
  - enabling some locales e.g. by BR2_GENERATE_LOCALE="C en_US" (fixes no usable system locales were found)

No need to enable BR2_SYSTEM_ENABLE_NLS...

Regards,
Peter

>
>  define GLIBC_INSTALL_TARGET_CMDS
