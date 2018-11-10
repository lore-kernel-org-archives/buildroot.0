From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 10 Nov 2018 20:30:47 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] busybox: add patch to fix seg fault in
 'ifup -a'
In-Reply-To: <20181110193319.1273-1-daniel.m@sent.com>
References: <20181110193319.1273-1-daniel.m@sent.com>
Message-ID: <1989059802.1429665.1541889047561.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Daniel Mentz" <daniel.m@sent.com>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "ratbert90" <aduskett@gmail.com>, "DATACOM" <casantos@datacom.com.br>, "Daniel Mentz" <daniel.m@sent.com>
> Sent: S?bado, 10 de novembro de 2018 17:33:19
> Subject: [PATCH 1/1] busybox: add patch to fix seg fault in 'ifup -a'

> Building busybox for arm64 generates the following warning message:
> 
> libbb/get_line_from_file.c: In function ?xmalloc_fgets?:
> libbb/get_line_from_file.c:52:38: warning: passing argument 2 of
> ?bb_get_chunk_from_file? from incompatible pointer type
> [-Wincompatible-pointer-types]
>  return bb_get_chunk_from_file(file, &i);
>                                      ^
> libbb/get_line_from_file.c:13:17: note: expected ?size_t * {aka long unsigned
> int *}? but argument is of type ?int *?
> char* FAST_FUNC bb_get_chunk_from_file(FILE *file, size_t *end)
>                 ^~~~~~~~~~~~~~~~~~~~~~
> 
> As it turned out, this is a real bug that leads to stack corruption.
> The following command crashed on my device due to a NULL pointer being
> derefenced. That pointer turned out to be a victim of the stack
> corruption.
> 
> /sbin/ifup -a
> 
> The affected pointer was liface in ifupdown_main(). The crash occured on
> the following line:
> 
> if (strcmp(liface, currif->iface) == 0) {
> 
> liface should have pointed to "eth0" but got corrupted.
> 
> Signed-off-by: Daniel Mentz <daniel.m@sent.com>
> ---
> ..._fgets-use-size_t-for-bb_get_chunk_f.patch | 27 +++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644
> package/busybox/0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch
> 
> diff --git
> a/package/busybox/0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch
> b/package/busybox/0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch
> new file mode 100644
> index 0000000000..62e7cf6c3d
> --- /dev/null
> +++
> b/package/busybox/0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch
> @@ -0,0 +1,27 @@
> +From 22a99516206b33b7ae124d426319bab03d5c8309 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Sun, 2 Sep 2018 18:48:09 +0200
> +Subject: [PATCH] libbb: in xmalloc_fgets(), use size_t for
> + bb_get_chunk_from_file()
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +---
> + libbb/get_line_from_file.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libbb/get_line_from_file.c b/libbb/get_line_from_file.c
> +index 49ef093c2..903ff1fb6 100644
> +--- a/libbb/get_line_from_file.c
> ++++ b/libbb/get_line_from_file.c
> +@@ -47,7 +47,7 @@ char* FAST_FUNC bb_get_chunk_from_file(FILE *file, size_t
> *end)
> + /* Get line, including trailing \n if any */
> + char* FAST_FUNC xmalloc_fgets(FILE *file)
> + {
> +-	int i;
> ++	size_t i;
> +
> + 	return bb_get_chunk_from_file(file, &i);
> + }
> +--
> +2.17.1
> +
> --
> 2.17.1

Busybox 1.29.3, which is on Buildroot master since commit 77497f5497,
aleady has this fix:

Applying 0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch using patch: 
patching file libbb/get_line_from_file.c
Reversed (or previously applied) patch detected!  Skipping patch.

What Busybox version are you using? Perhaps your patch could be
applied on the LTS branches but I think we should just bump it
to 1.29.3 on those branches too.

Peter?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
