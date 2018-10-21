From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 23:35:56 +0100
Subject: [Buildroot] [PATCH v2] gcc: Build libgcc with
 BR2_TARGET_OPTIMIZATION flags
In-Reply-To: <20180118165639.2154-1-abrodkin@synopsys.com>
References: <20180118165639.2154-1-abrodkin@synopsys.com>
Message-ID: <77954d04-08f7-bdda-8c95-fd87b2509e85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?Hi Alexey,

?Sorry for the extremely late feedback...


On 18/01/2018 16:56, Alexey Brodkin wrote:
> libgcc gets built very early and what's more it is built not by
> "normal" cross gcc later found in "output/host/usr/bin" but by
> gcc's own bare-minimal version: output/build/host-gcc-xxx/build/./gcc/xgcc.
>
> Which in the end means BR2_TARGET_OPTIMIZATION is not applied to
> cross-compiler via toolchain wrapper.

?TBH I don't like this BR2_TARGET_OPTIMIZATION option too much, it's too
unpredictable, but indeed it is sometimes the only way to fix something.

>
> But given libgcc is an essential target executable we may want it to
> be built with the same "optimization" flags as all other libs and binaries.
>
> Technically this is doable with TARGET_ABI which is added to TARGET_CFLAGS
> but user cannot [or at least is not supposed to] modify TARGET_ABI as it
> is used for tunign for a particular platform.
>
> But still there might be a need to compile everything for tha target with
> a special compiler option and this change allows for that.
>
> For eaxmple ARC still doesn't have properly working link-time relaxation
> which requires us to compile everything properly from the beginning, otherwise
> we may face a situation when huge apps/libs like Qt5WebKit might fail to pass
> the final linkage because some symbols might be too far from each other as
> by default gcc will try to use shorter relocations. Solution is as simple as
> rebuild of everything with "-mlong-calls" so that all the symbols are
> compiled with full 32-bit relocations. And now only libgcc causes problems
> because it contains quite a few symbols used widely by other binaries like
> millicode, some math stuff etc.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>
> Changes v1 -> v2:
>  * Strip quotes from BR2_TARGET_OPTIMIZATION
>    Didn't notice a problem with 1 option in BR2_TARGET_OPTIMIZATION
>    but if another one is added libgcc configuration fails because:
>    CFLAGS_FOR_TARGET="-xxx "-yyy -zzz"" and thus
>    /bin/sh: -zzz: command not found
>
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 27fc1e987c..431f534f56 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -109,7 +109,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  HOST_GCC_COMMON_CONF_ENV = \
>  	MAKEINFO=missing
>  
> -GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
> +GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
?This looks good to me, but...
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)

... shouldn't it be added here as well, for libstdc++?


?Regards,
?Arnout


>  
>  # Propagate options used for target software building to GCC target libs
