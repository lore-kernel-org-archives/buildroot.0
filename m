From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 20:00:36 +0200
Subject: [Buildroot] [PATCH 1/2] libnl: add patch to fix bmon build
 breakage
In-Reply-To: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150417180036.GD5271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gustavo, All,

On 2015-04-17 07:26 -0300, Gustavo Zacarias spake thusly:
> Revert a 3.2.26 patch that breaks the bmon build (among possibly
> others). Fixes:
> http://autobuild.buildroot.net/results/296/296bcaf4fd1fadcab71881d6d00a8763bfa91a41/

I wonder if that should not be bmon that should be patched to include
that header wherever necessary, instead of reverting a commit from
libnl?

Regards,
Yann E. MORIN.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...remove-unnecessary-include-of-private-lin.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch
> 
> diff --git a/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch b/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch
> new file mode 100644
> index 0000000..3520899
> --- /dev/null
> +++ b/package/libnl/0001-Revert-route-remove-unnecessary-include-of-private-lin.patch
> @@ -0,0 +1,44 @@
> +From 61310ce3f2b6c5c21be8c788848f083e4c58d138 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Fri, 17 Apr 2015 07:20:48 -0300
> +Subject: [PATCH] Revert "route: remove unnecessary include of private
> + linux/if.h"
> +
> +It breaks rtnl_link_get_flags() checks against IFF_* defines that aren't
> +defined.
> +
> +This reverts commit 50a76998ac36ace3716d3c979b352fac73cfc80a.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +---
> + include/netlink/route/link.h | 1 +
> + src/nl-link-set.c            | 1 -
> + 2 files changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/netlink/route/link.h b/include/netlink/route/link.h
> +index 8f74f42..a7aa88b 100644
> +--- a/include/netlink/route/link.h
> ++++ b/include/netlink/route/link.h
> +@@ -15,6 +15,7 @@
> + #include <netlink/netlink.h>
> + #include <netlink/cache.h>
> + #include <netlink/addr.h>
> ++#include <linux/if.h>
> + #include <sys/types.h>
> + 
> + #ifdef __cplusplus
> +diff --git a/src/nl-link-set.c b/src/nl-link-set.c
> +index 6a6bac8..bbb60f9 100644
> +--- a/src/nl-link-set.c
> ++++ b/src/nl-link-set.c
> +@@ -9,7 +9,6 @@
> +  * Copyright (c) 2003-2010 Thomas Graf <tgraf@suug.ch>
> +  */
> + 
> +-#include <linux/if.h>
> + #include <netlink/cli/utils.h>
> + #include <netlink/cli/link.h>
> + 
> +-- 
> +2.0.5
> +
> -- 
> 2.0.5
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
