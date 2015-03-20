From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:42:07 +0100
Subject: [Buildroot] [PATCH 2/2] bfin: put the libc link path of the
 flat shared and sep data formats before the sysroot link path
In-Reply-To: <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
 <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20150320224207.7b3334b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

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

Thanks for this patch. I did some quick testing with
BR2_BINFMT_FLAT_SHARED with and without your patch, and I do not see a
difference. For example, I've built strace with and without your patch
applied, and the resulting binary has the same size. Looking at
strace.gdb using readelf, I can see that the C library functions are
not inside the strace binary itself, while with a BR2_BINFMT_FLAT_ONE
build, the strace binary is definitely bigger and a readelf on
strace.gdb shows that the C library functions have been copied into the
binary.

So, could you give us an example of what this patch is fixing?

I'm sorry to ask such questions, but while the Blackfin architecture is
probably well known to you, it isn't to most of us, so some additional
details are always useful.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
