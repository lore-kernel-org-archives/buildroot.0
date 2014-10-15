From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 19:26:00 +0200
Subject: [Buildroot] partclone package issues
In-Reply-To: <CABDNR17qm+njSsYRcyzvSPy3c9yyrXGH_Y66_KwOOKAgWbqa2A@mail.gmail.com>
References: <CABDNR17qm+njSsYRcyzvSPy3c9yyrXGH_Y66_KwOOKAgWbqa2A@mail.gmail.com>
Message-ID: <543EAE28.8080903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/14 21:46, Michael Sumulong wrote:
[snip]
> partclone-0.2.70/configure.ac <http://configure.ac>:
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

 This thing is clearly not cross-compile friendly. You'll have to add a patch
that replaces all this rubbish with something using PKG_CHECK_MODULES. It should
actually also update CFLAGS and LDFLAGS according the pkg-config results, so it
won't be completely trivial. But you should be able to replace about 20 lines of
configure.ac with just 4 lines using PKG_CHECK_MODULES.

 Preferably, you should also upstream that patch to introduce PKG_CHECK_MODULES,
so we don't have to carry that patch forever.


 Regards,
 Arnout

> 
> 
> partclone.mk <http://partclone.mk>:
> 
> PARTCLONE_VERSION = 0.2.70
> PARTCLONE_SOURCE = partclone-$(PARTCLONE_VERSION).tar.gz
> PARTCLONE_SITE = http://sourceforge.net/projects/partclone/files/testing/src/
> PARTCLONE_INSTALL_STAGING = YES
> PARTCLONE_INSTALL_TARGET = YES
> PARTCLONE_AUTORECONF = YES
> PARTCLONE_DEPENDENCIES = attr e2fsprogs libgcrypt lzo xz zlib
> PARTCLONE_CONF_OPT = --enable-ntfs --enable-extfs --enable-fat --enable-ncursesw
> 
> $(eval $(autotools-package))
> 
> 
> Thanks,
> Mike
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
