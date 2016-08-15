From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 13:09:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] wayland: fix musl build issue
In-Reply-To: <1471241742-28182-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471241742-28182-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471241742-28182-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160815110908.GB5822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-08-15 11:45 +0530, Rahul Bedarkar spake thusly:
> With musl C library, we see following build failure.
> 
>   src/scanner.c: In function 'find_enumeration':
>   src/scanner.c:811:2: error: unknown type name 'uint'
>     uint idx = 0, j;
>     ^
> 
> uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
> but in musl stdlib.h doesn't include it.
> 
> This patch adds upstream patch where uint32_t is used instead of uint.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fcf/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/
> 
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Backport upstream patch instead of adding new patch (suggested by Khem Raj)
> ---
>  ...0002-scanner-Use-uint32_t-instead-of-uint.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
> 
> diff --git a/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch b/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
> new file mode 100644
> index 0000000..1d05f25
> --- /dev/null
> +++ b/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
> @@ -0,0 +1,31 @@
> +From 6750b47d9e0d3074d2e56aa36c476493f533d696 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 15 Jul 2016 16:23:48 -0700
> +Subject: [PATCH 1/1] scanner: Use uint32_t instead of uint
> +
> +uint32_t is C99 defined stdint type
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Reviewed-by: Daniel Stone <daniels@collabora.com>
> +[Rahul Bedarkar: Backported from: 6750b47d9e0d3074d2e56aa36c476493f533d696]
> +Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> +---
> + src/scanner.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/scanner.c b/src/scanner.c
> +index 6e2c3a3..ebae4cc 100644
> +--- a/src/scanner.c
> ++++ b/src/scanner.c
> +@@ -819,7 +819,7 @@ find_enumeration(struct protocol *protocol,
> + 	struct interface *i;
> + 	struct enumeration *e;
> + 	char *enum_name;
> +-	uint idx = 0, j;
> ++	uint32_t idx = 0, j;
> + 
> + 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
> + 		if (enum_attribute[j] == '.') {
> +-- 
> +2.6.2
> +
> -- 
> 2.6.2
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
