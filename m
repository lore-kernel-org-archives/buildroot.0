From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Mar 2018 22:31:00 +0100
Subject: [Buildroot] [PATCH] xfsprogs: fix build with libunistring
In-Reply-To: <06acdda957b792e80ecf80549852bcdf8bf48b19.1521549297.git.baruch@tkos.co.il>
References: <06acdda957b792e80ecf80549852bcdf8bf48b19.1521549297.git.baruch@tkos.co.il>
Message-ID: <a1a3687a-4ef3-0685-d3f1-1da96fe8b5ba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-18 13:34, Baruch Siach wrote:
> The latest xfsprogs bump to version 4.15.1 added an optional dependency
> on libunistring. Make sure we libunistring build before xfsprogs.
> 
> xfsprogs also added -lunistring to its make dependency. This does not
> work very well with cross compile because make does not know about
> sysroot. Add a patch to remove this dependency.
> 
> To make shared only link with libunistring work, we also need to extend
> the -static-libtool-libs patch to cover xfs_scrub as well.
> 
> Fixes:
> http://autobuild.buildroot.net/results/66e/66e425b00a06f928be0951ac4196190fe88b0f62/
> http://autobuild.buildroot.net/results/1cd/1cde87d1daf3c6009220ff47512794cef6a2938f/
> http://autobuild.buildroot.net/results/8ba/8ba4e94cfbb8a5cbb166423a671bdbcdf535f86b/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  ...o-not-do-dynamic-linking-of-libtool-libra.patch | 25 ++++++++++++---
>  ...scrub-fix-cross-compile-with-libunistring.patch | 37 ++++++++++++++++++++++
>  package/xfsprogs/xfsprogs.mk                       |  4 +++
>  3 files changed, 61 insertions(+), 5 deletions(-)
>  create mode 100644 package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
> 
> diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> index 4eb43480c0d5..74636c2ebbd1 100644
> --- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> +++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> @@ -1,7 +1,8 @@
> -From 770902a0a29fb4ac62358f7eacb3a83d0d9af1c7 Mon Sep 17 00:00:00 2001
> +From d5cbb4f43cc9c30100fbf18a3e0d1fb95e1c1b0a Mon Sep 17 00:00:00 2001
>  From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  Date: Wed, 25 Nov 2015 10:50:00 +0000
> -Subject: [PATCH] mdrestore: do not do dynamic linking of libtool libraries
> +Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
> + libraries
>  
>  As explained in commit ece49daeff1a3cad765e106d678c608925c9d768, use
>  -static-libtool-libs instead of -static to allow fallback to the dynamic
> @@ -11,11 +12,12 @@ ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
>  
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]

 Clearly upstream didn't do much with it. Perhaps resend?

 Regards,
 Arnout

> -[baruch: update for v4.15.1]
> +[baruch: update for v4.15.1; extend to include scrub]
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
