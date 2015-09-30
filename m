From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Sep 2015 22:31:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoil: new package
References: <1443468339-24028-1-git-send-email-bernd.kuhls@t-online.de>
 <20150930125219.767840c1@free-electrons.com>
Message-ID: <5ettdcxfen.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Wed, 30 Sep 2015 12:52:19 +0200 schrieb Thomas Petazzoni:

> Bernd,
> 
> On Mon, 28 Sep 2015 21:25:39 +0200, Bernd Kuhls wrote:
>> Needed for these new Kodi addons, to be included in upcoming
>> 16.x-Jarvis version bump:
>> 
>> kodi-screensaver-asterwave kodi-screensaver-cpblobs
>> kodi-screensaver-matrixtrails kodi-screensaver-planestate
>> kodi-visualisation-fountain
> 
> So they start using a library that has seen its last release in 2008?
> Interesting choice :)

I doubt that these screensavers are new projects, I found references about
them dating back to 2005:
http://forum.kodi.tv/showthread.php?tid=8113&pid=50673#pid50673

They were ported to the new CMake-based Kodi build system before I
recognized them: https://github.com/notspiff/screensaver.matrixtrails

>> +-	gcc -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o
>> $(LIBNAME).so.$(VERSION) $(OFILES)
>> ++	$(CC) -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o
>> $(LIBNAME).so.$(VERSION) $(OFILES) -lGL -lm
> 
> Looking at this line, I believe this package should "depends on
> !BR2_STATIC_LIBS".

v2 will contain this, thx!

>> +LIBSOIL_VERSION = 1.07~20080707 +LIBSOIL_SOURCE =
>> libsoil_$(LIBSOIL_VERSION).dfsg.orig.tar.gz +LIBSOIL_SITE =
>> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/
libs/libsoil
> 
> Any reason to not use the upstream site,
> http://www.lonesock.net/files/soil.zip ?

How do I handle a package where the source code file has no reference to
its version number? Like this (tested code)?

LIBSOIL_VERSION = 20080707
LIBSOIL_SOURCE = soil.zip
LIBSOIL_SITE = http://www.lonesock.net/files

and handle updates using a hash file? Btw, hash will be included in v2 ;)

>> +LIBSOIL_INSTALL_STAGING = YES +LIBSOIL_DEPENDENCIES = libgl
>> +LIBSOIL_LICENSE = Public Domain, MIT +LIBSOIL_LICENSE_FILES =
>> src/stb_image_aug.c src/image_helper.c +
>> +define LIBSOIL_BUILD_CMDS +	$(TARGET_CONFIGURE_OPTS) $(MAKE) \ +	
>> CC=$(TARGET_CC) \
> 
> Why do you pass CC=$(TARGET_CC) if you already pass
> $(TARGET_CONFIGURE_OPTS) in the environment?
> 
> Also, please use $(TARGET_MAKE_ENV) in the environment.

I had problems with overriding "CC = gcc" in "alternate Makefile.txt" 
which I solved by patching that file, all of this will be part of v2 
tomorrow.

Thanks for the review!

Regards, Bernd
