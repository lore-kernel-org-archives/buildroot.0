From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:44:47 +0200
Subject: [Buildroot] [PATCH] pixman: properly enable/disable ARM
 optimizations
In-Reply-To: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160827144447.7fd4775e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 22:44:58 +0200, Thomas Petazzoni wrote:
> The pixman ARM optimized code assumes that ARM instructions are
> available. Unfortunately, the configure.ac checks do not detect that the
> platform is Thumb-only for Cortex-M builds, so it enables the ARM
> optimizations, leading to failures like:
> 
> error: /home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libpixman-1.a(pixman-arm-simd-asm-scaled.o): Conflicting CPU architectures 13/1
> 
> When building programs linked with pixman on Thumb-only
> architectures. This is due to the fact that some object files in
> libpixman-1.a are built for the ARM instruction set.
> 
> To resolve this, we give better hints to the pixman configure script
> about which ARM optimizations to use: the ARM SIMD optimizations need at
> least a CPU that supports ARM instructions, and obviously the ARM NEON
> optimizations need NEON support.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/54bee2ce382fcd067965d30f758f9d15514478d9/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pixman/pixman.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied to master, after adding a comment above the --enable-arm-simd
option, as suggested by Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
