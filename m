From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jul 2017 09:25:38 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170704235445.35255-2-code@mmayer.net>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
Message-ID: <20170705072538.GE3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, all,

On 2017-07-04 16:54 -0700, Markus Mayer spake thusly:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> The Linux tools master makefile (linux-tools.mk) must be included after
> all Linux tools sub-makefiles (linux-tool-*.mk). This is currently
> ensured by sorting all package makefiles alphabetically.
> 
> In preparation for adding linux-tool-tmon, we cannot keep relying on
> this mechanism. In the C locale, linux-tool-tmon.mk will be sorted
> behind linux-tools.mk, which would break the build.

That is not the case for me:

    $ touch package/linux-tools/linux-tool-tmon.mk
    $ LC_ALL=C ls -lh package/linux-tools/
    total 28K
    -rw-r--r-- 1 ymorin ymorin 2.8K Jul  3 23:55 Config.in
    -rw-r--r-- 1 ymorin ymorin 1.1K Jul  3 23:55 linux-tool-cpupower.mk
    -rw-r--r-- 1 ymorin ymorin  721 Jul  3 23:55 linux-tool-gpio.mk
    -rw-r--r-- 1 ymorin ymorin  730 Jul  3 23:55 linux-tool-iio.mk
    -rw-r--r-- 1 ymorin ymorin 4.0K Jul  3 23:55 linux-tool-perf.mk
    -rw-r--r-- 1 ymorin ymorin 1.5K Jul  3 23:55 linux-tool-selftests.mk
    -rw-r--r-- 1 ymorin ymorin    0 Jul  5 09:17 linux-tool-tmon.mk
    -rw-r--r-- 1 ymorin ymorin 2.0K Jul  3 23:55 linux-tools.mk

However, I am totally in favour of fixing it once and for all.

But rather than do a hack in the main Makefile as you suggest, I would
just ensure the ordering of the files.

I think we should just rneame the individual tool files to remove
the .mk extension, and then exp[licitly source them from
package/linux-tools/linux-tools.mk

    include $(wildcard package/linux-tools/linux-tool-*)

and be done with that once and for all.

Regards,
Yann E. MORIN.

> Therefore, we ensure that linux-tools.mk always comes after
> linux-tool-*.mk by explicitly including it after the other package
> makefiles.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  Makefile                           | 6 +++++-
>  package/linux-tools/linux-tools.mk | 8 +++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b37171fcf..b5596444d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -495,7 +495,11 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
>  -include $(PACKAGE_OVERRIDE_FILE)
>  endif
>  
> -include $(sort $(wildcard package/*/*.mk))
> +# We need to insure that linux-tools.mk is included after all linux-tool-*.mk
> +# makefiles, and we can't rely on alphabetical sort order for this.
> +LINUX_TOOLS_MK = package/linux-tools/linux-tools.mk
> +include $(sort $(filter-out $(LINUX_TOOLS_MK),$(wildcard package/*/*.mk)))
> +include $(LINUX_TOOLS_MK)
>  
>  include boot/common.mk
>  include linux/linux.mk
> diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> index 7fa8d194c..3d7a0bd92 100644
> --- a/package/linux-tools/linux-tools.mk
> +++ b/package/linux-tools/linux-tools.mk
> @@ -14,11 +14,9 @@
>  # to guarantee that each tool has a chance to register itself before we build
>  # the list of build and install hooks, below.
>  #
> -# This is currently guaranteed by the naming of each file:
> -# - they get included by the top-level Makefile, with $(sort $(wildcard ...))
> -# - make's $(sort) function will aways sort in the C locale
> -# - the files names correctly sort out in the C locale so that each tool's
> -#   .mk file is included before this one.
> +# This is ensured by the main buildroot makefile, which explicitly includes
> +# linux-tools.mk after all linux-tool*.mk makefiles. Look for LINUX_TOOLS_MK
> +# in the top-level makefile to see where this is happening.
>  
>  # We only need the kernel to be extracted, not actually built
>  LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> -- 
> 2.13.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
