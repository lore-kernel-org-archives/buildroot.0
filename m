From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Apr 2021 21:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix build with gcc 4.8
In-Reply-To: <20210408165445.2586926-1-fontaine.fabrice@gmail.com>
References: <20210408165445.2586926-1-fontaine.fabrice@gmail.com>
Message-ID: <20210413192043.GE359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-08 18:54 +0200, Fabrice Fontaine spake thusly:
> Build is broken with gcc 4.8 since bump to version 2.3.1 in commit
> 01e78811db25c34d506138994efd981e4ab60caf due to
> https://github.com/FreeRDP/FreeRDP/commit/5b2f35747bb37b09b1803b99ca2b1cb248b5bb16
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e8e7d43d6183bb6de7bd2c2b300dbdb89f2052d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...001-Fix-variable-declaration-in-loop.patch | 33 ++++++++++++++++++
>  ...2-Fixed-variable-declaration-in-loop.patch | 34 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/freerdp/0001-Fix-variable-declaration-in-loop.patch
>  create mode 100644 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> 
> diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
> new file mode 100644
> index 0000000000..a391e42ee6
> --- /dev/null
> +++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
> @@ -0,0 +1,33 @@
> +From ddde652460350b962d32036981ff8ed77ed2f1ed Mon Sep 17 00:00:00 2001
> +From: Armin Novak <armin.novak@thincast.com>
> +Date: Wed, 16 Sep 2020 09:30:37 +0200
> +Subject: [PATCH] Fix variable declaration in loop
> +
> +[Retrieved from:
> +https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + client/X11/xf_graphics.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> +index 76fbef5bd6..bf71b563c3 100644
> +--- a/client/X11/xf_graphics.c
> ++++ b/client/X11/xf_graphics.c
> +@@ -386,6 +386,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
> + static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
> + {
> + #ifdef WITH_XCURSOR
> ++	UINT32 i;
> + 	xfContext* xfc = (xfContext*)context;
> + 	xfPointer* xpointer = (xfPointer*)pointer;
> + 
> +@@ -395,7 +396,7 @@ static void xf_Pointer_Free(rdpContext* context, rdpPointer* pointer)
> + 	free(xpointer->cursorWidths);
> + 	free(xpointer->cursorHeights);
> + 
> +-	for (int i = 0; i < xpointer->nCursors; i++)
> ++	for (i = 0; i < xpointer->nCursors; i++)
> + 	{
> + 		XFreeCursor(xfc->display, xpointer->cursors[i]);
> + 	}
> diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> new file mode 100644
> index 0000000000..14e1d6c8f4
> --- /dev/null
> +++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
> @@ -0,0 +1,34 @@
> +From 4f8a48d96e472e43a5f856c449f61669792ce9fa Mon Sep 17 00:00:00 2001
> +From: akallabeth <akallabeth@posteo.net>
> +Date: Tue, 22 Sep 2020 07:43:56 +0200
> +Subject: [PATCH] Fixed variable declaration in loop
> +
> +[Retrieved from:
> +https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + client/X11/xf_graphics.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> +index bf71b563c3..c50726c8e4 100644
> +--- a/client/X11/xf_graphics.c
> ++++ b/client/X11/xf_graphics.c
> +@@ -240,7 +240,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
> + 	double xscale;
> + 	double yscale;
> + 	size_t size;
> +-	int cursorIndex = -1;
> ++	int cursorIndex = -1, i;
> + 
> + 	if (!context || !pointer || !context->gdi)
> + 		return FALSE;
> +@@ -255,7 +255,7 @@ static BOOL _xf_Pointer_GetCursorForCurrentScale(rdpContext* context, const rdpP
> + 	xTargetSize = pointer->width * xscale;
> + 	yTargetSize = pointer->height * yscale;
> + 
> +-	for (int i = 0; i < xpointer->nCursors; i++)
> ++	for (i = 0; i < xpointer->nCursors; i++)
> + 	{
> + 		if (xpointer->cursorWidths[i] == xTargetSize && xpointer->cursorHeights[i] == yTargetSize)
> + 		{
> -- 
> 2.30.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
