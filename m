From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= <leo@yuriev.ru>
Date: Tue, 6 Oct 2020 01:12:10 +0300
Subject: [Buildroot] CMake issue with pthread library (bug report)
Message-ID: <CAO2+NUABZp7JAY=yNDegsQCcRZhaHhg9kGmcyKWbddiGdckSFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When testing my package, I found a series of similar problems when
building for some platforms.
For instance:
$ utils/test-pkg -k -a -p libmdbx
                             andes-nds32 [ 1/45]: FAILED
                             arm-aarch64 [ 2/45]: FAILED
                    bootlin-x86-64-glibc [ 3/45]: FAILED
                        br-aarch64-glibc [ 4/45]: FAILED
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: OK
                  br-arm-cortex-a9-glibc [ 7/45]: FAILED
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: SKIPPED
                      br-arm-full-static [12/45]: OK
                   br-i386-pentium4-full [13/45]: OK
                br-i386-pentium-mmx-musl [14/45]: OK
                       br-m68k-5208-full [15/45]: SKIPPED
                      br-m68k-68040-full [16/45]: OK
                    br-microblazeel-full [17/45]: FAILED
                 br-mips32r6-el-hf-glibc [18/45]: FAILED
                      br-mips64-n64-full [19/45]: OK
                 br-mips64r6-el-hf-glibc [20/45]: FAILED
                      br-mipsel-o32-full [21/45]: OK
                          br-nios2-glibc [22/45]: FAILED
                      br-openrisc-uclibc [23/45]: OK
               br-powerpc-603e-basic-cpp [24/45]: OK
             br-powerpc64le-power8-glibc [25/45]: FAILED
               br-powerpc64-power7-glibc [26/45]: FAILED
                  br-powerpc-e500mc-full [27/45]: OK
                              br-riscv32 [28/45]: FAILED
                              br-riscv64 [29/45]: FAILED
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                        br-sparc64-glibc [32/45]: FAILED
                         br-sparc-uclibc [33/45]: SKIPPED
                    br-x86-64-core2-full [34/45]: OK
                          br-x86-64-musl [35/45]: OK
                          br-xtensa-full [36/45]: OK
                       linaro-aarch64-be [37/45]: FAILED
                          linaro-aarch64 [38/45]: FAILED
                              linaro-arm [39/45]: FAILED
                     sourcery-arm-armv4t [40/45]: FAILED
                            sourcery-arm [41/45]: FAILED
                     sourcery-arm-thumb2 [42/45]: FAILED
                         sourcery-mips64 [43/45]: FAILED
                           sourcery-mips [44/45]: FAILED
                          sourcery-nios2 [45/45]: FAILED
45 builds, 4 skipped, 23 build failed, 0 legal-info failed

The reason is that CMake doesn't link executables and so-libraries
with the pthread library and doesn't use the '-pthread' flag either.
If you dig a little deeper, you can see that the Assembly always
breaks when the code of pthreads functions is in the separate library
(which should be linked explicitly).

I observe this behavior with cmake 3.17.4 on Fedora 32 and with cmake
3.16.3 on Ubuntu 20.04.
At the same time, I am sure that everything is correct in my CMakefiles.
In particular, when building locally for a host system, I see the
`-pthread` flag in the linking commands (or linking with a pthread
library on the other host).

I looked at support/misc/toolchainfile.cmake.in and
package/pkg-cmake.mk but I didn't notice any errors.
So, it would be nice for someone else to pay attention to this problem.

Regards,
Leonid.

P.S.
As a workaround, I temporarily added a patch to my package that
forcibly adds the `-pthread` flag for linking executables and
so-libraries.
https://github.com/erthink/libmdbx/commit/787eaaa373073e17f3a53658b085c255bc2c8ff8
