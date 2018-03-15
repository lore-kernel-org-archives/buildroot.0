From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 15 Mar 2018 15:50:50 -0400
Subject: [Buildroot] [PATCH v2 0/4] Qt5 bump latest version to 5.10.1
Message-ID: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear maintainers,

This patch series bumps the latest version of Qt to 5.10.1. All modules
compile fine[1] (on PC x86-64 BIOS configuration). I tested a few of
them through the examples.

The first two patches add two new host libraries that are needed by
qtwebengine (since 5.10.0). I patched libnss to be able to set the
include directory for zlib. The patch works the same way as for sqlite.
I have not submitted the patch mainline yet. 

The third patch adds a pkg-config wrapper for host packages. This
wrapper is needed by qtwebengine since this new version compiles host
tools that get host package data using pkg-config (host-libnss,
host-libpng).

The fourth patch updates all hashes for all Qt5 modules; at the
exception of qtwebkit (and qtwebkit-samples) that stays in 5.9.

Unfortunately, the filename has changed since 5.10. The module prefix
*opensource-src* has changed to *everywhere-src*. I introduced the
*QT5_SOURCE_TARBALL_PREFIX* variable to set the right filename according
to the Qt version.

This last patch fixes build issues with qtwebengine. It adds the new
requirements (libnss, host-libnss, host-libpng). It also sets the host
pkg-config wrapper for host to Ninja using the qmake $GN_PKG_CONFIG_HOST
environment variable, that fixes:

	FAILED: host/transport_security_state_generator 
	/home/gportay/src/buildroot/output-qt5.10/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4 
	/usr/bin/ld: cannot find /lib64/libpthread.so.0
	/usr/bin/ld: cannot find /usr/lib64/libpthread_nonshared.a
	collect2: error: ld returned 1 exit status
	ninja: build stopped: subcommand failed.
	Makefile.gn_run:449: recipe for target 'run_ninja' failed

Note: The third patch about pkgconf/pkg-config is left unchanged for
now. Follow thread[2].

[1]: With the need of the following patches from Peter Seiderer:
 - https://patchwork.ozlabs.org/patch/880814/
 - https://patchwork.ozlabs.org/patch/880817/
 - https://patchwork.ozlabs.org/patch/880816/
[2]: http://lists.busybox.net/pipermail/buildroot/2018-February/214132.html

Changes since RFC:
 * add libnss and libnpsr host packages (qtwebengine)
 * add host-pkg-config wrapper (qtwebengine)
 * bump to Qt 5.10.1
 * add host-libnss and host-libpng dependencies to qtwebengine
 * set host pkg-config using $GN_PKG_CONFIG_HOST in qtwebengine

Changes since v1:
 * remove useless Config.in.host for host-libnpsr package
   (host-libnpsr)
 * remove NATIVE_* build environment variables for host (host-libnpsr)
 * detect 64bits buid machine by filtering string 64 on HOSTARCH
   (host-libnpsr, host-libnss)
 * rename QT5_SRC into QT5_SOURCE_TARBALL_PREFIX (qt5.10)
 * remove qt5source macro and use directly QT5_SOURCE_TARBALL_PREFIX
   (qt5.10)
 * squash patches 5 and 6 to patch 4 (qt5.10)
 * reword and remove code snippet from commit message (qt5.10)

Ga?l PORTAY (4):
  package: add libnpsr host package
  package: add libnss host package
  pkgconf: add host-pkg-config wrapper
  qt5: bump latest version to 5.10.1

 package/libnspr/libnspr.mk                         |  3 ++
 .../0002-add-zlib-include-dir-variable.patch       | 49 ++++++++++++++++++++++
 package/libnss/libnss.mk                           | 48 +++++++++++++++++++++
 package/pkgconf/host-pkg-config                    |  4 ++
 package/pkgconf/pkgconf.mk                         |  6 ++-
 package/qt5/Config.in                              |  4 +-
 package/qt5/qt5.mk                                 |  6 ++-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 package/qt5/qt53d/qt53d.mk                         |  2 +-
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk             |  2 +-
 package/qt5/qt5charts/qt5charts.hash               |  4 +-
 package/qt5/qt5charts/qt5charts.mk                 |  2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5location/qt5location.mk             |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  2 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |  4 +-
 package/qt5/qt5scxml/qt5scxml.mk                   |  2 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |  2 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |  2 +-
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
 package/qt5/qt5wayland/qt5wayland.mk               |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 package/qt5/qt5webengine/Config.in                 |  1 +
 package/qt5/qt5webengine/qt5webengine.hash         |  4 +-
 package/qt5/qt5webengine/qt5webengine.mk           |  8 +++-
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |  2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 62 files changed, 201 insertions(+), 86 deletions(-)
 create mode 100644 package/libnss/0002-add-zlib-include-dir-variable.patch
 create mode 100644 package/pkgconf/host-pkg-config

-- 
2.16.1
