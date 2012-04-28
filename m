From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 18:01:42 +0200
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <CAG6aBkVRsBJtcBSf_ZQ84Bf7SffptL7-h9RrJqc8TYLPbef-_A@mail.gmail.com>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <CAG6aBkUJAnhhWH1jF2yPLRHrk_+w3xOeSFwxS6K8U4_Pzu26sw@mail.gmail.com>
 <CAG6aBkVRsBJtcBSf_ZQ84Bf7SffptL7-h9RrJqc8TYLPbef-_A@mail.gmail.com>
Message-ID: <201204281801.42601.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 April 2012 04:56:35 Nigel Sollars wrote:
> Hello Arnout,
> 
> It seems my first reply with regards to the make clean may not have been
> accurate, please see defconfig,

 Please reply to all, to include the list.  I reproduced and minimized your 
defconfig below.  Also avoid top-posting please.

> The new error is ( from the top error cause ):
> 
> target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/cfenv:41:0, 
>    from /usr/local/panda-stuff/buildroot-src/buildroot/output/toolchain/gcc-4.6.3/libstdc++-v3/include/precompiled/stdc++.h:54:
>    /usr/local/panda-stuff/buildroot-src/buildroot/output/build/gcc-4.6.3-target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/fenv.h:36:24:
> fatal error: fenv.h: No such file or directory
> compilation terminated.
[snip]

 I can indeed reproduce this error.  However, after a second (clean) run
it did come through.  I suspect that this is a ccache problem.  Try clearing
your ccache (e.g. removing ~/.buildroot-ccache, or disabling ccache in your
buildroot config) and rebuilding from scratch. Our ccache setup is not 
resilient to changes in the toolchain.  This was discussed before on the
list, but we found no good solution.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


----------- failing defconfig -------------
BR2_arm=y
BR2_cortex_a9=y
BR2_BINUTILS_VERSION_2_22=y
BR2_GCC_VERSION_4_6_X=y
BR2_INSTALL_FORTRAN=y
BR2_PACKAGE_GDB=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_PTHREADS_OLD=y
-------------------------------------------
