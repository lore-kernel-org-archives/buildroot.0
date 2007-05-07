From: Ken Cecka <ceckak@alumni.washington.edu>
Date: Mon, 07 May 2007 09:09:46 -0700
Subject: [Buildroot] wrong address when linking simple ARM test
	application
References: <f1adr8$d8g$1@sea.gmane.org>
Message-ID: <f1nj0b$pck$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following up on this with the resolution.  Rex Ashbaugh worked through this
with me and pointed out that the buildroot toolchain links in
linux-specific runtime code by default.  I am trying to build a completely
standalone application, and apparently this was causing problems.  The
solution was to add the '-nostartup' flag to LDFLAGS.

Ken

Ken Cecka wrote:

> Hi,
> 
> May need to go to a GCC list for this, but I thought I'd start here.  I've
> constructed a very minimal standalone ARM test application that I am
> trying
> to load into SRAM on an ARM1136JFS target.  The SRAM is at address
> 0x1fffc000, and I am trying to link my elf file at that address, but when
> I go to download it, the debugger tries to write to address 0x1fff8000.
> 
> When I look at the elf file using objdump, I see that all the sections are
> at 0x1fffc000, but there's a program header at 0x1fff8000.  Why does the
> header have this address, and how can I fix it?
> 
> Source files and objdump output are copied below.
> 
> Thanks,
> Ken
> 
> ---- Begin Makefile ----
> 
> TOOLCHAIN=/home/kcecka/projects/zasfiles/buildroot/build_arm/staging_dir
> PREFIX=arm-linux-
> AS=$(TOOLCHAIN)/bin/$(PREFIX)as
> CC=$(TOOLCHAIN)/bin/$(PREFIX)gcc
> CXX=$(TOOLCHAIN)/bin/$(PREFIX)g++
> LD=$(TOOLCHAIN)/bin/$(PREFIX)ld
> OBJDUMP=$(TOOLCHAIN)/bin/$(PREFIX)objdump
> STRIP=$(TOOLCHAIN)/bin/$(PREFIX)strip
> 
> ASFLAGS=-gdwarf-2
> CFLAGS=-gdwarf-2
> LDFLAGS=-Ttext 0x1fffc000 --defsym stack=0x1fffffff
> 
> all: testapp.elf testapp.srec testapp.elf.s
> 
> testapp.elf: start.o main.o
>         $(LD) $(LDFLAGS) -o $@ $^
> 
> %.elf.s: %.elf
>         $(OBJDUMP) --disassemble-all $< > $@
> 
> %.srec: %.elf
>         cp $< $@
>         $(STRIP) -O srec $@
> 
> ---- end Makefile ----
> 
> ---- begin start.s ----
> 
>         .text
>         .global _start
>         .global main
> _start:
>         LDR r13, =stack
>         BL main
> stall:
>         B stall
> 
> ---- end start.s ----
> 
> ---- begin main.c ----
> 
> int foo(int);
> 
> int bar(int);
> 
> 
> int main()
> {
>         int i = 0;
> 
>         i = foo(i);
> 
>         while(1)
>                 i = bar(i);
> }
> 
> int foo(int i)
> {
>         return i+1;
> }
> 
> int bar(int i)
> {
>         return i;
> }
> 
> ---- end main.c ----
> 
> ---- begin objdump output ----
> 
> $ arm-linux-objdump -x testapp.elf
> 
> testapp.elf:     file format elf32-littlearm
> testapp.elf
> architecture: arm, flags 0x00000112:
> EXEC_P, HAS_SYMS, D_PAGED
> start address 0x1fffc000
> 
> Program Header:
>     LOAD off    0x00000000 vaddr 0x1fff8000 paddr 0x1fff8000 align 2**15
>          filesz 0x00004098 memsz 0x00004098 flags r-x
> private flags = 4000002: [Version4 EABI] [has entry point]
> 
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>   0 .text         00000098  1fffc000  1fffc000  00004000  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   1 .comment      00000012  00000000  00000000  00004098  2**0
>                   CONTENTS, READONLY
>   2 .debug_aranges 00000040  00000000  00000000  000040b0  2**3
>                   CONTENTS, READONLY, DEBUGGING
>   3 .debug_pubnames 0000002b  00000000  00000000  000040f0  2**0
>                   CONTENTS, READONLY, DEBUGGING
>   4 .debug_info   00000132  00000000  00000000  0000411b  2**0
>                   CONTENTS, READONLY, DEBUGGING
>   5 .debug_abbrev 00000098  00000000  00000000  0000424d  2**0
>                   CONTENTS, READONLY, DEBUGGING
>   6 .debug_line   00000074  00000000  00000000  000042e5  2**0
>                   CONTENTS, READONLY, DEBUGGING
>   7 .debug_frame  00000070  00000000  00000000  0000435c  2**2
>                   CONTENTS, READONLY, DEBUGGING
>   8 .debug_loc    0000007e  00000000  00000000  000043cc  2**0
>                   CONTENTS, READONLY, DEBUGGING
>   9 .ARM.attributes 00000010  00000000  00000000  0000444a  2**0
>                   CONTENTS, READONLY
> SYMBOL TABLE:
> 1fffc000 l    d  .text  00000000 .text
> 00000000 l    d  .comment       00000000 .comment
> 00000000 l    d  .debug_aranges 00000000 .debug_aranges
> 00000000 l    d  .debug_pubnames        00000000 .debug_pubnames
> 00000000 l    d  .debug_info    00000000 .debug_info
> 00000000 l    d  .debug_abbrev  00000000 .debug_abbrev
> 00000000 l    d  .debug_line    00000000 .debug_line
> 00000000 l    d  .debug_frame   00000000 .debug_frame
> 00000000 l    d  .debug_loc     00000000 .debug_loc
> 00000000 l    d  .ARM.attributes        00000000 .ARM.attributes
> 00000000 l    d  *ABS*  00000000 .shstrtab
> 00000000 l    d  *ABS*  00000000 .symtab
> 00000000 l    d  *ABS*  00000000 .strtab
> 1fffc008 l       .text  00000000 stall
> 00000000 l    df *ABS*  00000000 main.c
> 1fffc098 g       *ABS*  00000000 __exidx_end
> 20004098 g       *ABS*  00000000 _bss_end__
> 20004098 g       *ABS*  00000000 __bss_start__
> 1fffc098 g       *ABS*  00000000 __exidx_start
> 1fffffff g       *ABS*  00000000 stack
> 20004098 g       *ABS*  00000000 __bss_end__
> 1fffc000 g       .text  00000000 _start
> 20004098 g       *ABS*  00000000 __bss_start
> 1fffc010 g     F .text  0000003c main
> 20004098 g       *ABS*  00000000 __end__
> 1fffc04c g     F .text  00000028 foo
> 20004098 g       *ABS*  00000000 _edata
> 20004098 g       *ABS*  00000000 _end
> 1fffc074 g     F .text  00000024 bar
> 20004098 g       *ABS*  00000000 __data_start
> 
> ---- end objdump output ----
