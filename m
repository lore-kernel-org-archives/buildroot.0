From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Mar 2016 21:33:29 +0100
Subject: [Buildroot] [PATCH V3 RESEND 0/5] Add ILP32 support in aarch64
In-Reply-To: <56EEA12F.3040400@huawei.com>
References: <1439428605-17453-1-git-send-email-bamvor.zhangjian@linaro.org>
 <569A60E6.2030108@gmail.com>
 <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
 <569FFB7E.2000104@gmail.com>
 <CAFy1USRK1QDrruMk+icMqELL3MtFZv8KTkDvOHZ9wrAEWNvCJg@mail.gmail.com>
 <56A4B6F0.8080108@gmail.com> <56B014A7.2070808@huawei.com>
 <56B07114.9030404@gmail.com> <56B089D6.4070106@huawei.com>
 <56B09008.8030202@mind.be> <56B26D0A.3000906@gmail.com>
 <56EEA12F.3040400@huawei.com>
Message-ID: <56EF0919.1030309@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bamvor, All,

Le 20/03/2016 14:10, Zhangjian (Bamvor) a ?crit :
> Hi, Romain, Arnout, all
> 
[snip]
>>>
>>>> Do you think it will be accepted after patch of ilp32 of kernel and glibc
>>>> upstream?
>>>
>>>   It doesn't necessarily mean that upstream has to have accepted it already. We
>>> just prefer to have a release tarball.
>>
>> See as example the toolchains provided by Imagination Technologies [1] or
>> Synopsys [2]. All their patches they are using may not upstream yet, but they
>> provide a working toolchain which is pretty well tested.
>>
>> [1] http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
>> [2] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/
> In recent linaro connect, there is a presentation[1] about the performance of
> ilp32.
> And in its homepage[2], there is a script[3] for building the ilp32 compiler.
> At this pointer, are you intertested in review the patches of ilp32 if I send a new
> series?

Thanks for the news about ilp32 support in aarch64.

Since your previous patches doesn't apply anymore on the master branch we have
marked them "Changes requested" in the patchwork. However, I added a new entry
in our TODO list [1] in order to not forget them.

The first problem is: how to build a working ipl32 toolchain ?

* With the abe script I wasn't able to build one due to some build issue with
glibc. Also the abe script was from an experimental/unstable branch.

* With build_ilp32_toolchain.sh script we need to build the toolchain as root
[2] which is not recommended. Also the kernel header is directly imported from
the host machine (from /usr/include). I guess an ilp32 toolchain needs some
specific or modified kernel header in order to support ilp32 based system.

* There is no aarch64 ilp32 prebuild toolchain available.

It seems that the number of patches is quite limited [4], so maybe you can use
the Buildroot internal toolchain infra to build the toolchain, and use a
specific source version for gcc, binutils and glibc and include all needed patches.

Do you know if each ilp32 patches can be easily applied on binutils and glibc
official release ? Otherwise you can simply use the hashes provided by
leapproject wiki [4].
For gcc it's a bit complicated since the patches are for the Linaro GCC 4.9.3,
not sure it will apply/work with a vanilla gcc 4.9.3. Also
gcc-prequisites-aarch64_ilp32-target-autoconf.patch is quite huge and need to be
split into several patches...
But this require a lot of work.

So, in the end, it would be easier if you provide a prebuild ilp32 toolchain
tarball (like Arnout suggest) with your new series.
To answer your question.
Yes, I'm interested in reviewing your ilp32 series but I need a toolchain to
test it :)

Best regards,
Romain

[1] http://elinux.org/Buildroot#Toolchain
[2]
https://github.com/leapproject/ilp32-toolchain/blob/master/build_ilp32_toolchain.sh#L15
[3]
https://github.com/leapproject/ilp32-toolchain/blob/master/build_ilp32_toolchain.sh#L112
[4]
https://wiki.leapproject.ca/index.php?title=AArch64_ILP32_Toolchain#Sources_and_Patches
> 
> Regards
> 
> Bamvor
> 
> [1] http://connect.linaro.org/resource/bkk16/bkk16-305b/
> [2] https://wiki.leapproject.ca/index.php?title=AArch64_ILP32_Toolchain
> [3]
> https://github.com/leapproject/ilp32-toolchain/blob/master/build_ilp32_toolchain.sh
> 
