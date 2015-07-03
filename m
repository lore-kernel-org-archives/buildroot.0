From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Fri, 03 Jul 2015 12:29:34 +0200
Subject: [Buildroot] Failed to build gdb on host side
Message-ID: <5596640E.8080604@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a problem when I enabled gdb compilation on host side:

----
/bin/bash ./libtool --tag=CC   --mode=link 
/home/avd/wksp/dev/output/host/usr/bin/ccache /usr/bin/gcc -W -Wall 
-Wstrict-prototypes -Wmissing-prototypes -Wshadow -O2 
-I/home/avd/wksp/dev/output/host/usr/include  -release `cat 
libtool-soversion`  -static-libstdc++ -static-libgcc 
-L/home/avd/wksp/dev/output/host/lib 
-L/home/avd/wksp/dev/output/host/usr/lib 
-Wl,-rpath,/home/avd/wksp/dev/output/host/usr/lib -o libbfd.la -rpath 
/home/avd/wksp/dev/output/host/usr/x86_64-unknown-linux-gnu/arm-buildroot-linux-uclibcgnueabi/lib 
archive.lo archures.lo bfd.lo bfdio.lo bfdwin.lo cache.lo coff-bfd.lo 
compress.lo corefile.lo format.lo hash.lo init.lo libbfd.lo linker.lo 
merge.lo opncls.lo reloc.lo section.lo simple.lo stab-syms.lo stabs.lo 
syms.lo targets.lo binary.lo ihex.lo srec.lo tekhex.lo verilog.lo `cat 
ofiles` 
-L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic 
-liberty -Wl,-lc,--as-needed,-lm,--no-as-needed -ldl -lz -ldl
libtool: link: /home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -shared  -fPIC -DPIC  .libs/archive.o .libs/archures.o 
.libs/bfd.o .libs/bfdio.o .libs/bfdwin.o .libs/cache.o .libs/coff-bfd.o 
.libs/compress.o .libs/corefile.o .libs/format.o .libs/hash.o 
.libs/init.o .libs/libbfd.o .libs/linker.o .libs/merge.o .libs/opncls.o 
.libs/reloc.o .libs/section.o .libs/simple.o .libs/stab-syms.o 
.libs/stabs.o .libs/syms.o .libs/targets.o .libs/binary.o .libs/ihex.o 
.libs/srec.o .libs/tekhex.o .libs/verilog.o .libs/elf32-arm.o 
.libs/elf32.o .libs/elf-nacl.o .libs/elf-vxworks.o .libs/elf.o 
.libs/elflink.o .libs/elf-attrs.o .libs/elf-strtab.o 
.libs/elf-eh-frame.o .libs/dwarf1.o .libs/dwarf2.o .libs/elf32-gen.o 
.libs/plugin.o .libs/cpu-arm.o .libs/cpu-plugin.o .libs/archive64.o 
-L/home/avd/wksp/dev/output/host/lib 
-L/home/avd/wksp/dev/output/host/usr/lib 
-L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic 
-liberty -lz -ldl  -Wl,-rpath -Wl,/home/avd/wksp/dev/output/host/usr/lib 
-Wl,-lc -Wl,--as-needed -Wl,-lm -Wl,--no-as-needed   -Wl,-soname 
-Wl,libbfd-2.25.51.so -o .libs/libbfd-2.25.51.so
/usr/bin/ld: 
/home/avd/wksp/dev/output/host/usr/lib/libiberty.a(cplus-dem.o): 
relocation R_X86_64_32S against `_sch_istable' can not be used when 
making a shared object; recompile with -fPIC
/home/avd/wksp/dev/output/host/usr/lib/libiberty.a: error adding 
symbols: Bad value
collect2: error: ld returned 1 exit status
Makefile:1240: recipe for target 'libbfd.la' failed
make[5]: *** [libbfd.la] Error 1
make[5]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd'
Makefile:1655: recipe for target 'all-recursive' failed
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd'
Makefile:1137: recipe for target 'all' failed
make[3]: *** [all] Error 2
make[3]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd'
Makefile:2603: recipe for target 'all-bfd' failed
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory '/home/avd/wksp/dev/output/build/host-gdb-7.9'
Makefile:837: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/home/avd/wksp/dev/output/build/host-gdb-7.9'
package/pkg-generic.mk:156: recipe for target 
'/home/avd/wksp/dev/output/build/host-gdb-7.9/.stamp_built' failed
make: *** [/home/avd/wksp/dev/output/build/host-gdb-7.9/.stamp_built] 
Error 2
----

To fix the issue, I had to copy manually the libiberty.a file from pic/ 
directory to the host target directory:

----
cp output/build/host-gcc-final-4.7.4/build/libiberty/pic/libiberty.a 
output/host/usr/lib/libiberty.a
----

I use buildroot 2015.5 and I have a amd64 arch.

Maybe a patch in gcc package to copy libiberty.a from pic is needed for 
x86_64 arch like me. What do you think about that ?

Regards,
Anthony.
