From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 22:01:49 +0100
Subject: [Buildroot] [PATCH 2/2] bfin: put the libc link path of the
 flat shared and sep data formats before the sysroot link path
In-Reply-To: <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
 <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20151229220149.0fe86aac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sonic,

On Wed, 18 Mar 2015 16:59:16 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> The libc of the shared flat and sep data formats are different from the
> standard flat libc in the sysroot lib path. In order to make application
> link with proper libc, put their path before the sysroot link path.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/Makefile.in |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 803b162..e88d1ad 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -153,12 +153,12 @@ TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSI
>  endif
>  
>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
> -TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0 -L$(STAGING_DIR)/usr/lib/mid-shared-library
>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>  TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>  endif
>  ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
> -TARGET_LDFLAGS += -msep-data
> +TARGET_LDFLAGS += -msep-data -L$(STAGING_DIR)/usr/lib/msep-data
>  TARGET_CFLAGS += -msep-data
>  TARGET_CXXFLAGS += -msep-data
>  endif

We finally discussed your patch today during a review meeting.
Unfortunately, your solution is not appropriate for two reasons:

 1) It applies to all cases, while the problem is completely specific
    to the Analog Devices Blackfin toolchain.

 2) The problem that needs to be solved is in fact that the external
    toolchain logic in Buildroot seems to not be copying the right
    sysroot. If you build with -mid-shared-library, then it's directly
    this libc.a variant that should be in $(STAGING_DIR)/usr/lib.

Could you instead investigate the external toolchain code to understand
why the appropriate sysroot doesn't get copied?

In the mean time, I'll mark your patch as Changes Requested in our
patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
