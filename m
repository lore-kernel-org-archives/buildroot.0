From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 7 Nov 2019 22:22:40 +0100
Subject: [Buildroot] [RFC PATCH v2 05/30] llvm: add config to build
 backend for host arch
In-Reply-To: <9fb7d609-fba3-7a5d-6f41-7c7123f9c71d@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-6-michael.drake@codethink.co.uk>
 <59ddb71c-d7e4-c314-3d19-d28d8fea68cd@mind.be>
 <fa174a39-24ea-3b27-fb67-68a431863df7@mind.be>
 <9fb7d609-fba3-7a5d-6f41-7c7123f9c71d@codethink.co.uk>
Message-ID: <6334e8c9-b415-c297-3f18-bcaa3a5262f5@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/11/2019 ? 13:02, Thomas Preston a ?crit?:
> +Romain Naour, as we discussed this on the #buildroot channel yesterday. 
> 
> Hi all,
> 
> On 19/10/2019 23:20, Arnout Vandecappelle wrote:
>> On 20/10/2019 00:04, Arnout Vandecappelle wrote:
>>> On 17/10/2019 17:29, Michael Drake wrote:
>>>> From: Joseph Kogut <joseph.kogut@gmail.com>
>>>  We need a bit more explanation why this option is useful/needed.
>>>
>>>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>>>> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
>>>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>>
>>  I think I should clarify my review a little...
>>
>>  I think this should be split into two patches, where I doubt the second one is
>> relevant:
>>
>> 1. Add the host arch as a target for the host-llvm build. I think this can be
>> done unconditionally, which makes the patch a whole lot simpler.
>>
>> 2. Add a Config.in.host option for llvm. This is only useful if you want to use
>> host-llvm outside of Buildroot, in a post-build/image script. I don't think this
>> is the case.
>>
>>  If the patch is reduced to the first bit, then I think the
>> BR2_PACKAGE_HOST_LLVM_HOST_ARCH symbol (the only bit remaining in
>> Config.in.host) should move to Config.in. And the change to the .mk file becomes
>> very simple, as I indicated.
>>
> 
> We agree that the above changes simplify this patch, and have rolled them in. Thanks!
> 
> We had an issue yesterday where this didn't actually allow LLVM to build for the host
> architecture, but rebuilding all of the LLVM packages fixed that:
>     
>     host-llvm, host-clang, host-lld
>     
> We also have to explicitly use lld, as clang tries to use the
> arm-buildroot-linux-gnueabihf-ld linker. We noticed this is turned off in
> llvm.mk:
> 
>     HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
> 
> Is there still a reason for this now that host-lld exists?

For now, lld is not yet used as C and C++ linker. Only the host-lld package was
added but we need to check/modify the infrastructure to be sure to use ldd
instead of the GNU ld.

> 
> Many thanks,
> Thomas
> 
> P.s. Here is some working output:
>     
> $ codethink/docker-run.sh ./output/host/bin/llc --version
> 
> LLVM (http://llvm.org/):
>   LLVM version 9.0.0
>   Optimized build.
>   Default target: arm-buildroot-linux-gnueabihf
>   Host CPU: znver1
> 
>   Registered Targets:
>     arm     - ARM
>     armeb   - ARM (big endian)
>     thumb   - Thumb
>     thumbeb - Thumb (big endian)
>     x86     - 32-bit X86: Pentium-Pro and above
>     x86-64  - 64-bit X86: EM64T and AMD64
> 
> $ ./codethink/docker-run.sh output/host/bin/clang -target x86_64-linux-gnu -fuse-ld=/mnt/output/host/bin/ld.lld -o hello hello.c

Indeed, you need to provide the -target flag to clang in order to compile for
the host machine. By default clang build for the target.

> 
> $ ./hello
> Hello, world

Nice!

Best regards,
Romain


> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
