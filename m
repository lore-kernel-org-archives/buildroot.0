From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 16:42:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix CVE-2018-19876
In-Reply-To: <20200229200016.3448256-1-fontaine.fabrice@gmail.com>
References: <20200229200016.3448256-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301154235.GL8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 21:00 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

As per Peter's review, this is a long shot for a security fix: better
backport the two patches (+autoreconf) for master. The version bump can
then be respun for next or after the merge.

I've marked this as chages-requested in patchwork.

Regards,
Yann E. MORIN.

> ---
>  ...vailable-in-cairo_ft_apply_variation.patch | 33 +++++++++++++++++++
>  package/cairo/cairo.mk                        |  3 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
> 
> diff --git a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
> new file mode 100644
> index 0000000000..10e000d16f
> --- /dev/null
> +++ b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
> @@ -0,0 +1,33 @@
> +From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <cgarcia@igalia.com>
> +Date: Mon, 19 Nov 2018 12:33:07 +0100
> +Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
> + cairo_ft_apply_variations
> +
> +Fixes a crash when using freetype >= 2.9
> +[Retrieved from:
> +https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/cairo-ft-font.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
> +index 325dd61b4..981973f78 100644
> +--- a/src/cairo-ft-font.c
> ++++ b/src/cairo-ft-font.c
> +@@ -2393,7 +2393,11 @@ skip:
> + done:
> +         free (coords);
> +         free (current_coords);
> ++#if HAVE_FT_DONE_MM_VAR
> ++        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
> ++#else
> +         free (ft_mm_var);
> ++#endif
> +     }
> + }
> + 
> +-- 
> +2.24.1
> +
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 902f505aaa..c6a3dad932 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -11,6 +11,9 @@ CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
>  CAIRO_SITE = http://cairographics.org/releases
>  CAIRO_INSTALL_STAGING = YES
>  
> +# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
> +CAIRO_IGNORE_CVES += CVE-2018-19876
> +
>  # relocation truncated to fit: R_68K_GOT16O
>  ifeq ($(BR2_m68k_cf),y)
>  CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
> -- 
> 2.25.0
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
