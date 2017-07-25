From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:14:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/joe: bump version to 4.4
In-Reply-To: <20170724182544.31732-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 24 Jul 2017 20:25:44 +0200")
References: <20170724182544.31732-1-bernd.kuhls@t-online.de>
Message-ID: <87pocozjr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Add upstream sha1 & md5 hashes.
 > Removed patch 0001 after bessel functions in uClibc were enabled by
 > default:
 > https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Tested with test-pkg using this defconfig

 > BR2_PACKAGE_JOE=y
 > BR2_PACKAGE_JOE_FULL=y

 >                 armv5-ctng-linux-gnueabi [ 1/47]: OK
 >               armv7-ctng-linux-gnueabihf [ 2/47]: OK
 >                         br-aarch64-glibc [ 3/47]: OK
 >                            br-arcle-hs38 [ 4/47]: OK
 >                             br-arm-basic [ 5/47]: OK
 >                   br-arm-cortex-a9-glibc [ 6/47]: OK
 >                    br-arm-cortex-a9-musl [ 7/47]: OK
 >                    br-arm-cortex-m4-full [ 8/47]: SKIPPED
 >                              br-arm-full [ 9/47]: OK
 >                     br-arm-full-nothread [10/47]: OK
 >                       br-arm-full-static [11/47]: OK
 >                             br-bfin-full [12/47]: SKIPPED
 >                    br-i386-pentium4-full [13/47]: OK
 >                 br-i386-pentium-mmx-musl [14/47]: OK
 >                        br-m68k-5208-full [15/47]: SKIPPED
 >                       br-m68k-68040-full [16/47]: OK
 >                     br-microblazeel-full [17/47]: OK
 >                  br-mips32r6-el-hf-glibc [18/47]: OK
 >                       br-mips64-n64-full [19/47]: OK
 >                  br-mips64r6-el-hf-glibc [20/47]: OK
 >                       br-mipsel-o32-full [21/47]: OK
 >                           br-nios2-glibc [22/47]: OK
 >                       br-openrisc-uclibc [23/47]: OK
 >                br-powerpc-603e-basic-cpp [24/47]: OK
 >              br-powerpc64le-power8-glibc [25/47]: OK
 >                br-powerpc64-power7-glibc [26/47]: OK
 >                   br-powerpc-e500mc-full [27/47]: OK
 >                              br-sh4-full [28/47]: OK
 >                         br-sparc64-glibc [29/47]: OK
 >                          br-sparc-uclibc [30/47]: OK
 >                     br-x86-64-core2-full [31/47]: OK
 >                           br-x86-64-musl [32/47]: OK
 >                           br-xtensa-full [33/47]: OK
 >                      i686-ctng-linux-gnu [34/47]: OK
 >                           linaro-aarch64 [35/47]: OK
 >                               linaro-arm [36/47]: OK
 >              mips64el-ctng_n32-linux-gnu [37/47]: OK
 >              mips64el-ctng_n64-linux-gnu [38/47]: OK
 >         powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
 >                      sourcery-arm-armv4t [40/47]: OK
 >                             sourcery-arm [41/47]: OK
 >                      sourcery-arm-thumb2 [42/47]: OK
 >                          sourcery-mips64 [43/47]: OK
 >                            sourcery-mips [44/47]: OK
 >                           sourcery-nios2 [45/47]: OK
 >                          sourcery-x86-64 [46/47]: OK
 >            x86_64-ctng_locales-linux-gnu [47/47]: OK
 > 47 builds, 3 skipped, 0 build failed, 0 legal-info failed

Really?

>>> joe 4.4 Installing to target
/usr/bin/install -m 0755 -D /home/peko/source/buildroot/output-joe/build/joe-4.4/joe /home/peko/source/buildroot/output-joe/target/usr/bin/joe
/usr/bin/install: omitting directory '/home/peko/source/buildroot/output-joe/build/joe-4.4/joe'
package/pkg-generic.mk:308: recipe for target '/home/peko/source/buildroot/output-joe/build/joe-4.4/.stamp_target_installed' failed
make[1]: *** [/home/peko/source/buildroot/output-joe/build/joe-4.4/.stamp_target_installed] Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

joe 4.x seems to have moved the joe binary into the joe/ subdirectory.

I'm not quite sure why we use a custom install step instead of just make
install. This is what joe installs:

make DESTDIR=/tmp/blah install

du -h /tmp/blah/                                                                                                                                            
132K    /tmp/blah/usr/share/man/man1
44K     /tmp/blah/usr/share/man/ru/man1
48K     /tmp/blah/usr/share/man/ru
184K    /tmp/blah/usr/share/man
572K    /tmp/blah/usr/share/joe/syntax
232K    /tmp/blah/usr/share/joe/lang
16K     /tmp/blah/usr/share/joe/charmaps
824K    /tmp/blah/usr/share/joe
312K    /tmp/blah/usr/share/doc/joe
316K    /tmp/blah/usr/share/doc
1.3M    /tmp/blah/usr/share
596K    /tmp/blah/usr/bin
1.9M    /tmp/blah/usr
320K    /tmp/blah/etc/joe
324K    /tmp/blah/etc
2.3M    /tmp/blah/

So ~320KB default configuration in /etc and ~824K of
syntax/lang/charmaps data.

If that is too much, then some of this can be imho be stripped in a
post-build script.

-- 
Bye, Peter Korsgaard
