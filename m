From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:15:13 +0200
Subject: [Buildroot] [PATCH v8 17/28] xbmc-pvr-addons: Version bump to
 xbmc Gotham-compatible addon
In-Reply-To: <1400342276-10303-18-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-18-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517201513.GH3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../xbmc-pvr-addons-0001-buildfix.patch            |  229 ++++++++++++++++++++
>  package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |    7 +-
>  2 files changed, 233 insertions(+), 3 deletions(-)
>  create mode 100644 package/xbmc-pvr-addons/xbmc-pvr-addons-0001-buildfix.patch
> 
> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons-0001-buildfix.patch b/package/xbmc-pvr-addons/xbmc-pvr-addons-0001-buildfix.patch
> new file mode 100644
> index 0000000..aa1fb08
> --- /dev/null
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons-0001-buildfix.patch
> @@ -0,0 +1,229 @@
> +Add support to build in a seperate builddir

We do not need that patch, sicne we are not building the packages
out-of-tree.

If it does not build without this patch, then the explanations in this
patch are incorrect.

Regards,
Yann E. MORIN.

> +source: https://github.com/opdenkamp/xbmc-pvr-addons/pull/224
> +
> +patch taken from OpenElec
> +https://github.com/OpenELEC/OpenELEC.tv/blob/5d7777390abcb59cdc8f99c4253f89da94a8055c/packages/mediacenter/xbmc-pvr-addons/patches/xbmc-pvr-addons-buildfix.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/Makefile.include.am xbmc-pvr-addons-f38b2eb.patch/addons/Makefile.include.am
> +--- xbmc-pvr-addons-f38b2eb/addons/Makefile.include.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/Makefile.include.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -36,7 +36,9 @@
> + 	mkdir -m 755 -p $(DESTDIR)@LIBDIR@/$(ADDONNAME)
> + 	mkdir -m 755 -p $(DESTDIR)@DATADIR@/$(ADDONNAME)
> + 	cp -f @BINPREFIX@$(ADDONBINNAME)@BIN_EXT@ $(DESTDIR)@LIBDIR@/$(ADDONNAME) ; chmod 655 $(DESTDIR)@LIBDIR@/$(ADDONNAME)/@BINPREFIX@$(ADDONBINNAME)@BIN_EXT@
> +-	cp -r -f @abs_top_srcdir@/addons/$(ADDONNAME)/addon/* $(DESTDIR)@DATADIR@/$(ADDONNAME) ; chmod -R o+rx $(DESTDIR)@DATADIR@/$(ADDONNAME)
> ++	cp -r -f @abs_top_srcdir@/addons/$(ADDONNAME)/addon/* $(DESTDIR)@DATADIR@/$(ADDONNAME)
> ++	cp -r -f @abs_top_builddir@/addons/$(ADDONNAME)/addon/* $(DESTDIR)@DATADIR@/$(ADDONNAME)
> ++	chmod -R o+rx $(DESTDIR)@DATADIR@/$(ADDONNAME)
> + endif
> + 
> + all: @BUILD_TYPE@
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.argustv/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.argustv/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.argustv/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.argustv/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,11 +10,11 @@
> + LIBNAME         = libargustv-addon
> + lib_LTLIBRARIES = libargustv-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/jsoncpp/libjsoncpp.la
> ++LIBS            = @abs_top_builddir@/lib/jsoncpp/libjsoncpp.la
> + 
> + include ../Makefile.include.am
> + 
> +-INCLUDES+=-Isrc -Isrc/lib/filesystem -I at abs_top_srcdir@/lib/jsoncpp/include
> ++INCLUDES+=-I$(srcdir)/src -I$(srcdir)/src/lib/filesystem -I at abs_top_srcdir@/lib/jsoncpp/include
> + 
> + libargustv_addon_la_SOURCES = src/activerecording.cpp \
> +                                    src/channel.cpp \
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.demo/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.demo/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.demo/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.demo/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libpvrdemo-addon
> + lib_LTLIBRARIES = libpvrdemo-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.dvblink/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.dvblink/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.dvblink/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.dvblink/Makefile.am	2014-05-04 14:38:41.761644652 +0200
> +@@ -10,11 +10,11 @@
> + LIBNAME         = libdvblink-addon
> + lib_LTLIBRARIES = libdvblink-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/libdvblinkremote/libdvblinkremote.la
> ++LIBS            = @abs_top_builddir@/lib/libdvblinkremote/libdvblinkremote.la
> + 
> + include ../Makefile.include.am
> + 
> +-INCLUDES+=-Isrc
> ++INCLUDES+=-I$(srcdir)/src
> + 
> + libdvblink_addon_la_SOURCES = src/client.cpp \
> +                               src/base64.cpp \
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.dvbviewer/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.dvbviewer/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.dvbviewer/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.dvbviewer/Makefile.am	2014-05-04 14:36:53.759689719 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libdvbviewer-addon
> + lib_LTLIBRARIES = libdvbviewer-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.hts/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.hts/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.hts/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.hts/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libtvheadend-addon
> + lib_LTLIBRARIES = libtvheadend-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/libhts/libhts.la -ldl
> ++LIBS            = @abs_top_builddir@/lib/libhts/libhts.la -ldl
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.mediaportal.tvserver/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.mediaportal.tvserver/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.mediaportal.tvserver/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.mediaportal.tvserver/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,11 +10,11 @@
> + LIBNAME         = libmediaportal-addon
> + lib_LTLIBRARIES = libmediaportal-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +-INCLUDES+=-Isrc
> ++INCLUDES+=-I$(srcdir)/src
> + 
> + libmediaportal_addon_la_SOURCES = src/Cards.cpp \
> +                                   src/channels.cpp \
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.mythtv.cmyth/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.mythtv.cmyth/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.mythtv.cmyth/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.mythtv.cmyth/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libmythtvcmyth-addon
> + lib_LTLIBRARIES = libmythtvcmyth-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/cmyth/libcmyth.la
> ++LIBS            = @abs_top_builddir@/lib/cmyth/libcmyth.la
> + 
> + AM_CPPFLAGS = -I$(abs_top_srcdir)/lib/cmyth/include
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.nextpvr/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.nextpvr/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.nextpvr/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.nextpvr/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,11 +10,11 @@
> + LIBNAME         = libnextpvr-addon
> + lib_LTLIBRARIES = libnextpvr-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +-INCLUDES+=-Isrc
> ++INCLUDES+=-I$(srcdir)/src
> + 
> + libnextpvr_addon_la_SOURCES = src/client.cpp \
> +                                   src/pvrclient-nextpvr.cpp \
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.njoy/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.njoy/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.njoy/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.njoy/Makefile.am	2014-05-04 14:35:47.618601552 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libpvrnjoy-addon
> + lib_LTLIBRARIES = libpvrnjoy-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.vuplus/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.vuplus/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.vuplus/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.vuplus/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libvuplus-addon
> + lib_LTLIBRARIES = libvuplus-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/addons/pvr.wmc/Makefile.am xbmc-pvr-addons-f38b2eb.patch/addons/pvr.wmc/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/addons/pvr.wmc/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/addons/pvr.wmc/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -10,7 +10,7 @@
> + LIBNAME         = libpvrwmc-addon
> + lib_LTLIBRARIES = libpvrwmc-addon.la
> + 
> +-LIBS            = @abs_top_srcdir@/lib/tinyxml/libtinyxml.la
> ++LIBS            = @abs_top_builddir@/lib/tinyxml/libtinyxml.la
> + 
> + include ../Makefile.include.am
> + 
> +diff -Naur xbmc-pvr-addons-f38b2eb/lib/cmyth/libcmyth/Makefile.am xbmc-pvr-addons-f38b2eb.patch/lib/cmyth/libcmyth/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/lib/cmyth/libcmyth/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/lib/cmyth/libcmyth/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -26,7 +26,7 @@
> +                      storagegroup.c \
> +                      epginfo.c
> + 
> +-INCLUDES=-I../include/ $(MYSQL_INCLUDES)
> ++INCLUDES=-I$(srcdir)/../include/ $(MYSQL_INCLUDES)
> + 
> + $(LIB): libcmyth.la
> + 	cp -f .libs/libcmyth.a .
> +diff -Naur xbmc-pvr-addons-f38b2eb/lib/cmyth/librefmem/Makefile.am xbmc-pvr-addons-f38b2eb.patch/lib/cmyth/librefmem/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/lib/cmyth/librefmem/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/lib/cmyth/librefmem/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -3,7 +3,7 @@
> + librefmem_la_SOURCES = alloc.c \
> +                       debug_refmem.c
> + 
> +-INCLUDES=-I../include/ -I../libcmyth/
> ++INCLUDES=-I$(srcdir)/../include/ -I$(srcdir)/../libcmyth/
> + 
> + $(LIB): librefmem.la
> + 	cp -f .libs/librefmem.a .
> +diff -Naur xbmc-pvr-addons-f38b2eb/lib/jsoncpp/Makefile.am xbmc-pvr-addons-f38b2eb.patch/lib/jsoncpp/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/lib/jsoncpp/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/lib/jsoncpp/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -4,7 +4,7 @@
> +                         src/lib_json/json_value.cpp \
> +                         src/lib_json/json_writer.cpp
> + 
> +-INCLUDES=-Iinclude/
> ++INCLUDES=-I$(srcdir)/include/
> + 
> + $(LIB): libjsoncpp.la
> + 	cp -f .libs/libjsoncpp.a .
> +diff -Naur xbmc-pvr-addons-f38b2eb/lib/libdvblinkremote/Makefile.am xbmc-pvr-addons-f38b2eb.patch/lib/libdvblinkremote/Makefile.am
> +--- xbmc-pvr-addons-f38b2eb/lib/libdvblinkremote/Makefile.am	2014-05-04 14:27:57.000000000 +0200
> ++++ xbmc-pvr-addons-f38b2eb.patch/lib/libdvblinkremote/Makefile.am	2014-05-04 14:35:47.619601641 +0200
> +@@ -26,10 +26,10 @@
> + 			util.cpp \
> + 			xml_object_serializer_factory.cpp
> + 
> +-LIBS= @abs_top_srcdir@/lib/tinyxml2/libtinyxml2.la
> ++LIBS= @abs_top_builddir@/lib/tinyxml2/libtinyxml2.la
> +  
> +-INCLUDES=-I..
> ++INCLUDES=-I$(srcdir)/..
> + 
> + $(LIB): libdvblinkremote.la
> + 	cp -f .libs/libdvblinkremote.a .
> +-	cp -f .libs/libdvblinkremote.la $(LIB)
> +\ Kein Zeilenumbruch am Dateiende.
> ++	cp -f .libs/libdvblinkremote.la $(LIB)
> diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> index b6d061b..97628e2 100644
> --- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'frodo'
> -# When XBMC is updated, then this should be updated to the corresponding branch
> -XBMC_PVR_ADDONS_VERSION = 319351af7f3b546a5a56cdf6492f6ba1aec1cd2f
> +# This cset in on master. When a Gotham branch is made, we should
> +# follow it, as incompatible changes in the plugins API can happen
> +# on the master branch.
> +XBMC_PVR_ADDONS_VERSION = f38b2ebdc6f96244d5e4bc584315f4a2c24bc787
>  XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
>  XBMC_PVR_ADDONS_LICENSE = GPLv3+
>  XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
