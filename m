From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 15:16:21 +0200
Subject: [Buildroot] [PATCH next v2] atop: fix minor() major() build
 failure
In-Reply-To: <20180828125258.9285-1-giulio.benetti@micronovasrl.com>
References: <87k1oay87h.fsf@tkos.co.il>
 <20180828125258.9285-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180828151621.77022940@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 14:52:58 +0200, Giulio Benetti wrote:
> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include
> sys/sysmacros.h which contains minor() and major() macros.
> 
> Add patch to directly include <sys/sysmacros.h> into photosyst.c where
> minor() and major() macros are used.
> 
> Patch has been taken from atop upstream pull request:
> https://github.com/Atoptool/atop/pull/35
> 
> Fixes
> http://autobuild.buildroot.net/results/3fc/3fc0f18ed94697c404e7ff3751781789170c4fe5//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...ysmacros.h-to-compile-with-newer-gcc.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> 
> diff --git a/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> new file mode 100644
> index 0000000000..8e612fe2b3
> --- /dev/null
> +++ b/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
> @@ -0,0 +1,50 @@
> +From 414127c03669b4eedc85778a7bff80cf601311d8 Mon Sep 17 00:00:00 2001
> +From: SjonHortensius <SjonHortensius@users.noreply.github.com>
> +Date: Fri, 24 Aug 2018 18:26:58 +0200
> +Subject: [PATCH] Include sysmacros.h to compile with newer gcc
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Older gcc throws a warning
> +```
> +photosyst.c: In function 'lvmmapname':
> +photosyst.c:1465:13: warning: In the GNU C Library, "major" is defined
> + by <sys/sysmacros.h>. For historical compatibility, it is
> + currently defined by <sys/types.h> as well, but we plan to
> + remove this soon. To use "major", include <sys/sysmacros.h>
> + directly. If you did not intend to use a system-defined macro
> + "major", you should undefine it after including <sys/types.h>.
> +     dmp->major  = major(statbuf.st_rdev);
> +```
> +
> +Newer gcc throws an error:
> +
> +```
> +photosyst.c: In function ?lvmmapname?:
> +photosyst.c:1482:19: error: called object ?major? is not a function or function pointer
> +     dmp->major  = major(statbuf.st_rdev);
> +                   ^~~~~
> +photosyst.c:1437:25: note: declared here
> + lvmmapname(unsigned int major, unsigned int minor,
> +            ~~~~~~~~~~~~~^~~~~
> +```

We need your Signed-off-by here, i.e inside the patch you are
backporting.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
