From: =?UTF-8?B?fH7bnn58IGRlbW9uaWFyayB8ftuefnwg?= <demoniark@gmail.com>
Date: Sun, 16 Mar 2014 18:18:12 +0000
Subject: [Buildroot] USE_BX=n on armv4 generate bx instruction
In-Reply-To: <CAA3gGbmb58DMdD2_rbD9_UdHR+64J-yTECDMbAt11OZddeGTSg@mail.gmail.com>
References: <CAA3gGbm=kiMxE3S79dzUgF0jF7QiC+SLfGNhi7qAu2Qynt1E9A@mail.gmail.com>
 <20140214094259.2117f172@skate>
 <CAA3gGbmb58DMdD2_rbD9_UdHR+64J-yTECDMbAt11OZddeGTSg@mail.gmail.com>
Message-ID: <CAA3gGbk5ZYVXj5+Wgd6_MX7COS2tBm+mezFctxDn7Mx1=0gnbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With different google search I found that armv4l isn't EABI compliant. In
fact, according to this document [1] and this old document [4], EABI has to
generate thumb instructions. So GCC devs make a workaround to fix
compatibility with armv4l cpus, two linker options, '--fix-v4bx' &
'--fix-v4bx-interwork'. In my other compilation I tryed to pass this
options by adding '-Xlinker' in the CFLAGS_OPTIMIZATION of buildroot
without succes. I suppose it is due to a GCC bug and found a patch for it
[2]

Here are my last build results.
I download buildroot v 2014.02 (stable), copy my work around [0] in
package/uclibc/0.9.33.2/uclibc-0999-thumb-interwork-for-armv4.patch ,
paste the gcc patch[2] in
package/gcc/4.8.2/0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
,
compile with buildroot options:
BR2_TARGET_OPTIMIZATION="-pipe -marm -mno-thumb-interwork -march=armv4
-mtune=fa526 -Wl,--fix-v4bx,--fix-v4bx-interworking"
BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-interwork"

When I disassemble some binaries on the target file system there are some
bx instructions but I think there don't seem to be used.
So, now, my nas is fully operational! Dropbear, mdadm, lvm, cryptsetup, as
exemple [3]:
root at nas ~ % cryptsetup benchmark
# Tests are approximate using memory only (no storage IO).
PBKDF2-sha1 9781 iterations per second
PBKDF2-sha256 6619 iterations per second
PBKDF2-sha512 2136 iterations per second
PBKDF2-ripemd160 9051 iterations per second
PBKDF2-whirlpool 724 iterations per second
[...]

I will try again asap with a new toolchain with the above modifications.
Should I submit uclibc and gcc bugreport?
How can I be more precise on my compilation option to found the right one?
Is there a way to pass CFLAGS on the full toolchain and not only after the
final-gcc compilig (case of target_optimization)?

[0] modified: http://paste.debian.net/86598/
[1]
http://downloads.tmuniz.com/diversos/livros/readonline/CLFS-EMBEDDED-GIT-0.0.1-20130812/arm/cross-tools/abi.html
[2]
https://github.com/openembedded/oe-core/blob/master/meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
[3]
https://paste.ydct.org/?0151916d653c5d2a#Nx/Uu9Gt9l0poSoV2Ig+CMfx7LAKFRHnhzOnBUZFVec=
[4] http://www.lwithers.me.uk/usr/src/arm-eabi-on-armv4/


Configs files used:
(I downgrade to kernel 3.8 to be able using openwrt's drivers patches for
my ib-nas4220)
buildroot:
https://paste.ydct.org/?e85b029190ae899e#u8zTzKBDuVy4GVy9ZHr6ljyq+jnYL6EruzM4ZHK7d7Y=
uclibc:
https://paste.ydct.org/?3aacb7b76d644cbe#a+rvJ8Y3j71JfjvL+KQLWKIzoBf2Vo+YWCkRVgqK40I=
kernel3.8:
https://paste.ydct.org/?1ab3561e7ecd4be1#WquwyUDGcal5+s1aKdxEvtmCP/yN6LC2UJswNXGDbTw=
busybox:
https://paste.ydct.org/?710bef0b5eddb2c5#a+ofoJY7PJzu4qH5uzmvm5WRiHK/6Pm6r6azfAzaH1k=



2014-03-05 1:36 GMT+00:00 |~?~| demoniark |~?~| <demoniark@gmail.com>:

> Thanks for your answer, and sorry for the late reply but I ran through a
> lot of compiling during the last days to understand exactly what is h
> appening.
> I'm now using the buildroot version that do you recommended to me. Without
> any changes the result is not the one I expected...
>
> On my last try I wrote a quick patch[0] and pasted it in
> buildroot-2014.02-rc1/package/uclibc/
> 0.9.33.2/uclibc-0999-thumb-interwork-for-armv4.patch.
> I changed buildroot BR2_TARGET_OPTIMIZATION="-pipe" for
> BR2_TARGET_OPTIMIZATION="-pipe -mno-thumb-interwork -marm
> -D__LINUX_ARM_ARCH__=4 -march=armv4 -mtune=fa526 -msoft-float"
> and set uclibc flag UCLIBC_EXTRA_CFLAGS="-march=armv4 -mtune=fa526"
>
> The results are close to those expected. I ran some  tools to check 'bx'
> and 'thumbs' instructions (arm-linux-objdump -S,  readelf -d):
> % grep 'bx\|Disassembly' *.asm
> busybox.asm:Disassembly of section .text:
> busybox.asm:   81764:    e12fff13     bx    r3
> busybox.asm:   81770:    e12fff1e     bx    lr
> [...]
> libc.asm:Disassembly of section .text:
> libc.asm:   42484:    e12fff1e     bx    lr
> libc.asm:   424c4:    e12fff1e     bx    lr
> libc.asm:   42970:    e12fff1e     bx    lr
> libc.asm:   42d90:    e12fff1e     bx    lr
> (full output[1])
>
> I think this is not the right way to proceed, but it allowed me to see the
> different options to pass to the toolchain/CFLAGS wich make the system
> operational.
> So when my nas4220 boots on this generated kernel and root filesystem
> everythink seems to be ok (except drivers but that's another story).
>     Welcome to Buildroot
>     nas login: root
>     Password:
>     # uname -a
>     Linux nas 3.12.10 #1 Tue Mar 4 01:04:41 UTC 2014 armv4l GNU/Linux
>     # busybox | head -1
>     BusyBox v1.22.1 (2014-03-03 21:10:48 UTC) multi-call binary.
>     #
>
> From what I understand here buildroot does not pass
> '-mno-thumb-interwork' option to gcc when compiling for armv4 cpu. I tried
> to wrote a patch for builroot but without success. I assume that uclibc
> needs to be patched to because buildroot CFLAGS doesn't seem to affect
> uclibc CFLAGS.
>
> Is the approach correct? Does anyone has a clue on how to proceed?
>
> Thanks in advance.
>
> Here are my config files:
> uclibc:
> https://paste.ydct.org/?6e6c16ca059e6f1f#xXIFmMsmGE1T4Q+ym2fxKx2m+JmVJeqqLOhf2Mkb9JU=
> kernel:
> https://paste.ydct.org/?5f6bc06098ca8cef#wzu7HLm1pwhEFTmfkJPCq+bAgD7qO/vIalSH+C+5/Co=
> busybox:
> https://paste.ydct.org/?8d240d1975706482#P4783MWLYaI1jAAmBYdhyDrfrP9QNqJRl4OsxEscpa0=
> buildroot:
> https://paste.ydct.org/?d028b977eaae5c8c#tW5YeRIj1WWfonL7UNIdV9JJcXiN1aPdCqt9S1d3Jd4=
>
> [0] http <http://paste.debian.net/hidden/5e5c72f6/>
> ://paste.debian.net/hidden/5e5c72f6/<http://paste.debian.net/hidden/5e5c72f6/>
> [1] http://paste.debian.net/hidden/1f9230ae/
>
>
> 2014-02-14 8:42 GMT+00:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
>
> Dear |~?~| demoniark |~?~|,
>>
>> On Fri, 14 Feb 2014 00:02:18 +0100, |~?~| demoniark |~?~| wrote:
>> > I'm tring to self compile a system for my ib-nas-4220-b which embed a
>> fa526
>> > cpu.
>> > I'm using buildroot v2013.11 with compiling kernel 3.12.
>> > My configs files are here:
>> > buildroot config:
>> >
>> https://paste.ydct.org/?d7d79d21da6e34dc#cIrSeqbdDpbAvA3d55DoH36Eb417bDysMEjmtaYaaZU=
>> > busybox config:
>> >
>> https://paste.ydct.org/?a1a61121ae4be30f#cBDY3H89/m4owEwtCO0Mv6nI0WFhScBuwJ92V/zyOPE=
>> > kernel config:
>> >
>> https://paste.ydct.org/?a3035f3c2a153083#w7dWY4LuBgoSMXDWn7alrIuueR1x+Gc75Rt6nlZLS2I=
>> > uclibc config:
>> >
>> https://paste.ydct.org/?91bbe608fe4be481#JRt/Zd/1I5VOmyYldmUK+2L1fxM0sSHDbplmZxGXPxM=
>> > When I try to boot my kernel with internet found filesystem, the nas
>> boots.
>> > When the nas boot with the filesystem compiled with buildroot I get:
>> > [    4.630000] init (1): undefined instruction: pc=b6f0df40
>> > [    4.640000] Code: e5803180 e5802188 e580c18c e8bd4038 (e12fff1e)
>> > [    4.650000] Kernel panic - not syncing: Attempted to kill init!
>> > exitcode=0x00000004
>> > [    4.650000]
>> > [    4.650000] CPU: 0 PID: 1 Comm: init Not tainted 3.12.1 #2
>> > [    4.650000] Backtrace:
>> > [    4.650000] [<c001119c>] (dump_backtrace+0x0/0x10c) from [<c001153c>]
>> > (show_stack+0x18/0x1c)
>> > [    4.650000]  r6:c7825be0 r5:c0c78de0 r4:c072c728 r3:00000204
>> > [    4.650000] [<c0011524>] (show_stack+0x0/0x1c) from [<c05a3880>]
>> > (dump_stack+0x20/0x28)
>> > [    4.650000] [<c05a3860>] (dump_stack+0x0/0x28) from [<c059f8e0>]
>> > (panic+0x80/0x1d4)
>> > [    4.650000] [<c059f860>] (panic+0x0/0x1d4) from [<c001bf94>]
>> > (do_exit+0x388/0x75c)
>> > [    4.650000]  r3:c7829c40 r2:c7825cd0 r1:00000004 r0:c065552f
>> > [    4.650000]  r7:c0c78e10
>> > [    4.650000] [<c001bc0c>] (do_exit+0x0/0x75c) from [<c001c428>]
>> > (do_group_exit+0x88/0xc4)
>> > [    4.650000]  r7:c7829c40
>> > [    4.650000] [<c001c3a0>] (do_group_exit+0x0/0xc4) from [<c0026018>]
>> > (get_signal_to_deliver+0x40c/0x458)
>> > [    4.650000]  r4:c7826000 r3:80000013
>> > [    4.650000] [<c0025c0c>] (get_signal_to_deliver+0x0/0x458) from
>> > [<c059f3c4>] (do_signal+0xa0/0x3c0)
>> > [    4.650000] [<c059f324>] (do_signal+0x0/0x3c0) from [<c0010f28>]
>> > (do_work_pending+0x64/0xbc)
>> > [    4.650000] [<c0010ec4>] (do_work_pending+0x0/0xbc) from [<c000e9dc>]
>> > (work_pending+0xc/0x20)
>> > [    4.650000]  r6:ffffffff r5:60000010 r4:b6f0df40 r3:c7825be0
>> > With objdump fautly code e12fff1e appears to be the assembly 'bx'
>> > instruction. However, due to arm.com (
>> >
>> http://infocenter.arm.com/help/topic/com.arm.doc.dui0204j/Cihfddaf.html#Cihiiajh
>> > ),
>> > I suppose that this instruction is not implemented in my farraday 526
>> > processor (an old armv4).
>> > In reference of this patch:
>> >
>> http://git.buildroot.net/buildroot/commit/?id=9474421da36d8602f56b84b150e4cf4c78e788b3
>> > [*
>> > Fix uClibc USE_BX logic, it was always on, this would break the new
>> > FA526/626 support and broke StrongARM since it's a v4 core.] I
>> understood
>> > it was corrected.
>> > So my question is next: what i'm doing wrong/missing?
>>
>> Thanks a lot for your very detailed report, great to see people
>> reporting precise bugs, with all the details (configuration files,
>> Buildroot version, things that are happening, and the beginning of an
>> analysis).
>>
>> Would you mind retrying with 2014.02-rc1, which has been recently
>> released? It might be possible that the commit
>>
>> http://git.buildroot.net/buildroot/commit/arch/Config.in.arm?id=d3539dd53bf9e37538fd4d8b89783a11fded119f
>> ,
>> which has been merged after 2013.11, is fixing the problem you're
>> reporting.
>>
>> If not, then please get back to us again, and I'll have a look.
>>
>> Thanks again for your report!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140316/4faaea34/attachment.html>
