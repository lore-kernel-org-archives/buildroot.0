From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 20:22:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <20191109213357.GP3419@scaer>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
 <20191109120151.GO3419@scaer>
 <569eeff2-f02f-3506-5cdc-1f02a8e3c325@gmail.com>
 <20191109213357.GP3419@scaer>
Message-ID: <2260300d-96e1-c557-e1e4-106d06db3edd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/11/2019 22:33, Yann E. MORIN wrote:
> Romain, All,
> 
> On 2019-11-09 14:09 +0100, Romain Naour spake thusly:
>> Le 09/11/2019 ? 13:01, Yann E. MORIN a ?crit?:
>>> On 2019-11-09 11:40 +0100, Romain Naour spake thusly:
>>>>>   mips64el   |        host-llvm-9.0.0         | http://autobuild.buildroot.net/results/d3aa03ca7085727d0794228178c7744859900137
>>>> This is weird since mips is not (yet) supported by Buildroot's llvm package (see
>>>> BR2_PACKAGE_LLVM_ARCH_SUPPORTS).
>>>>
>>>> host-llvm dependency seems trigged by another package at Makefile level without
>>>> being llvm/clang at Kconfig level.
>>>>
>>>> Yann, the issue seems related to qt5tools for Qt 5.12 [1].
>>>> Since it now depends on libclang, BR2_PACKAGE_QT5TOOLS_QDOC_TOOL must depends on
>>>> BR2_PACKAGE_LLVM_ARCH_SUPPORTS (at least).
[snip]
>> But since we use the same LLVM_TARGET_ARCH for the host-llvm and llvm, we need
>> to use -target x86_64-linux-gnu when using clang.
> 
> But if there is no target llvm built, we could just fallback to the host
> machine, then, no?

 That would be by intuition as well.

 But looking at the details, I don't see the light yet...

 There are actually three variables that contain the target:

LLVM_TARGET_ARCH
LLVM_TARGETS_TO_BUILD
LLVM_DEFAULT_TARGET_TRIPLE

LLVM_TARGETS_TO_BUILD is easy: we should just always make sure that it contains
the host in addition to the target.

 For the other two, I guess we could default them to host if target is not
supported. However, that gives the weird situation that the default target
(which I guess is the meaning of LLVM_TARGET_ARCH) is sometimes the host and
sometimes the target... That feels... weird...

 So maybe it would make more sense to set the defaults to the host architecture
in host-llvm, and always require explicit cross-compilation options.

 Note that that also means that in host-clang, we shouldn't set
CLANG_DEFAULT_LINKER=$(TARGET_LD) - instead the linker should always be
specified explicitly when cross-building.


 Regards,
 Arnout
