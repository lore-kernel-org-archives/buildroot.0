From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 31 Jan 2018 10:33:09 +0000
Subject: [Buildroot] [PATCH v2] gcc: Build libgcc with
 BR2_TARGET_OPTIMIZATION flags
In-Reply-To: <20180118165639.2154-1-abrodkin@synopsys.com>
References: <20180118165639.2154-1-abrodkin@synopsys.com>
Message-ID: <1517394789.17823.36.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2018-01-18 at 19:56 +0300, Alexey Brodkin wrote:
> libgcc gets built very early and what's more it is built not by
> "normal" cross gcc later found in "output/host/usr/bin" but by
> gcc's own bare-minimal version: output/build/host-gcc-xxx/build/./gcc/xgcc.
> 
> Which in the end means BR2_TARGET_OPTIMIZATION is not applied to
> cross-compiler via toolchain wrapper.
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

Any comments on this one? If not please consider applying.

-Alexey
