From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 27 Mar 2020 15:27:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.15.0
In-Reply-To: <AM0PR04MB4067D7B4191AAAC3986CFEE7B6CC0@AM0PR04MB4067.eurprd04.prod.outlook.com>
References: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
 <20200326164943.564656-3-gary.bisson@boundarydevices.com>
 <AM0PR04MB4067D7B4191AAAC3986CFEE7B6CC0@AM0PR04MB4067.eurprd04.prod.outlook.com>
Message-ID: <20200327142719.GA595973@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent,

On Fri, Mar 27, 2020 at 10:31:03AM +0000, Laurent Gauthier (OSS) wrote:
> Hi Gary,
> 
> While testing your change I ran into a build problem due to the fact that execinfo.h is included in some debug macro header.
> 
> This failure occurred because I build with a uclibc in default configuration and by default backtrace support is not enabled (and therefore this header file is not available).

Indeed I only built with glibc toolchain (prebuilt one).

> After looking at the details I came up with the following patch that can be applied to properly avoid the build issue.
> 
> package/freescale-imx/imx-vpu-hantro/0002-disable-debug-macros.patch
> ---- 8< -----------------
> --- a/openmax_il/source/dbgmacros.h     2019-09-30 05:21:45.000000000 +0200
> +++ b/openmax_il/source/dbgmacros.h     2020-03-27 10:34:07.354415087 +0100
> @@ -50,13 +50,6 @@
>  #    define __USE_GNU
>  #endif
> 
> -#ifndef ANDROID
> -#include <execinfo.h>
> -#include <link.h>
> -#endif
> -#include <dlfcn.h>
> -#include <elf.h>
> -
>  /*****************
>   ** DEBUG FLAGS **
>   *****************/
> @@ -76,6 +69,13 @@
>  #define TRACE_FILE "trace.log"
>  #endif
> 
> +#ifndef ANDROID
> +#include <execinfo.h>
> +#include <link.h>
> +#endif
> +#include <dlfcn.h>
> +#include <elf.h>
> +
>  #ifdef LOG_IN_FILE
>  #define TRACE(...)                                              \
>      {                                                           \
> ---- 8< -----------------
> 
> I hope this helps.

It does help a lot, thanks! I'll add your patch in my v2 then.

Have you reached out to the NXP team internally to have the patch merged
for next release by any chance?

Thanks,
Gary
