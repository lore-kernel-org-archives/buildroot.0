From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Apr 2014 19:43:05 +0200
Subject: [Buildroot] [PATCH 6/9] package/upx: new package
In-Reply-To: <535DEF25.4050701@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <d2b063c77023df58acb96852a8dfe0b812750355.1398378217.git.yann.morin.1998@free.fr>
 <535DEF25.4050701@mind.be>
Message-ID: <20140428174305.GD3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-04-28 08:03 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:30, Yann E. MORIN wrote:
> > From: Frank Hunleth <fhunleth@troodon-software.com>
> > 
> > UPX is a free, portable, extendable, high-performance executable packer
> > for several executable formats.
> 
>  Just for my understanding: this builds a self-extractor, right? So my
> guess is that it won't be able to build a cross-self-extractor... Since
> we don't have a Config.in, there's no way to encode that information, but
> perhaps it's worth to add a comment that this tool will only work if
> target-arch == host-arch.

Well, that was my (and Frank's) fear, but:

    $ ./host/usr/bin/upx -h
    [--SNIP--]
    This version supports:
        AMD64-darwin.macho               Mach/AMD64
        ARMEL-darwin.macho               Mach/ARMEL
        amd64-linux.elf                  linux/ElfAMD
        amd64-linux.kernel.vmlinux       vmlinux/AMD64
        amd64-win64.pe                   win64/pe
        arm-linux.elf                    linux/armel
        arm-linux.kernel.vmlinux         vmlinux/armel
        arm-wince.pe                     arm/pe
        armeb-linux.elf                  linux/armeb
        armeb-linux.kernel.vmlinux       vmlinux/armeb
        armel-linux.kernel.vmlinuz       vmlinuz/armel
        fat-darwin.macho                 Mach/fat
        i086-dos16.com                   dos/com
        i086-dos16.exe                   dos/exe
        i086-dos16.sys                   dos/sys
        i386-bsd.elf.execve              BSD/386
        i386-darwin.macho                Mach/i386
        i386-dos32.djgpp2.coff           djgpp2/coff
        i386-dos32.tmt.adam              tmt/adam
        i386-dos32.watcom.le             watcom/le
        i386-freebsd.elf                 BSD/elf386
        i386-linux.elf                   linux/elf386
        i386-linux.elf.execve            linux/386
        i386-linux.elf.shell             linux/sh386
        i386-linux.kernel.bvmlinuz       bvmlinuz/386
        i386-linux.kernel.vmlinux        vmlinux/386
        i386-linux.kernel.vmlinuz        vmlinuz/386
        i386-netbsd.elf                  netbsd/elf386
        i386-openbsd.elf                 opnbsd/elf386
        i386-win32.pe                    win32/pe
        m68k-atari.tos                   atari/tos
        mips-linux.elf                   linux/mipseb
        mipsel-linux.elf                 linux/mipsel
        mipsel.r3000-ps1                 ps1/exe
        powerpc-darwin.macho             Mach/ppc32
        powerpc-linux.elf                linux/ElfPPC
        powerpc-linux.kernel.vmlinux     vmlinux/ppc32

So it seems it does not mind being build natively and generate
self-extractors for all these archs in the same binary.

But even is it would be only target-arch == host-arch, this is
_currently_ not a problem, as the only way to get host-upx is to select
syslinux, which is already only available in this case (eg. host and
target are both x86) anyway.

Maybe that would warrant a bit of comment in the .mk too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
