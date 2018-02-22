From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 22 Feb 2018 10:04:54 +0100
Subject: [Buildroot] [PATCH v2 0/3] llvm for mesa3d
In-Reply-To: <CAEj2-1Mg73ZORc95J8-athRuZnmOs-j+n05tG-O_gmc7=8801A@mail.gmail.com>
References: <20180219171805.13769-1-valentin.korenblit@smile.fr>
 <CAEj2-1Mg73ZORc95J8-athRuZnmOs-j+n05tG-O_gmc7=8801A@mail.gmail.com>
Message-ID: <9231fc3b-1943-bbab-3377-5de5e87a60a3@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/02/2018 21:55, Andre Renaud wrote:
> Hi Valentin,
> Thanks for these patches - I've been looking at getting the llvmpipe 
> mesa3d driver going on the Dragonboard 410C, which uses the freedreno 
> driver. The work you've done here gets me very close, but I'm having 
> one last issue I thought you might know something about.
>
> I'm having to patch in a change to enable this for AARCH64 on top of 
> the changes that you've made, but it looks like I'm ending up with the 
> LLVM tools generating output for the host architecture, 
> x86_64-unknown-linux-gnu, rather than the target architecture. As such 
> I'm getting the "No available targets are compatible with this triple" 
> error when llvmpipe gets initialised.
>
Hi Andre,

Today I will start working on aarch64, so I'll check that. I guess that 
error should be related to TARGETS_TO_BUILD.
> The changes I made to enable compilation were:
> --- a/package/llvm/Config.in2018-02-22 09:49:46.635210136 +1300
> +++ b/package/llvm/Config.in2018-02-21 11:49:39.638970682 +1300
> @@ -3,11 +3,12 @@
> # 
> http://llvm.org/docs/GettingStarted.html#host-c-toolchain-both-compiler-and-standard-library
> # http://llvm.org/docs/GettingStarted.html#local-llvm-configuration
> depends on BR2_HOST_GCC_AT_LEAST_4_8
> -default y if BR2_i386 || BR2_x86_64
> +default y if BR2_i386 || BR2_x86_64 || BR2_aarch64
> ?config BR2_PACKAGE_LLVM_TARGET_ARCH
> string
> default "X86" if BR2_i386 || BR2_x86_64
> +default "AArch64" if BR2_aarch64
> ?config BR2_PACKAGE_LLVM
> bool "llvm"
>
Your changes are ok, it shouldn't be necessary to do other 
modifications, but I haven't tested it yet.
> In addition I've tried tinkering with LLVM_NATIVE_ARCH, and 
> LLVM_TARGET_TRIPLE_ENV, but haven't had much luck.
>
> I don't suppose you have any thoughts on what I might have missed? I'm 
> assuming that there is some confusion over the host llvm vs. the 
> target. I appreciate that your initial patch targeted x86 only, so if 
> you're still working on the ARM support then it may be easiest if I 
> wait on that.
 ?I will keep you up to date.
>
> Regards,
> Andre
>
> On Tue, 20 Feb 2018 at 06:18 Valentin Korenblit 
> <valentin.korenblit at smile.fr <mailto:valentin.korenblit@smile.fr>> wrote:
>
>     Hello all,
>
>     This series provides LLVM support for Mesa3d, enabling
>     llvmpipe software rasterizer.
>
>     It must be considered that it does not provide a full LLVM
>     installation for the host, only the necessary components to
>     cross-compile LLVM for the target. It will install all target
>     components as libLLVM.so.
>
>     Changes in v2:
>
>     The series has been simplified:
>
>     *Build only backend for target architecture by default.
>
>     *Support for AMDGPU(PATCH 3/4 in v1) was removed because I cannot test
>     it currently.
>
>     *Host: make options modified to build only llvm-config and llvm-tblgen
>     (reduces drastically build time for host).
>
>     *Target: support only x86 currently (tested), I will test on ARM soon.
>
>
>     The idea is to add incrementally more options to configure LLVM as
>     soon
>     as I can test them.
>
>     Regards,
>
>     Valent?n
>
>
>     Romain Naour (3):
>     ? package/llvm: new host package
>     ? package/llvm: enable target variant
>     ? package/mesa3d: enable llvm support
>
>     ?package/Config.in? ? ? ? ? ?|? ?1 +
>     ?package/Config.in.host? ? ? |? ?1 +
>     ?package/llvm/Config.in? ? ? |? 19 +++
>     ?package/llvm/Config.in.host |? ?8 +
>     ?package/llvm/llvm.hash? ? ? |? ?2 +
>     ?package/llvm/llvm.mk <http://llvm.mk> ? | 360
>     ++++++++++++++++++++++++++++++++++++++++++++
>     ?package/mesa3d/Config.in? ? |? ?8 +
>     ?package/mesa3d/mesa3d.mk <http://mesa3d.mk> ? |? 18 ++-
>     ?8 files changed, 414 insertions(+), 3 deletions(-)
>     ?create mode 100644 package/llvm/Config.in
>     ?create mode 100644 package/llvm/Config.in.host
>     ?create mode 100644 package/llvm/llvm.hash
>     ?create mode 100644 package/llvm/llvm.mk <http://llvm.mk>
>
>     --
>     2.14.3
>
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>

Best regards,

Valent?n

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180222/011265c0/attachment.html>
