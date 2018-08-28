From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Aug 2018 15:41:22 +0300
Subject: [Buildroot] [PATCH next] atop: fix minor() major() build failure
In-Reply-To: <20180828123213.6560-1-giulio.benetti@micronovasrl.com>
References: <20180828123213.6560-1-giulio.benetti@micronovasrl.com>
Message-ID: <87k1oay87h.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

Giulio Benetti writes:
> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include
> sys/sysmacros.h which contains minor() and major() macros.
>
> Add patch to directly include <sys/sysmacros.h> into photosyst.c where
> minor() and major() macros are used.
>
> Fixes
> http://autobuild.buildroot.net/results/3fc/3fc0f18ed94697c404e7ff3751781789170c4fe5//
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../0001-Fix-major-minor-build-failure.patch  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/atop/0001-Fix-major-minor-build-failure.patch
>
> diff --git a/package/atop/0001-Fix-major-minor-build-failure.patch b/package/atop/0001-Fix-major-minor-build-failure.patch
> new file mode 100644
> index 0000000000..d46302dedc
> --- /dev/null
> +++ b/package/atop/0001-Fix-major-minor-build-failure.patch
> @@ -0,0 +1,32 @@
> +From 1f85bae1fa4b4a021adc71517d218000c53d8501 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Tue, 28 Aug 2018 14:11:25 +0200
> +Subject: [PATCH] Fix major() minor() build failure.
> +
> +In some toolchain sys/types.h file doesn't include sys/sysmacros.h but
> +minor() and major() macros are contained there. This causes build failure
> +using such toolchains(i.e. arm-linux-gnueabihf).
> +
> +Add #include <sys/sysmacros.h> directly where using major() and minor()
> +macros.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---

Please add a reference to the upstream pull request in the patch
description:

  https://github.com/Atoptool/atop/pull/35

baruch

> + photosyst.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/photosyst.c b/photosyst.c
> +index 38828ec..871d05c 100644
> +--- a/photosyst.c
> ++++ b/photosyst.c
> +@@ -172,6 +172,7 @@ static const char rcsid[] = "$Id: photosyst.c,v 1.38 2010/11/19 07:40:40 gerlof
> + // #define	_GNU_SOURCE
> + #include <sys/ipc.h>
> + #include <sys/shm.h>
> ++#include <sys/sysmacros.h>
> + 
> + #include "atop.h"
> + #include "photosyst.h"
> +-- 
> +2.17.1

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
