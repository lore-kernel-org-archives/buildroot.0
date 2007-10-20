From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 20 Oct 2007 11:03:52 +1000
Subject: [Buildroot] [buildroot 0001542]: arm gcc-4.1.2 + oabi +
	soft	floats fails to build
In-Reply-To: <4718F974.3010404@promwad.com>
References: <90e28420e271f11d8ba34a6bf88df8e2@bugs.uclibc.org>
	<4718F974.3010404@promwad.com>
Message-ID: <20071020010352.GA14795@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 19, 2007 at 09:37:40PM +0300, Ivan Kuten wrote:
> It compiled successfully but
> 
> readelf -h build_arm/staging_dir/lib/libuClibc-0.9.29.so
> ELF Header:
>   Magic:   7f 45 4c 46 01 01 01 61 00 00 00 00 00 00 00 00
>   Class:                             ELF32
>   Data:                              2's complement, little endian
>   Version:                           1 (current)
>   OS/ABI:                            ARM
>   ABI Version:                       0
>   Type:                              DYN (Shared object file)
>   Machine:                           ARM
>   Version:                           0x1
>   Entry point address:               0xa520
>   Start of program headers:          52 (bytes into file)
>   Start of section headers:          525932 (bytes into file)
>   Flags:                             0x202, has entry point, GNU EABI, software FP
> 
> 
> Seems I get anyway EABI not OABI. Can you confirm this?

Hmm. readelf tells me the same thing, but "objdump -p" says otherwise.

[10:58AM] hamish at bach:staging_dir/usr/lib $ ../bin/armeb-linux-objdump -p libuClibc-0.9.29.so

libuClibc-0.9.29.so:     file format elf32-bigarm

Program Header:
    PHDR off    0x00000034 vaddr 0x00000034 paddr 0x00000034 align 2**2
         filesz 0x000000c0 memsz 0x000000c0 flags r-x
  INTERP off    0x000378f8 vaddr 0x000378f8 paddr 0x000378f8 align 2**3
         filesz 0x00000018 memsz 0x00000018 flags r--
    LOAD off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**15
         filesz 0x00037910 memsz 0x00037910 flags r-x
    LOAD off    0x00037ce4 vaddr 0x0003fce4 paddr 0x0003fce4 align 2**15
         filesz 0x0000067c memsz 0x00004834 flags rw-
 DYNAMIC off    0x00037dd8 vaddr 0x0003fdd8 paddr 0x0003fdd8 align 2**2
         filesz 0x000000b8 memsz 0x000000b8 flags rw-
   RELRO off    0x00037ce4 vaddr 0x0003fce4 paddr 0x0003fce4 align 2**0
         filesz 0x0000031c memsz 0x0000031c flags r--

Dynamic Section:
  NEEDED      ld-uClibc.so.0
  SONAME      libc.so.0
  INIT        0x32f10
  HASH        0xf4
  STRTAB      0x5970
  SYMTAB      0x1930
  STRSZ       0x260d
  SYMENT      0x10
  PLTGOT      0x3fe90
  PLTRELSZ    0x160
  PLTREL      0x11
  JMPREL      0x83a8
  REL         0x7f80
  RELSZ       0x428
  RELENT      0x8
  BIND_NOW    0x0
  FLAGS_1     0x1
  RELCOUNT    0x5b
private flags = 202: [APCS-32] [FPA float format] [software FP] [has entry point]

APCS-32 is OABI, while EABI shows as AAPCS.

readelf tells me EABI for binaries built with an old gcc-3.4.4 too.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
