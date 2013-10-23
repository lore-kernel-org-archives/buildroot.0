From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 11:44:57 +0200
Subject: [Buildroot] [PATCH 2/2] kobs-ng: test kernel version for
	redefines
In-Reply-To: <1382518620-26320-2-git-send-email-alyoshin.s@gmail.com>
References: <1382518620-26320-1-git-send-email-alyoshin.s@gmail.com>
 <1382518620-26320-2-git-send-email-alyoshin.s@gmail.com>
Message-ID: <CAAXf6LU7amhD6DwXWCB9ArpSuGwiJaEonL8fPhZA84GN6SSnxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Wed, Oct 23, 2013 at 10:57 AM, Sergey Alyoshin <alyoshin.s@gmail.com> wrote:
> kobs-ng failed to build with 2.6.36, because enum tested with #ifndef
>
> mtd.c: In function 'mtd_open':
> mtd.c:696:42: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
> function)
> mtd.c:696:42: note: each undeclared identifier is reported only once for each
> function it appears in
> mtd.c: In function 'mtd_set_ecc_mode':
> mtd.c:896:43: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
> function)
> mtd.c:914:43: error: 'MTD_FILE_MODE_RAW' undeclared (first use in this
> function)
>
> Do kernel version test before enum redefines.
>
> Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
> ---
>  package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch b/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
> index 39d7474..4a9a626 100644
> --- a/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
> +++ b/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch

Since you're changing a patch written by Paul Henson, I think you
should add your Signed-off-by: line also after his, inside the patch.
Otherwise it would seem that Paul Henson wrote your changes.

> @@ -56,16 +56,15 @@ diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
>  diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.h kobs-ng-3.0.35-4.0.0/src/mtd.h
>  --- kobs-ng-3.0.35-4.0.0-orig/src/mtd.h        2012-12-17 22:37:40.000000000 -0800
>  +++ kobs-ng-3.0.35-4.0.0/src/mtd.h     2013-07-28 19:33:57.000000000 -0700
> -@@ -31,6 +31,14 @@
> +@@ -31,6 +31,13 @@
>   #include "BootControlBlocks.h"
>   #include "rom_nand_hamming_code_ecc.h"
>
>  +// Newer kernel headers renamed define
> -+#ifndef MTD_MODE_NORMAL
> -+#define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
> -+#endif
> -+#ifndef MTD_MODE_RAW
> -+#define MTD_MODE_RAW MTD_FILE_MODE_RAW
> ++#include <linux/version.h>
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 1, 0)

Are you sure about this check?
If I look at the Free Electrons LXR, linux 3.1 still used
MTD_MODE_NORMAL, while 3.2 has MTD_FILE_MODE_NORMAL.
http://lxr.free-electrons.com/source/include/mtd/mtd-abi.h?v=3.1

I haven't checked the versions in between (3.1.1, 3.1.2, etc.).
Could you verify what is the right check?

> ++# define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
> ++# define MTD_MODE_RAW MTD_FILE_MODE_RAW

Best regards,
Thomas
