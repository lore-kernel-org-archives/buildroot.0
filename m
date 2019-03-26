From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 01:09:39 +0100
Subject: [Buildroot] [PATCH v4 0/6] Qt5 qmake infra with generic target
 install
In-Reply-To: <20190322183904.22401-1-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
Message-ID: <59832315-10f8-3d04-c40c-70ece2e8d531@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/03/2019 19:38, Andreas Naumann wrote:
> Hi all,
> 
> here is the fourth iteration of my efforts to prepare Qt5 packages for ppsh.
> 
> Originally I had prepared v3 with a fix for the reinstall issue found by Thomas,
> which included conversion to a new qmake infra as suggested by Arnout.
> 
> However, having done that I had the idea to use a folder inside the package 
> build dir as INSTALL_ROOT, which makes it possible to to isolate the staging
> files and copy them to target without relying on timestamps. So I ditched v3
> and carried on doing that as v4. (If somebody is interested in v3 I can still
>  send it.)
> 
> This avoids the controversial discussed "install to staging only" approach,
> for which I'm not sure if it actually has enough advantages to be worth the
> hassle of dealing with timestamps and such.

 I've given feedback on all patches and marked as changes requested. Except for
patch 5, which I think can be applied as is. It would be nice to do that first,
because then my comment about the .la/.prl fixup wouldn't apply any more.


> 
> 
> regards,
> Andreas
> 
> 
> 
> v3 -> v4:
>   - changed time-stamp based target install to using INSTALL_ROOT
>   - exclude ppsh specific patches>
> v2 -> v3 (not published):
>   - convert to qmake infra
>   - use a custom .stamp_staging_started to fix the -reinstall issue

 I think the quazip patch is also new.

 Regards,
 Arnout

> 
> v1 -> v2:
>   - added generic qmake target install
>   - added removal of la/prl fixup (optional)
>   - rebased and reordered (together with ppsh-v7) on master
>   - split patches to separate qmake rework from ppsh specifics
>   - added handling of pkg-config search pathes for ppsh
> 
> 
> Andreas Naumann (6):
>   qt5base: Do not build shared libs if BR2_STATIC_LIBS is chosen
>   qt5: Provide generic qmake package infrastructure
>   qt5: Convert packages to qmake infra
>   quazip: Patch .pro file to correctly crosscompile and use qmake infra
>   qt5base: Fix inconsistencies when overriding qmake properties
>   qt5: Remove *.la/*.prl fixup script
> 
>  package/Makefile.in                           |   1 +
>  package/pkg-qmake.mk                          | 108 ++++++++++++++++++
>  package/qextserialport/qextserialport.mk      |  22 +---
>  package/qt-webkit-kiosk/qt-webkit-kiosk.mk    |  11 +-
>  package/qt5/qt53d/qt53d.mk                    |  39 +------
>  package/qt5/qt5base/qt.conf.in                |  17 +--
>  package/qt5/qt5base/qt5base.mk                |  88 ++------------
>  package/qt5/qt5canvas3d/qt5canvas3d.mk        |  26 +----
>  package/qt5/qt5charts/qt5charts.mk            |  41 +------
>  .../qt5/qt5connectivity/qt5connectivity.mk    |  60 +---------
>  package/qt5/qt5declarative/qt5declarative.mk  |  48 +-------
>  package/qt5/qt5enginio/qt5enginio.mk          |  39 +------
>  .../qt5graphicaleffects.mk                    |  18 +--
>  .../qt5/qt5imageformats/qt5imageformats.mk    |  20 +---
>  package/qt5/qt5location/qt5location.mk        |  50 +-------
>  package/qt5/qt5multimedia/qt5multimedia.mk    |  47 +-------
>  .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |  41 +------
>  .../qt5quickcontrols2/qt5quickcontrols2.mk    |  40 +------
>  package/qt5/qt5script/qt5script.mk            |  32 +-----
>  package/qt5/qt5scxml/qt5scxml.mk              |  37 +-----
>  package/qt5/qt5sensors/qt5sensors.mk          |  40 +------
>  package/qt5/qt5serialbus/qt5serialbus.mk      |  38 +-----
>  package/qt5/qt5serialport/qt5serialport.mk    |  32 +-----
>  package/qt5/qt5svg/qt5svg.mk                  |  40 +------
>  package/qt5/qt5tools/qt5tools.mk              |   6 +-
>  .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |  63 +---------
>  package/qt5/qt5wayland/qt5wayland.mk          |  43 +------
>  package/qt5/qt5webchannel/qt5webchannel.mk    |  40 +------
>  package/qt5/qt5webengine/qt5webengine.mk      |  50 +-------
>  .../qt5webkit-examples/qt5webkit-examples.mk  |  23 +---
>  package/qt5/qt5webkit/qt5webkit.mk            |  30 ++---
>  package/qt5/qt5websockets/qt5websockets.mk    |  40 +------
>  package/qt5/qt5x11extras/qt5x11extras.mk      |  21 +---
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |  32 +-----
>  package/qt5cinex/qt5cinex.mk                  |   9 +-
>  ...001-Fix-crosscompile-staging-install.patch |  16 +++
>  package/quazip/quazip.mk                      |  18 +--
>  package/qwt/qwt.mk                            |   9 +-
>  38 files changed, 190 insertions(+), 1145 deletions(-)
>  create mode 100644 package/pkg-qmake.mk
>  create mode 100644 package/quazip/0001-Fix-crosscompile-staging-install.patch
> 
