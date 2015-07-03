From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 19:02:13 +0200
Subject: [Buildroot] Failed to build gdb on host side
In-Reply-To: <5596640E.8080604@syscom-instruments.com>
References: <5596640E.8080604@syscom-instruments.com>
Message-ID: <5596C015.9070201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 12:29, Viallard Anthony wrote:
> Hi,
> 
> I have a problem when I enabled gdb compilation on host side:
> 
> ----
> /bin/bash ./libtool --tag=CC   --mode=link
> /home/avd/wksp/dev/output/host/usr/bin/ccache /usr/bin/gcc -W -Wall
> -Wstrict-prototypes -Wmissing-prototypes -Wshadow -O2
> -I/home/avd/wksp/dev/output/host/usr/include  -release `cat libtool-soversion` 
> -static-libstdc++ -static-libgcc -L/home/avd/wksp/dev/output/host/lib
> -L/home/avd/wksp/dev/output/host/usr/lib
> -Wl,-rpath,/home/avd/wksp/dev/output/host/usr/lib -o libbfd.la -rpath
> /home/avd/wksp/dev/output/host/usr/x86_64-unknown-linux-gnu/arm-buildroot-linux-uclibcgnueabi/lib
> archive.lo archures.lo bfd.lo bfdio.lo bfdwin.lo cache.lo coff-bfd.lo
> compress.lo corefile.lo format.lo hash.lo init.lo libbfd.lo linker.lo merge.lo
> opncls.lo reloc.lo section.lo simple.lo stab-syms.lo stabs.lo syms.lo targets.lo
> binary.lo ihex.lo srec.lo tekhex.lo verilog.lo `cat ofiles`
> -L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic -liberty

 This is where libiberty should be found...

> -Wl,-lc,--as-needed,-lm,--no-as-needed -ldl -lz -ldl
> libtool: link: /home/avd/wksp/dev/output/host/usr/bin/ccache /usr/bin/gcc
> -shared  -fPIC -DPIC  .libs/archive.o .libs/archures.o .libs/bfd.o .libs/bfdio.o
> .libs/bfdwin.o .libs/cache.o .libs/coff-bfd.o .libs/compress.o .libs/corefile.o
> .libs/format.o .libs/hash.o .libs/init.o .libs/libbfd.o .libs/linker.o
> .libs/merge.o .libs/opncls.o .libs/reloc.o .libs/section.o .libs/simple.o
> .libs/stab-syms.o .libs/stabs.o .libs/syms.o .libs/targets.o .libs/binary.o
> .libs/ihex.o .libs/srec.o .libs/tekhex.o .libs/verilog.o .libs/elf32-arm.o
> .libs/elf32.o .libs/elf-nacl.o .libs/elf-vxworks.o .libs/elf.o .libs/elflink.o
> .libs/elf-attrs.o .libs/elf-strtab.o .libs/elf-eh-frame.o .libs/dwarf1.o
> .libs/dwarf2.o .libs/elf32-gen.o .libs/plugin.o .libs/cpu-arm.o
> .libs/cpu-plugin.o .libs/archive64.o -L/home/avd/wksp/dev/output/host/lib
> -L/home/avd/wksp/dev/output/host/usr/lib
> -L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic -liberty -lz
> -ldl  -Wl,-rpath -Wl,/home/avd/wksp/dev/output/host/usr/lib -Wl,-lc
> -Wl,--as-needed -Wl,-lm -Wl,--no-as-needed   -Wl,-soname -Wl,libbfd-2.25.51.so
> -o .libs/libbfd-2.25.51.so
> /usr/bin/ld: /home/avd/wksp/dev/output/host/usr/lib/libiberty.a(cplus-dem.o):

 ... but instead, it is found in host/usr/lib.

 That's pretty bad, libiberty should not be installed in the host dir. I also
can't find any code that does that (nothing passes --enable-install-libiberty
except the target binutils).

 So can you trace back which step of the build installed libiberty in the host
dir? Perhaps share your defconfig?


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
