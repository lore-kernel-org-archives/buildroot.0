From: Michael Sumulong <msumulong@gmail.com>
Date: Fri, 10 Oct 2014 15:46:02 -0400
Subject: [Buildroot] partclone package issues
Message-ID: <CABDNR17qm+njSsYRcyzvSPy3c9yyrXGH_Y66_KwOOKAgWbqa2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to add a new package (partclone) to buildroot but I think there
may be errors in the autoconf config files or some configuration setting
with the ext2 libraries.

My current config is buildroot-2014.08 and I'm trying to add partclone
0.2.70.

I think my issue is that the partclone/configure.ac invokes a shell command
to compile a .c file but uses a hardcoded 'gcc' in the shell command. I
changed the gcc to use $cc but now it cannot find the libext2fs shared
object file. I do see libext2fs.a in output/host/usr/lib but not
libext2fs.so.2.



The error that I get occurs during the autoreconf phase:

checking for unistd.h... yes
checking ext2fs/ext2fs.h usability... yes
checking ext2fs/ext2fs.h presence... yes
checking for ext2fs/ext2fs.h... yes
checking for ext2fs_initialize in -lext2fs... yes
checking version of libextfs... ./get_lib_version: error while loading
shared libraries: libext2fs.so.2: cannot open shared object file: No such
file or directory
./get_lib_version: error while loading shared libraries: libext2fs.so.2:
cannot open shared object file: No such file or directory
./get_lib_version: error while loading shared libraries: libext2fs.so.2:
cannot open shared object file: No such file or directory
./get_lib_version: error while loading shared libraries: libext2fs.so.2:
cannot open shared object file: No such file or directory
?.?.?; bad
configure: error: Please check your libextfs!
make: ***
[/home/br/Desktop/buildroot/bin/buildroot-2014.08/output/build/partclone-0.2.70/.stamp_configured]
Error 1




partclone-0.2.70/configure.ac:

if test "$enable_extfs" = "yes"; then
#check library of some filesystems
dnl Check for EXT2/3
AC_CHECKING([ for EXT2/3 Library and Header files ... ])
AC_CHECK_HEADERS([ext2fs/ext2fs.h], ,
  AC_MSG_ERROR([*** EXT2/3 header files (ext2fs/ext2fs.h) not found])
)
AC_CHECK_LIB([ext2fs], [ext2fs_initialize], true,
    AC_MSG_ERROR([*** EXT2/3 library (libext2fs) not found]))

AC_MSG_CHECKING(version of libextfs)
extfs_version=`$cc $srcdir/src/deplib_version.c -o $srcdir/get_lib_version
-lext2fs -DEXTFS`
extfs_version=`$srcdir/get_lib_version extfs`


partclone.mk:

PARTCLONE_VERSION = 0.2.70
PARTCLONE_SOURCE = partclone-$(PARTCLONE_VERSION).tar.gz
PARTCLONE_SITE =
http://sourceforge.net/projects/partclone/files/testing/src/
PARTCLONE_INSTALL_STAGING = YES
PARTCLONE_INSTALL_TARGET = YES
PARTCLONE_AUTORECONF = YES
PARTCLONE_DEPENDENCIES = attr e2fsprogs libgcrypt lzo xz zlib
PARTCLONE_CONF_OPT = --enable-ntfs --enable-extfs --enable-fat
--enable-ncursesw

$(eval $(autotools-package))


Thanks,
Mike
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141010/13877ec8/attachment.html>
