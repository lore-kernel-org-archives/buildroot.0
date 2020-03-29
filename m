From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:23:36 +0200
Subject: [Buildroot] [PATCH v1] package/localedef: fix gcc-10.0.1 compile
In-Reply-To: <20200328220750.17732-1-ps.report@gmx.net>
References: <20200328220750.17732-1-ps.report@gmx.net>
Message-ID: <20200329142336.GD22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-03-28 23:07 +0100, Peter Seiderer spake thusly:
> Fixes bug 12711 ([1]):
> 
>   programs/ld-ctype.c:855:18: error: array subscript 0 is outside the bounds of an interior zero-length array ?unsigned char[0]? [-Werror=zero-length-bounds]
>     855 |  replace[0].bytes[0] = '?';
>         |  ~~~~~~~~~~~~~~~~^~~
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=12711
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

> ---
> Notes:
> Patch suggested by Yann E, MORIN, could not test personally (no
> gcc-10.0.1 available).

Neother do I, but the patch is exactly the one from upstream, which
claims to fix jsut this very issue, so seems legit to me, so I applied.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...itializer-for-flexible-array-member-.patch | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
> 
> diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
> new file mode 100644
> index 0000000000..93547e08f0
> --- /dev/null
> +++ b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
> @@ -0,0 +1,81 @@
> +From 6fea0a8e33760258c4baa5d0a6f3a145897427fe Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Tue, 3 Sep 2019 14:01:39 +0200
> +Subject: [PATCH] localedef: Use initializer for flexible array member [BZ
> + #24950]
> +
> +struct charseq used a zero-length array instead of a flexible array
> +member.  This required a strange construct to initialize struct
> +charseq objects, and GCC 10 warns about that:
> +
> +cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> +In file included from programs/repertoire.h:24,
> +                 from programs/localedef.h:32,
> +                 from programs/ld-ctype.c:35:
> +programs/charmap.h:63:17: note: destination object declared here
> +   63 |   unsigned char bytes[0];
> +      |                 ^~~~~
> +cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> +programs/charmap.h:63:17: note: destination object declared here
> +cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> +programs/charmap.h:63:17: note: destination object declared here
> +cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> +programs/charmap.h:63:17: note: destination object declared here
> +
> +The change makes the object physically const, but it is not expected
> +to be modified.
> +
> +[Upstream: https://sourceware.org/git/?p=glibc.git;a=patch;h=1471fa556afb428c4a4c46cf5543a4101d5bcf91]
> +[Dropped confliciting ChangeLog part]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + locale/programs/charmap.h  |  2 +-
> + locale/programs/ld-ctype.c | 12 ++++++------
> + 2 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/locale/programs/charmap.h b/locale/programs/charmap.h
> +index 870a9e95..70db330d 100644
> +--- a/locale/programs/charmap.h
> ++++ b/locale/programs/charmap.h
> +@@ -60,7 +60,7 @@ struct charseq
> +   const char *name;
> +   uint32_t ucs4;
> +   int nbytes;
> +-  unsigned char bytes[0];
> ++  unsigned char bytes[];
> + };
> + 
> + 
> +diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
> +index cfc9c43f..9123f64a 100644
> +--- a/locale/programs/ld-ctype.c
> ++++ b/locale/programs/ld-ctype.c
> +@@ -842,8 +842,6 @@ no input digits defined and none of the standard names in the charmap"));
> +   for (cnt = 0; cnt < 10; ++cnt)
> +     if (ctype->mboutdigits[cnt] == NULL)
> +       {
> +-	static struct charseq replace[2];
> +-
> + 	if (!warned)
> + 	  {
> + 	    record_error (0, 0, _("\
> +@@ -851,10 +849,12 @@ not all characters used in `outdigit' are available in the charmap"));
> + 	    warned = 1;
> + 	  }
> + 
> +-	replace[0].nbytes = 1;
> +-	replace[0].bytes[0] = '?';
> +-	replace[0].bytes[1] = '\0';
> +-	ctype->mboutdigits[cnt] = &replace[0];
> ++	static const struct charseq replace =
> ++	  {
> ++	     .nbytes = 1,
> ++	     .bytes = "?",
> ++	  };
> ++	ctype->mboutdigits[cnt] = (struct charseq *) &replace;
> +       }
> + 
> +   warned = 0;
> +-- 
> +2.26.0
> +
> -- 
> 2.26.0
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
