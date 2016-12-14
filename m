From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 22:43:42 +0100
Subject: [Buildroot] Script to build-test your packages
Message-ID: <20161214224342.1d79cb05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This has been often asked, and yesterday I needed it, so I did a quick
and dirty hack. The following script takes as argument a defconfig
fragment that defines a bunch of Buildroot configuration options, and
will built this fragment against all the toolchain configurations
tested in the autobuilders.

Example:

~/buildroot$ cat template
BR2_PACKAGE_JACK2=y
BR2_PACKAGE_JACK2_LEGACY=y
BR2_PACKAGE_JACK2_DBUS=y
~/buildroot$ ~/test-all.sh template
                 armv5-ctng-linux-gnueabi : OK
               armv7-ctng-linux-gnueabihf : OK
                         br-aarch64-glibc : OK
                            br-arcle-hs38 : OK
                             br-arm-basic : SKIP
                   br-arm-cortex-a9-glibc : OK
                    br-arm-cortex-a9-musl : OK
                    br-arm-cortex-m4-full : SKIP
                              br-arm-full : OK
                     br-arm-full-nothread : SKIP
                       br-arm-full-static : SKIP
                             br-bfin-full : SKIP
                    br-i386-pentium4-full : OK
                 br-i386-pentium-mmx-musl : OK
                        br-m68k-5208-full : SKIP
                       br-m68k-68040-full : OK
                     br-microblazeel-full : OK
                       br-mips64-n64-full : OK
                  br-mips32r6-el-hf-glibc : OK
                  br-mips64r6-el-hf-glibc : OK
                       br-mipsel-o32-full : OK
                           br-nios2-glibc : OK
                br-powerpc-603e-basic-cpp : SKIP
              br-powerpc64le-power8-glibc : OK
                br-powerpc64-power7-glibc : OK
                   br-powerpc-e500mc-full : OK
                              br-sh4-full : OK
                          br-sparc-uclibc : SKIP
                         br-sparc64-glibc : OK
                     br-x86-64-core2-full : OK
                           br-x86-64-musl : OK
                           br-xtensa-full : OK
                      i686-ctng-linux-gnu : OK
                           linaro-aarch64 : FAIL
                               linaro-arm : FAIL
              mips64el-ctng_n32-linux-gnu : OK
              mips64el-ctng_n64-linux-gnu : FAIL
         powerpc-ctng_e500v2-linux-gnuspe : OK
                      sourcery-arm-armv4t : OK
                             sourcery-arm : OK
                      sourcery-arm-thumb2 : OK
                          sourcery-mips64 : OK
                            sourcery-mips : OK
                           sourcery-nios2 : OK
                              sourcery-sh : FAIL
                          sourcery-x86-64 : OK
                             sourcery-x86 : OK
            x86_64-ctng_locales-linux-gnu : OK
~/buildroot$

So, the jack2 package, with both its "legacy" and "dbus" backends has
been built in all those configurations.

It says "OK" when the build was successful, "FAIL" when it failed and
"SKIP" when for some reason the options could not be enabled for the
current toolchain configuration (for example if this package is
disabled on this architecture, or if a toolchain feature is missing,
etc.).

Note that the script excludes the "internal toolchain" configurations,
because they take too long to build.

The below script is horribly, hardcodes the output directory, assumes
you run it from the Buildroot source directory, has absolutely no error
checking whatsoever and needs more love. But I wanted to share it to
get some feedback, and hopefully improve it up to something that can be
merged if there's interest.

One nice trick is that you can re-run the script, and it will simply
restart the build. So after fixing your package, if you want to test it
again, you don't have to clean everything and restart from scratch:
just remove the build directory of your package in all output
directories, and restart the script.

The script itself is really trivial:

#!/bin/bash

OUTPUTS=$HOME/projets/outputs/
TEMPLATE=$(readlink -f $1)

toolchains=$(curl -s http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv | cut -f1 -d',' | sed 's%.*/\([^.]*\).config%\1%' | grep -v internal)

for toolchain in ${toolchains} ; do
    output=${OUTPUTS}/${toolchain}
    mkdir -p ${output}
    wget -q -O ${output}/.config http://autobuild.buildroot.org/toolchains/configs/${toolchain}.config
    cat >> ${output}/.config <<EOF
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
EOF
    cat ${TEMPLATE} >> ${output}/.config
    make O=${output} olddefconfig >/dev/null 2>&1
    printf " %40s : " ${toolchain}
    skip=0
    while read line ; do
	if ! grep -q ^${line}$ ${output}/.config ; then
	    skip=1
	fi
    done < <(cat ${TEMPLATE})

    if test ${skip} = 1 ; then
	echo "SKIP"
	continue
    fi

    make O=${output} > ${output}/logfile 2>&1
    [ $? = 0 ] && echo "OK" || echo "FAIL"
done

Enjoy :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
