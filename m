From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Sep 2013 23:36:07 +0200
Subject: [Buildroot] [PATCH v2] python-crc16: new package
In-Reply-To: <1379170427-16802-1-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Sat, 14 Sep 2013 16:53:47 +0200")
References: <1379170427-16802-1-git-send-email-rommel@layer-7.net>
Message-ID: <87ob7rcerc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> A python library that calculates CRC checksums of the CCITT/XModem
 Michael> variant.

 Michael> Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Michael> ---
 Michael> Changes v1 -> v2
 Michael>  * corrected a typo in the filename for the .mk file

 Michael>  package/Config.in                    |    1 +
 Michael>  package/python-crc16/Config.in       |   11 +++++++++++
 Michael>  package/python-crc16/python-crc16.mk |   34 ++++++++++++++++++++++++++++++++++
 Michael>  3 files changed, 46 insertions(+)
 Michael>  create mode 100644 package/python-crc16/Config.in
 Michael>  create mode 100644 package/python-crc16/python-crc16.mk

 Michael> diff --git a/package/Config.in b/package/Config.in
 Michael> index 2884bfb..ccd5e11 100644
 Michael> --- a/package/Config.in
 Michael> +++ b/package/Config.in
 Michael> @@ -385,6 +385,7 @@ source "package/python/Config.in"
 Michael>  if BR2_PACKAGE_PYTHON
 Michael>  menu "external python modules"
 Michael>  source "package/python-bottle/Config.in"
 Michael> +source "package/python-crc16/Config.in"
 Michael>  source "package/python-dpkt/Config.in"
 Michael>  source "package/python-id3/Config.in"
 Michael>  source "package/python-mad/Config.in"
 Michael> diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
 Michael> new file mode 100644
 Michael> index 0000000..d5c62e9
 Michael> --- /dev/null
 Michael> +++ b/package/python-crc16/Config.in
 Michael> @@ -0,0 +1,11 @@
 Michael> +config BR2_PACKAGE_PYTHON_CRC16
 Michael> +	bool "python-crc16"
 Michael> +	depends on BR2_PACKAGE_PYTHON
 Michael> +	help
 Michael> +	  This library calculates only CRC16 (16-bit codes) and the
 Michael> +	  only supported variant at the moment is CRC-CCITT (XModem).
 Michael> +	  CRC is a way of detecting accidental changes in data storage
 Michael> +	  or transmission. There are many variants of CRC and CRC16,
 Michael> +	  in particular.
 Michael> +
 Michael> +	  http://pycrc16.googlecode.com/files/crc16-0.1.1.tar.gz

The URL should just be the homepage, so without /files/..

I was just about to commit it, but it doesn't build here
(qemu_arm_versatile_defconfig + default external codesourcery
toolchain):

building 'crc16._crc16' extension
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/src
/home/peko/source/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -fPIC -I/home/peko/source/buildroot/output/build/python-2.7.3/Include -I/home/peko/source/buildroot/output/build/python-2.7.3 -c src/_crc16module.c -o build/temp.linux-x86_64-2.7/src/_crc16module.o
/home/peko/source/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -shared -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os build/temp.linux-x86_64-2.7/src/_crc16module.o -L/usr/lib -lpython2.7 -o build/lib.linux-x86_64-2.7/crc16/_crc16.so
/home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
/usr/lib/libpython2.7.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

It seems like it tries to build it natively instead of for the
target. Any ideas?

-- 
Bye, Peter Korsgaard
