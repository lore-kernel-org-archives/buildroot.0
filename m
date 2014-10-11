From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Oct 2014 23:24:57 +0200
Subject: [Buildroot] partclone package issues
In-Reply-To: <CABDNR17qm+njSsYRcyzvSPy3c9yyrXGH_Y66_KwOOKAgWbqa2A@mail.gmail.com>
References: <CABDNR17qm+njSsYRcyzvSPy3c9yyrXGH_Y66_KwOOKAgWbqa2A@mail.gmail.com>
Message-ID: <20141011232457.24d9c029@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Sumulong,

On Fri, 10 Oct 2014 15:46:02 -0400, Michael Sumulong wrote:

> I think my issue is that the partclone/configure.ac invokes a shell command
> to compile a .c file but uses a hardcoded 'gcc' in the shell command. I
> changed the gcc to use $cc but now it cannot find the libext2fs shared
> object file. I do see libext2fs.a in output/host/usr/lib but not
> libext2fs.so.2.

[...]

> partclone-0.2.70/configure.ac:
> 
> if test "$enable_extfs" = "yes"; then
> #check library of some filesystems
> dnl Check for EXT2/3
> AC_CHECKING([ for EXT2/3 Library and Header files ... ])
> AC_CHECK_HEADERS([ext2fs/ext2fs.h], ,
>   AC_MSG_ERROR([*** EXT2/3 header files (ext2fs/ext2fs.h) not found])
> )
> AC_CHECK_LIB([ext2fs], [ext2fs_initialize], true,
>     AC_MSG_ERROR([*** EXT2/3 library (libext2fs) not found]))
> 
> AC_MSG_CHECKING(version of libextfs)
> extfs_version=`$cc $srcdir/src/deplib_version.c -o $srcdir/get_lib_version
> -lext2fs -DEXTFS`
> extfs_version=`$srcdir/get_lib_version extfs`

That will not work, even using $cc, because the entire approach used in
their configure.ac script is broken: they don't simply build something,
but they also run it. So even if you manage to build this tool with $CC
pointing to the cross-compiler, there is no way the resulting binary
can be executed on your build machine.

So, instead, I'd suggest to completely remove their libext2fs version
check and instead simply use pkg-config to test that. Replace all their
version testing crap by one single line:

PKG_CHECK_MODULES([LIBEXT2FS], [libext2fs >= 1.42])

and that's it.

Of course, don't forget to add host-pkgconf to PARTCLONE_DEPENDENCIES.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
