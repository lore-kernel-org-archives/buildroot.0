From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Feb 2017 21:15:25 +0100
Subject: [Buildroot] [PATCH 0/6 v3] support: script to build-test packages
Message-ID: <cover.1486584734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As Thomas Petazzoni initially wrote (and slightly edited to match the
new script):

This has been often asked, and yesterday I needed it, so I did a quick
and dirty hack. The following script takes as argument a defconfig
fragment that defines a bunch of Buildroot configuration options, and
will built this fragment against all the toolchain configurations
tested in the autobuilders.

Example:

    $ cat test-jack2.snippet
    BR2_PACKAGE_JACK2=y
    BR2_PACKAGE_JACK2_LEGACY=y
    BR2_PACKAGE_JACK2_DBUS=y
    $ ./support/scripts/test-pkg -c test-jack2.snippet -d ~/br-test-jack2 -p jack2
             armv5-ctng-linux-gnueabi : download config, olddefconfig, dirclean, build: OK
           armv7-ctng-linux-gnueabihf : download config, olddefconfig, dirclean, build: OK
                     br-aarch64-glibc : download config, olddefconfig, dirclean, build: OK
                        br-arcle-hs38 : download config, olddefconfig, dirclean, build: OK
                         br-arm-basic : download config, olddefconfig, SKIPPED
               br-arm-cortex-a9-glibc : download config, olddefconfig, dirclean, build: OK
                br-arm-cortex-a9-musl : download config, olddefconfig, dirclean, build: OK
                br-arm-cortex-m4-full : download config, olddefconfig, SKIPPED
                          br-arm-full : download config, olddefconfig, dirclean, build: OK
                 br-arm-full-nothread : download config, olddefconfig, SKIPPED
                   br-arm-full-static : download config, olddefconfig, SKIPPED
                         br-bfin-full : download config, olddefconfig, SKIPPED
                br-i386-pentium4-full : download config, olddefconfig, dirclean, build: OK
             br-i386-pentium-mmx-musl : download config, olddefconfig, dirclean, build: OK
                    br-m68k-5208-full : download config, olddefconfig, SKIPPED
                   br-m68k-68040-full : download config, olddefconfig, dirclean, build: OK
                 br-microblazeel-full : download config, olddefconfig, dirclean, build: OK
                   br-mips64-n64-full : download config, olddefconfig, dirclean, build: OK
              br-mips32r6-el-hf-glibc : download config, olddefconfig, dirclean, build: OK
              br-mips64r6-el-hf-glibc : download config, olddefconfig, dirclean, build: OK
                   br-mipsel-o32-full : download config, olddefconfig, dirclean, build: OK
                       br-nios2-glibc : download config, olddefconfig, dirclean, build: OK
            br-powerpc-603e-basic-cpp : download config, olddefconfig, SKIPPED
          br-powerpc64le-power8-glibc : download config, olddefconfig, dirclean, build: OK
            br-powerpc64-power7-glibc : download config, olddefconfig, dirclean, build: OK
               br-powerpc-e500mc-full : download config, olddefconfig, dirclean, build: OK
                          br-sh4-full : download config, olddefconfig, dirclean, build: OK
                      br-sparc-uclibc : download config, olddefconfig, SKIPPED
                     br-sparc64-glibc : download config, olddefconfig, dirclean, build: OK
                 br-x86-64-core2-full : download config, olddefconfig, dirclean, build: OK
                       br-x86-64-musl : download config, olddefconfig, dirclean, build: OK
                       br-xtensa-full : download config, olddefconfig, dirclean, build: OK
                  i686-ctng-linux-gnu : download config, olddefconfig, dirclean, build: OK
                       linaro-aarch64 : download config, olddefconfig, dirclean, build: FAILED
                           linaro-arm : download config, olddefconfig, dirclean, build: FAILED
          mips64el-ctng_n32-linux-gnu : download config, olddefconfig, dirclean, build: OK
          mips64el-ctng_n64-linux-gnu : download config, olddefconfig, dirclean, build: FAILED
     powerpc-ctng_e500v2-linux-gnuspe : download config, olddefconfig, dirclean, build: OK
                  sourcery-arm-armv4t : download config, olddefconfig, dirclean, build: OK
                         sourcery-arm : download config, olddefconfig, dirclean, build: OK
                  sourcery-arm-thumb2 : download config, olddefconfig, dirclean, build: OK
                      sourcery-mips64 : download config, olddefconfig, dirclean, build: OK
                        sourcery-mips : download config, olddefconfig, dirclean, build: OK
                       sourcery-nios2 : download config, olddefconfig, dirclean, build: OK
                          sourcery-sh : download config, olddefconfig, dirclean, build: FAILED
                      sourcery-x86-64 : download config, olddefconfig, dirclean, build: OK
                         sourcery-x86 : download config, olddefconfig, dirclean, build: OK
        x86_64-ctng_locales-linux-gnu : download config, olddefconfig, dirclean, build: OK
    8 configurations were skipped
    4 configurations would not build

So, the jack2 package, with both its "legacy" and "dbus" backends has
been built in all those configurations.

It says "OK" when the build was successful, "FAILED" when it failed and
"SKIPPED" when for some reason the options could not be enabled for the
current toolchain configuration (for example if this package is
disabled on this architecture, or if a toolchain feature is missing,
etc.).

Note that the script excludes the "internal toolchain" configurations,
because they take too long to build.

One nice trick is that you can re-run the script, and it will simply
restart the build. So after fixing your package, if you want to test it
again, you don't have to clean everything and restart from scratch: the
build directory for your package is removed in each output directory,
and the build resumed.


Changes v2 -> v3:
  - simplify the code to store missing config lines  (Luca)
  - properly run when -r is not provided
  - add 5th path to use an alternate list
  - add 6th patch to print the progress [n/N] for each toolchain


Regards,
Yann E. MORIN.


The following changes since commit 5d065ef1da3c213ad6fc0d039f92dbbb68dca921

  wget: add upstream patch to fix build failure (2017-02-08 15:41:53 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to aeb2ab98194fac3ad0a73727707023552624d52e

  support/test-pkg: print number of toolchain and progress (2017-02-08 21:05:35 +0100)


----------------------------------------------------------------
Yann E. MORIN (6):
      support/scripts: add script to test a package
      support/test-pkg: store lines missing from resulting configuraiton
      support/test-pkg: report number and types of failures
      supprt/test-pkg: add option to limit the number of tests
      support/test-pkg: add option to use an alternate list of toolchains
      support/test-pkg: print number of toolchain and progress

 support/scripts/test-pkg | 257 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100755 support/scripts/test-pkg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
