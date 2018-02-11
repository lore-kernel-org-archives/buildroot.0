From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 11:13:18 -0500
Subject: [Buildroot] [RFC 0/2] Qt5 bump latest version to 5.10.0
Message-ID: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear maintainers,

I am working on bumping the latest version of Qt to 5.10. All modules
except qtwebengine compile fine (on PC x86-64 BIOS configuration); and
they are not tested yet.

The first patch updates all hashes for all Qt5 modules; at the exception
of qtwebkit (and qtwebkit-samples) that stay in 5.9.

Unfortunately filename has changed since 5.10. The module suffix
*opensource-src* has changed to *everywhere-src*. I introduced the
*qt5source* function to compute automatically the right filename
according to the Qt version. This function takes the module as first
argument and its version as second argument.

The second patch add libnss dependency to qtwebengine 5.10 to fix a new
requirement.

But I met a link issue with an 64bit host tool with lpthread. If someone
may help about this issue...

	FAILED: host/transport_security_state_generator 
	/home/gportay/src/buildroot/output-qt5.10/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4 
	/usr/bin/ld: cannot find /lib64/libpthread.so.0
	/usr/bin/ld: cannot find /usr/lib64/libpthread_nonshared.a
	collect2: error: ld returned 1 exit status
	ninja: build stopped: subcommand failed.
	Makefile.gn_run:449: recipe for target 'run_ninja' failed

The libpthread.so present in host directory is a ld script:

	$ cat host/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libpthread.so 
	/* GNU ld script
	   Use the shared library, but some functions are only in
	   the static library, so try that secondarily.  */
	OUTPUT_FORMAT(elf64-x86-64)
	GROUP ( /lib64/libpthread.so.0 /usr/lib64/libpthread_nonshared.a )

When the script is removed, I met another link issue with other
libraries.

	/usr/bin/ld: cannot find /lib64/libm.so.6
	/usr/bin/ld: cannot find /usr/lib64/libmvec_nonshared.a
	/usr/bin/ld: cannot find /lib64/libmvec.so.1

I also noticed a build issue with qtmultimedia, qtwayland and qtwebkit
when using mesa3d as EGL library without X. When BR2_PACKAGE_LIBXCB is
set the issue is gone.

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

Regards,
Ga?l PORTAY (2):
  qt5: bump to 5.10.0
  qt5webengine: select libnss

 package/qt5/Config.in                                    | 4 ++--
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
 package/qt5/qt5webengine/Config.in                       | 1 +
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
