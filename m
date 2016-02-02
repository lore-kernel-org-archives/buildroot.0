From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 14:10:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/wipe: fix musl build
In-Reply-To: <1454273054-8087-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454273054-8087-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0AAB5.6000900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 21:44, Bernd Kuhls wrote:
> The build error was not yet found by the autobuilders:
> 
> In file included from main.c:46:0:
> rand.h:31:9: error: unknown type name ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^
> <builtin>: recipe for target 'main.o' failed
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wipe/0001-musl.patch | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/wipe/0001-musl.patch
> 
> diff --git a/package/wipe/0001-musl.patch b/package/wipe/0001-musl.patch
> new file mode 100644
> index 0000000..35b3af8
> --- /dev/null
> +++ b/package/wipe/0001-musl.patch
> @@ -0,0 +1,28 @@
> +Fix musl build
> +
> +In file included from main.c:46:0:
> +rand.h:31:9: error: unknown type name ?u_int32_t?
> + typedef u_int32_t u_rand_t;
> +         ^
> +<builtin>: recipe for target 'main.o' failed
> +
> +Patch sent upstream: https://sourceforge.net/p/wipe/patches/4/
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr wipe-2.3.1.org/rand.h wipe-2.3.1/rand.h
> +--- wipe-2.3.1.org/rand.h	2003-12-03 04:01:02.000000000 +0100
> ++++ wipe-2.3.1/rand.h	2016-01-31 21:39:54.000000000 +0100
> +@@ -22,10 +22,9 @@
> + 
> + #ifdef HAVE_STDINT_H
> + # include "stdint.h"
> +-#else
> +-# ifndef LINUX
> ++#endif
> ++#if !defined(u_int32_t)
> + #  define u_int32_t uint32_t
> +-# endif
> + #endif

 Wouldn't it be better to use uint32_t everywhere?

 However, since the project hasn't had any activity since 2009, I don't think we
can expect much from upstream, so this quick-and-dirty patch should be OK.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> + 
> + typedef u_int32_t u_rand_t;
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
