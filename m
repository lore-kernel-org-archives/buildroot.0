From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:40:20 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: upgrade to 1.7.0
In-Reply-To: <20180302100924.10823-1-nolange79@gmail.com>
References: <20180302100924.10823-1-nolange79@gmail.com>
Message-ID: <20180409214020.2831258f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Mar 2018 11:09:24 +0100, Norbert Lange wrote:
> -   Patches have been adopted upstream
> -   microblaze and powerpc should build now
> -   changed build from CMake to using plain Makefile as
>     CMake build doesnt seem particularly well maintained
> -   openssl is automatically used if available
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Thanks for this update. A few comments/questions below.


> diff --git a/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch b/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch
> new file mode 100644
> index 0000000000..075d743338
> --- /dev/null
> +++ b/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch
> @@ -0,0 +1,56 @@
> +From 45d57103fe4c344b95d39bf8615b5f6bad138027 Mon Sep 17 00:00:00 2001
> +From: Eugene Tarassov <eugenet@xilinx.com>
> +Date: Sat, 24 Feb 2018 16:32:09 -0800
> +Subject: [PATCH] TCF Agent: stop stack crawl when SP = 0
> +

We need your Signed-off-by here, and an indication that this is a
backport from upstream (if that's the case).

> diff --git a/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch b/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch
> new file mode 100644
> index 0000000000..a6ebe45d4b
> --- /dev/null
> +++ b/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch
> @@ -0,0 +1,28 @@
> +From 0007972acc45c7f397589f1d90cd65ade0519e59 Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <norbert.lange@andritz.com>
> +Date: Wed, 28 Feb 2018 10:53:04 +0100
> +Subject: [PATCH] TCF Agent: fix build with static libcrypto on Linux
> +
> +libcrypto depends on libz, so this library needs to be linked as well
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +---
> + agent/Makefile.inc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/agent/Makefile.inc b/agent/Makefile.inc
> +index f9f191b2..7c8cfa53 100644
> +--- a/agent/Makefile.inc
> ++++ b/agent/Makefile.inc
> +@@ -81,7 +81,7 @@ endif
> + 
> + ifeq ($(OPSYS),GNU/Linux)
> +   ifeq ($(NO_SSL),)
> +-    LIBS = -lpthread -lssl -lcrypto -lrt
> ++    LIBS = -lpthread -lssl -lcrypto -lz -lrt

It's not great because you force using -lz even in dynamic linking
situations. What about instead something like this:

PKG_CONFIG ?=

ifeq ($(OPSYS),GNU/Linux)
  ifeq ($(NO_SSL),)
    LIBS = -lpthread -lrt
    ifeq ($(PKG_CONFIG),)
      LIBS += -lssl -l crypto
    else
      LIBS += $(shell $(PKG_CONFIG) --libs crypto)
    endif
  endif
endif

And same for libuuid. pkg-config automatically returns the right result
depending on whether dynamic linking or static linking is used.

> diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
> index 7b615d3120..7952c94bff 100644
> --- a/package/tcf-agent/tcf-agent.mk
> +++ b/package/tcf-agent/tcf-agent.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCF_AGENT_VERSION = 1.6.0
> +TCF_AGENT_VERSION = 1.7.0
>  # the tar.xz link was broken the time this file got authored
>  TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.gz
>  TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
> @@ -12,14 +12,40 @@ TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
>  TCF_AGENT_LICENSE = BSD-3-Clause
>  TCF_AGENT_LICENSE_FILES = agent/edl-v10.html
>  
> -TCF_AGENT_DEPENDENCIES = util-linux
> +TCF_AGENT_DEPENDENCIES =
>  TCF_AGENT_SUBDIR = agent
>  
> -# there is not much purpose for the shared lib,
> -# if wont be used (unmodifed) outside the tcf-agent application
> -TCF_AGENT_CONF_OPTS = \
> -	-DBUILD_SHARED_LIBS=OFF \
> -	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
> +# There still persists an issue with crosscompiling,
> +# the file agent/Makefile.inc will use the build system arch
> +# OPTS += -DENABLE_arch_$(shell uname -m)

And so, how is this issue fixed ?

Here, the build fails for me, it calls ranlib without arguments:

/home/thomas/projets/buildroot/output/host/bin/arm-linux-ranlib
Usage: /home/thomas/projets/buildroot/output/host/bin/arm-linux-ranlib [options] archive
 Generate an index to speed access to archives
 The options are:
  @<file>                      Read options from <file>
  --plugin <name>              Load the specified plugin
  -D                           Use zero for symbol map timestamp
  -U                           Use actual symbol map timestamp (default)
  -t                           Update the archive's symbol map timestamp
  -h --help                    Print this help message
  -v --version                 Print version information
/home/thomas/projets/buildroot/output/host/bin/arm-linux-ranlib: supported targets: elf32-littlearm elf32-bigarm elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex
make[2]: *** [Makefile:53: obj/GNU/Linux/arm/Debug/libtcf.a] Error 1
make[1]: *** [package/pkg-generic.mk:224: /home/thomas/projets/buildroot/output/build/tcf-agent-1.7.0/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

Here is the defconfig that I have used:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_TCF_AGENT=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
