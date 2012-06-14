From: djames.suhanko <djames.suhanko@gmail.com>
Date: Thu, 14 Jun 2012 10:58:12 -0300
Subject: [Buildroot] Creating fsarchiver package
Message-ID: <CAFYZmWiMduvC=nRAs4Vz0W8Ji5_ewEnD0W5BT0qnx-S6BTBO8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!
 In the first place, I'm really sorry my terrible english, but please, be
patience with me :-)

I'm trying to create a fsarchiver package, but I found many problems
because I'm newbie in buildroot.

in my procedures I did it:
* did a 'mkdir fsarchiver' in package folder
* My Config.in inside of fsarchiver directory:
====================
config BR2_PACKAGE_FSARCHIVER
 bool "FSArchiver"
select BR2_PACKAGE_LIBINTL
select BR2_PACKAGE_NEWT
 select BR2_PACKAGE_ZLIB
select BR2_PACKAGE_BZIP2

help
     Partition cloning tool.

     http://sourceforge.net/projects/fsarchiver/files/fsarchiver-src/0.6.15/
======================

* My fsarchiver.mk:
======================
#############################################################
#
# FSArchiver
#
#############################################################
FSARCHIVER_VERSION = 0.6.15
FSARCHIVER_SOURCE = fsarchiver-0.6.15.tar.gz
FSARCHIVER_SITE =
http://sourceforge.net/projects/fsarchiver/files/fsarchiver-src/0.6.15/

FSARCHIVER_INSTALL_STAGING = YES
FSARCHIVER_INSTALL_TARGET = YES

#FSARCHIVER_CONF_ENV = \
# ac_cv_func_malloc_0_nonnull=yes \
# ac_cv_type_bool=yes \
# ac_cv_sizeof_bool=1

FSARCHIVER_CONF_OPT = --program-prefix=''

$(eval $(call AUTOTARGETS,package,fsarchiver))
========================================

When I'm running make fsarchiver, I get this error:
checking for EXT2FS... no
configure: error: Package requirements (ext2fs) were not met:

No package 'ext2fs' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables EXT2FS_CFLAGS
and EXT2FS_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: **
[/root/buildroot-2012.02/output/build/fsarchiver-0.6.15/.stamp_configured]
Erro 1


In this buildroot version I have no problems to compile e2fsprogs, but I
have just this files in my output/staging/usr/lib/pkgconfig directory:
blkid.pc
directfb-internal.pc
directfb.pc
direct.pc
freetype2.pc
fuse.pc
fusion.pc
gio-2.0.pc
gio-unix-2.0.pc
glib-2.0.pc
gmodule-2.0.pc
gmodule-export-2.0.pc
gmodule-no-export-2.0.pc
gnutls-extra.pc
gnutls.pc
gobject-2.0.pc
gthread-2.0.pc
libcrypto.pc
libffi.pc
libip4tc.pc
libip6tc.pc
libiptc.pc
liblzma.pc
libntfs-3g.pc
libpcrecpp.pc
libpcre.pc
libpcreposix.pc
libpng14.pc
libpng.pc
libssl.pc
libxenomai_native.pc
libxenomai_posix.pc
libxenomai_psos+.pc
libxenomai_rtdm.pc
libxenomai_uitron.pc
libxenomai_vrtx.pc
libxenomai_vxworks.pc
libxml-2.0.pc
openssl.pc
python-2.7.pc
python.pc
QtCore.pc
QtGui.pc
QtNetwork.pc
QtScript.pc
QtSql.pc
QtTest.pc
QtXml.pc
SDL_mixer.pc
sdl.pc
sqlite3.pc
tslib-1.0.pc
tslib.pc
uuid.pc
xtables.pc
zlib.pc

Smartin gave me a tip (this two lines above, in my e2fsprogs.mk) :
E2FSPROGS_INSTALL_STAGING_OPT += install install-libs
DESTDIR=$(STAGING_DIR)

I did a make e2fsprogs-rebuild and make fsarchiver, but I have the same
problem everytime.

I was trying to do this process in buildroot-2012.05 too, but there I'm
found another problems.

Can someone help me with this?
-- 
Djames Suhanko
LinuxUser 158.760
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120614/a05dae20/attachment.html>
