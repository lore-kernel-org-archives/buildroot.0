From: Julien CORJON <corjon.j@ecagroup.com>
Date: Sun, 11 Feb 2018 22:11:18 +0000
Subject: [Buildroot] [RFC 0/2] Qt5 bump latest version to 5.10.0
In-Reply-To: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
Message-ID: <6E93C276-D7E9-4E27-B3DD-44FA8626F542@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l,

Le 11 f?vr. 2018 ? 17:13, Ga?l PORTAY <gael.portay at savoirfairelinux.com<mailto:gael.portay@savoirfairelinux.com>> a ?crit :

Dear maintainers,

[snip]

I also noticed a build issue with qtmultimedia, qtwayland and qtwebkit
when using mesa3d as EGL library without X. When BR2_PACKAGE_LIBXCB is
set the issue is gone.

I also noticed this bug last week when I was trying to make qt5wayland work on top of Mesa for an i.MX6 and made a report here : https://bugreports.qt.io/browse/QTBUG-66233

You should probably extend this bug report with others modules (multimedia and WebKit)


   /home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
    #include <X11/Xlib.h>
                         ^
   compilation terminated.

Theses following hunks fix the issue.

   diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
   index 6df96bcab4..c890b31804 100644
   --- a/package/qt5/qt5multimedia/qt5multimedia.mk
   +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
   @@ -34,8 +34,12 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
    endif

   +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
   +QT5MULTIMEDIA_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
   +endif
   +
    define QT5MULTIMEDIA_CONFIGURE_CMDS
   -       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
   +       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5MULTIMEDIA_QMAKEFLAGS))
    endef

    define QT5MULTIMEDIA_BUILD_CMDS
   diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
   index 0a7bdb8cf9..81f514c6a1 100644
   --- a/package/qt5/qt5wayland/qt5wayland.mk
   +++ b/package/qt5/qt5wayland/qt5wayland.mk
   @@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
    QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
    endif

   +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
   +QT5WAYLAND_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
   +endif
   +
    define QT5WAYLAND_CONFIGURE_CMDS
       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
    endef
   diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
   index 3b218a5385..f67bb50899 100644
   --- a/package/qt5/qt5webkit/qt5webkit.mk
   +++ b/package/qt5/qt5webkit/qt5webkit.mk
   @@ -44,8 +44,12 @@ define QT5WEBKIT_PYTHON2_SYMLINK
    endef
    QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK

   +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
   +QT5WEBKIT_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
   +endif
   +
    define QT5WEBKIT_CONFIGURE_CMDS
   -       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
   +       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBKIT_QMAKEFLAGS))
    endef

    define QT5WEBKIT_BUILD_CMDS

The issue is present in Qt 5.9; that is why I did not send these patches
withing this patch series. I will send them latter. I probably have to
check for both BR2_PACKAGE_MESA3D_OPENGL_EGL and !BR2_PACKAGE_LIBXCB
before setting the cflag MESA_EGL_NO_X11_HEADERS.

I?ll review this fix until qt community fix this bug in pro files.

Regards,

Julien


Regards,
Ga?l PORTAY (2):
 qt5: bump to 5.10.0
 qt5webengine: select libnss

package/qt5/Config.in<http://Config.in>                                    | 4 ++--
package/qt5/qt5.mk                                       | 8 ++++++--
package/qt5/qt53d/qt53d.hash                             | 4 ++--
package/qt5/qt53d/qt53d.mk                               | 2 +-
package/qt5/qt5base/qt5base.hash                         | 4 ++--
package/qt5/qt5base/qt5base.mk                           | 2 +-
package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
package/qt5/qt5charts/qt5charts.mk                       | 2 +-
package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
package/qt5/qt5location/qt5location.hash                 | 4 ++--
package/qt5/qt5location/qt5location.mk                   | 2 +-
package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
package/qt5/qt5script/qt5script.hash                     | 4 ++--
package/qt5/qt5script/qt5script.mk                       | 2 +-
package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
package/qt5/qt5svg/qt5svg.mk                             | 2 +-
package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
package/qt5/qt5tools/qt5tools.mk                         | 2 +-
package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
package/qt5/qt5webengine/Config.in<http://Config.in>                       | 1 +
package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
package/qt5/qt5webengine/qt5webengine.mk                 | 4 ++--
package/qt5/qt5webkit-examples/qt5webkit-examples.mk     | 2 +-
package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
57 files changed, 90 insertions(+), 85 deletions(-)

--
2.15.1
