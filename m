From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Tue, 07 Jul 2015 11:44:19 +0200
Subject: [Buildroot] Failed to build gdb on host side
In-Reply-To: <5596C015.9070201@mind.be>
References: <5596640E.8080604@syscom-instruments.com>
 <5596C015.9070201@mind.be>
Message-ID: <559B9F73.6010101@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2015 07:02 PM, Arnout Vandecappelle wrote:
> On 07/03/15 12:29, Viallard Anthony wrote:
>> Hi,
>>
>> I have a problem when I enabled gdb compilation on host side:
>>
>> ----
>> /bin/bash ./libtool --tag=CC   --mode=link
>> /home/avd/wksp/dev/output/host/usr/bin/ccache /usr/bin/gcc -W -Wall
>> -Wstrict-prototypes -Wmissing-prototypes -Wshadow -O2
>> -I/home/avd/wksp/dev/output/host/usr/include  -release `cat libtool-soversion`
>> -static-libstdc++ -static-libgcc -L/home/avd/wksp/dev/output/host/lib
>> -L/home/avd/wksp/dev/output/host/usr/lib
>> -Wl,-rpath,/home/avd/wksp/dev/output/host/usr/lib -o libbfd.la -rpath
>> /home/avd/wksp/dev/output/host/usr/x86_64-unknown-linux-gnu/arm-buildroot-linux-uclibcgnueabi/lib
>> archive.lo archures.lo bfd.lo bfdio.lo bfdwin.lo cache.lo coff-bfd.lo
>> compress.lo corefile.lo format.lo hash.lo init.lo libbfd.lo linker.lo merge.lo
>> opncls.lo reloc.lo section.lo simple.lo stab-syms.lo stabs.lo syms.lo targets.lo
>> binary.lo ihex.lo srec.lo tekhex.lo verilog.lo `cat ofiles`
>> -L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic -liberty
>
>   This is where libiberty should be found...
>
>> -Wl,-lc,--as-needed,-lm,--no-as-needed -ldl -lz -ldl
>> libtool: link: /home/avd/wksp/dev/output/host/usr/bin/ccache /usr/bin/gcc
>> -shared  -fPIC -DPIC  .libs/archive.o .libs/archures.o .libs/bfd.o .libs/bfdio.o
>> .libs/bfdwin.o .libs/cache.o .libs/coff-bfd.o .libs/compress.o .libs/corefile.o
>> .libs/format.o .libs/hash.o .libs/init.o .libs/libbfd.o .libs/linker.o
>> .libs/merge.o .libs/opncls.o .libs/reloc.o .libs/section.o .libs/simple.o
>> .libs/stab-syms.o .libs/stabs.o .libs/syms.o .libs/targets.o .libs/binary.o
>> .libs/ihex.o .libs/srec.o .libs/tekhex.o .libs/verilog.o .libs/elf32-arm.o
>> .libs/elf32.o .libs/elf-nacl.o .libs/elf-vxworks.o .libs/elf.o .libs/elflink.o
>> .libs/elf-attrs.o .libs/elf-strtab.o .libs/elf-eh-frame.o .libs/dwarf1.o
>> .libs/dwarf2.o .libs/elf32-gen.o .libs/plugin.o .libs/cpu-arm.o
>> .libs/cpu-plugin.o .libs/archive64.o -L/home/avd/wksp/dev/output/host/lib
>> -L/home/avd/wksp/dev/output/host/usr/lib
>> -L/home/avd/wksp/dev/output/build/host-gdb-7.9/bfd/../libiberty/pic -liberty -lz
>> -ldl  -Wl,-rpath -Wl,/home/avd/wksp/dev/output/host/usr/lib -Wl,-lc
>> -Wl,--as-needed -Wl,-lm -Wl,--no-as-needed   -Wl,-soname -Wl,libbfd-2.25.51.so
>> -o .libs/libbfd-2.25.51.so
>> /usr/bin/ld: /home/avd/wksp/dev/output/host/usr/lib/libiberty.a(cplus-dem.o):
>
>   ... but instead, it is found in host/usr/lib.
>
>   That's pretty bad, libiberty should not be installed in the host dir. I also
> can't find any code that does that (nothing passes --enable-install-libiberty
> except the target binutils).
>
>   So can you trace back which step of the build installed libiberty in the host
> dir? Perhaps share your defconfig?
>
>
>   Regards,
>   Arnout
>
> [snip]
>

Hi Arnout and all,

If I look over the output directory about libiberty.a, here what I find:

----------------
[avd:~/wksp/dev] $ for f in $(find output/ -name "libiberty.a"); do 
md5sum $f; done
5c79d008976401db98e014f8b4cf74aa 
output/build/host-gcc-final-4.7.4/build/build-x86_64-unknown-linux-gnu/libiberty/libiberty.a
1139e997c007ab5187665e98c23659f6 
output/build/host-gcc-final-4.7.4/build/libiberty/libiberty.a
fc9ca886f8c6e8d1cbc3293a496ac179 
output/build/host-gcc-final-4.7.4/build/libiberty/pic/libiberty.a
626fcb7a10b75bad14a14886c111e3b4 
output/build/host-gcc-initial-4.7.4/build/build-x86_64-unknown-linux-gnu/libiberty/libiberty.a
480750b2bf20cb389ba84d875667c8e0 
output/build/host-gcc-initial-4.7.4/build/libiberty/libiberty.a
4903b2aaa94fed7579685aa6789778f2 
output/build/host-gcc-initial-4.7.4/build/libiberty/pic/libiberty.a
c1303d7bbcf87fb95eb18a604ef1bbc2 
output/build/gdb-7.9/gdb/gdbserver/build-libiberty-gdbserver/libiberty.a
a86309dd08155fc1b664f7c066402513 
output/build/gdb-7.9/gdb/gdbserver/build-libiberty-gdbserver/pic/libiberty.a
09901aa03336b1ef814b866c1a532015 
output/build/host-binutils-2.24/libiberty/libiberty.a
d228daa645bb5d167ee9d86c2756fa75 
output/build/host-gdb-7.9/libiberty/libiberty.a
70b7d21a71b8f79322ca71b3df0e98cf 
output/build/host-gdb-7.9/libiberty/pic/libiberty.a
96e90ee6aeffcfb418ea31eb9c7ce802  output/host/usr/lib/libiberty.a
----------------

----------------
[avd:~/wksp/dev] $ for f in $(find output/ -name "libiberty.a"); do ls 
-l $f; done
-rw-r--r-- 1 avd 401332 Jul  6 16:18 
output/build/host-gcc-final-4.7.4/build/build-x86_64-unknown-linux-gnu/libiberty/libiberty.a
-rw-r--r-- 1 avd 401332 Jul  6 16:18 
output/build/host-gcc-final-4.7.4/build/libiberty/libiberty.a
-rw-r--r-- 1 avd 405500 Jul  6 16:18 
output/build/host-gcc-final-4.7.4/build/libiberty/pic/libiberty.a
-rw-r--r-- 1 avd 401332 Jul  6 16:16 
output/build/host-gcc-initial-4.7.4/build/build-x86_64-unknown-linux-gnu/libiberty/libiberty.a
-rw-r--r-- 1 avd 401332 Jul  6 16:16 
output/build/host-gcc-initial-4.7.4/build/libiberty/libiberty.a
-rw-r--r-- 1 avd 405500 Jul  6 16:16 
output/build/host-gcc-initial-4.7.4/build/libiberty/pic/libiberty.a
-rw-r--r-- 1 avd 982840 Jul  6 16:31 
output/build/gdb-7.9/gdb/gdbserver/build-libiberty-gdbserver/libiberty.a
-rw-r--r-- 1 avd 1003652 Jul  6 16:31 
output/build/gdb-7.9/gdb/gdbserver/build-libiberty-gdbserver/pic/libiberty.a
-rw-r--r-- 1 avd 447600 Jul  6 16:14 
output/build/host-binutils-2.24/libiberty/libiberty.a
-rw-r--r-- 1 avd 483720 Jul  6 16:31 
output/build/host-gdb-7.9/libiberty/libiberty.a
-rw-r--r-- 1 avd 521136 Jul  6 16:31 
output/build/host-gdb-7.9/libiberty/pic/libiberty.a
-rw-r--r-- 1 avd 401332 Jul  6 16:20 output/host/usr/lib/libiberty.a
----------------

The file libiberty.a seems to come from the gcc-final package but it 
doesn't have the same md5 hash. I think gcc doesn't make a simple copy 
but modify the installed ar archive ?

Near the end of the build of gcc-final, I can see this:

----------------
make[3]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libdecnumber'
make[3]: Entering directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libiberty'
make[4]: Entering directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libiberty/testsuite'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libiberty/testsuite'
make[4]: Entering directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libiberty/testsuite'
make[4]: Nothing to be done for 'install'.
make[4]: Leaving directory 
'/home/avd/wksp/dev/output/build/host-gcc-final-4.7.4/build/libiberty/testsuite'
/bin/bash ../../libiberty/../mkinstalldirs 
/home/avd/wksp/dev/output/host/usr/lib/`/home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -O2 -I/home/avd/wksp/dev/output/host/usr/include 
-print-multi-os-directory`
/usr/bin/install -c -m 644 ./libiberty.a 
/home/avd/wksp/dev/output/host/usr/lib/`/home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -O2 -I/home/avd/wksp/dev/output/host/usr/include 
-print-multi-os-directory`/./libiberty.an
( cd 
/home/avd/wksp/dev/output/host/usr/lib/`/home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -O2 -I/home/avd/wksp/dev/output/host/usr/include 
-print-multi-os-directory` ; chmod 644 ./libiberty.an ;/usr/bin/ranlib 
./libiberty.an )
mv -f 
/home/avd/wksp/dev/output/host/usr/lib/`/home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -O2 -I/home/avd/wksp/dev/output/host/usr/include 
-print-multi-os-directory`/./libiberty.an 
/home/avd/wksp/dev/output/host/usr/lib/`/home/avd/wksp/dev/output/host/usr/bin/ccache 
/usr/bin/gcc -O2 -I/home/avd/wk\
      sp/dev/output/host/usr/include 
-print-multi-os-directory`/./libiberty.a
----------------

I can see in my build log there is binutils which can install the lib 
but the install command is surrounded with "if test	-n ""; then \" so 
nothing is done.

The openwrt guys did a patch in gcc/final package: 
https://dev.openwrt.org/changeset/42625

I use gcc 4.7.4.

I pasted my config and the build log here:

http://dropcanvas.com/k1YRbqW9GW9bMLthese links:

Regards,
Anthony.
