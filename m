From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 11 Jun 2018 21:42:10 +0200
Subject: [Buildroot] xtensa: qemu_xtensa_lx60 issue with gcc 8.1
In-Reply-To: <CAMo8Bf+XNMhRSkdQbN6Kd3oDOjuQSg-HUJLRNynZ_YOiXaf2QQ@mail.gmail.com>
References: <8d26aa17-fe18-2f56-8eb0-d32073ad099b@gmail.com>
 <CAMo8Bf+TYADAm93CKCAxrFUBtwEf4hgcKZ3_SbriUgC5Tu80Cg@mail.gmail.com>
 <CAMo8Bf+XNMhRSkdQbN6Kd3oDOjuQSg-HUJLRNynZ_YOiXaf2QQ@mail.gmail.com>
Message-ID: <308c5c37-1c9f-a0bb-c9bb-225be67a0280@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

Le 11/06/2018 ? 02:53, Max Filippov a ?crit?:
> On Sun, Jun 10, 2018 at 1:46 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Sun, Jun 10, 2018 at 1:39 PM, Romain Naour <romain.naour@gmail.com> wrote:
>>> Hello Max,
>>>
>>> We recently added gcc 8.1 in Buildroot and checked if all qemu configs are able
>>> to boot correctly:
>>>
>>> https://gitlab.com/free-electrons/toolchains-builder/pipelines/23083553
>>>
>>> Unfortunately the qemu_xtensa_lx60 config doesn't boot using a toolchain with
>>> gcc 8.1, binutils 2.30, uclibc-ng 1.0.30 and a kernel 4.16.7.
>>>
>>> See: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006443
>>>
>>> I'm able to reproduce the issue and fallback to gcc 7.3 allow to boot the system
>>> on Qemu. So it seems really related to the gcc version.
>>>
>>> Do you have any clue ?
>>
>> Not yet, but let me look at it. Thanks for the report.
> 
> I've tracked it down to the following fragment in the _dl_get_ready_to_run
> in ld-uClibc.so
> 
>     419f:       f0c1b2          addi    a11, a1, -16
>     41a2:       1ba9            s32i.n  a10, a11, 4
>     41a4:       0bc9            s32i.n  a12, a11, 0
>     41a6:       5127f2          l32i    a15, a7, 0x144
>     41a9:       1765b2          s32i    a11, a5, 92
>     41ac:       4e2782          l32i    a8, a7, 0x138
>     41af:       146af2          s32i    a15, a10, 80
>     41b2:       001b10          movsp   a1, a11
> 
> It looks clearly wrong to me: a region on stack allocated with alloca
> is used before the stack pointer is updated. Looks like an issue with
> xtensa gcc backend. Perhaps related to this one:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65416
> Let me try to fix it.
> 
Ok, thanks for the help.

Best regards,
Romain
