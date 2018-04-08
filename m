From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Apr 2018 15:57:03 +0200
Subject: [Buildroot] [PATCH] package/liblo: fix build with musl
In-Reply-To: <20180408093706.1082-1-yann.morin.1998@free.fr>
References: <20180408093706.1082-1-yann.morin.1998@free.fr>
Message-ID: <20180408135703.GA21158@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-04-08 11:37 +0200, Yann E. MORIN spake thusly:
> Commit 2759ba03979 (liblo: disable werror to fix build issues) tried to
> fix the issue by passing --disable-werror, but this is not a recognised
> option.
> 
> Instead, just fix the code for good.
[--SNIP--]
> diff --git a/package/liblo/0001-server-use-correct-poll.h-header.patch b/package/liblo/0001-server-use-correct-poll.h-header.patch
> new file mode 100644
> index 0000000000..04c0445534
> --- /dev/null
> +++ b/package/liblo/0001-server-use-correct-poll.h-header.patch
> @@ -0,0 +1,32 @@
> +From d59f2e6f42a9e4f8a9184d7ed75546f47dc50123 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 8 Apr 2018 11:09:02 +0200
> +Subject: [PATCH] server: use correct poll.h header
> +
> +Fixes build with the musl C library:
> +    http://autobuild.buildroot.net/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> +Upstream status:
> +  PR sent: https://github.com/radarsat1/liblo/pull/66

PR has just been accepted now:
    https://github.com/radarsat1/liblo/commit/e3c6f0eaae41fb19e893466a6459668c958c4f89

Regards,
Yann E. MORIN.

> +---
> + src/server.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/server.c b/src/server.c
> +index 01fa08f..11c62d2 100644
> +--- a/src/server.c
> ++++ b/src/server.c
> +@@ -51,7 +51,7 @@
> + #include <netdb.h>
> + #include <sys/socket.h>
> + #ifdef HAVE_POLL
> +-#include <sys/poll.h>
> ++#include <poll.h>
> + #endif
> + #include <sys/un.h>
> + #include <arpa/inet.h>
> +-- 
> +2.14.1
> +
> diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
> index 7845c68ff2..e28e52803a 100644
> --- a/package/liblo/liblo.mk
> +++ b/package/liblo/liblo.mk
> @@ -12,10 +12,7 @@ LIBLO_LICENSE_FILES = COPYING
>  LIBLO_INSTALL_STAGING = YES
>  
>  # IPv6 support broken, issue known upstream
> -# werror - not needed for release.
> -LIBLO_CONF_OPTS += \
> -	--disable-ipv6 \
> -	--disable-werror
> +LIBLO_CONF_OPTS = --disable-ipv6
>  
>  # Liblo uses atomic builtins, so we need to link with libatomic for
>  # the architectures who explicitly need libatomic.
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
