From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:49:24 +0200
Subject: [Buildroot] [PATCH 3/3] package/runc: disable for static only
 build
In-Reply-To: <20160708214712.30976a76@free-electrons.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-3-git-send-email-romain.naour@gmail.com>
 <20160708214712.30976a76@free-electrons.com>
Message-ID: <20160724164924.6bd8d256@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 8 Jul 2016 21:47:12 +0200, Thomas Petazzoni wrote:

> I believe this only happens on ARM, because on ARM, Go forces the use
> of -pie, for some reason:
> 
>         pie := (goarch == "arm" && goos == "linux") || goos == "android"
>         if pie { // we need to use -pie for Linux/ARM to get accurate imported sym
>                 cgoLDFLAGS = append(cgoLDFLAGS, "-pie")
>         }
> 
> And static linking + PIE isn't supported by uClibc. But on
> architectures other than ARM, I believe Go doesn't use -pie, so static
> linking with uClibc should work (remains to be tested, though).
> 
> For this reason, I believe your patch is not correct as it disables Go
> packages for static linking on all architectures, while only ARM is
> affected by this problem.
> 
> This is yet another situation which makes me think we should add a
> "BR2_TOOLCHAIN_SUPPORTS_PIE" hidden boolean.

I'll mark your patch as Changes Requested. We instead need a patch at
the BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS level that makes Go packages
unavailable on ARM + uClibc + static linking. To do this, you should
probably use the BR2_TOOLCHAIN_SUPPORTS_PIE option added by
https://patchwork.ozlabs.org/patch/646956/.

Something like:

config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
        bool
        default y
-       depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || ...
+       depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 || BR2_i386 || BR2_x86_64 || ...

Can you send such a patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
