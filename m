From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 20 Aug 2012 10:40:53 +0800
Subject: [Buildroot] [PATCH 2/2] package: Makefile.in: Add target
 compilation flags for Blackfin.
In-Reply-To: <1344843674-27814-2-git-send-email-sonic.adi@gmail.com>
References: <1344843674-27814-1-git-send-email-sonic.adi@gmail.com>
 <1344843674-27814-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <CAJxxZ0OUarK5rQQT_SgCAu7Q3J30U0SvhZaCJus_zevZFEDaBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping

Sonic

On Mon, Aug 13, 2012 at 3:41 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> 1) Add CPU type and revision CFLAGS
> 2) Add FLAT ABI LDFLAGS
> 3) Add share FLAT ABI FLAGS
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/Makefile.in |   22 +++++++++++++++++++++-
>  1 files changed, 21 insertions(+), 1 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6fad224..cda2297 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -85,7 +85,13 @@ ifeq ($(BR2_DEBUG_3),y)
>  TARGET_DEBUGGING=-g3
>  endif
>
> -TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> +ifeq ($(BR2_GCC_TARGET_CPU_REVISION),)
> +TARGET_CPU=-mcpu=$(BR2_GCC_TARGET_CPU)
> +else
> +TARGET_CPU=-mcpu=$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION)
> +endif
> +
> +TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_CPU)
>
>  ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
>  TARGET_CFLAGS+=-fno-pic -mno-abicalls
> @@ -95,9 +101,23 @@ ifeq ($(BR2_LARGEFILE),y)
>  TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>  endif
>
> +ifeq ($(BR2_NOMMU), y)
> +TARGET_CFLAGS += -D__NOMMU__ -D__uClinux__
> +endif
> +
>  TARGET_CXXFLAGS=$(TARGET_CFLAGS)
>  TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
>
> +ifeq ($(BR2_ABI_FLAT),y)
> +TARGET_LDFLAGS += -Wl,-elf2flt
> +endif
> +
> +ifeq ($(BR2_BFIN_SHARED_FLAT), y)
> +TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
>  else
> --
> 1.7.0.4
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
