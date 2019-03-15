From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:21:24 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/gnu-efi: fix gnu-efi in
 projects using -nostdinc
In-Reply-To: <20190315221218.2643-1-james.hilliard1@gmail.com>
References: <20190315221218.2643-1-james.hilliard1@gmail.com>
Message-ID: <20190315232124.33ab7aa0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 06:12:17 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> This fixes the problem with undeclared intptr_t type for builds not including
> stdint.h, without breaking builds using -nostdinc.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks, it's good to have an upstream fix for this. However...

> diff --git a/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch b/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
> new file mode 100644
> index 0000000000..4923242158
> --- /dev/null
> +++ b/package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
> @@ -0,0 +1,113 @@
> +From 1a53d8f88a452847b25f9689f9a08dbcf82c86e4 Mon Sep 17 00:00:00 2001
> +From: Esben Haabendal <esben@esben1.localdomain>
> +Date: Fri, 15 Mar 2019 11:57:51 +0100
> +Subject: [PATCH] Fix for problem with undeclared intptr_t type
> +
> +When building gnu-efi with old compilers with pre C90 compilers:
> +
> +In file included from gnu-efi-3.0.9/lib/../inc/efilib.h:25:0,
> +                 from gnu-efi-3.0.9/lib/lib.h:24,
> +                 from gnu-efi-3.0.9/lib/dpath.c:25:
> +gnu-efi-3.0.9/lib/dpath.c: In function 'FileDevicePath':
> +gnu-efi-3.0.9/lib/../inc/efilink.h:145:47: error: 'intptr_t' undeclared (first use in this function)
> + #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
> +
> +Problem introduced with commit a46a62b12b58139c31d4288384808365c4053bf2
> +(Fix some types gcc doesn't like).
> +
> +Avoid this by adding intptr_t (and uintptr_t) typedefs for builds that does
> +not include stdint.h.
> +
> +Signed-off-by: Esben Haabendal <esben@esben1.localdomain>
> +[Upstream status:
> +https://sourceforge.net/p/gnu-efi/code/merge-requests/5]

You forgot to add your SoB here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
