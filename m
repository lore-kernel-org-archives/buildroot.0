From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 9 Jun 2007 02:06:06 -0700
Subject: [Buildroot] [buildroot 0001387]: Trying to build the file package
	with config update failes
Message-ID: <7d291d7bd1c62dc8d106df987829cf75@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1387 
====================================================================== 
Reported By:                Rod Boyce
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1387
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-09-2007 02:06 PDT
Last Modified:              06-09-2007 02:06 PDT
====================================================================== 
Summary:                    Trying to build the file package with config update
failes
Description: 
While trying to do a clean rebuild and build the file utility I get a
failure during the host confiure stage.  But if I comment out the config
update then the host configure sucessfully completes and the package is
sucessfully build on my system.

My configureation is:
target: i586 (Via PD600)
build machine: fedora core 5

my simple workaround fix is:
Index: package/file/file.mk
===================================================================
--- package/file/file.mk        (revision 18784)
+++ package/file/file.mk        (working copy)
@@ -54,7 +54,7 @@
 $(FILE_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
        $(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
        toolchain/patch-kernel.sh $(FILE_SOURCE_DIR) package/file/
file\*.patch
-       $(CONFIG_UPDATE) $(FILE_SOURCE_DIR)
+#      $(CONFIG_UPDATE) $(FILE_SOURCE_DIR)
        touch $(FILE_SOURCE_DIR)/.unpacked

 $(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked


The build log that produces the error every time without the above fix
is:
[rod at celeron root]$ make file
if [ ! -e
"/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin/sed" ]
; then \
	mkdir -p
"/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin"; \
	rm -f
"/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin/sed";
\
	ln -sf "/bin/sed"
"/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin/sed";
\
fi

Checking build system dependencies:
CC clean:					Ok
CXX clean:					Ok
CPP clean:					Ok
CFLAGS clean:					Ok
INCLUDES clean:					Ok
CXXFLAGS clean:					Ok
which installed:				Ok
sed works:					Ok (/bin/sed)
GNU make version '3.80':			Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.1':			Ok
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.1':			Ok
bison installed:				Ok
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:				Ok
Build system dependencies:			Ok

gzip -d -c /home/rod/projects/car-pc/build-root/root/dl/file-4.19.tar.gz |
tar -C /home/rod/projects/car-pc/build-root/root/build_i586   -xf -
toolchain/patch-kernel.sh
/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19
package/file/ file\*.patch
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess 
/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19
touch
/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19/.unpacked
mkdir -p
/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19-target
(cd /home/rod/projects/car-pc/build-root/root/build_i586/file-4.19-target;
rm -rf config.cache; \
	PATH="/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin:/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin:/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/usr/bin:/home/rod/usr/bin:/usr/local/bin/samsung:/home/rod/usr/bin:/usr/local/bin/samsung:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/home/rod/bin"
AR=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ar
AS=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-as
LD=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld
NM=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-nm
CC=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
GCC=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
CXX=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
CPP=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-cpp
RANLIB=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ranlib
STRIP=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-strip
OBJCOPY=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-objcopy
CC_FOR_BUILD="gcc"
PKG_CONFIG_SYSROOT=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir
PKG_CONFIG=/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/usr/bin/pkg-config
\
	CFLAGS="-Os -pipe " \
	LDFLAGS="" \
	/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19/configure
\
	--target=i586-linux \
	--host=i586-linux \
	--build=i386-pc-linux-gnu \
	--prefix=/usr \
	--exec-prefix=/usr \
	--bindir=/usr/bin \
	--sbindir=/usr/sbin \
	--libdir=/lib \
	--libexecdir=/usr/lib \
	--sysconfdir=/etc \
	--datadir=/usr/share/misc \
	--localstatedir=/var \
	--mandir=/usr/man \
	--infodir=/usr/info \
	--disable-nls \
	 \
	--enable-static \
	--disable-fsect-man5 \
);
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for i586-linux-strip...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-strip
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for builtin ELF support... yes
checking for ELF core file support... yes
checking for file formats in man section 5... no
checking for i586-linux-gcc...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
accepts -g... yes
checking for
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
option to accept ANSI C... none needed
checking for style of include used by make... GNU
checking dependency style of
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc...
gcc3
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking build system type... i386-pc-linux-gnu
checking host system type... i586-pc-linux-gnu
checking for a sed that does not truncate output...
/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/bin/sed
checking for egrep... grep -E
checking for ld used by
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld
checking if the linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
is GNU ld... yes
checking for
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld
option to reload object files... -r
checking for BSD-compatible nm...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-nm
checking how to recognise dependent libraries... pass_all
checking how to run the C preprocessor...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-cpp
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking for i586-linux-g++...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
checking whether we are using the GNU C++ compiler... yes
checking whether
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
accepts -g... yes
checking dependency style of
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++...
gcc3
checking how to run the C++ preprocessor...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
-E
checking for i586-linux-g77... no
checking for i586-linux-f77... no
checking for i586-linux-xlf... no
checking for i586-linux-frt... no
checking for i586-linux-pgf77... no
checking for i586-linux-fort77... no
checking for i586-linux-fl32... no
checking for i586-linux-af77... no
checking for i586-linux-f90... no
checking for i586-linux-xlf90... no
checking for i586-linux-pgf90... no
checking for i586-linux-epcf90... no
checking for i586-linux-f95... no
checking for i586-linux-fort... no
checking for i586-linux-xlf95... no
checking for i586-linux-ifc... no
checking for i586-linux-efc... no
checking for i586-linux-pgf95... no
checking for i586-linux-lf95... no
checking for i586-linux-gfortran... no
checking for g77... no
checking for f77... no
checking for xlf... no
checking for frt... no
checking for pgf77... no
checking for fort77... no
checking for fl32... no
checking for af77... no
checking for f90... no
checking for xlf90... no
checking for pgf90... no
checking for epcf90... no
checking for f95... f95
checking whether we are using the GNU Fortran 77 compiler... yes
checking whether f95 accepts -g... yes
checking the maximum length of command line arguments... 32768
checking command to parse
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-nm
output from
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
object... ok
checking for objdir... .libs
checking for i586-linux-ar...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ar
checking for i586-linux-ranlib...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ranlib
checking for i586-linux-strip... (cached)
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-strip
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
static flag  works... yes
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
supports -fno-rtti -fno-exceptions... no
checking for
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
option to produce PIC... -fPIC
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
PIC flag -fPIC works... yes
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
supports -c -o file.o... yes
checking whether the
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++...
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld
checking if the linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
is GNU ld... yes
checking whether the
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
supports shared libraries... yes
checking for
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
option to produce PIC... -fPIC
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
PIC flag -fPIC works... yes
checking if
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
supports -c -o file.o... yes
checking whether the
/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-g++
linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
appending configuration tag "F77" to libtool
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for f95 option to produce PIC... -fPIC
checking if f95 PIC flag -fPIC works... yes
checking if f95 supports -c -o file.o... yes
checking whether the f95 linker
(/home/rod/projects/car-pc/build-root/root/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking for ANSI C header files... (cached) yes
checking whether sys/types.h defines makedev... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for stdint.h... (cached) yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking for stdint.h... (cached) yes
checking for inttypes.h... (cached) yes
checking for unistd.h... (cached) yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking utime.h usability... yes
checking utime.h presence... yes
checking for utime.h... yes
checking wchar.h usability... yes
checking wchar.h presence... yes
checking for wchar.h... yes
checking wctype.h usability... yes
checking wctype.h presence... yes
checking for wctype.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking for sys/stat.h... (cached) yes
checking for sys/types.h... (cached) yes
checking sys/utime.h usability... no
checking sys/utime.h presence... no
checking for sys/utime.h... no
checking for an ANSI C-conforming const... yes
checking for off_t... yes
checking for size_t... yes
checking for struct stat.st_rdev... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for tm_zone in struct tm... yes
checking for tzname... yes
checking for tm_isdst in struct tm... yes
checking for daylight... yes
checking for special C compiler options needed for large files=
... no
checking for _FILE_OFFSET_BITS value needed for large files... 64
checking for _LARGE_FILES value needed for large files... no
checking for mbstate_t... yes
checking for uint8_t... yes
checking for uint16_t... yes
checking for uint32_t... yes
checking for int32_t... yes
checking for long long... yes
checking for uint64_t... yes
checking size of uint8_t... 0
checking size of uint16_t... 0
checking size of uint32_t... 0
checking size of uint64_t... 0
checking for mmap... yes
checking for strerror... yes
checking for strtoul... yes
checking for mbrtowc... yes
checking for mkstemp... yes
checking for getopt_long... yes
checking for utimes... yes
checking for utime... yes
checking for wcwidth... yes
checking for snprintf... yes
checking for vsnprintf... yes
checking for gzopen in -lz... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating magic/Makefile
config.status: creating doc/Makefile
config.status: creating python/Makefile
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands
touch
/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19-target/.configured
mkdir -p
/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/file-4.19-host
(cd
/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/file-4.19-host;
rm -rf config.cache; \
	CC="gcc" \
	/home/rod/projects/car-pc/build-root/root/build_i586/file-4.19/configure
\
	--prefix=/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/file-4.19-host/install
\
);
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for builtin ELF support... yes
checking for ELF core file support... yes
checking for file formats in man section 5... no
checking for gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ANSI C... none needed
checking for style of include used by make... GNU
checking dependency style of gcc... gcc3
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking build system type... config.guess: missing argument
Try `config.guess --help' for more information.
configure: error: cannot guess build type; you must specify one
make: ***
[/home/rod/projects/car-pc/build-root/root/toolchain_build_i586/file-4.19-host/.configured]
Error 1



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-09-07 02:06  Rod Boyce      New Issue                                    
06-09-07 02:06  Rod Boyce      Status                   new => assigned     
06-09-07 02:06  Rod Boyce      Assigned To               => buildroot       
======================================================================
