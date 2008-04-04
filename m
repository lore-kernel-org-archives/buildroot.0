From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 4 Apr 2008 11:02:23 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W><8763v071sq.fsf@macbook.be.48ers.dk>
	<20080402164154.GE9436@mx.loc><0ddc01c89583$84ecb960$f52f9e86@LPSC0173W><87ej9n2kj4.fsf@macbook.be.48ers.dk><0e8d01c89595$e3482140$f52f9e86@LPSC0173W><87bq4r0ybx.fsf@macbook.be.48ers.dk><0e9b01c895a0$47d11590$f52f9e86@LPSC0173W>
	<87ej9mvygr.fsf@macbook.be.48ers.dk>
Message-ID: <0efa01c89632$9b7d9910$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and thanks for the support.

> Just do make menuconfig and select powerpc/405/softfloat and off you
> go.

Did exactly that from a clean svn. Incidentaly I notice that there are now 
far fewer activated defaults (no IPV6, CXX, locale, kernel compilation, 
etc...):
$ make menuconfig
$ make
[...]
                /home/guinevere/buildroot/toolchain_build_powerpc/gmp-4.2.2/configure 
\
                --prefix="/home/guinevere/buildroot/toolchain_build_powerpc/gmp" 
\
                --build=i386-pc-linux-gnu \
                --host=i386-pc-linux-gnu \
                --enable-shared \
                --enable-static \
                --disable-nls \
        )
checking build system type... i386-pc-linux-gnu
checking host system type... i386-pc-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking ABI=32
checking compiler /usr/bin/gcc  -m32 -O2 -fomit-frame-pointer ... yes
checking compiler /usr/bin/gcc  -m32 -O2 -fomit-frame-pointer has 
sizeof(long)==4... yes
checking compiler 
usr/bin/gcc  -m32 -O2 -fomit-frame-pointer  -mtune=i386... yes
checking compiler 
usr/bin/gcc  -m32 -O2 -fomit-frame-pointer -mtune=i386  -march=i386... yes
checking for i386-pc-linux-gnu-gcc... /usr/bin/gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc  accepts -g... yes
checking for /usr/bin/gcc  option to accept ANSI C... none needed
checking how to run the C preprocessor... /usr/bin/cpp
configure: error: C preprocessor "/usr/bin/cpp " fails sanity check
See `config.log' for more details.
make: *** 
[/home/guinevere/buildroot/toolchain_build_powerpc/gmp-4.2.2-host/.configured] 
Error 1

It also tries to compile gmp without the BR2_SOFT_FLOAT option. And same 
error with your .config.

Now gmp is a dependency of uclibc, right ? So I disable the FPU in there... 
same thing.

There's something wrong with the cross compiler, right ?!?

2 $ egrep -v "^#|^$" .config
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="0.10.0-svn"
BR2_powerpc=y
BR2_powerpc_405=y
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="405"
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to the Erik's uClibc development environment."
BR2_BOARD_NAME="arm"
BR2_BOARD_PATH="target/device/ARM"
### What is this doing here ?!?

BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_RECENT=y
BR2_STRIP_strip=y
BR2_OPTIMIZE_S=y
BR2_UPDATE_CONFIG=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_SOURCE=y
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_KERNEL_HEADERS_2_6_24=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.24"
BR2_UCLIBC_VERSION_0_9_29=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_18=y
BR2_BINUTILS_VERSION="2.18"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_2_3=y
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_VERSION="4.2.3"
BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_10_X=y
BR2_BUSYBOX_VERSION="1.10.0"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
BR2_TEXTEDIT_SUPPORT=y
BR2_NETWORK_SUPPORT=y
BR2_BLOCKDEV_SUPPORT=y
BR2_AUDIO_SUPPORT=y
BR2_GRAPHIC_SUPPORT=y
BR2_PACKAGE_XSERVER_none=y
BR2_X11_PREFIX="/usr"
BR2_COMPRESSOR_SUPPORT=y
BR2_SCRIPTING_SUPPORT=y
BR2_XML_SUPPORT=y
BR2_JAVA_SUPPORT=y
BR2_GAMES=y
BR2_KERNEL_none=y



Thanks.
-- 
Guillaume Dargaud
http://www.gdargaud.net/Antarctica/
