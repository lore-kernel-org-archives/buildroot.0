From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 21:50:21 +0100
Subject: [Buildroot] [PATCH v2 07/17] uclibc: disable DOPIC on ARM FLAT
In-Reply-To: <CAAEAJfC1to61NBpAK2+S_RAUZr2JK7h4gk_EK+QxG4MaRS6KJg@mail.gmail.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAEAJfC1to61NBpAK2+S_RAUZr2JK7h4gk_EK+QxG4MaRS6KJg@mail.gmail.com>
Message-ID: <20160319215021.11938b4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 16:27:19 -0300, Ezequiel Garcia wrote:

> On 18 March 2016 at 18:08, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > As explained by Waldemar, enabling DOPIC in uClibc will lead to the
> > creation of a Position Independent library. In turn, this will cause
> > elf2flt to generate a "Has-PIC-GOT" flat binary, which doesn't work on
> > ARM. In fact, elf2flt on ARM really expect to have non-PIC code as
> > input, so we must disable DOPIC in the uClibc configuration.
> >
> 
> While testing on LPC4350, I found that Lua is built with the Has-PIC-GOT flag:
> 
> $ output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-flthdr
> output/target/usr/bin/lua
> output/target/usr/bin/lua
>     Magic:        bFLT
>     Rev:          4
>     Build Date:   Sat Mar 19 16:14:03 2016
>     Entry:        0x45
>     Data Start:   0x1f08c
>     Data End:     0x23ed8
>     BSS End:      0x260c0
>     Stack Size:   0x1000
>     Reloc Start:  0x23ed8
>     Reloc Count:  0x214
>     Flags:        0x2 ( Has-PIC-GOT )
> 
> The Lua interpreter is not loaded by the binfmt_flat loader, and the
> kernel says:
> 
>   BINFMT_FLAT: reloc outside program 0x7fffd3e4 (0 - 0x26080/0x1f04c),
> killing lua!
> 
> When DEBUG is defined in fs/binfmt_flat.c, the kernel says:
> 
>   BINFMT_FLAT: reference 0xffd3e4 to shared library 127, killing lua!
> 
> On the other side, atftp throws the same error:
> 
>   BINFMT_FLAT: reference 0xa0100 to shared library 161, killing atftp!
> 
> Any ideas?

Thanks for this testing. Is lua using threads by any chance? I for sure
know that the thread support is causing errors similar to the one that
you are reporting.

The ARM noMMU support is preliminary, for now I've only tested Busybox
and a few other small programs. Once this preliminary support is
merged, we can start looking at additional problems. For example,
adding a check at the end of the build that all binaries have the
appropriate BFLT flags.

Waldemar: in fact maybe the issue I had with threads is that as soon as
you link with -lpthread, you have a Has-PIC-GOT flagged BFLT. I'll
check that when I find some time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
