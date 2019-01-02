From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2019 16:48:17 +0100
Subject: [Buildroot] [PATCH] package/pkgconf: fix behavior of pkg-config
 --version
In-Reply-To: <20181227141523.18796-1-thomas.petazzoni@bootlin.com>
References: <20181227141523.18796-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190102154817.GJ23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-27 15:15 +0100, Thomas Petazzoni spake thusly:
> For some odd reason, the new pkg-config 1.5.3 changed the behavior of
> "pkg-config --version": as soon as another argument than "--version"
> is passed, the code assumes the user wanted to run "--modversion"
> instead.
> 
> Sadly, this breaks badly with our pkg-config wrapper that
> unconditionally passes --static to pkg-config when
> BR2_STATIC_LIBS=y. When ffmpeg calls "pkg-config --version" to test if
> pkg-config is available and functional, it's actually "pkg-config
> --static --version" that gets executed. pkg-config assumes that the
> user wanted to use --modversion and bails out with an error.
> 
> This causes a build failure of ffmpeg in BR2_STATIC_LIBS=y
> configuration.
> 
> This misbehavior of pkg-config has been reported upstream at
> https://git.dereferenced.org/pkgconf/pkgconf/issues/19, but until it
> gets fixed, we work around the issue by patching pkg-config so that it
> ignores --static in the count of arguments when doing its
> --version/--modversion dance.

Why don't we simply revert the upstream commit that changed the
behaviour?

Regards,
Yann E. MORIN.

> Fixes:
> 
>   http://autobuild.buildroot.net/results/ed82a95e1866ea2caadbb3433b2a255b2cf621d2/
>   (and plenty of other ffmpeg + BR2_STATIC_LIBS=y build failures)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-count-static-as-an-argument-when-ha.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/pkgconf/0002-cli-main.c-don-t-count-static-as-an-argument-when-ha.patch
> 
> diff --git a/package/pkgconf/0002-cli-main.c-don-t-count-static-as-an-argument-when-ha.patch b/package/pkgconf/0002-cli-main.c-don-t-count-static-as-an-argument-when-ha.patch
> new file mode 100644
> index 0000000000..817c23c985
> --- /dev/null
> +++ b/package/pkgconf/0002-cli-main.c-don-t-count-static-as-an-argument-when-ha.patch
> @@ -0,0 +1,49 @@
> +From f7a58c164ab1d2dc296ce47ab238ed1ea39cb559 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Thu, 27 Dec 2018 14:50:38 +0100
> +Subject: [PATCH] cli/main.c: don't count --static as an argument when handling
> + --version
> +
> +In commit 12a0eb124cea85586e57f33c91a1e4c73459eef6 ("main: assume
> +--modversion insted of --version if other flags or module names are
> +provided"), the handling of the --version option was changed so that
> +if any other option than --version is passed, pkg-config assumes the
> +user wanted to use --modversion.
> +
> +This breaks the use case where "pkg-config --static --version" is
> +passed, a situation where we really want the normal --version
> +behavior.
> +
> +This issue has been reported upstream at
> +https://git.dereferenced.org/pkgconf/pkgconf/issues/19, but until a
> +resolution is found, let's not count the --static option in the count
> +of options that trigger this "the user wanted --modversion" behavior.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + cli/main.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/cli/main.c b/cli/main.c
> +index b52cc85..8f6c4c9 100644
> +--- a/cli/main.c
> ++++ b/cli/main.c
> +@@ -955,7 +955,14 @@ main(int argc, char *argv[])
> + 
> + 	if ((want_flags & PKG_VERSION) == PKG_VERSION)
> + 	{
> +-		if (argc > 2)
> ++		int nargs = argc;
> ++
> ++		/* Don't count --static as an argument for the
> ++		 * following test */
> ++		if ((want_flags & PKG_STATIC) == PKG_STATIC)
> ++			nargs--;
> ++
> ++		if (nargs > 2)
> + 		{
> + 			fprintf(stderr, "%s: --version specified with other options or module names, assuming --modversion.\n", argv[0]);
> + 
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
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
