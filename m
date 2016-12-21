From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 21 Dec 2016 22:42:12 +0100
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery AMD64
 to 2016.11-19
In-Reply-To: <f1436636-46cc-8253-990d-5bb3276b242d@gmail.com>
References: <1482265769-6560-1-git-send-email-romain.naour@gmail.com>
 <20161220215452.447ee8f3@free-electrons.com>
 <9c743fd4-5835-aab9-01e4-17504a409416@gmail.com>
 <20161220221836.672e059b@free-electrons.com>
 <f1436636-46cc-8253-990d-5bb3276b242d@gmail.com>
Message-ID: <578a9e23-be4c-1f1c-748f-fdb8094289fc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/12/2016 ? 22:27, Romain Naour a ?crit :
> Le 20/12/2016 ? 22:18, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> On Tue, 20 Dec 2016 22:15:16 +0100, Romain Naour wrote:
>>
>>>> You don't have qemu-system-x86_64, really ? :-)  
>>>
>>> I can't use it with Qemu even with the current version or this new toolchain.
>>> It doesn't boot at all, I don't even see the first kernel line.
>>>
>>> I'm using a Linux kernel 4.8.13 with qemu-2.4.1-11.fc23 or v2.8.0-rc2-8-gbd8ef50
>>
>> Odd. What CPU variant are you using?
> 
> I'm using BR2_x86_steamroller, Qemu doesn't seems support it.

I switched to BR2_x86_jaguar for testing and it still don't boot with the command line provided in board/qemu/x86_64/readme.txt

So, I tried several Qemu options (-cpu and -M) and some kernel options...
Qemu 2.8.0 -cpu Opteron_G4 option seems interesting.

Finally, I had to try a strange option combination "-cpu Opteron_G4 -enable-kvm" even if my host is not an AMD64 cpu (it's an Intel(R) Core(TM) i5-4670K CPU).

And it boot completely :)

Here is the command line used:
~/git/qemu/x86_64-softmmu/qemu-system-x86_64 -M pc  -kernel test/sourcery-x86-64/images/bzImage -drive file=test/sourcery-x86-64/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user -cpu Opteron_G4 -enable-kvm

Note: Qemu complain about some missing feature
warning: host doesn't support requested feature: CPUID.80000001H:ECX.sse4a [bit 6]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.misalignsse [bit 7]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.3dnowprefetch [bit 8]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.xop [bit 11]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.fma4 [bit 16]

It's almost the same warning without -enable-kvm option
warning: TCG doesn't support requested feature: CPUID.01H:ECX.avx [bit 28]
warning: TCG doesn't support requested feature: CPUID.80000001H:ECX.misalignsse [bit 7]
warning: TCG doesn't support requested feature: CPUID.80000001H:ECX.3dnowprefetch [bit 8]
warning: TCG doesn't support requested feature: CPUID.80000001H:ECX.xop [bit 11]
warning: TCG doesn't support requested feature: CPUID.80000001H:ECX.fma4 [bit 16]

I guess it works with --enable-kvm since my host support CPUID.01H:ECX.avx

It's amazing to see the content of cpuinfo inside Qemu VM: 
# cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 21
model		: 1
model name	: AMD Opteron 62xx class CPU

So, this toolchain seems to work correctly if avx support is present :)
Tested with Qemu 2.8.0 and kernel 4.9 (using board/qemu/x86_64/linux-4.8.config) with BR2_x86_jaguar.

However, it doesn't boot with BR2_x86_steamroller.
warning: host doesn't support requested feature: CPUID.80000001H:ECX.sse4a [bit 6]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.misalignsse [bit 7]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.3dnowprefetch [bit 8]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.xop [bit 11]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.fma4 [bit 16]
warning: host doesn't support requested feature: CPUID.80000001H:ECX.tbm [bit 21]

missing CPUID.80000001H:ECX.tbm on my host it seems...

Best regards,
Romain

> 
> Romain
> 
>>
>> Maybe Gustavo has a clue?
>>
>> Thomas
>>
> 
