From: Valentin KORENBLIT <valentin.korenblit@smile.fr>
Date: Fri, 16 Feb 2018 15:31:24 +0100
Subject: [Buildroot] [PATCH 0/4] llvm for mesa3d
In-Reply-To: <0d3785ce-032b-330c-d7ff-fb92bcc07f1d@carallon.com>
References: <20180216083606.6472-1-valentin.korenblit@smile.fr>
 <0d3785ce-032b-330c-d7ff-fb92bcc07f1d@carallon.com>
Message-ID: <5fb32f7a-205d-07a9-07bd-f8110259ea2a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi WIll,

On 16/02/2018 10:42, Will Wagner wrote:
> On 16/02/2018 08:36, Valentin Korenblit wrote:
>> Hello all,
>>
>> This series provides LLVM support for Mesa3d, enabling
>> llvmpipe software rasterizer.
>>
>> It must be considered that it does not provide a full LLVM
>> installation for the host, only the necessary components to
>> cross-compile LLVM for the target. It will install all target
>> components as libLLVM.so.
>
> Hi Valentin,
>
> As it happens I've just been updating my patches for llvm as I added 
> it to get radeonsi gallium working in mesa3d. My patches are much 
> messier than your and hence I've never tried to upstream anything.
>
> A couple of overall questions:
>
> Have you only added host-llvm because of llvm-tblgen and llvm-config? 
> llvm will try to build native versions of those for you but I had 
> problems with llvm-tblgen and so had to go to a host package like you. 
> However I only built those two tools with:
>
> HOST_LLVM_MAKE_OPTS = llvm-tblgen llvm-config
>
> It makes the build smaller and faster and it means you don't need to 
> care about almost all of the host conf options.

Correct, host-llvm installs only llvm-tblgen and llvm-config and I agree 
with you that we could use that option for this case.
>
> My other question is about AMDGPU support, you seem to have mixed this 
> up into a number of your patches not just number 3. What are you 
> trying to do here, add an option to build amdgpu as well as the target 
> arch? In my case I wanted to be able to build for only amdgpu and not 
> the target arch as this is what radeonsi needs.
You're right, I should move:

ifeq ($(BR2_PACKAGE_LLVM_TARGET_ARCH_AMDGPU),y)
HOST_LLVM_TARGET_TO_BUILD = "$(HOST_LLVM_TARGET_ARCH);AMDGPU"
endif

to patch 3. Yes, by using this option I limit the targets to build to 
'target_arch + amdgpu' because by default it is set to 'all'.
>
> Regards
> Will
>
Thanks and regards,

Valent?n
