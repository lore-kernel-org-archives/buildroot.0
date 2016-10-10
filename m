From: Adam Baxter <voltagex@voltagex.org>
Date: Mon, 10 Oct 2016 12:40:20 +1100
Subject: [Buildroot] GDB fails to link against musl
Message-ID: <CAChFQ9SqyEVwU_uS=CdaRNLckQ8fd+f6kEHhNFpDbTmrnrdjJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
gdb fails to build / link when musl is used in buildroot 2016.08.

e.g.
BR2_TOOLCHAIN_USES_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_MUSL=y
BR2_PACKAGE_MUSL_COMPAT_HEADERS=y
BR2_GDB_VERSION="7.10.1"
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_GDB_TUI=y

libtool: link: /home/voltagex/src/buildroot-skeleton/build/host/usr/bin/x86_64-buildroot-linux-musl-gcc
-shared  -fPIC -DPIC  .libs/archive.o .libs/archures.o .libs/bfd.o
.libs/bfdio.o .libs/bfdwin.o .libs/cache.o .libs/coff-bfd.o
.libs/compress.o .libs/corefile.o .libs/format.o .libs/hash.o
.libs/init.o .libs/libbfd.o .libs/linker.o .libs/merge.o
.libs/opncls.o .libs/reloc.o .libs/section.o .libs/simple.o
.libs/stab-syms.o .libs/stabs.o .libs/syms.o .libs/targets.o
.libs/binary.o .libs/ihex.o .libs/srec.o .libs/tekhex.o
.libs/verilog.o .libs/elf64-x86-64.o .libs/elf-ifunc.o
.libs/elf-nacl.o .libs/elf64.o .libs/elf.o .libs/elflink.o
.libs/elf-attrs.o .libs/elf-strtab.o .libs/elf-eh-frame.o
.libs/dwarf1.o .libs/dwarf2.o .libs/elf32-i386.o .libs/elf-vxworks.o
.libs/elf32.o .libs/i386linux.o .libs/aout32.o .libs/pei-i386.o
.libs/peigen.o .libs/cofflink.o .libs/coffgen.o .libs/pei-x86_64.o
.libs/pex64igen.o .libs/elf64-gen.o .libs/elf32-gen.o .libs/plugin.o
.libs/cpu-i386.o .libs/cpu-iamcu.o .libs/cpu-l1om.o .libs/cpu-k1om.o
.libs/cpu-plugin.o .libs/archive64.o
-L/home/voltagex/src/buildroot-skeleton/build/build/gdb-7.10.1/bfd/../libiberty/pic
-liberty -L/home/voltagex/src/buildroot-skeleton/build/build/gdb-7.10.1/zlib
-lz  -Wl,-lc -Wl,--as-needed -Wl,-lm -Wl,--no-as-needed   -Wl,-soname
-Wl,libbfd-2.25.51.so -o .libs/libbfd-2.25.51.so
/home/voltagex/src/buildroot-skeleton/build/host/usr/lib/gcc/x86_64-buildroot-linux-musl/5.4.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
.libs/archive.o: unrecognized relocation (0x2a) in section `.text'
/home/voltagex/src/buildroot-skeleton/build/host/usr/lib/gcc/x86_64-buildroot-linux-musl/5.4.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
Makefile:1255: recipe for target 'libbfd.la' failed
make[6]: *** [libbfd.la] Error 1
Makefile:1673: recipe for target 'all-recursive' failed
make[5]: *** [all-recursive] Error 1
Makefile:1152: recipe for target 'all' failed
make[4]: *** [all] Error 2
Makefile:2710: recipe for target 'all-bfd' failed
make[3]: *** [all-bfd] Error 2
Makefile:845: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:201: recipe for target
'/home/voltagex/src/buildroot-skeleton/build/build/gdb-7.10.1/.stamp_built'
failed
make[1]: *** [/home/voltagex/src/buildroot-skeleton/build/build/gdb-7.10.1/.stamp_built]
Error 2
Makefile:18: recipe for target '_all' failed
make: *** [_all] Error 2

I believe it's caused by the -fPIC flag, but I don't know enough to
debug further than that.

Regards,
Adam
