From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 May 2013 01:03:23 +0000 (UTC)
Subject: [Buildroot] [Bug 6236] New: binutils-2.23.2/bfd fails with
 undefined reference to __fini_array_end
Message-ID: <bug-6236-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6236

           Summary: binutils-2.23.2/bfd fails with undefined reference to
                    __fini_array_end
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: a.nielsen at shikadi.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4886
  --> https://bugs.busybox.net/attachment.cgi?id=4886
buildroot config to generate error

Compiling a toolchain with no MMU support (and consequently ELF support
disabled, so STATIC FLAT binaries in use) gives this error:

libtool: link: buildroot/host/usr/bin/ccache
buildroot/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -shared 
.libs/archive.o .libs/archures.o .libs/bfd.o .libs/bfdio.o .libs/bfdwin.o
.libs/cache.o .libs/coffgen.o .libs/corefile.o .libs/format.o .libs/init.o
.libs/libbfd.o .libs/opncls.o .libs/reloc.o .libs/section.o .libs/syms.o
.libs/targets.o .libs/hash.o .libs/linker.o .libs/srec.o .libs/binary.o
.libs/tekhex.o .libs/ihex.o .libs/stabs.o .libs/stab-syms.o .libs/merge.o
.libs/dwarf2.o .libs/simple.o .libs/compress.o .libs/verilog.o
.libs/elf32-arm.o .libs/elf32.o .libs/elf-nacl.o .libs/elf-vxworks.o
.libs/elf.o .libs/elflink.o .libs/elf-attrs.o .libs/elf-strtab.o
.libs/elf-eh-frame.o .libs/dwarf1.o .libs/elf32-gen.o .libs/cpu-arm.o  
-Lbuildroot/build/binutils-2.23.2/bfd/../libiberty/pic -liberty  -Wl,-lc
-Wl,--as-needed -Wl,-lm -Wl,--no-as-needed   -Wl,-soname -Wl,libbfd-2.23.2.so
-o .libs/libbfd-2.23.2.so
buildroot/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_fini':
__uClibc_main.c:(.text+0xc8): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0xcc): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0xd0): undefined reference to `__fini_array_start'
buildroot/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_main':
__uClibc_main.c:(.text+0x298): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x29c): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x2a0): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x2a4): undefined reference to `__init_array_end'
buildroot/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
.libs/libbfd-2.23.2.so: hidden symbol `__fini_array_end' isn't defined
buildroot/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
make[4]: *** [libbfd.la] Error 1
make[4]: Leaving directory `buildroot/build/binutils-2.23.2/bfd'

It seems to have something to do with binutils still trying to handle ELF
files?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
