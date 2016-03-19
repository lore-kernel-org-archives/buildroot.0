From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:55:15 +0100
Subject: [Buildroot] [PATCH 6/6] linux/perf: build the host perf tool
In-Reply-To: <b5f50fa3c517ddd37dbf339c011f6bf0621f55ac.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
 <b5f50fa3c517ddd37dbf339c011f6bf0621f55ac.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <20160319145515.32875737@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 11 Mar 2016 19:19:59 +0100, Yann E. MORIN wrote:
> Currently, we only build the target variant of the perf tool. However,
> perf on the target may generate a bunch of data files that may have to
> be analysed on the host.
> 
> There is no host-variant of the linux-tools infrastructure, so we just
> build the host perf at the same time we build the target one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

First of all, I have to say I hate this target package that builds and
installs host stuff. But, since I don't have a better solution to
offer, and it's anyway not the only package in this case (qt/qt5 are
also target packages, and they install stuff in host), I'm fine with
the general approach.

I have some comments about the details, though.

> ---
>  linux/Config.tools.in    |  4 ++++
>  linux/linux-tool-perf.mk | 51 ++++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> index 24ef8cd..a01b53e 100644
> --- a/linux/Config.tools.in
> +++ b/linux/Config.tools.in
> @@ -26,4 +26,8 @@ config BR2_LINUX_KERNEL_TOOL_PERF
>  
>  	  https://perf.wiki.kernel.org/
>  
> +config BR2_LINUX_KERNEL_TOOL_HOST_PERF
> +    bool "host-perf"
> +    depends on BR2_LINUX_KERNEL_TOOL_PERF

Indentation should just tab.

> +# For the host, we inherit the same flags as for the target,
> +# overriding just those that are needed.

I don't really understand this, it seems really weird to me, and I
would find it much more future proof to have separate target and host
flags. Otherwise, any addition of a flag to the target variant can
break in subtle way the host variant.

> +HOST_PERF_MAKE_FLAGS = \
> +	$(PERF_MAKE_FLAGS) \
> +	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/elfutils" \

We don't have this -I for the target variant. Why do we need it for the
host variant?

> +	LDFLAGS="$(HOST_LDFLAGS)" \
> +	LD="$(HOSTLD)" \
> +	ARCH=$(PERF_ARCH) \
> +	CROSS_COMPILE= \
> +	DESTDIR=$(HOST_DIR)
> +
> +# No host-packages in Buildroot, but we don't let it depend on the
> +# libraries provided by the host system (they may be there or not,
> +# depending on the user's system, but we won't play that game).

This sentence is not really clear IMO. What about:

# For the following optional dependencies of perf, Buildroot doesn't
# provide any host package, and we don't want to rely on those
# libraries being provided by the host system.

> +HOST_PERF_MAKE_FLAGS += \
> +	NO_SLANG=1 \
> +	NO_LIBUNWIND=1 \
> +	NO_LIBNUMA=1 \
> +	NO_LIBELF=1 NO_DWARF=1
> +
>  # The call to backtrace() function fails for ARC, because for some
>  # reason the unwinder from libgcc returns early. Thus the usage of
>  # backtrace() should be disabled in perf explicitly: at build time
> @@ -49,6 +69,7 @@ endif
>  # instead of the complete backtrace.
>  ifeq ($(BR2_arc),y)
>  PERF_MAKE_FLAGS += NO_BACKTRACE=1
> +HOST_PERF_MAKE_FLAGS += NO_BACKTRACE=1

Why ?

>  endif
>  
>  ifeq ($(BR2_PACKAGE_SLANG),y)
> @@ -76,14 +97,14 @@ PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -PERF_DEPENDENCIES += zlib
> +PERF_DEPENDENCIES += zlib host-zlib

This is the part I'm really not a big fan of. You enable a target
package, and it affects the configuration of a host package. Not nice.

Is there an actual connection between zlib/xz support in the target
perf and the need to have it in host-perf? Like is zlib/xz support used
to compress the data output by the target perf, which needs to be
uncompressed by the host perf ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
