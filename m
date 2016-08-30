From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Aug 2016 11:17:42 +0200
Subject: [Buildroot] [PATCH] package/systemd: fix build with old
	toolchains
In-Reply-To: <1472400772-13647-1-git-send-email-yann.morin.1998@free.fr>
References: <1472400772-13647-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160830091742.GB5815@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2016-08-28 18:12 +0200, Yann E. MORIN spake thusly:
> Toolchains using glibc-218 or older do not define O_TMPFILE, which
> causes build failures on some archs.
> 
> systemd has a definition for O_TMPFILE if it is missing, but only
> defines it for i386 or x86_64. Furthermore, the header defining it is
> not included everywhere O_TMPFILE is used.
> 
> Fix that with two patches:
>   - include the needed header where it is needed (he!),
>   - define O_TMPFILE for all archs, according to linux-4.8rc3.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Status: patches sent upstream:
>     https://github.com/systemd/systemd/pull/4052

Upstream has accepted the patches, in a slightly different form.

I'll update this change with the upstreamed patches, and respin shortly.

Regards,
Yann E. MORIN.

> ---
>  ...-export-raw-needs-missing.h-for-O_TMPFILE.patch | 28 ++++++++++
>  ...h-add-missing-definitions-for-__O_TMPFILE.patch | 63 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
>  create mode 100644 package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
> 
> diff --git a/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch b/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
> new file mode 100644
> index 0000000..2ebdf3f
> --- /dev/null
> +++ b/package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
> @@ -0,0 +1,28 @@
> +From d3d268037e65c51e674f297018b92d51b2f3ec25 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 28 Aug 2016 16:26:04 +0200
> +Subject: [PATCH 4/5] importd/export-raw: needs missing.h for O_TMPFILE
> +
> +O_TMPFILE may be missing from the system headers, so use our fallback
> +definition.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + src/import/export-raw.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/import/export-raw.c b/src/import/export-raw.c
> +index db06e11..2ec06b0 100644
> +--- a/src/import/export-raw.c
> ++++ b/src/import/export-raw.c
> +@@ -25,6 +25,7 @@
> + #include <libgen.h>
> + #undef basename
> + 
> ++#include "missing.h"
> + #include "sd-daemon.h"
> + 
> + #include "alloc-util.h"
> +-- 
> +2.7.4
> +
> diff --git a/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch b/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
> new file mode 100644
> index 0000000..8a283d3
> --- /dev/null
> +++ b/package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
> @@ -0,0 +1,63 @@
> +From d34c5bdb4635edd23dbbc761033063da4d7d55e3 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 28 Aug 2016 17:26:42 +0200
> +Subject: [PATCH 5/5] missing.h: add missing definitions for __O_TMPFILE
> +
> +Currently, a missing __O_TMPFILE was only defined for i386 and x86_64,
> +leaving any other architectures with an "old" toolchain fail miserably
> +at build time:
> +    src/import/export-raw.c: In function 'reflink_snapshot':
> +    src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
> +             new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
> +                              ^
> +
> +__O_TMPFILE (and O_TMPFILE) are available since glibc 2.19. However, a
> +lot of existing toolchains are still using glibc-2.18, and some even
> +before that, and it is not really possible to update those toolchains.
> +
> +Instead of defining it only for i386 and x86_64, define __O_TMPFILE
> +with the specific values for those archs where it is different from the
> +generic value. Use the values as found in the Linux kernel (v4.8-rc3,
> +current as of time of commit).
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +---
> +Note: tested on ARM (build+run), with glibc-2.18 and linux headers 3.12.
> +Untested on other archs, though (I have no board to test this).
> +---
> + src/basic/missing.h | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/basic/missing.h b/src/basic/missing.h
> +index f8e0966..057d3fe 100644
> +--- a/src/basic/missing.h
> ++++ b/src/basic/missing.h
> +@@ -537,12 +537,20 @@ struct btrfs_ioctl_quota_ctl_args {
> + #  define DRM_IOCTL_DROP_MASTER _IO('d', 0x1f)
> + #endif
> + 
> +-#if defined(__i386__) || defined(__x86_64__)
> +-
> +-/* The precise definition of __O_TMPFILE is arch specific, so let's
> +- * just define this on x86 where we know the value. */
> ++/* The precise definition of __O_TMPFILE is arch specific; use the
> ++ * values defined by the kernel:
> ++ * - alpha, parisc, sparc: all have a specific value;
> ++ * - others: they use the "generic" value.
> ++ */
> + 
> + #ifndef __O_TMPFILE
> ++#if defined(__alpha__)
> ++#define __O_TMPFILE     0100000000
> ++#elif defined(__parisc__) || defined(__hppa__)
> ++#define __O_TMPFILE     0400000000
> ++#elif defined(__sparc__) || defined(__sparc64__)
> ++#define __O_TMPFILE     0x2000000
> ++#else
> + #define __O_TMPFILE     020000000
> + #endif
> + 
> +-- 
> +2.7.4
> +
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
