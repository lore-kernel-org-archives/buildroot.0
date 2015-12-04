From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 4 Dec 2015 11:37:27 -0200 (BRST)
Subject: [Buildroot] Problem compiling kernel module
Message-ID: <980213507.13505384.1449236247504.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Sorry for the HTML formatting, but I need to prevent undesired line breaks that Zimbra adds to plain text messages] 

Hello, 

Here at DATACOM we have kernel module that is built with the "check" option on ( make C=1 ). When I compile it under buildroot I get the following error: 

cd /work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/_build/src/kernel/dm-module && /usr/bin/gmake -C /work/firmware/build/linux-393b3260e01a9a5c2541e4b8723c93016357541f CROSS_COMPILE=/work/firmware/host/usr/bin/powerpc-e500v2-linux-gnuspe- ARCH=powerpc "EXTRA_CFLAGS= -I/work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/include/module-interfaces/" "INSTALL_MOD_PATH=\${DESTDIR}" M=/work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module V=1 C=1 KBUILD_EXTRA_SYMBOLS= modules 
test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \ 
echo >&2; \ 
echo >&2 " ERROR: Kernel configuration is invalid."; \ 
echo >&2 " include/generated/autoconf.h or include/config/auto.conf are missing.";\ 
echo >&2 " Run 'make oldconfig && make prepare' on kernel src to fix it."; \ 
echo >&2 ; \ 
/bin/false) 
mkdir -p /work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module/.tmp_versions ; rm -f /work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module/.tmp_versions/* 
/usr/bin/gmake -f scripts/Makefile.build obj=/work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module 
sparse -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -m32 -D__powerpc__ -D__powerpc32__ -nostdinc -isystem /opt/x-tools/powerpc-e500v2-linux-gnuspe_v1.0/lib/gcc/powerpc-e500v2-linux-gnuspe/4.8.2/include -Wp,-MD,/work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module/.dm-module.o.d -nostdinc -isystem /opt/x-tools/powerpc-e500v2-linux-gnuspe_v1.0/lib/gcc/powerpc-e500v2-linux-gnuspe/4.8.2/include -I/work/firmware/build/linux-393b3260e01a9a5c2541e4b8723c93016357541f/arch/powerpc/include -Iarch/powerpc/include/generated -Iinclude -I/work/firmware/build/linux-393b3260e01a9a5c2541e4b8723c93016357541f/arch/powerpc/include/uapi -Iarch/powerpc/include/generated/uapi -I/work/firmware/build/linux-393b3260e01a9a5c2541e4b8723c93016357541f/include/uapi -Iinclude/generated/uapi -include /work/firmware/build/linux-393b3260e01a9a5c2541e4b8723c93016357541f/include/linux/kconfig.h -D__KERNEL__ -Iarch/powerpc -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -msoft-float -pipe -Iarch/powerpc -ffixed-r2 -mmultiple -mno-altivec -mno-vsx -mno-spe -mspe=no -funit-at-a-time -fno-dwarf2-cfi-asm -mno-string -Wa,-me500 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -I/work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/include/module-interfaces/ -DMODULE -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(fpga_core)" -D"KBUILD_MODNAME=KBUILD_STR(fpga_core)" /work/firmware/build/dm-module-0a5b7c3c67f73cf69c24ba0965950675ddcc5fd5/src/kernel/dm-module/dm-module.c ; 
include/linux/compiler-gcc.h:103:10: error: unable to open 'linux/compiler-gcc5.h' 

Extra information: I'm using Fedora 23 with GCC 5.1.1 and sparse 0.5.0 installed. I don't see this error on CentOS 7.1 with GCC 4.8.3 and sparse 0.5.0 neither on Ubuntu 14.04 with GCC 4.8.4 and sparse 0.4.5-rc1 (all hosts are x86_64). 

The problem happens because sparse looks for C header files under the host hierarchy, not under the cross-compiler one. As a workaround, I use a custom "sparse" script under ~/bin/ containing 

#!/bin/sh 
set -x 
/usr/bin/sparse -gcc-base-dir /opt/x-tools/powerpc-e500v2-linux-gnuspe_v1.0 "$@" 
set +x 

Does anybody know a better workaround? Should we try to improve buildroot in order to solve the problem? 

Carlos Santos (Casantos) - DATACOM, P&D 
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000 
casantos at datacom.ind.br +55 51 3933.3000 ext. 3627 
http://www.datacom.ind.br 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151204/353b509e/attachment.html>
