From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 14 Nov 2017 09:00:26 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <20171113203343.GC2861@scaer>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home> <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk> <20171113173611.GB2861@scaer>
 <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
 <20171113203343.GC2861@scaer>
Message-ID: <fbbec566-444f-39de-d23e-6b50de62294e@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 13.11.2017 um 21:33 schrieb Yann E. MORIN:
> On 2017-11-13 19:04 +0100, Wolfgang Grandegger spake thusly:
>> Hello,
>>
>> Am 13.11.2017 um 18:36 schrieb Yann E. MORIN:
>>> Peter, All,
>>>
>>> On 2017-11-13 14:50 +0100, Peter Korsgaard spake thusly:
>>>>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
>>>>    > This means: A symbolic link would work.
>>>> Ok, great - Makes sense. I wonder how much effort it wil be to get
>>>> binutils to generate symbolic links instead of hard links.
>>>
>>> No way.
>>
>> Well, the attached patch fixes the issue with the binary utilities (ld,
>> ar, objdump, as, ...). I think only the fixes in "binutils/Makefile.in" and
>> "gas/Makefile.in" are need, IIRC. And in the fixes did not break the
>> build, at least. Will do more checks...
> 
> Well, what I meant is that there are no --disable-hardlinks on the
> ocnfigure command line.
> 
> And don;t forget that we do have 4 versions of binutils to patch.
> 
> And as Peter said: if we patch, we should try to get that upstreamable.
> Maybe upstream will be receptive to that. Or maybe not. Who knows...
> 
> I think providing a post-install hook is better than patching.

I agree.

> 
>>> We'll have to provide post-install hooks to do the de-hardlinking step
>>> ourselves.
>>
>>> Also, as Wolfgang noticed, gcc is also affected by the hardlink issue.
>>
>> No, with the patch above I get:
>>
>> ./bin/x86_64-buildroot-linux-gnu-gcc-6.4.0.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
>> ./bin/x86_64-buildroot-linux-gnu-g++.br_real: Device: 811h/2065d	Inode: 64370887    Links: 2
>> ./bin/x86_64-buildroot-linux-gnu-gcc.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
>> ./bin/x86_64-buildroot-linux-gnu-c++.br_real: Device: 811h/2065d	Inode: 64370887    Links: 2
>> ./bin/x86_64-buildroot-linux-gnu-cc.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/XBS5_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/POSIX_V6_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/POSIX_V7_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/bin/getconf: Device: 811h/2065d	Inode: 72747785    Links: 4
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/i965_dri.so: Device: 811h/2065d	Inode: 72748076    Links: 2
>> ./x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/i915_dri.so: Device: 811h/2065d	Inode: 72748076    Links: 2
>>
>> The gcc hard links are all in the same directory.
> 
> Right, that's OK.
> 
>> Just "getconf" remains,
>> but the RPATH is already empty.
> 
> And those are binaries for the target, not the host.

Well, but they are treated as host libraries.

Wolfgang.
