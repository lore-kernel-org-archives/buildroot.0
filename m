From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Feb 2017 14:52:57 +0100
Subject: [Buildroot] [PATCH 0/4] support: script to build-test packages
Message-ID: <cover.1486475561.git.yann.morin.1998@free.fr>
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

    $ cat template
    BR2_PACKAGE_JACK2=y
    BR2_PACKAGE_JACK2_LEGACY=y
    BR2_PACKAGE_JACK2_DBUS=y
    $ ./support/scripts/test-pkg -c template -d ~/br-test-jack2 -p jack2
             armv5-ctng-linux-gnueabi : download config, olddefconfig, dirclean, build: OK
           armv7-ctng-linux-gnueabihf : download config, olddefconfig, dirclean, build: OK
                     br-aarch64-glibc : download config, olddefconfig, dirclean, build: OK
                        br-arcle-hs38 : download config, olddefconfig, dirclean, build: OK
                         br-arm-basic : download config, olddefconfig, SKIP
               br-arm-cortex-a9-glibc : download config, olddefconfig, dirclean, build: OK
                br-arm-cortex-a9-musl : download config, olddefconfig, dirclean, build: OK
                br-arm-cortex-m4-full : download config, olddefconfig, SKIP
                          br-arm-full : download config, olddefconfig, dirclean, build: OK
                 br-arm-full-nothread : download config, olddefconfig, SKIP
                   br-arm-full-static : download config, olddefconfig, SKIP
                         br-bfin-full : download config, olddefconfig, SKIP
                br-i386-pentium4-full : download config, olddefconfig, dirclean, build: OK
             br-i386-pentium-mmx-musl : download config, olddefconfig, dirclean, build: OK
                    br-m68k-5208-full : download config, olddefconfig, SKIP
                   br-m68k-68040-full : download config, olddefconfig, dirclean, build: OK
                 br-microblazeel-full : download config, olddefconfig, dirclean, build: OK
                   br-mips64-n64-full : download config, olddefconfig, dirclean, build: OK
              br-mips32r6-el-hf-glibc : download config, olddefconfig, dirclean, build: OK
              br-mips64r6-el-hf-glibc : download config, olddefconfig, dirclean, build: OK
                   br-mipsel-o32-full : download config, olddefconfig, dirclean, build: OK
                       br-nios2-glibc : download config, olddefconfig, dirclean, build: OK
            br-powerpc-603e-basic-cpp : download config, olddefconfig, SKIP
          br-powerpc64le-power8-glibc : download config, olddefconfig, dirclean, build: OK
            br-powerpc64-power7-glibc : download config, olddefconfig, dirclean, build: OK
               br-powerpc-e500mc-full : download config, olddefconfig, dirclean, build: OK
                          br-sh4-full : download config, olddefconfig, dirclean, build: OK
                      br-sparc-uclibc : download config, olddefconfig, SKIP
                     br-sparc64-glibc : download config, olddefconfig, dirclean, build: OK
                 br-x86-64-core2-full : download config, olddefconfig, dirclean, build: OK
                       br-x86-64-musl : download config, olddefconfig, dirclean, build: OK
                       br-xtensa-full : download config, olddefconfig, dirclean, build: OK
                  i686-ctng-linux-gnu : download config, olddefconfig, dirclean, build: OK
                       linaro-aarch64 : download config, olddefconfig, dirclean, build: FAIL
                           linaro-arm : download config, olddefconfig, dirclean, build: FAIL
          mips64el-ctng_n32-linux-gnu : download config, olddefconfig, dirclean, build: OK
          mips64el-ctng_n64-linux-gnu : download config, olddefconfig, dirclean, build: FAIL
     powerpc-ctng_e500v2-linux-gnuspe : download config, olddefconfig, dirclean, build: OK
                  sourcery-arm-armv4t : download config, olddefconfig, dirclean, build: OK
                         sourcery-arm : download config, olddefconfig, dirclean, build: OK
                  sourcery-arm-thumb2 : download config, olddefconfig, dirclean, build: OK
                      sourcery-mips64 : download config, olddefconfig, dirclean, build: OK
                        sourcery-mips : download config, olddefconfig, dirclean, build: OK
                       sourcery-nios2 : download config, olddefconfig, dirclean, build: OK
                          sourcery-sh : download config, olddefconfig, dirclean, build: FAIL
                      sourcery-x86-64 : download config, olddefconfig, dirclean, build: OK
                         sourcery-x86 : download config, olddefconfig, dirclean, build: OK
        x86_64-ctng_locales-linux-gnu : download config, olddefconfig, dirclean, build: OK
    8 configurations were skipped
    4 configurations would not build

So, the jack2 package, with both its "legacy" and "dbus" backends has
been built in all those configurations.

It says "OK" when the build was successful, "FAIL" when it failed and
"SKIP" when for some reason the options could not be enabled for the
current toolchain configuration (for example if this package is
disabled on this architecture, or if a toolchain feature is missing,
etc.).

Note that the script excludes the "internal toolchain" configurations,
because they take too long to build.

One nice trick is that you can re-run the script, and it will simply
restart the build. So after fixing your package, if you want to test it
again, you don't have to clean everything and restart from scratch:
just remove the build directory of your package in all output
directories, and restart the script.


Regards,
Yann E. MORIN.


The following changes since commit c03f112b63327409c6ebb301d2fa8d873233e0da

  python-service-identity: bump version to 16.0.0 (2017-02-07 14:25:23 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 3a2dfc3a5dcf4389d2b65b91de95124385241a18

  supprt/test-pkg: add option to limit the number of tests (2017-02-07 14:41:50 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      support/scripts: add script to test a package
      support/test-pkg: store lines missing from resulting configuraiton
      support/test-pkg: report number and types of failures
      supprt/test-pkg: add option to limit the number of tests

 support/scripts/test-pkg | 214 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100755 support/scripts/test-pkg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
