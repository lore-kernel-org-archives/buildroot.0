From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Mon, 24 Mar 2008 19:37:52 -0700 (PDT)
Subject: [Buildroot] build problems
Message-ID: <33705.99183.qm@web58203.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

I can't speak for Tim. My problems are that stuff I don't know about and don't know how to change - entirely unrelated to embedded kernel issues cause my build to break. I have a newly svn update'd source tree. I would just once like to build a default config before I start customizing. I cannot get through a make. Thats why I keep asking if anyone has a default config (for an arm926) that will build with the current (or any previously tagged) svn tree. I run Ubuntu feisy and think I have all the necessary host tools.

This sequence was copied from the http://www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRoot website where I do:

$ make menuconfig
$ make at91sam9260dfc_defconfig
$ make > at91sam9260dfc.log 2>&1

and here is a snip of the log file:

cp /home/calfee/buildroot/arm/buildroot/toolchain_build_arm/ccache-2.4/ccache /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin
# Keep the actual toolchain binaries in a directory at the same level.
# Otherwise, relative paths for include dirs break.
mkdir -p /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache
(cd /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache; \
                ln -fs arm-linux-uclibc-gcc arm-linux-gcc; \
                ln -fs arm-linux-uclibc-gcc arm-linux-cc; \
                ln -fs arm-linux-uclibc-gcc arm-linux-uclibc-cc; \
        )
[ -f /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc ] && \
                mv /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc \
                        /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache/
(cd /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin; \
                ln -fs ccache arm-linux-cc; \
                ln -fs ccache arm-linux-gcc; \
                ln -fs ccache arm-linux-uclibc-cc; \
                ln -fs ccache arm-linux-uclibc-gcc; \
        )
[ -f /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-c++ ] && \
                mv /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-c++ \
                        /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache/
[ -f /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-g++ ] && \
                mv /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-g++ \
                        /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache/
(cd /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin; \
                ln -fs ccache arm-linux-c++; \
                ln -fs ccache arm-linux-g++;\
                ln -fs ccache arm-linux-uclibc-c++; \
                ln -fs ccache arm-linux-uclibc-g++; \
        )
(cd /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache; \
                ln -fs arm-linux-uclibc-c++ arm-linux-c++; \
                ln -fs arm-linux-uclibc-g++ arm-linux-g++; \
        )
mkdir -p /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
/usr/bin/gcc -g -O2 .//toolchain/sstrip/sstrip.c -o /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-sstrip
ln -snf ../../bin/arm-linux-uclibc-sstrip \
                /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/sstrip
ln -snf arm-linux-uclibc-sstrip \
                /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-sstrip
/home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -O2  -I/home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/include -I/home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/include --sysroot=/home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/ -isysroot /home/calfee/buildroot/arm/buildroot/build_arm/staging_dir .//toolchain/sstrip/sstrip.c -o /home/calfee/buildroot/arm/buildroot/project_build_arm/at91sam9260dfc/root/usr/bin/sstrip
/home/calfee/buildroot/arm/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/ld: cannot open output file /home/calfee/buildroot/arm/buildroot/project_build_arm/at91sam9260dfc/root/usr/bin/sstrip: No such file or directory
collect2: ld returned 1 exit status
make: *** [/home/calfee/buildroot/arm/buildroot/project_build_arm/at91sam9260dfc/root/usr/bin/sstrip] Error 1
[1]+  Exit 2                  make > at91sam9260dfc.log 2>&1

 
 Then I checked to see if sstrip exists:
 
 calfee at squiggy-linux:~/buildroot/arm/buildroot$ find . -name sstrip
./build_arm/staging_dir/usr/arm-linux-uclibc/bin/sstrip
./toolchain/sstrip

calfee at squiggy-linux:~/buildroot/arm/buildroot$ ./build_arm/staging_dir/usr/arm-linux-uclibc/bin/sstrip
Usage: sstrip FILE...
sstrip discards all nonessential bytes from an executable.


And it does, so the path in the makefile must be wrong.

Indeed:
calfee at squiggy-linux:~/buildroot/arm/buildroot$ /home/calfee/buildroot/arm/buildroot/project_build_arm/at91sam9260dfc/root/usr/bin/sstrip
bash: /home/calfee/buildroot/arm/buildroot/project_build_arm/at91sam9260dfc/root/usr/bin/sstrip: No such file or directory

So in this case it seems something has changed in directory naming and somewhere the makefiles are broken. I don't think I have any changed files in my source tree.

As one new to the current buildroot system, I have no idea how to proceed.

Regards, Steve






      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ
