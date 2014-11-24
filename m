From: bart.thoelen at telenet.be <bart.thoelen@telenet.be>
Date: Mon, 24 Nov 2014 18:02:52 +0100 (CET)
Subject: [Buildroot] buildroot does not copy the C++ headers to sysroot
In-Reply-To: <87k32ktzi7.fsf@dell.be.48ers.dk>
References: <1600692898.53530555.1416834863233.JavaMail.root@telenet.be>
 <87oarwu2y3.fsf@dell.be.48ers.dk>
 <1376091194.53675670.1416840204279.JavaMail.root@telenet.be>
 <87k32ktzi7.fsf@dell.be.48ers.dk>
Message-ID: <349401945.53923382.1416848572340.JavaMail.root@telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found the problem.  It was using the -I(includedir) in the Makefile.am of the projects.
This was causing the Makefile to get the headers from /usr/include.

The hint "look at config.log" did wonders to me ;).  Thanks.  

>>> nmcmdserver_CPPFLAGS = -I$(includedir) -Wall -O3 -Werror -DNMSERVER_BUILD=$(SVN_REVISION)

I did this to let the Make automatically look for headers in the install directory (looked convenient to use libraries that way).

Now it puzzles me why this works in our custom make-file/batch-file build system.

Anyway, Case closed.

many thanks.

Greetz,

BartT

----- Original Message -----
From: "Peter Korsgaard" <peter@korsgaard.com>
To: "bart thoelen" <bart.thoelen@telenet.be>, buildroot at uclibc.org
Sent: Monday, November 24, 2014 4:00:16 PM
Subject: Re: buildroot does not copy the C++ headers to sysroot

>>>>> "bart" == bart thoelen <bart.thoelen@telenet.be> writes:

Hi,

Please keep the mailing list in CC so others can help.

 > Hi,
> when searching in the staging directory, none of the C++ headers
> (string, vector ... ) showup.

That is because those headers are part of the toolchain, so they are not
actually present in usr/include.

E.G.:

cat defconfig
BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305=y

find output/host -name string
output/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.7.3/string
output/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.7.3/debug/string

And it gets correctly found by the cross compiler:

cat test.cpp
#include <iostream>
#include <string>

int main(void)
{
  std::string s("hello world");
  std::cout << s << std::endl;
  return 0;
}

strace -e open -f ./output/host/usr/bin/arm-none-linux-gnueabi-g++ -o test test.cpp 2>&1 | grep string
[pid 17378] open("/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/include/c++/4.7.3/bits/stringfwd.h", O_RDONLY|O_NOCTTY|O_LARGEFILE) = 3
[pid 17378] open("/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/include/c++/4.7.3/string", O_RDONLY|O_NOCTTY|O_LARGEFILE) = 3
[pid 17378] open("/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/include/c++/4.7.3/bits/basic_string.h", O_RDONLY|O_NOCTTY|O_LARGEFILE) = 3
[pid 17378] open("/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/include/c++/4.7.3/bits/basic_string.tcc", O_RDONLY|O_NOCTTY|O_LARGEFI


 > Below is the output of the build process during the nm_libraries.

 > I guess due to the absence of the C++ header files, the configure "assumes" they are on /usr/include.

 > A snap out of the build process...

 > checking string usability... no
 > checking string presence... no
 > checking for string... no
 > checking vector usability... no
 > checking vector presence... no
 > checking for vector... no

And what does config.log show regarding these tests?

 >>>> nm_libraries 1.0 Building
 > PATH="/home/bartt/dx2/buildroot-2014.08/output/host/bin:/home/bartt/dx2/buildroot-2014.08/output/host/sbin:/home/bartt/dx2/buildroot-2014.08/output/host/usr/bin:/home/bartt/dx2/buildroot-2014.08/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/uClinux_10r1-4/bfin-uclinux/bin:/opt/uClinux_10r1-4/bfin-elf/bin/:/opt/freescale-coldfire-4.2/bin/:/opt/Xilinx/SDK/2013.4/gnu/arm/lin/bin:/opt/Xilinx/SDK/2013.4/bin/lin"
 > /usr/bin/make -j3 -C
 > /home/bartt/dx2/buildroot-2014.08/output/build/nm_libraries-1.0/
 > make[1]: Entering directory `/home/bartt/dx2/buildroot-2014.08/output/build/nm_libraries-1.0'
 > Making all in nmcriticalsection
 > make[2]: Entering directory
 > `/home/bartt/dx2/buildroot-2014.08/output/build/nm_libraries-1.0/nmcriticalsection'
 > /bin/bash ../libtool --tag=CXX --mode=compile
 > /home/bartt/dx2/buildroot-2014.08/output/host/usr/bin/arm-xilinx-linux-gnueabi-g++
 > -DPACKAGE_NAME=\"amfwcommonlibs\" -DPACKAGE_TARNAME=\"amfwcommonlibs\"
 > -DPACKAGE_VERSION=\"1.0\" -DPACKAGE_STRING=\"amfwcommonlibs\ 1.0\"
 > -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\"
 > -DPACKAGE=\"amfwcommonlibs\" -DVERSION=\"1.0\" -DSTDC_HEADERS=1
 > -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
 > -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1
 > -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1
 > -DHAVE_STDLIB_H=1 -DHAVE_STDIO_H=1 -DHAVE_DLFCN_H=1
 > -DLT_OBJDIR=\".libs/\" -I.  -I/usr/include -Wall -O3 -Werror

-I/usr/include is wrong for cross compilation, so that's why it fails
below. config.log will most likely contain hints about why the configure
test failed.

-- 
Bye, Peter Korsgaard 
