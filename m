From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:28:55 +0300
Subject: [Buildroot] firefox: a new package
Message-ID: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone

I finally got my lazy butt up and finished firefox and all
it's minimal dependencies and changes.

The current status is as follows:

- Extensions work. I have included option and helper function 
  that will let users to download & install default extensions.
  For more information how this works and the limitations still
  existing see firefox_extensions.mk.in file from patch #6.
  That file is meant to only include new extension descriptions,
  they download url and the helpur function itself.

- Langpacks work. Will download and install any locale selected
  from menuconfig option.

- Plugins work. Tested with open source GNU gnash flash plugin.
  Proprietary plugins without source code (like Adobe Flash plugin) 
  can probably be made working with nspluginwrapper (working on)

- Flash works (with gnash) but is currently limited to older SWF file formats.
  This means you can mostly watch just YouTube videos and little else in the net.
  
  For complete open source flash solution, maybe 
  Lightspark (needs Mono ugh!) + gnash is sufficient (working on)

- Added WebM option. This will let you watch some YouTube videos
  without anykind of flash plugin (open source or proprietary)

- Debug build option added.

TODO List:

1 ) Use only buildroot provided, system-wide libraries for packages nss, nspr and
    libpng. 
    libpng needs an APNG patch from http://sourceforge.net/projects/libpng-apng.
    Currently internal, firefox tarball provided versions of these three libs are
    used.

2 ) Full flash support with lightspark + gnash and/or nspluginwrapper and official
    Adobe plugin.

3 ) Figure out if framebuffer enabled firefox building is possible.
    In the net there are some mentions of how to build DirectFB Firefox
    but they are outdated.

    There seems to be an configure option --enable-default-toolkit=cairo-gtk2-dfb
    for DirectFB and also --enable-default-toolkit=cairo-qt for Qt (Embedded?).
    Currently only traditional Xorg stuff, --enable-default-toolkit=cairo-gtk2
    is used.

    There have been reports that playing flash videos with GNU gnash under
    framebuffer is possible. So doing directfb firefox should be possible too  :)



All the builds were done under Fedora 16 x86 32-bit with buildroot-2012.05,
uclibc 0.9.33 (with NPTL enabled), binutils 2.22 and gcc 4.6 (with TLS enabled).

My CFLAGS were:
-pipe -funit-at-a-time -Wno-error -Os

My LDFLAGS were:
-Wl,-O1 -Wl,--as-needed -Wl,-z -Wl,combreloc -Wl,--enable-new-dtags -Wl,--hash-style=gnu

Testing were made with VirtualBox and also with my crappy laptop.

Best Regards:
Stefan
