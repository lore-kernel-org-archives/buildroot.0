From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 05 Jul 2017 19:03:35 +0200
Subject: [Buildroot] [PATCH 1/1] libcodec2: Update to version 0.6.
	Change to	cmake-package
References: <20170705114236.14906-1-olivier.schonken@gmail.com>
Message-ID: <7oiv2exvqt.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 05 Jul 2017 13:42:36 +0200 schrieb Olivier Schonken:

> The 0.6 version of libcodec2 switched buildsystem from autotools to 
cmake.

Hi Olivier,

the only buildroot package using libcodec2 is freeswitch so I tested with 
this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBCODEC2=y
BR2_PACKAGE_FREESWITCH=y

Building freeswitch fails with your libcodec2 bump:

making all mod_codec2
make[4]: Entering directory '/home/bernd/buildroot/br7_freeswitch/output/
build/freeswitch-1.6.18/src/mod/codecs/mod_codec2'
  CCLD   mod_codec2.la
/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.18/
libtool: line 4991: cd: lib: No such file or directory
libtool: link: cannot determine absolute directory name of `lib'
Makefile:537: recipe for target 'mod_codec2.la' failed

The reason for this build error can be found in $(STAGING_DIR)/usr/lib/
pkgconfig/codec2.pc, line 2:

libdir=lib

Changing this line to 

libdir=/lib

fixes the freeswitch build error. Unfortunately I do not know enough 
about cmake to fix the generation of codec2.pc myself.

Regards, Bernd
