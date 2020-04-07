From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 10:34:06 +0200
Subject: [Buildroot] [PATCH] package/libminizip: new package
In-Reply-To: <5c619a4b-cc2f-5dba-a32d-4bf1f6f80d52@grinn-global.com>
References: <20200406183559.130627-1-b.bilas@grinn-global.com>
 <20200407060433.GA22325@scaer>
 <47cf1b5b-79b5-c3dc-f648-35ba96383d56@grinn-global.com>
 <20200407074535.GE22325@scaer>
 <5c619a4b-cc2f-5dba-a32d-4bf1f6f80d52@grinn-global.com>
Message-ID: <20200407083406.GI22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-04-07 09:53 +0200, Bartosz Bilas spake thusly:
> On 07.04.2020 09:45, Yann E. MORIN wrote:
> >On 2020-04-07 09:16 +0200, Bartosz Bilas spake thusly:
> >>On 07.04.2020 08:04, Yann E. MORIN wrote:
> >>  How is it different from package/minizip/ ?
> >>
> >>That's the old, original version of minizip which contains some of necessary headers such as unzip.h which is required for one of
> >>buildroot's package which started failing due to lack of it. The current version of minizip doesn't have it unfortunately .
> >>Therefore I decided to create a new-separate package to provide that library only. I was wondering how to handle that, using the
> >>existing minizip/libzlib package but nothing good came my mind :/ So it would be great if you had some idea? :)
> >
> >Why don't you just update our version of minizip to the newer version?
> My answer was related to the topic's package, buildroot's minizip is a fork
> and is already updated but as I said, it doesn't contain the necessary
> header for cegui...

Ah, sorry, that was not clear at all... In fact, you libminizip is
adding an _older_ version...

OK, but the newer version has an option, MZ_COMPAT, to install the
compatibility stuff:

    diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
    index 313fe87a49..32a46d61dc 100644
    --- a/package/minizip/minizip.mk
    +++ b/package/minizip/minizip.mk
    @@ -13,7 +13,7 @@ MINIZIP_DEPENDENCIES = \
     MINIZIP_INSTALL_STAGING = YES
     MINIZIP_CONF_OPTS = \
     	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DMZ_BUILD_TEST=ON) \
    -	-DMZ_COMPAT=OFF
    +	-DMZ_COMPAT=ON
     MINIZIP_LICENSE = Zlib
     MINIZIP_LICENSE_FILES = LICENSE
     

But they are installed in .usr/include, rather than /usr/include/minizip
I think this is better to work with upstream to fix the compat stuff
rather than introduce another package. And in the meantime, disable
minizip support in cegui (and work with their upstream to use the newer
minizip API).

Regards,
Yann E. MORIN.

> >Regards,
> >Yann E. MORIN.
> >
> >>[0] [2]http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c
> >>
> >>  I've marked as "not applicable", then.Regards,
> >>  Yann E. MORIN.
> >>
> >>  --- DEVELOPERS                         |  1 +
> >>   package/Config.in                  |  1 +
> >>   package/libminizip/Config.in       | 11 +++++++++++
> >>   package/libminizip/libminizip.hash |  2 ++
> >>   package/libminizip/libminizip.mk   | 15 +++++++++++++++
> >>   5 files changed, 30 insertions(+) create mode 100644 package/libminizip/Config.in
> >>   create mode 100644 package/libminizip/libminizip.hash
> >>   create mode 100644 package/libminizip/libminizip.mk
> >>  diff --git a/DEVELOPERS b/DEVELOPERSindex e9ac2b7460..b6243276a3 100644
> >>  --- a/DEVELOPERS+++ b/DEVELOPERS@@ -282,6 +282,7 @@ F:  package/orbit/
> >>   N:     Bartosz Bilas
> >>  [3]<b.bilas@grinn-global.com> F:   board/stmicroelectronics/stm32mp157a-dk1/
> >>   F:     configs/stm32mp157a_dk1_defconfig+F:    package/libminizip/
> >>   F:     package/python-esptool/ F:      package/python-pyaes/
> >>   F:     package/qt5/qt5scxml/diff --git a/package/Config.in b/package/Config.in
> >>  index 373868ca82..95727396ea 100644--- a/package/Config.in
> >>  +++ b/package/Config.in@@ -1278,6 +1278,7 @@ endmenu
> >>    menu "Compression and decompression"  source "package/libarchive/Config.in"
> >>  +       source "package/libminizip/Config.in"   source "package/libmspack/Config.in"
> >>          source "package/libsquish/Config.in"    source "package/libzip/Config.in"
> >>  diff --git a/package/libminizip/Config.in b/package/libminizip/Config.in
> >>  new file mode 100644index 0000000000..5307db3c4f
> >>  --- /dev/null+++ b/package/libminizip/Config.in
> >>  @@ -0,0 +1,11 @@+config BR2_PACKAGE_LIBMINIZIP
> >>  +       bool "libminizip"+      select BR2_PACKAGE_ZLIB
> >>  +       help+     LibMinizip is a minimalistic library that supports compressing,
> >>  +         extracting, viewing, and manipulating zip files.
> >>  ++        This package includes development support files
> >>  +         for the minizip library.++
> >>  [4]http://www.winimage.com/zLibDll/minizip.html
> >>  diff --git a/package/libminizip/libminizip.hash b/package/libminizip/libminizip.hash
> >>  new file mode 100644index 0000000000..1aa87a2901
> >>  --- /dev/null+++ b/package/libminizip/libminizip.hash
> >>  @@ -0,0 +1,2 @@+# Locally computed+sha256  78d87c463dd6bd446292fe0d3ee72878355b3b7fa52add5722671dfe9290f262  libminizip-1.1.tar.gz
> >>  diff --git a/package/libminizip/libminizip.mk b/package/libminizip/libminizip.mk
> >>  new file mode 100644index 0000000000..6ae3c6cb01
> >>  --- /dev/null+++ b/package/libminizip/libminizip.mk
> >>  @@ -0,0 +1,15 @@+################################################################################
> >>  +#+# libminizip+#+################################################################################
> >>  ++LIBMINIZIP_VERSION = 1.1+LIBMINIZIP_SITE = $(call github,nmoinvaz,minizip,$(LIBMINIZIP_VERSION))
> >>  +LIBMINIZIP_DEPENDENCIES = zlib+LIBMINIZIP_AUTORECONF = YES
> >>  +LIBMINIZIP_INSTALL_STAGING = YES+LIBMINIZIP_LICENSE = Zlib
> >>  +LIBMINIZIP_LICENSE_FILES = LICENSE++$(eval $(autotools-package))
> >>  -- 2.26.0_______________________________________________
> >>  buildroot mailing list
> >>  [5]buildroot at busybox.net
> >>  [6]http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >>Best
> >>Bartek
> >>
> >>Links:
> >>1. mailto:b.bilas at grinn-global.com/
> >>2. http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c
> >>3. mailto:b.bilas at grinn-global.com/
> >>4. http://www.winimage.com/zLibDll/minizip.html
> >>5. mailto:buildroot at busybox.net/
> >>6. http://lists.busybox.net/mailman/listinfo/buildroot
> Best
> Bartek

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
