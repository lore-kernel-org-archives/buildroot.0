From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Jul 2017 07:16:48 +0300
Subject: [Buildroot] [PATCH] package/linuxptp: remove incdefs.sh to
 avoid cross-compilation issues
In-Reply-To: <20170705141028.28194-1-romain.naour@smile.fr>
References: <20170705141028.28194-1-romain.naour@smile.fr>
Message-ID: <20170706041648.p546saeul5pdr576@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Wed, Jul 05, 2017 at 04:10:28PM +0200, Romain Naour wrote:
> incdefs.sh try to define some flags based on some build tests and
> by checking a kernel header. It doesn't work well while cross-compiling.

Can you elaborate on why that doesn't work with cross compiling? Since commit 
85bf5750fe641 (linuxptp: don't check host headers for target features), 
incdefs.sh only searches the target headers.

> The Buildroot buildsystem define these definition directly
> in the EXTRA_CFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/364/36470db2c262d2e1fda5144a08cfe221831e093e
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...move-incdefs.sh-to-avoid-cross-compilatio.patch | 31 ++++++++++++++++++++++
>  package/linuxptp/Config.in                         |  4 +++
>  package/linuxptp/linuxptp.mk                       | 10 +++++--
>  3 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
> 
> diff --git a/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch b/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
> new file mode 100644
> index 0000000..cc932b4
> --- /dev/null
> +++ b/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
> @@ -0,0 +1,31 @@
> +From 0759b36ad0a728a49f329fa0e7e6173fe3ccb657 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Wed, 5 Jul 2017 15:37:22 +0200
> +Subject: [PATCH] makefile: remove incdefs.sh to avoid cross-compilation issues
> +
> +The Buildroot buildsystem define these definition directly
> +in the EXTRA_CFLAGS.

Since you add the correct macros in EXTRA_CFLAGS, why do you need to remove 
the incdefs.sh call?

> +
> +Fixes:
> +http://autobuild.buildroot.net/results/364/36470db2c262d2e1fda5144a08cfe221831e093e
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/makefile b/makefile
> +index f898336..5912f9a 100644
> +--- a/makefile
> ++++ b/makefile
> +@@ -33,7 +33,6 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
> + SRC	= $(OBJECTS:.o=.c)
> + DEPEND	= $(OBJECTS:.o=.d)
> + srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
> +-incdefs := $(shell $(srcdir)/incdefs.sh)
> + version := $(shell $(srcdir)/version.sh $(srcdir))
> + VPATH	= $(srcdir)
> + 
> +-- 
> +2.9.4
> +
> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
> index 3e18a0c..8c9d684 100644
> --- a/package/linuxptp/Config.in
> +++ b/package/linuxptp/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LINUXPTP
>  	bool "linuxptp"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	help
>  	  The Linux PTP Project is the Precision Time Protocol
>  	  implementation according to IEEE standard 1588 for Linux.
> @@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
>  	  not a goal.
>  
>  	  http://linuxptp.sourceforge.net/
> +
> +comment "linuxptp needs a toolchain w/ headers >= 3.2"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index beb2591..35702e0 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -10,10 +10,16 @@ LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
>  LINUXPTP_LICENSE = GPL-2.0+
>  LINUXPTP_LICENSE_FILES = COPYING
>  
> +# incdefs.sh doesn't work for cross-compilation.
> +# Define HAVE_ONESTEP_SYNC in EXTRA_CFLAGS directly and depends on
> +# kernel headers >= 3.2.

Can't we make HAVE_ONESTEP_SYNC depend on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2?

>  define LINUXPTP_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" \
> -		$(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
> -		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
> +		$(MAKE) \
> +		EXTRA_CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE \
> +			-DHAVE_ONESTEP_SYNC -DHAVE_CLOCK_ADJTIME \
> +			-DHAVE_POSIX_SPAWN" \
> +		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>  		-C $(@D) all

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
