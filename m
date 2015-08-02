From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 22:12:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/arptables: fix musl compilation
 issues
In-Reply-To: <1438542614-2069-1-git-send-email-brendanheading@gmail.com>
References: <1438542614-2069-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150802201211.GJ3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan, All,

On 2015-08-02 20:10 +0100, Brendan Heading spake thusly:
> Fixes http://autobuild.buildroot.net/results/841/841129b8f49df205e1dabc2c2a5be70fa266768b/
> 
> Backported two patches from upstream which had solved this problem.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  package/arptables/0002-src-Use-stdint-types.patch  | 129 +++++++++++++++++++++
>  .../0003-src-Remove-support-for-libc5.patch        |  64 ++++++++++
>  2 files changed, 193 insertions(+)
>  create mode 100644 package/arptables/0002-src-Use-stdint-types.patch
>  create mode 100644 package/arptables/0003-src-Remove-support-for-libc5.patch
> 
> diff --git a/package/arptables/0002-src-Use-stdint-types.patch b/package/arptables/0002-src-Use-stdint-types.patch
> new file mode 100644
> index 0000000..1c02697
> --- /dev/null
> +++ b/package/arptables/0002-src-Use-stdint-types.patch
> @@ -0,0 +1,129 @@
> +From 24957c135eaacd718f3c788285de33d64316b32e Mon Sep 17 00:00:00 2001
> +From: Felix Janda <felix.janda@posteo.de>
> +Date: Sat, 16 May 2015 10:31:24 +0200
> +Subject: [PATCH 1/2] src: Use stdint types
> +
> +Backport of upstream commit 047f37b1d5d865084a435fd7594b8c5c332ccb8d
> +
> +Upstream-status: backport
> +Signed-off-by: Felix Janda <felix.janda@posteo.de>
> +Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +---
> + arptables.c                 | 8 ++++----
> + include/arptables.h         | 3 ++-
> + include/libarptc/libarptc.h | 7 ++++---
> + libarptc/libarptc.c         | 4 ++--
> + libarptc/libarptc_incl.c    | 2 +-
> + 5 files changed, 13 insertions(+), 11 deletions(-)
> +
[--SNIP--]
> +diff --git a/include/arptables.h b/include/arptables.h
> +index 820b664..e6a6ba6 100644
> +--- a/include/arptables.h
> ++++ b/include/arptables.h
> +@@ -1,6 +1,7 @@
> + #ifndef _ARPTABLES_USER_H
> + #define _ARPTABLES_USER_H
> + 
> ++#include <stdint.h>
> + #include "arptables_common.h"
> + #include "libarptc/libarptc.h"
> + 
> +@@ -126,7 +127,7 @@ extern char *mask_to_dotted(const struct in_addr *mask);
> + 
> + extern void parse_hostnetworkmask(const char *name, struct in_addr **addrpp,
> +                       struct in_addr *maskp, unsigned int *naddrs);
> +-extern u_int16_t parse_protocol(const char *s);
> ++extern uint16_t parse_protocol(const char *s);
> + 
> + extern int do_command(int argc, char *argv[], char **table,
> + 		      arptc_handle_t *handle);

This is not exactly the patch that was applied by upstream:
    http://git.netfilter.org/arptables/commit/?id=047f37b1d5d865084a435fd7594b8c5c332ccb8d

The patch you provide is missing two hunks which are upstream...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
