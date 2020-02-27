From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 27 Feb 2020 21:56:09 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5tools: mark qdoc option as
 broken
In-Reply-To: <20200227090339.344f8d3e@windsurf>
References: <20200226232237.292826-1-romain.naour@smile.fr>
 <15341_1582786313_5E576709_15341_100_1_20200227065151.GA3323@r-lnx-nyma7486-2>
 <20200227090339.344f8d3e@windsurf>
Message-ID: <6ae3e6e0-1611-de5a-1f4f-cfd9b9d89e32@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Thomas,

Le 27/02/2020 ? 09:03, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 27 Feb 2020 07:51:51 +0100
> <yann.morin@orange.com> wrote:
> 
>>> So in the current state, host-clang is added to qt5tools
>>> dependency without taking into account BR2_PACKAGE_LLVM_ARCH_SUPPORTS.  
>>
>> Then when don't we simply add that depednency instead of hiding it
>> behind BROKEN?
> 
> I think the idea was that since BR2_PACKAGE_LLVM_ARCH_SUPPORTS only
> exposes whether the target architecture is supported by LLVM, it does
> not make sense to use that, and for now, we don't have an option to
> indicate that the the host architecture is supported by LLVM.

Indeed. If we add this dependency BR2_PACKAGE_LLVM_ARCH_SUPPORTS for the failing
build below on riscv [1] the qdoc option would be unavailable. Even we only need
to build host-llvm and host-clang.

> 
>>> But even with host native support in llvm/clang host packages, the
>>> host-clang dependency itself increase a lot the build time.
>>>
>>> On a laptop with a i7-8565U CPU @ 1.80GHz, host-llvm takes 1100 sec
>>> (18,3min) to build and host-clang takes 1200 sec (20min) to build.
>>> qt5tools takes 18sec to build.
>>>
>>> Increasing the build time by 40min just for the sake of building qdoc
>>> is not great.  
>>
>> Yes, and so what? If people want to build qdoc because they want to
>> generate documentation for their Qt-based programs, and upstream Qt has
>> decided they need clang, there is not much we can do about that, can we?
>>
>> The build time is no reason to hide away a feature, so there is no
>> reason to reference that in the commit log (it could be a post-commit
>> note, though).
> 
> I agree that the phrasing here is not ideal.

Ok, the patch is too "aggressive" against the qdoc option... But the build time
is certainly important for users. I would suggest to use llvm/clang installed on
the host to avoid spend 40min to build them.

> 
>>> Instead we may consider adding a new check in support/dependencies/dependencies.sh
>>> for llvm/clang installed on the build machine.
>>> This llvm/clang would be used for building qdoc (or mabe other host package).
>>>
>>> But we need to be careful for the case where host-llvm and host-clang
>>> package are already build.
>>>
>>> Then, the qt5tools package would set LLVM_INSTALL_DIR in the
>>> additional environment variables to pass to make in the build step,
>>> to provide the patch to llvm/clang headers and libraries.
>>>
>>> Something like:
>>> define QT5TOOLS_BUILD_CMDS
>>> 	$(TARGET_MAKE_ENV) LLVM_INSTALL_DIR="`/usr/bin/llvm-config --prefix`" \
>>> 		$(MAKE) -C $(@D) sub-src-qmake_all
>>> [...]  
>>
>> All those proposals do not belogn to the commit log, but to a
>> post-commit note, too.
> 
> Not sure here. Post-commit notes are lost. Commit logs are not. So a
> commit log can easily be found by someone who sees the dependency,
> finds it annoying, and wants to find what are the alternative solutions.

That is exactly why I added the proposal here. To suggest something in the
commit log for those who want to generate documentation.

> 
> 
>> Here's my counter-proposal:
>>
>>     config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
>>         bool "qdoc host tool"
>>         # Needs llvm-config and libclang for the host, which is not
>>         # currently supported in Buildroot, unless the target is
>>         # already supported by llvm.
>>         depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> 
> If that works, then that's fine by me.
> 
> What I discussed with Romain yesterday is that I didn't want for
> 2020.02 to do all the work to supports LLVM just for the host (i.e when
> the target architecture is not supported), and wanted a more minimal
> solution.

This is the more minimal solution, but it require to build host-llvm and host-clang.

> 
> If your solution works, fine with me. Romain, Yann, could you
> coordinate to send an updated patch ?

I'm fine for 2020.02.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
