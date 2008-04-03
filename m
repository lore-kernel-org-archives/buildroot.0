From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 3 Apr 2008 14:09:03 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
Message-ID: <0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> Why does ARCH change ?!?
>>
>>Because target/linux/Makefile.in uses KERNEL_ARCH for ARCH setting,
>>and not what you have set ARCH to on the cmdline.
>>
>>KERNEL_ARCH is calculated in
>>toolchain/kernel-headers/kernel-headers.mk - Notice that arch/ppc is
>>deprecated, you should use arch/powerpc nowadays.
>
> Somebody did IMHO the Wrong Thing by silently unset'ing ARCH in the
> toplevel Makefile. The proper thing to do is either $(error ARCH is set)
> or, preferably, check that $ARCH is clean via dependencies.sh
> Silently unseting ARCH is error-prone and misleading (as you see).

So, how does one go to compile for a Xilinx ppc ?
Deprecated or not, various info I have insist that I should use ARCH=ppc
If I try:

$ make ARCH=ppc KERNEL_ARCH=ppc

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
GNU make version '3.81':                        Ok
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
(cd /home/guinevere/buildroot/toolchain_build_ppc/linux-2.6.24; \
         /usr/bin/make -j1 ARCH=ppc \
                HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" \
                HOSTCXX="/usr/bin/g++" \
                INSTALL_HDR_PATH=/home/guinevere/buildroot/toolchain_build_ppc/linux 
headers_install; \
        )
make[1]: Entering directory 
`/home/guinevere/buildroot/toolchain_build_ppc/linux-2.6.24'
  CHK     include/linux/version.h
*** Error: Headers not exportable for this architecture (ppc)
make[1]: *** [headers_install] Error 1
make[1]: Leaving directory 
`/home/guinevere/buildroot/toolchain_build_ppc/linux-2.6.24'
make: *** [/home/guinevere/buildroot/toolchain_build_ppc/linux/.configured] 
Error 2


Am I supposed to try and edit some of the makefile to get them to use 
ARCH=ppc for the kernel ? I can't believe I'm the first one to use buildroot 
on a Xilinx board, so what am I doing wrong...?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
