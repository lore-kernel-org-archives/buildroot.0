From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jun 2019 22:13:34 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: fix build without ssp on x86_64
In-Reply-To: <20190601133413.GG3407@scaer>
References: <20190525222209.14372-1-fontaine.fabrice@gmail.com>
 <d0c26970-8d47-c56f-3491-f636348b674d@mind.be> <20190601133413.GG3407@scaer>
Message-ID: <a558a009-3159-d138-6b3a-7f8db4a7f8b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2019 15:34, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2019-05-26 20:20 +0200, Arnout Vandecappelle spake thusly:
>> On 26/05/2019 00:22, Fabrice Fontaine wrote:
>>> Makefile tries to detect stack-protector which will result in build
>>> failure on x86_64 if ssp is not available on host compiler so disable
>>> stack protector through EXTRA_CFLAGS
>>
>>  I would like to actually understand the failure though... The error is:
>>
>> /usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
>> .../x86/realmode.c:104: undefined reference to `__stack_chk_fail'
>>
>>  However, realmode.c is built with
>>
>> gcc  -mno-red-zone -m32 -O1 -g -MMD -MF x86/.realmode.d  -Wall -Wwrite-strings
>> -Wclobbered -Wempty-body -Wuninitialized -Wignored-qualifiers
>> -Wunused-but-set-parameter  -fno-omit-frame-pointer    -Wno-frame-address
>> -fno-pic  -no-pie -Wmissing-parameter-type -Wold-style-declaration
>> -Woverride-init -std=gnu99 -ffreestanding -I
>> /data/buildroot/buildroot-test/instance-1/output/build/kvm-unit-tests-kvm-unit-tests-20171020/lib
>> -I
>> /data/buildroot/buildroot-test/instance-1/output/build/kvm-unit-tests-kvm-unit-tests-20171020/lib/x86
>> -I lib   -c -o x86/realmode.o x86/realmode.c
>>
>>  So, stack-protector is *not* enabled... So what the hell is going on here?
>>
>>  It seems to only happen on Xogium's Arch Linux server. Maybe there's something
>> weird going on with that server?
> 
> That's because:
> 
>   - kvm-unit-tests, on x86_64 target, uses the host compiler to build:
>     https://git.buildroot.org/buildroot/tree/package/kvm-unit-tests/kvm-unit-tests.mk#n34
> 
>   - Xogium's autobuilder is running Arch Linux, which enables SSP by
>     default, yes.

... and it does that in a way that is incompatible with -nostdlib, apparently?

 Ubuntu also enables stack-protector by default (since 12.10 I think), so why
doesn't it happen on Ubuntu?

 Smells like a broken distro to me...

 Xogium, could you investigate this? Or someone else with Arch?

 Regards,
 Arnout
