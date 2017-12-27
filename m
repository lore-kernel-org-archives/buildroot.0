From: Christian Stewart <christian@paral.in>
Date: Tue, 26 Dec 2017 21:39:12 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <20171227030548.GE27558@waldemar-brodkorb.de>
References: <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org> <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de> <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de> <87mv25cg5t.fsf@paral.in>
 <87shbxq99x.fsf@paral.in> <20171227030548.GE27558@waldemar-brodkorb.de>
Message-ID: <87y3loenlr.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Waldemar Brodkorb <wbx@openadk.org> writes:
> To verify my analyzation you can add -L<sysrootpathofyourbr> into:
> systemd/Makefile
> PAM_LIBS =
> -L/home/paralin/buildroot/pi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> -lpam -lpam_misc
>
> Like in KMOD_LIBS. Then just continue the build with make V=1 and
> see if it succeeds.

Did the build, after cleaning, again. After encountering the error, I modified the Makefile as you say:

PAM_LIBS = -L/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lpam -lpam_misc

And tried to continue the build. I got the same error. I also tried
doing a "make clean" inside the systemd build directory and deleting the
build and configure stamps to get it to re-configure after the Makefile
change, that too did not work.

Note that I am using an in-tree build here.

> As systemd is switching completely to meson buildsystem a
> upstreamable patch is not possible.

Hopefully some kind of short-term fix is possible in Buildroot or at
least a patch I can apply locally?

Here is the error in full, note how /lib/libpam.so is listed as an
absolute path:

/bin/sh ./libtool  --tag=CC   --mode=link /home/paralin/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__  -pipe -Wall -Wextra -Wundef -Wlogical-op
 -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration 
-Werror=missing-declarations -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-str
ings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-alia
sing -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections    -I/home/paralin/Documents/synrobo/skiff/buildroot-wor
k/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount -I/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid -I/home/paralin/D
ocuments/synrobo/skiff/buildroot-work/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2  -fno-lto -Wl,--gc-sections -Wl,--as
-needed -Wl,--no-undefined -Wl,-z,relro -Wl,-z,now -pie    -o systemd-analyze src/analyze/systemd_analyze-analyze.o src/analyze/systemd_analyze-analyze-verify.o libcore.la                                         
libtool: link: /home/paralin/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wol
d-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations
 -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -
Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fs
tack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections -I/home/paralin/buildroot/output/host/arm-buildroot-lin
ux-gnueabihf/sysroot/usr/include/libmount -I/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid -I/home/paralin/Documents/synrobo/skiff/buildroo
t-work/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z -
Wl,relro -Wl,-z -Wl,now -pie -o systemd-analyze src/analyze/systemd_analyze-analyze.o src/analyze/systemd_analyze-analyze-verify.o  ./.libs/libcore.a /home/paralin/buildroot/output/bui
ld/systemd-234/.libs/libsystemd-shared.so -L/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lcap -lresolv -llz4 /home/paralin/Documents/synrobo/skiff
/buildroot-work/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgcrypt.so /home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgpg-error.so
 /home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so /lib/libpam.so /lib/libpam_misc.so /home/paralin/buildroot/o
utput/build/linux-pam-1.3.0/libpam/.libs/libpam.so -ldl /home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libkmod.so /home/paralin/Documents/synrobo/ski
ff/buildroot-work/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblzma.so -lz /home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libmount.so
 /home/paralin/buildroot/output/build/util-linux-2.31/.libs/libblkid.so /home/paralin/buildroot/output/build/util-linux-2.31/.libs/libuuid.so -lrt -pthread
 -Wl,-rpath -Wl,/home/paralin/buildroot/output/build/systemd-234/.libs -Wl,-rpath -Wl,/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sys
root/usr/lib -Wl,-rpath -Wl,/home/paralin/buildroot/output/build/linux-pam-1.3.0/libpam/.libs -Wl,-rpath -Wl,/home/paralin/buildroot/output/build/util-linu
x-2.31/.libs -Wl,-rpath -Wl,/lib/systemd -Wl,-rpath -Wl,/home/paralin/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib                                              
/lib/libpam.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:12785: systemd-analyze] Error 1

Thanks,
Christian
