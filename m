From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 09:43:15 +0100
Subject: [Buildroot] [PATCH v2 4/4] cdrkit: convert to CMAKETARGETS
 infrastructure
In-Reply-To: <1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110126094315.3eb2cd52@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

On Sat, 15 Jan 2011 21:53:28 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> +## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
> +## some extra flags so it finds needed libs and headers.
> +CDRKIT_CONF_OPT += -DCMAKE_REQUIRED_INCLUDES="$(STAGING_DIR)/usr/include"
> +CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
> +HOST_CDRKIT_CONF_OPT += -DCMAKE_REQUIRED_INCLUDES="$(HOST_DIR)/usr/include"
> +HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"

This does not seem to be sufficient: I don't have <sys/capability.h>
installed system-wide, but it is present in $(HOST_DIR)/usr/include,
but still host-cdrkit doesn't build:

/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:78:56: error: sys/capability.h: No such file or directory

See the following build log:

>>> host-cdrkit 1.1.10 Configuring
(cd /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/ && rm -f CMakeCache.txt && /home/thomas/local/outputs/cmake/host/usr/bin/cmake /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/ -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_FIND_ROOT_PATH="/home/thomas/local/outputs/cmake/host" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_REQUIRED_INCLUDES="/home/thomas/local/outputs/cmake/host/usr/include" -DCMAKE_EXE_LINKER_FLAGS="-L/home/thomas/local/outputs/cmake/host/lib -L/home/thomas/local/outputs/cmake/host/usr/lib -Wl,-rpath,/home/thomas/local/outputs/cmake/host/usr/lib" )
Re-run cmake no build system arguments
-- The C compiler identification is GNU
-- Check for working C compiler: /usr/bin/gcc
-- Check for working C compiler: /usr/bin/gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
CMake Warning (dev) in CMakeLists.txt:
  No cmake_minimum_required command is present.  A line of code such as

    cmake_minimum_required(VERSION 2.8)

  should be added at the top of the file.  The version specified may be lower
  if you wish to support older CMake versions for this project.  For more
  information run "cmake --help-policy CMP0000".
This warning is for project developers.  Use -Wno-dev to suppress it.

Configuring Cdrkit, version 1.1.10
-- Looking for sys/types.h
-- Looking for sys/types.h - found
-- Looking for stdint.h
-- Looking for stdint.h - found
-- Looking for stddef.h
-- Looking for stddef.h - found
-- Check size of short
-- Check size of short - done
-- Check size of int
-- Check size of int - done
-- Check size of long
-- Check size of long - done
-- Check size of long long
-- Check size of long long - done
-- Check size of float
-- Check size of float - done
-- Check size of double
-- Check size of double - done
-- Check size of char*
-- Check size of char* - done
-- Check if the system is big endian
-- Searching 16 bit integer
-- Check size of unsigned short
-- Check size of unsigned short - done
-- Using unsigned short
-- Check if the system is big endian - little endian
-- Looking for include files HAVE_STDARG_H
-- Looking for include files HAVE_STDARG_H - found
-- Looking for include files HAVE_STDLIB_H
-- Looking for include files HAVE_STDLIB_H - found
-- Looking for include files HAVE_STRING_H
-- Looking for include files HAVE_STRING_H - found
-- Looking for include files HAVE_STRINGS_H
-- Looking for include files HAVE_STRINGS_H - found
-- Looking for include files HAVE_UNISTD_H
-- Looking for include files HAVE_UNISTD_H - found
-- Looking for include files HAVE_GETOPT_H
-- Looking for include files HAVE_GETOPT_H - found
-- Looking for include files HAVE_LIMITS_H
-- Looking for include files HAVE_LIMITS_H - found
-- Looking for include files HAVE_FCNTL_H
-- Looking for include files HAVE_FCNTL_H - found
-- Looking for include files HAVE_SYS_FILE_H
-- Looking for include files HAVE_SYS_FILE_H - found
-- Looking for include files HAVE_INTTYPES_H
-- Looking for include files HAVE_INTTYPES_H - found
-- Looking for include files HAVE_DIRENT_H
-- Looking for include files HAVE_DIRENT_H - found
-- Looking for include files HAVE_ALLOCA_H
-- Looking for include files HAVE_ALLOCA_H - found
-- Looking for include files HAVE_TERMIOS_H
-- Looking for include files HAVE_TERMIOS_H - found
-- Looking for include files HAVE_TERMIO_H
-- Looking for include files HAVE_TERMIO_H - found
-- Looking for include files HAVE_PWD_H
-- Looking for include files HAVE_PWD_H - found
-- Looking for include files HAVE_SYS_TIME_H
-- Looking for include files HAVE_SYS_TIME_H - found
-- Looking for include files HAVE_UTIME_H
-- Looking for include files HAVE_UTIME_H - found
-- Looking for include files HAVE_SYS_IOCTL_H
-- Looking for include files HAVE_SYS_IOCTL_H - found
-- Looking for include files HAVE_SYS_PARAM_H
-- Looking for include files HAVE_SYS_PARAM_H - found
-- Looking for include files HAVE_WAIT_H
-- Looking for include files HAVE_WAIT_H - found
-- Looking for include files HAVE_SYS_WAIT_H
-- Looking for include files HAVE_SYS_WAIT_H - found
-- Looking for include files HAVE_SYS_RESOURCE_H
-- Looking for include files HAVE_SYS_RESOURCE_H - found
-- Looking for include files HAVE_SYS_UTSNAME_H
-- Looking for include files HAVE_SYS_UTSNAME_H - found
-- Looking for include files HAVE_POLL_H
-- Looking for include files HAVE_POLL_H - found
-- Looking for include files HAVE_SYS_POLL_H
-- Looking for include files HAVE_SYS_POLL_H - found
-- Looking for include files HAVE_NETDB_H
-- Looking for include files HAVE_NETDB_H - found
-- Looking for include files HAVE_SYS_SOCKET_H
-- Looking for include files HAVE_SYS_SOCKET_H - found
-- Looking for include files HAVE_LINUX_PG_H
-- Looking for include files HAVE_LINUX_PG_H - found
-- Looking for include files HAVE_ARPA_INET_H
-- Looking for include files HAVE_ARPA_INET_H - found
-- Looking for include files HAVE_SYS_IPC_H
-- Looking for include files HAVE_SYS_IPC_H - found
-- Looking for include files HAVE_SYS_MMAN_H
-- Looking for include files HAVE_SYS_MMAN_H - found
-- Looking for include files HAVE_SYS_DKIO_H
-- Looking for include files HAVE_SYS_DKIO_H - not found.
-- Looking for include files HAVE_SUN_DKIO_H
-- Looking for include files HAVE_SUN_DKIO_H - not found.
-- Looking for include files HAVE_ICONV_H
-- Looking for include files HAVE_ICONV_H - found
-- Performing Test USE_LIBC_ICONV
-- Performing Test USE_LIBC_ICONV - Success
-- Performing Test HAVE_DRAND48
-- Performing Test HAVE_DRAND48 - Success
-- Performing Test HAVE_DRAND
-- Performing Test HAVE_DRAND - Failed
-- Performing Test HAVE_GETNAMEINFO
-- Performing Test HAVE_GETNAMEINFO - Success
-- Performing Test HAVE_INET_NTOA
-- Performing Test HAVE_INET_NTOA - Success
-- Performing Test HAVE_UNION_WAIT
-- Performing Test HAVE_UNION_WAIT - Success
-- Performing Test HAVE_MLOCKALL
-- Performing Test HAVE_MLOCKALL - Success
-- Performing Test HAVE_DYN_ARRAYS
-- Performing Test HAVE_DYN_ARRAYS - Success
-- Looking for include files HAVE_CAMLIB_H
-- Looking for include files HAVE_CAMLIB_H - not found.
-- Performing Test LIBC_SOCKET
-- Performing Test LIBC_SOCKET - Success
-- Performing Test LIBC_SCHED
-- Performing Test LIBC_SCHED - Success
-- Looking for include files USE_MAGIC
-- Looking for include files USE_MAGIC - not found.
-- Looking for include files USE_PTHREAD
-- Looking for include files USE_PTHREAD - found
-- Looking for getopt_long
-- Looking for getopt_long - found
-- Looking for include files HAVE_SYS_CAPABILITY_H
-- Looking for include files HAVE_SYS_CAPABILITY_H - found
-- Performing Test USE_LIBC_SOCKET
-- Performing Test USE_LIBC_SOCKET - Success
-- Performing Test USE_LIBC_NLS
-- Performing Test USE_LIBC_NLS - Success
-- Configuring done
CMake Warning (dev) at genisoimage/CMakeLists.txt:52 (ADD_EXECUTABLE):
  Policy CMP0003 should be set before this line.  Add code such as

    if(COMMAND cmake_policy)
      cmake_policy(SET CMP0003 NEW)
    endif(COMMAND cmake_policy)

  as early as possible but after the most recent call to
  cmake_minimum_required or cmake_policy(VERSION).  This warning appears
  because target "devdump" links to some libraries for which the linker must
  search:

    pthread

  and other libraries with known full path:

    /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/libwodimstuff.a
    /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libusal/libusal.a
    /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/librols/librols.a
    /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libunls/libunls.a

  CMake is adding directories in the second list to the linker search path in
  case they are needed to find libraries from the first list (for backwards
  compatibility with CMake 2.4).  Set policy CMP0003 to OLD or NEW to enable
  or disable this behavior explicitly.  Run "cmake --help-policy CMP0003" for
  more information.
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Generating done
-- Build files have been written to: /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10
>>> host-cdrkit 1.1.10 Building
PATH=/home/thomas/local/outputs/cmake/host/bin:/home/thomas/local/outputs/cmake/host/usr/bin:/home/thomas/sys/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games LD_LIBRARY_PATH="/home/thomas/local/outputs/cmake/host/usr/lib:" PKG_CONFIG="" PKG_CONFIG_LIBDIR="/home/thomas/local/outputs/cmake/host/usr/lib/pkgconfig" PERLLIB="/home/thomas/local/outputs/cmake/host/usr/lib/perl"  /usr/bin/make -j2  -C /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/
make[1]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[2]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/librols/CMakeFiles/rols.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/librols/CMakeFiles/rols.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/librols/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/librols/CMakeFiles/rols.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodimstuff.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodimstuff.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodimstuff.dir/depend.internal".
Scanning dependencies of target wodimstuff
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[  0%] Scanning dependencies of target rols
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Building C object wodim/CMakeFiles/wodimstuff.dir/cd_misc.o
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[  1%] Building C object librols/CMakeFiles/rols.dir/astoi.o
[  1%] Building C object librols/CMakeFiles/rols.dir/astoll.o
[  1%] Building C object wodim/CMakeFiles/wodimstuff.dir/defaults.o
[  1%] Building C object librols/CMakeFiles/rols.dir/astoull.o
[  2%] Building C object librols/CMakeFiles/rols.dir/breakline.o
[  3%] Building C object wodim/CMakeFiles/wodimstuff.dir/getnum.o
[  3%] Building C object librols/CMakeFiles/rols.dir/cmpbytes.o
[  3%] Building C object wodim/CMakeFiles/wodimstuff.dir/misc.o
[  4%] Building C object librols/CMakeFiles/rols.dir/comerr.o
[  5%] Building C object wodim/CMakeFiles/wodimstuff.dir/modes.o
[  5%] Building C object librols/CMakeFiles/rols.dir/error.o
[  6%] Building C object librols/CMakeFiles/rols.dir/fexec.o
[  6%] Building C object wodim/CMakeFiles/wodimstuff.dir/movesect.o
[  6%] [  7%] Building C object librols/CMakeFiles/rols.dir/fillbytes.o
Building C object wodim/CMakeFiles/wodimstuff.dir/scsi_cdr.o
[  8%] Building C object librols/CMakeFiles/rols.dir/getargs.o
[  8%] Building C object librols/CMakeFiles/rols.dir/getav0.o
[  8%] Building C object librols/CMakeFiles/rols.dir/getdomainname.o
[  9%] Building C object librols/CMakeFiles/rols.dir/geterrno.o
[  9%] Building C object librols/CMakeFiles/rols.dir/gethostid.o
[ 10%] Building C object librols/CMakeFiles/rols.dir/gethostname.o
[ 10%] Building C object librols/CMakeFiles/rols.dir/getpagesize.o
[ 11%] Building C object librols/CMakeFiles/rols.dir/handlecond.o
[ 11%] Building C object librols/CMakeFiles/rols.dir/movebytes.o
[ 12%] Building C object librols/CMakeFiles/rols.dir/raisecond.o
[ 12%] Building C object wodim/CMakeFiles/wodimstuff.dir/scsi_mmc.o
[ 12%] Building C object librols/CMakeFiles/rols.dir/rename.o
[ 12%] Building C object librols/CMakeFiles/rols.dir/saveargs.o
[ 13%] Building C object librols/CMakeFiles/rols.dir/seterrno.o
[ 13%] Building C object librols/CMakeFiles/rols.dir/spawn.o
[ 14%] Building C object wodim/CMakeFiles/wodimstuff.dir/scsi_scan.o
[ 15%] Building C object librols/CMakeFiles/rols.dir/strcatl.o
[ 15%] Building C object librols/CMakeFiles/rols.dir/strdup.o
[ 16%] Building C object librols/CMakeFiles/rols.dir/streql.o
Linking C static library libwodimstuff.a
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 16%] [ 16%] Built target wodimstuff
[ 17%] Building C object librols/CMakeFiles/rols.dir/swabbytes.o
Building C object librols/CMakeFiles/rols.dir/usleep.o
[ 17%] make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Building C object librols/CMakeFiles/rols.dir/stdio/cvmod.o
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libusal/CMakeFiles/usal.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libusal/CMakeFiles/usal.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libusal/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libusal/CMakeFiles/usal.dir/depend.internal".
Scanning dependencies of target usal
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 17%] Building C object libusal/CMakeFiles/usal.dir/usalsettarget.o
[ 17%] Building C object librols/CMakeFiles/rols.dir/stdio/dat.o
[ 18%] [ 19%] Building C object librols/CMakeFiles/rols.dir/stdio/fcons.o
Building C object libusal/CMakeFiles/usal.dir/usaltimes.o
[ 19%] Building C object libusal/CMakeFiles/usal.dir/scsierrs.o
[ 19%] Building C object librols/CMakeFiles/rols.dir/stdio/fdown.o
[ 20%] Building C object librols/CMakeFiles/rols.dir/stdio/fdup.o
[ 21%] Building C object libusal/CMakeFiles/usal.dir/scsihack.o
[ 21%] Building C object librols/CMakeFiles/rols.dir/stdio/ffileread.o
[ 22%] Building C object librols/CMakeFiles/rols.dir/stdio/ffilewrite.o
[ 22%] Building C object librols/CMakeFiles/rols.dir/stdio/fgetline.o
[ 22%] Building C object librols/CMakeFiles/rols.dir/stdio/file_raise.o
[ 23%] Building C object librols/CMakeFiles/rols.dir/stdio/fileclose.o
[ 23%] Building C object librols/CMakeFiles/rols.dir/stdio/fileluopen.o
[ 23%] Building C object libusal/CMakeFiles/usal.dir/scsihelp.o
[ 24%] Building C object librols/CMakeFiles/rols.dir/stdio/filemopen.o
[ 25%] Building C object libusal/CMakeFiles/usal.dir/scsiopen.o
[ 25%] Building C object librols/CMakeFiles/rols.dir/stdio/fileopen.o
[ 26%] Building C object librols/CMakeFiles/rols.dir/stdio/filepos.o
[ 26%] Building C object libusal/CMakeFiles/usal.dir/scsitransp.o
[ 26%] Building C object librols/CMakeFiles/rols.dir/stdio/fileread.o
[ 27%] Building C object librols/CMakeFiles/rols.dir/stdio/filereopen.o
[ 27%] Building C object librols/CMakeFiles/rols.dir/stdio/fileseek.o
[ 27%] Building C object libusal/CMakeFiles/usal.dir/scsi-remote.o
[ 27%] Building C object librols/CMakeFiles/rols.dir/stdio/filesize.o
[ 28%] Building C object librols/CMakeFiles/rols.dir/stdio/filestat.o
[ 28%] Building C object librols/CMakeFiles/rols.dir/stdio/filewrite.o
Linking C static library libusal.a
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 28%] Built target usal
[ 29%] Building C object librols/CMakeFiles/rols.dir/stdio/flag.o
[ 29%] Building C object librols/CMakeFiles/rols.dir/stdio/flush.o
[ 30%] Building C object librols/CMakeFiles/rols.dir/stdio/fpipe.o
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libunls/CMakeFiles/unls.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libunls/CMakeFiles/unls.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libunls/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libunls/CMakeFiles/unls.dir/depend.internal".
Scanning dependencies of target unls
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 30%] Building C object libunls/CMakeFiles/unls.dir/nls_base.o
[ 30%] Building C object librols/CMakeFiles/rols.dir/stdio/niread.o
[ 31%] Building C object libunls/CMakeFiles/unls.dir/nls_config.o
[ 32%] Building C object librols/CMakeFiles/rols.dir/stdio/niwrite.o
[ 32%] Building C object libunls/CMakeFiles/unls.dir/nls_cp10000.o
[ 32%] Building C object librols/CMakeFiles/rols.dir/stdio/nixread.o
[ 33%] Building C object libunls/CMakeFiles/unls.dir/nls_cp10006.o
[ 33%] Building C object librols/CMakeFiles/rols.dir/stdio/nixwrite.o
[ 33%] Building C object libunls/CMakeFiles/unls.dir/nls_cp10007.o
[ 34%] Building C object librols/CMakeFiles/rols.dir/stdio/openfd.o
[ 34%] Building C object libunls/CMakeFiles/unls.dir/nls_cp10029.o
[ 34%] Building C object librols/CMakeFiles/rols.dir/stdio/peekc.o
[ 35%] Building C object libunls/CMakeFiles/unls.dir/nls_cp10079.o
[ 36%] [ 36%] Building C object librols/CMakeFiles/rols.dir/default.o
Building C object libunls/CMakeFiles/unls.dir/nls_cp10081.o
[ 37%] Building C object libunls/CMakeFiles/unls.dir/nls_cp1250.o
Linking C static library librols.a
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 37%] [ 37%] Built target rols
Building C object libunls/CMakeFiles/unls.dir/nls_cp1251.o
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libhfs_iso/CMakeFiles/hfs_iso.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libhfs_iso/CMakeFiles/hfs_iso.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libhfs_iso/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libhfs_iso/CMakeFiles/hfs_iso.dir/depend.internal".
Scanning dependencies of target hfs_iso
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 37%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/block.o
[ 38%] Building C object libunls/CMakeFiles/unls.dir/nls_cp437.o
[ 39%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/btree.o
[ 39%] Building C object libunls/CMakeFiles/unls.dir/nls_cp737.o
[ 40%] Building C object libunls/CMakeFiles/unls.dir/nls_cp775.o
[ 40%] Building C object libunls/CMakeFiles/unls.dir/nls_cp850.o
[ 40%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/data.o
[ 40%] Building C object libunls/CMakeFiles/unls.dir/nls_cp852.o
[ 40%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/file.o
[ 41%] Building C object libunls/CMakeFiles/unls.dir/nls_cp855.o
[ 41%] Building C object libunls/CMakeFiles/unls.dir/nls_cp857.o
[ 42%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/gdata.o
[ 43%] Building C object libunls/CMakeFiles/unls.dir/nls_cp860.o
[ 43%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/hfs.o
[ 43%] Building C object libunls/CMakeFiles/unls.dir/nls_cp861.o
[ 44%] Building C object libunls/CMakeFiles/unls.dir/nls_cp862.o
[ 44%] Building C object libunls/CMakeFiles/unls.dir/nls_cp863.o
[ 45%] Building C object libunls/CMakeFiles/unls.dir/nls_cp864.o
[ 46%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/low.o
[ 46%] Building C object libunls/CMakeFiles/unls.dir/nls_cp865.o
[ 46%] Building C object libunls/CMakeFiles/unls.dir/nls_cp866.o
[ 46%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/node.o
[ 47%] Building C object libunls/CMakeFiles/unls.dir/nls_cp869.o
[ 47%] Building C object libunls/CMakeFiles/unls.dir/nls_cp874.o
[ 48%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/record.o
[ 49%] Building C object libunls/CMakeFiles/unls.dir/nls_file.o
[ 49%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-1.o
[ 49%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/volume.o
[ 50%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-14.o
[ 50%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-15.o
[ 50%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-2.o
Linking C static library libhfs_iso.a
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 50%] Built target hfs_iso
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 51%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-3.o
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libedc/CMakeFiles/edc.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libedc/CMakeFiles/edc.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libedc/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libedc/CMakeFiles/edc.dir/depend.internal".
Scanning dependencies of target edc
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 52%] Building C object libedc/CMakeFiles/edc.dir/edc_ecc.o
[ 52%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-4.o
[ 53%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-5.o
[ 53%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-6.o
[ 54%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-7.o
[ 54%] Building C object libedc/CMakeFiles/edc.dir/edcspeed.o
[ 54%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-8.o
Linking C static library libedc.a
[ 55%] Building C object libunls/CMakeFiles/unls.dir/nls_iso8859-9.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 55%] Built target edc
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libparanoia/CMakeFiles/paranoia.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libparanoia/CMakeFiles/paranoia.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libparanoia/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/libparanoia/CMakeFiles/paranoia.dir/depend.internal".
Scanning dependencies of target paranoia
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 55%] Building C object libparanoia/CMakeFiles/paranoia.dir/gap.o
[ 55%] Building C object libunls/CMakeFiles/unls.dir/nls_koi8-r.o
[ 55%] Building C object libunls/CMakeFiles/unls.dir/nls_koi8-u.o
[ 55%] Building C object libparanoia/CMakeFiles/paranoia.dir/isort.o
[ 56%] Building C object libunls/CMakeFiles/unls.dir/nls_iconv.o
Linking C static library libunls.a
[ 57%] Building C object libparanoia/CMakeFiles/paranoia.dir/overlap.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 57%] Built target unls
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/readom/CMakeFiles/readom.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/readom/CMakeFiles/readom.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/readom/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/readom/CMakeFiles/readom.dir/depend.internal".
Scanning dependencies of target readom
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 58%] Building C object readom/CMakeFiles/readom.dir/readom.o
[ 58%] Building C object libparanoia/CMakeFiles/paranoia.dir/p_block.o
[ 59%] Building C object libparanoia/CMakeFiles/paranoia.dir/paranoia.o
[ 59%] Building C object readom/CMakeFiles/readom.dir/io.o
[ 59%] Building C object libparanoia/CMakeFiles/paranoia.dir/pmalloc.o
Linking C static library libparanoia.a
Linking C executable readom
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 59%] Built target paranoia
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/netscsid/CMakeFiles/netscsid.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/netscsid/CMakeFiles/netscsid.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/netscsid/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/netscsid/CMakeFiles/netscsid.dir/depend.internal".
Scanning dependencies of target netscsid
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 60%] Building C object netscsid/CMakeFiles/netscsid.dir/netscsid.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 60%] Built target readom
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/devdump.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/devdump.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/devdump.dir/depend.internal".
Scanning dependencies of target devdump
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 60%] Building C object genisoimage/CMakeFiles/devdump.dir/diag/dump.o
Linking C executable netscsid
[ 60%] Building C object genisoimage/CMakeFiles/devdump.dir/scsi.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 60%] Built target netscsid
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/genisoimage.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/genisoimage.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/genisoimage.dir/depend.internal".
Scanning dependencies of target genisoimage
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 61%] Building C object genisoimage/CMakeFiles/genisoimage.dir/genisoimage.o
Linking C executable devdump
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 61%] Built target devdump
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodebug.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodebug.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodebug.dir/depend.internal".
Scanning dependencies of target isodebug
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 61%] Building C object genisoimage/CMakeFiles/isodebug.dir/diag/isodebug.o
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/genisoimage.c: In function ?main?:
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/genisoimage.c:3409: warning: format not a string literal and no format arguments
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/genisoimage.c:3422: warning: format not a string literal and no format arguments
[ 61%] Building C object genisoimage/CMakeFiles/isodebug.dir/scsi.o
Linking C executable isodebug
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 61%] Built target isodebug
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodump.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodump.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isodump.dir/depend.internal".
Scanning dependencies of target isodump
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 62%] Building C object genisoimage/CMakeFiles/isodump.dir/diag/isodump.o
[ 62%] Building C object genisoimage/CMakeFiles/genisoimage.dir/apple.o
[ 62%] Building C object genisoimage/CMakeFiles/isodump.dir/scsi.o
Linking C executable isodump
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 62%] Built target isodump
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isoinfo.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isoinfo.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isoinfo.dir/depend.internal".
Scanning dependencies of target isoinfo
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 63%] Building C object genisoimage/CMakeFiles/isoinfo.dir/diag/isoinfo.o
[ 64%] Building C object genisoimage/CMakeFiles/genisoimage.dir/boot.o
[ 64%] Building C object genisoimage/CMakeFiles/isoinfo.dir/scsi.o
[ 64%] Building C object genisoimage/CMakeFiles/genisoimage.dir/desktop.o
Linking C executable isoinfo
[ 64%] Building C object genisoimage/CMakeFiles/genisoimage.dir/dvd_file.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 64%] Built target isoinfo
[ 65%] Building C object genisoimage/CMakeFiles/genisoimage.dir/dvd_reader.o
[ 65%] Building C object genisoimage/CMakeFiles/genisoimage.dir/eltorito.o
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isovfy.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isovfy.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/CMakeFiles/isovfy.dir/depend.internal".
Scanning dependencies of target isovfy
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 66%] Building C object genisoimage/CMakeFiles/isovfy.dir/diag/isovfy.o
[ 67%] Building C object genisoimage/CMakeFiles/genisoimage.dir/exclude.o
[ 67%] Building C object genisoimage/CMakeFiles/genisoimage.dir/files.o
[ 67%] Building C object genisoimage/CMakeFiles/isovfy.dir/scsi.o
[ 68%] Building C object genisoimage/CMakeFiles/genisoimage.dir/fnmatch.o
[ 68%] Building C object genisoimage/CMakeFiles/genisoimage.dir/hash.o
Linking C executable isovfy
[ 69%] Building C object genisoimage/CMakeFiles/genisoimage.dir/ifo_read.o
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 69%] Built target isovfy
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodim.dir/DependInfo.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodim.dir/depend.internal".
Dependee "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/CMakeDirectoryInformation.cmake" is newer than depender "/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/CMakeFiles/wodim.dir/depend.internal".
[ 69%] Building C object genisoimage/CMakeFiles/genisoimage.dir/joliet.o
Scanning dependencies of target wodim
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[3]: Entering directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 70%] Building C object wodim/CMakeFiles/wodim.dir/wodim.o
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:78:56: error: sys/capability.h: No such file or directory
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:259: error: expected ?)? before ?cap_array?
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c: In function ?main?:
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:477: error: ?CAP_SYS_RAWIO? undeclared (first use in this function)
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:477: error: (Each undeclared identifier is reported only once
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:477: error: for each function it appears in.)
[ 70%] Building C object genisoimage/CMakeFiles/genisoimage.dir/mac_label.o
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c: At top level:
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:4691: error: expected ?)? before ?cap_array?
make[3]: *** [wodim/CMakeFiles/wodim.dir/wodim.o] Error 1
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[2]: *** [wodim/CMakeFiles/wodim.dir/all] Error 2
make[2]: *** Waiting for unfinished jobs....
[ 71%] Building C object genisoimage/CMakeFiles/genisoimage.dir/match.o
[ 71%] Building C object genisoimage/CMakeFiles/genisoimage.dir/multi.o
[ 72%] Building C object genisoimage/CMakeFiles/genisoimage.dir/name.o
[ 72%] Building C object genisoimage/CMakeFiles/genisoimage.dir/rock.o
[ 73%] Building C object genisoimage/CMakeFiles/genisoimage.dir/scsi.o
[ 73%] Building C object genisoimage/CMakeFiles/genisoimage.dir/stream.o
[ 74%] Building C object genisoimage/CMakeFiles/genisoimage.dir/tree.o
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/tree.c: In function ?sort_n_finish?:
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/tree.c:650: warning: format not a string literal and no format arguments
[ 74%] Building C object genisoimage/CMakeFiles/genisoimage.dir/udf.o
[ 74%] Building C object genisoimage/CMakeFiles/genisoimage.dir/vms.o
[ 75%] Building C object genisoimage/CMakeFiles/genisoimage.dir/volume.o
[ 75%] Building C object genisoimage/CMakeFiles/genisoimage.dir/write.o
[ 76%] Building C object genisoimage/CMakeFiles/genisoimage.dir/boot-alpha.o
[ 76%] Building C object genisoimage/CMakeFiles/genisoimage.dir/boot-hppa.o
[ 77%] Building C object genisoimage/CMakeFiles/genisoimage.dir/boot-mips.o
[ 77%] Building C object genisoimage/CMakeFiles/genisoimage.dir/md5.o
[ 78%] Building C object genisoimage/CMakeFiles/genisoimage.dir/jte.o
[ 78%] Building C object genisoimage/CMakeFiles/genisoimage.dir/rsync.o
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/jte.c: In function ?write_compressed_chunk?:
/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/genisoimage/jte.c:676: warning: format ?%d? expects type ?int?, but argument 2 has type ?size_t?
[ 78%] Building C object genisoimage/CMakeFiles/genisoimage.dir/boot-mipsel.o
[ 79%] Building C object genisoimage/CMakeFiles/genisoimage.dir/endian.o
[ 79%] Building C object genisoimage/CMakeFiles/genisoimage.dir/sha1.o
[ 80%] Building C object genisoimage/CMakeFiles/genisoimage.dir/sha256.o
[ 80%] Building C object genisoimage/CMakeFiles/genisoimage.dir/sha512.o
[ 81%] Building C object genisoimage/CMakeFiles/genisoimage.dir/checksum.o
Linking C executable genisoimage
make[3]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
[ 81%] Built target genisoimage
make[2]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10'
make: ***
[/home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/.stamp_built] Error 2

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
