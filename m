From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Feb 2017 17:03:42 +0100
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
Message-ID: <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20170209232937.2a071f11 at free-electrons.com: 

Hi Thomas,

> Are these .a files still needed after the switch to CMake as the build
> system for Kodi?

fortunately no.

> Also, for the patches that apply to the libdvdcss, libdvdread and
> libdvdnav code base, it would be good to know if they have been
> submitted to the respective upstream projects, or if it's stuff that we
> may have to keep in Buildroot forever.

Afaics when using the new CMake-based build system of Kodi 17 it will
build libdvd* itself by using Kodi-specific tarballs:

https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindLibDvd.
cmake#L100
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindLibDvd.
cmake#L132
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindLibDvd.
cmake#L164

So we do neither need to patch libdvd* anymore nor provide them as 
dependent packages, KODI_EXTRA_DOWNLOADS can be used to provide the 
tarballs.

First build tests were successful but I would like to be cautious about the 
switch to CMake because I only started to use it today with an x86_64 
toolchain so I have not much experience with it, as of this moment I never 
did a runtime test of the compiled binaries. I hope to find some time for 
this in the coming days but until then you can find my patches here:

https://github.com/bkuhls/buildroot/tree/kodi_cmake

Please note that LibreElec and Gentoo already build Kodi 17 using CMake:

https://github.com/LibreELEC/LibreELEC.tv/blob/libreelec-
8.0/packages/mediacenter/kodi/package.mk#L34

https://gitweb.gentoo.org/repo/gentoo.git/tree/media-tv/kodi/kodi-
17.0.ebuild#n161

Do we still have external toolchains based on uClibc 0.9.33.2?
If yes, we need to keep 
https://git.buildroot.net/buildroot/tree/package/kodi/0003-ALSA-fix-device-
change-event-support.patch and add CMake checks for eventfd_read & 
eventfd_write.

Regards, Bernd
