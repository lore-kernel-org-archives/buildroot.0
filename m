From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Oct 2019 22:37:22 +0200
Subject: [Buildroot] GNU Binutils 2.33.1 has been released.
In-Reply-To: <3704de99-d063-5f94-2c23-9532bc6a0b9d@redhat.com>
References: <87eezim2ho.fsf@redhat.com>
 <be5b0885-b1cb-875c-2fdc-30ee3078358e@gmail.com>
 <3704de99-d063-5f94-2c23-9532bc6a0b9d@redhat.com>
Message-ID: <3a81c766-4b06-3da3-0fc7-aa015ab94c55@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nick,

Le 14/10/2019 ? 12:44, Nick Clifton a ?crit?:
> Hi Romain,
> 
>> I tested this new version using toolchain-builder project [1] and discovered
>> some regressions on arm cortex-m4 and SH4 architectures.
> 
>> There is a segfault in elf2flt while building busybox:
>> "ld (ld-elf2flt):
>> /builds/kubu93/toolchains-builder/build/opt/armv7m--uclibc--bleeding-edge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt
> 
> Hmm, that is worrying, but I suppose that it could be a bug in
> elf2flt rather than the binutils.  Maybe...

Probably, elf2flt is testing with binutils up to 2.31.1.
We use the latest git version.

> 
> Is this problem specific to the ARM architecture ?  (Ie does elf2flt
> work when compiled and run for other architecures ?)  If so, then I
> would suspect a problem with the changes to the ARM specific code in
> the BFD library, and I would probably ask one of the ARM regulars to
> take a look.  (Hi Tamar...)

I can't say if it's specific to the ARM architecture. elf2flt is only used when
we use FLAT binary format. This is only the case in Buildroot for the ARM
cortex-m4 architecture.

> 
> Are you able to find out where the segmentation fault is occurring ?
> Is it inside the BFD library somewhere ?

For now, I just reproduced on gitlab yesterday and reproduced locally today.

The command line is https://pastebin.com/s9hfWpbE

> 
> 
>> - sh4 [4]: (sh4, binutils 2.33.1, kernel headers 4.19.79, Glibc | uClibc-ng |
>> musl, Qemu 3.1)
>>
>> The system doesn't boot under Qemu.
> 
> *sigh* This one will probably be even harder to investigate.  Not being
> familiar with Qemu, I do not what the best approach would be.  Can we get
> it to tell us why the boot fails ?  Does it think that a binary is invalid
> somehow ?

I tried to reproduce but nothing appear on the screen, not even a initial boot
from the kernel...
I can try to use git bisect between binutils 2.32 and 2.33.1, but it will take a
lot of time.

Best regards,
Romain

> 
> Cheers
>   Nick
> 
