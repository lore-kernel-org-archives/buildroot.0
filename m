From: Allan Nielsen <a@awn.dk>
Date: Fri, 28 Oct 2011 11:22:34 +0200
Subject: [Buildroot] Hints if anybody wants to upgrade to QT 4.8.0-rc1
Message-ID: <CANdC7UF+Wmb_hJbrwiQ-KzM=LDu03=Fa4fwiGoJZ_1kEsXokPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

If anybody at some point feels like upgrading qt to version 4.8.0
(rc1), then I would like to share two findings I spend the last couple
of says on:

PROBLEM WITH WEBKIT:
At some point in the build scripts of QT, qmake is called ( this is
after the configure step ), and updates the makefiles of ( at least)
webkit. This is causing qmake to use the default PKGCONFIG which will
make it link with the host installation of gstreamer. To fix this I
use the following build hook:

define QT_BUILD_CMDS
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
	$(MAKE) -C $(@D)
endef

Instead of:

define QT_BUILD_CMDS
	$(MAKE) -C $(@D)
endef



PROBLEMS WITH PLUGINS:
Qt 4.8.0 does not seem to work with plugins which have been stripped
using sstrip. If one activate the developers log messages the
following message is printed when a plugin is loaded:

load failed: "'/usr/lib/qt/plugins/phonon_backend/libphonon_gstreamer.so'
is an invalid ELF object (shstrtab section header seems to be at 0)"

Therefor, to make it work, qt plugins must not be stripped using sstrip.



Unfortunately, my qt 4.8.0 package is very customized, and is not
suitable for inclusion in buildroot, but let me know if you are
interested in seeing it any way. I hope this might save some time for
you out there.



Best Regards
Allan W. Nielsen
