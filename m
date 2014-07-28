From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 23:12:27 +0200
Subject: [Buildroot] [PATCH] gcc: explicitly use CFLAGS_FOR_TARGET
 instead of --enable-target-optspace
In-Reply-To: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
References: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140728231227.298a3882@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 14 Jul 2014 19:29:46 +0400, Alexey Brodkin wrote:
> Due to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=2222 it's impossible
> to specify custom CFLAGS_FOR_TARGET, it is alway gets overriden with values
> from "config/mt-ospace":
> ===========
>  CFLAGS_FOR_TARGET = -g -Os
>  CXXFLAGS_FOR_TARGET = -g -Os
> ===========
> 
> But in some situations it's required to pass custom flags on buildong of libgcc:
>  * Default flags "-g -Os" lead to build isses as with PowerPC on gcc 4.5
> (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810)
>  * Particular CPU requires specific instructions for HW support
>  * Deep optimizations
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

I found the commit log quite difficult to understand actually. It
lacked a bit of context like:

"""
The gcc.mk file is passing --enable-target-optspace to gcc configure
script, to ask for space-optimized (-Os) target libraries. However,
passing this option has the effect of overriding any custom
CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.
"""

And then go on with your explanation. Also, apparently, using "======="
in the middle of a commit log confuses patchwork a bit:
http://patchwork.ozlabs.org/patch/369672/.

> diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
> index db84d18..0543574 100644
> --- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
> +++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
> @@ -46,4 +46,17 @@ ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>  HOST_GCC_INTERMEDIATE_INSTALL_OPT += install-target-libgcc
>  endif
>  
> +ifeq ($(ARCH),powerpc)
> +ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> +	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
> +	# Workaround until it's fixed in 4.5.4 or later
> +	HOST_GCC_INTERMEDIATE_CONF_ENV += CFLAGS_FOR_TARGET="-g -O2"
> +	HOST_GCC_INTERMEDIATE_CONF_ENV += CXXFLAGS_FOR_TARGET="-g -O2"
> +endif
> +else
> +	# Defaults are "-g -Os" from "config/mt-ospace"
> +	HOST_GCC_INTERMEDIATE_CONF_ENV += CFLAGS_FOR_TARGET="-g -Os"
> +	HOST_GCC_INTERMEDIATE_CONF_ENV += CXXFLAGS_FOR_TARGET="-g -Os"
> +endif

The original --enable-target-optspace is passed at *all* gcc steps, but
now you're passing CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET only at
the gcc intermediate step. This looks weird.

Also, since we can actually customize this option, what about using the
ones from Buildroot, i.e something such as:

	HOST_GCC_CONF_ENV += CFLAGS_FOR_TARGET="$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)"
	HOST_GCC_CONF_ENV += CXXFLAGS_FOR_TARGET="$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)"

Maybe we could even just use $(TARGET_CFLAGS) and $(TARGET_CXXFLAGS),
though I'm a bit less sure about all the possible consequences.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
