From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Feb 2017 19:38:03 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
	Kodi-specific patches
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170212135110.61e55c66@free-electrons.com>
Message-ID: <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20170212135110.61e55c66 at free-electrons.com:

> Except that we definitely don't want this thing. Kodi should use the
> libdvd* libraries built by Buildroot. Not download/build its own.

in this case we need to
- apply the Kodi-specific patches, or
- switch libdvd* upstream to the Kodi repos

The packages were all forked by Kodi:

https://github.com/xbmc/libdvdnav/commits/master
https://github.com/xbmc/libdvdread/commits/master
https://github.com/xbmc/libdvdcss/commits/master

to add functions for supporting iso images by their internal VFS 
implementation, for example dvdnav_get_vm:

https://github.com/xbmc/xbmc/search?utf8=%E2%9C%93&q=dvdnav_get_vm

This function is not defined in upstream libdvdnav, but added by
https://github.com/xbmc/libdvdnav/commit/8305696be79fe650d3d9eee29b2a88e020d7
c58f, guarded with ifdef _XBMC...

You can however link kodi.bin successfully with an unpatched libdvdnav, but 
be warned: Kodi will crash during runtime like this:

http://www.vdr-portal.de/board16-video-disk-recorder/board99-
distributionen/board96-yavdr/p1279428-yavdr-0-6-kodi-amazon-prime-instant-
video-addon-kein-ton/#post1279428

10:51:04 T:140165711784000 WARNING: Unable to resolve: /libdvdnav-x86_64-
linux.so dvdnav_get_vm, reason: /usr/lib/x86_64-linux-
gnu/kodi/system/players/VideoPlayer/libdvdnav-x86_64-linux.so: undefined 
symbol: dvdnav_get_vm
10:51:04 T:140165711784000 ERROR: Unable to resolve exports from dll 
special://xbmcbin/system/players/VideoPlayer/libdvdnav-x86_64-linux.so

because libdvd* is wrapped with a dllwrapper:
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindLibDvd.cm
ake#L194

Currently I am using

KODI_LIBDVDCSS_VERSION = 2f12236
KODI_LIBDVDNAV_VERSION = 43b5f81
KODI_LIBDVDREAD_VERSION = 17d99db
 
KODI_EXTRA_DOWNLOADS = \
        https://github.com/xbmc/libdvdcss/archive/
$(KODI_LIBDVDCSS_VERSION).tar.gz \
        https://github.com/xbmc/libdvdnav/archive/
$(KODI_LIBDVDNAV_VERSION).tar.gz \
        https://github.com/xbmc/libdvdread/archive/
$(KODI_LIBDVDREAD_VERSION).tar.gz
        
KODI_CONF_OPTS += \
        -DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
        -DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
        -DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz

to provide the libdvd* source to be compiled during Kodi build. With them I 
can play iso dvd images without problems.

> I leave it up to you when it is a good time to switch to the CMake
> based build system.

This week I switched my production system to a CMake-build Kodi created by 
buildroot so the next iteration of my patch series is not far away :)

Regards, Bernd
