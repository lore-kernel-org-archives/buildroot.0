From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:19:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix glibc build
 with old toolchains
In-Reply-To: <20200420200058.1660444-1-fontaine.fabrice@gmail.com>
References: <20200420200058.1660444-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420211945.GN5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-20 22:00 +0200, Fabrice Fontaine spake thusly:
> For an unknown reason, since bump to version 3.0.0, we got build failure
> due to -D_FILE_OFFSET_BITS==64:
> 
> /home/naourr/work/instance-2/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>  # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>    ^
> 
> Update our workaround to also filter CPPFLAGS fix the issue and seems
> right as we're doing it for all the other affected packages
> (restorecond, elfutils ...)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/200fd0accf6a1926251243b05e600fbf591bb3a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/libselinux/libselinux.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index b53146e30b..258065b79d 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -45,12 +45,13 @@ define LIBSELINUX_BUILD_PYTHON_BINDINGS
>  endef
>  endif # python3
>  
> -# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc
> -# 2.22. We set CFLAGS and LDFLAGS here because we want to win over the
> -# CFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
> +# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22. We
> +# set CFLAGS, CPPFLAGS and LDFLAGS here because we want to win over the
> +# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
>  # when the python binding is enabled.
>  LIBSELINUX_MAKE_OPTS += \
>  	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
> +	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \
>  	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
>  
>  define LIBSELINUX_BUILD_CMDS
> -- 
> 2.25.1
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
