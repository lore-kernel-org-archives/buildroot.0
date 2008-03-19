From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 19 Mar 2008 12:04:59 +0100
Subject: [Buildroot] .exit.data referenced in section .exit.text of
	drivers/built-in.o
Message-ID: <002201c889b1$17f72a30$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all, beware newbie speaking...

I've been trying to get buildroot to build me a system for a Xilinx ML405 
board for a few days. It's a great tool you have here and I was able to get 
over the first few problems I had with it pretty quickly, I now have the 
cross-compiler, busybox and other things compiled.

[
Minor bugs are that buildroot seems to require the presence of the empty dir 
/kernel-patches-2.6.24 and the link /linux-2.6.24.config -> 
/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/.config
There's probably a relative path missing somewhere
]

The one thing missing is the kernel which fails in its final linking stage 
with
`.exit.data' referenced in section `.exit.text' of drivers/built-in.o: 
defined in discarded section `.exit.dilt-in.o

I tried with 2.6.24, 2.6.24.3, 2.6.23, 2.6.22.10 and get the same error...

Here's a complete output:

guinevere at lpsc6185x ~/buildroot 0 $ make ARCH=ppc

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
LD_LIBRARY_PATH sane:                           Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.80':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '3.4.6':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '3.4.6':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/guinevere/buildroot/project_build_ppc/genepy/buildroot-config
mkdir -p /home/guinevere/buildroot/project_build_ppc/genepy
cp -dpRf package/config/buildroot-config 
/home/guinevere/buildroot/project_build_ppc/genepy/buildroot-config
rm -rf /home/guinevere/buildroot/project_build_ppc/genepy/root/usr/include
find /home/guinevere/buildroot/project_build_ppc/genepy/root/usr/lib -name 
'*.a' -delete
find /home/guinevere/buildroot/project_build_ppc/genepy/root/lib -name 
'*.a' -delete
find /home/guinevere/buildroot/project_build_ppc/genepy/root/usr/lib -name 
'*.la' -delete
find /home/guinevere/buildroot/project_build_ppc/genepy/root/lib -name 
'*.la' -delete
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=powerpc 
CFLAGS_KERNEL="-O2 -I/home/guinevere/builaging_dir/usr/include -I/home/guinevere/buildroot/build_ppc/staging_dir/include 
 --sysroot=/home/guinevere/bustaging_dir/ -isysroot 
/home/guinevere/buildroot/build_ppc/staging_dir -mtune=405" 
INSTALL_MOD_PATH=/home/guproject_build_ppc/genepy/root 
CROSS_COMPILE=/home/guinevere/buildroot/build_ppc/staging_dir/usr/bin/ppc-linu"-L/home/guinevere/buildroot/build_ppc/staging_dir/lib 
 -L/home/guinevere/buildroot/build_ppc/staging_dir/usrme/guinevere/buildroot/build_ppc/staging_dir/"LZMA="/home/guinevere/buildroot/toolchain_build_ppc/bin/lzma"        -C /home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24zImagemake[1]: Entering directory`/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24'  CHK     include/linux/version.h  CHK     include/linux/utsrelease.h  CALL    scripts/checksyscalls.sh  CHK     include/linux/compile.h  GEN     .version  CHK     include/linux/compile.h  UPD     include/linux/compile.h  CC      init/version.o  LD      init/built-in.o  LD      .tmp_vmlinux1`.exit.data' referenced in section `.exit.text' of drivers/built-in.o:defined in discarded section `.exit.dilt-in.o`.exit.data' referenced in section `.exit.text' of drivers/built-in.o:defined in discarded section `.exit.dilt-in.o`.exit.data' referenced in section `.exit.text' of drivers/built-in.o:defined in discarded section `.exit.dilt-in.o`.exit.data' refere!
 nced in section `.exit.text' of drivers/built-in.o:defined in discarded section `.exit.dilt-in.omake[1]: *** [.tmp_vmlinux1] Error 1make[1]: Leaving directory`/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24'make: ***[/home/guinevere/buildroot/binaries/genepy/-linux-2.6.24-20080319.z] Error 2If I google for this error, all I can find are advices to run 'makemrproper' on the kernel tree, which I did to no avail.Thanks for any info on getting this ml405 running !--Guillaume Dargaudhttp://www.gdargaud.net/  "I used to laugh at my dog: like marking his territory was really gonnakeep those other dogs away. But since I started doing it myself, I have toadmit that my co-workers seldom come into my cubicle any more."    ? J.Murphy.
