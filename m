From: Christian Stewart <christian@paral.in>
Date: Tue, 26 Dec 2017 16:55:38 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87mv25cg5t.fsf@paral.in>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org> <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de> <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de> <87mv25cg5t.fsf@paral.in>
Message-ID: <87shbxq99x.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar, All,

Christian Stewart <christian@paral.in> writes:
> Hi Waldemar,
>
> Waldemar Brodkorb <wbx@openadk.org> writes:
>>> There are no extra pam files in my Buildroot tree - before building I
>>> ensure this with a "git clean -xfd" and I've searched the tree as well.
>>
>> But that is strange then.
>> find . -name libpam_misc.so\*
>> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0
>> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so
>> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0.82.1
>
> ... please note that I am building out of tree. There are no
> limpam_misc* inside the "buildroot tree" which includes the main source
> tree. When the compilation fails, inside my "output tree":

I can confirm now that even in-tree builds result in the same thing:

libtool: link: /home/paralin/Documents/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-sty
le-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations -Wer
ror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -Wno-m
issing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fstack-
protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fno-lto -Wl,--gc-se
ctions -Wl,--as-needed -Wl,--no-undefined -Wl,-z -Wl,relro -Wl,-z -Wl,now -pie -o systemd-run src/run/run.o  ./.libs/libsystemd-shared.so -L/home/paralin/Documents/buildroot/output/host/arm-buildroot
-linux-gnueabihf/sysroot/usr/lib -lcap -lrt -lresolv /home/paralin/Documents/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblzma.so -llz4 /home/paralin/Documents
/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgcrypt.so /home/paralin/Documents/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgpg-error.so /home/par
alin/Documents/synrobo/skiff/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so /home/paralin/Documents/buildroot/output/build/util-linux-2.31/.libs/libuuid.so -pthread -
Wl,-rpath -Wl,/home/paralin/Documents/buildroot/output/build/systemd-234/.libs -Wl,-rpath -Wl,/home/paralin/Documents/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
 -Wl,-rpath -Wl,/home/paralin/Documents/buildroot/output/build/util-linux-2.31/.libs -Wl,-rpath -Wl,/lib/systemd -Wl,-rpath -Wl,/home/paralin/Documents/buildroot/output/host/arm-buildro
ot-linux-gnueabihf/sysroot/usr/lib                                                                                                                                                                                  
/lib/libpam.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

It must be something with how libpam is discovered that is only
triggered when on a system with a libpam.so layout like Gentoo's.

Any ideas how to go about fixing this?

Best,
Christian
