From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 20 Nov 2007 16:19:02 -0800 (PST)
Subject: [Buildroot] ImageMagick fails to build also due to incorrect
 libfile file location
Message-ID: <13868781.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

ImageMagick depends on libtiff from below line. 

imagemagick: uclibc jpeg tiff $(IMAGEMAGICK_LIB) \

While imagemagick is being built, its libtool uses rpath from /usr/lib. 
But in tiff.mk file, libtiff.so files are kept inside $(STAGING_DIR)/lib/.
so Now imagemagick checks for libtiff file from OS root folder /usr/lib and
find a different format and fails with below error. 

ltdl/ltdl.c:3535: warning: the address of 'archive_ext' will always evaluate
as 'true'
ltdl/ltdl.c:3538: warning: the address of 'shlib_ext' will always evaluate
as 'true'
ltdl/ltdl.c: In function 'lt_dlpath_insertdir':
ltdl/ltdl.c:4037: warning: comparison between signed and unsigned
/bin/sh ./libtool --silent --tag=CC   --mode=link
/home/guru/project/toolchain/new/usr/bin/arm-linux-uclibcgnueabi-gcc -Os
-pipe -I/home/guru/project/toolchain/new/usr/include
-I/home/guru/project/toolchain/new/include
--sysroot=/home/guru/project/toolchain/new/ -isysroot
/home/guru/project/toolchain/new -mtune=arm9tdmi  -g -O2 -Wall -W -pthread
-no-undefined -export-symbols-regex ".*" -version-info 4:5:1  -o
ltdl/libltdl.la  ltdl/ltdl.lo -ldl 
libtool: link: warning: `-version-info/-version-number' is ignored for
convenience libraries
/bin/sh ./libtool --silent --tag=CC   --mode=link
/home/guru/project/toolchain/new/usr/bin/arm-linux-uclibcgnueabi-gcc -Os
-pipe -I/home/guru/project/toolchain/new/usr/include
-I/home/guru/project/toolchain/new/include
--sysroot=/home/guru/project/toolchain/new/ -isysroot
/home/guru/project/toolchain/new -mtune=arm9tdmi  -g -O2 -Wall -W -pthread
-no-undefined -export-symbols-regex ".*"  -version-info 10:9:0  -o
magick/libMagick.la -rpath /usr/lib magick/magick_libMagick_la-animate.lo
magick/magick_libMagick_la-annotate.lo 

<snip>
<snip>
<snip>
<snip>

magick/magick_libMagick_la-threshold.lo magick/magick_libMagick_la-type.lo
magick/magick_libMagick_la-utility.lo magick/magick_libMagick_la-version.lo
magick/magick_libMagick_la-widget.lo magick/magick_libMagick_la-xml-tree.lo
magick/magick_libMagick_la-xwindow.lo  -ltiff -ljpeg -lz -lm -lpthread
ltdl/libltdl.la 
/usr/lib/libtiff.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[1]: *** [magick/libMagick.la] Error 1
make[1]: Leaving directory
`/home/guru/project/original/bldrt/buildroot/build_arm/ImageMagick-6.3.7'
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/ImageMagick-6.3.7/.compiled]
Error 2


Kindly help me to fix this. Thanks in advance

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/ImageMagick-fails-to-build-also-due-to-incorrect-libfile-file-location-tf4847270.html#a13868781
Sent from the BuildRoot mailing list archive at Nabble.com.
