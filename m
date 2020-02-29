From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 29 Feb 2020 20:03:19 +0100
Subject: [Buildroot] [PATCH v1 09/30] package/Makefile.in: Provide
 TARGET_CROSS without path and trailing -
In-Reply-To: <20191205171517.96639-10-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
 <20191205171517.96639-10-michael.drake@codethink.co.uk>
Message-ID: <fc05f469-0966-34e6-d12b-ed291dd105e1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Le 05/12/2019 ? 18:14, Michael Drake a ?crit?:
> The LLVM/Clang toolchain takes the target triple as a `--target=`
> argument, rather than having separate binaries with different
> names for each target.
> 
> This change exposes just the triple as TARGET_CROSS_TRIPLE.
> 
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  package/Makefile.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 47808292b0..273e9de5d9 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -192,11 +192,13 @@ TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
> +TARGET_CROSS_TRIPLE = $(GNU_TARGET_NAME)

GNU_TARGET_NAME is used all over the place in Buildroot. Adding
TARGET_CROSS_TRIPLE would require in the manual [1] to clarify the use of one or
the other.

[1] docs/manual/adding-packages-generic.txt

>  else
> -TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
> +TARGET_CROSS_TRIPLE = $(TOOLCHAIN_EXTERNAL_PREFIX)
>  endif
>  
> +TARGET_CROSS = $(HOST_DIR)/bin/$(TARGET_CROSS_TRIPLE)-

TOOLCHAIN_EXTERNAL_PREFIX can be used in a package, see [2] as example.

[2] https://git.buildroot.net/buildroot/tree/package/wine/wine.mk?h=2020.02-rc2#n39

> +
>  # Define TARGET_xx variables for all common binutils/gcc
>  TARGET_AR       = $(TARGET_CROSS)ar
>  TARGET_AS       = $(TARGET_CROSS)as
> 
