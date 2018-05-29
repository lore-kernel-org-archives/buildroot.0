From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 May 2018 05:53:02 +0300
Subject: [Buildroot] [PATCH] package/dash: fix parallel build issue
In-Reply-To: <20180528212019.31614-1-yann.morin.1998@free.fr>
References: <20180528212019.31614-1-yann.morin.1998@free.fr>
Message-ID: <20180529025302.ciikalsiya7yvowf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, May 28, 2018 at 11:20:19PM +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/793/7934c815a3009af688c2f1183e67dfe542c9a009/
>     http://autobuild.buildroot.org/results/fc4/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb/
>     http://autobuild.buildroot.org/results/6bf/6bfdd44ea5d55a6ca3ef92254eab18c7c0416b7b/
>     [...]
> 
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dash/0003-BUILD-fix-parallel-build.patch | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/dash/0003-BUILD-fix-parallel-build.patch
> 
> diff --git a/package/dash/0003-BUILD-fix-parallel-build.patch b/package/dash/0003-BUILD-fix-parallel-build.patch
> new file mode 100644
> index 0000000000..4f86c639a4
> --- /dev/null
> +++ b/package/dash/0003-BUILD-fix-parallel-build.patch
> @@ -0,0 +1,60 @@
> +From 26d549e46161fd2280066dd538b957920a9cb765 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Mon, 28 May 2018 22:56:37 +0200
> +Subject: [PATCH] [BUILD] fix parallel build
> +
> +When neither token.h nor token_var.h exist, and we are building in
> +parallel, it is possible that make will spawn two mktokens at roughly
> +the same time, because of two different rules, one that needs token.h ad
> +another that need token_vars.h.
> +
> +For example, make can have a dependency chain toward just token.h, from
> +syntax.c, and another dependency chain toweard token_vars.h from the
> +generic BUILT_SOURCES.
> +
> +So, make will "quickly" decide that it needs token.h, then spawn
> +mktoken. A bit later, while that mktoken still runs but hasn't yet
> +created token_vars.h, make will need it, and thus spawn a second
> +mktoken.
> +
> +While the second one runs, the first terminates. However, the token.h it
> +had generated has been in the meantime overwritten by the second mktoken
> +that is still generating it, and token.h is still empty.
> +
> +But make proceeds to the rule that required token.h in the first place,
> +and the still-empty token.h gets icluded from a C file, and the build
> +fails because of missing defines.
> +
> +For example:
> +    http://autobuild.buildroot.org/results/fc4/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb/build-end.log
> +
> +Fix that by serialising both headers.
> +
> +Reported-by: Baruch Siach <baruch@tkos.co.il>
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Cc: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: sent, should show soon up on:
> +    https://www.mail-archive.com/dash at vger.kernel.org/

I could not find it there at the moment, but it's on spinics now:

  https://www.spinics.net/lists/dash/msg01639.html

> +
> +---
> + src/Makefile.am | 3 ++-

This requires AUTORECONF, right? We have a patch from Peter that touches the 
Makefile.in version of the same file. If you add AUTORECONF you would also 
have to to convert Peter's patch to Makefile.am, otherwise your patch 
overwrites his changes. See my upstream submission from last week at

  https://www.spinics.net/lists/dash/msg01629.html

> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 46399c7..5bf5a52 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -44,7 +44,8 @@ EXTRA_DIST = \
> + 	mktokens mkbuiltins builtins.def.in mkinit.c \
> + 	mknodes.c nodetypes nodes.c.pat mksyntax.c mksignames.c
> + 
> +-token.h token_vars.h: mktokens
> ++token_vars.h: token.h
> ++token.h: mktokens
> + 	$(SHELL) $^
> + 
> + builtins.def: builtins.def.in $(top_builddir)/config.h

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
