From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Aug 2012 05:53:45 +0200
Subject: [Buildroot] [PATCH 4/4] qtuio: new package
In-Reply-To: <1346230869-4926-4-git-send-email-sho@relinux.de>
References: <1346230869-4926-1-git-send-email-sho@relinux.de>
 <1346230869-4926-4-git-send-email-sho@relinux.de>
Message-ID: <20120830055345.388d4c89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 29 Aug 2012 11:01:09 +0200,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> new file mode 100644
> index 0000000..dfea228
> --- /dev/null
> +++ b/package/qtuio/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_QTUIO
> +	bool "qtuio"
> +	select BR2_PACKAGE_MTDEF2TUIO

Shouldn't this be MTDEV2TUIO ?

> +	depends on BR2_PACKAGE_QT

The code of qtuio also suggests it requires GUI support in Qt, so I
guess some other dependencies are needed here.

> +	help
> +	  Implementation of an interface connecting TUIO messages
> +	  and QT events
> +
> +	  https://github.com/x29a/qTUIO
> +
> +comment "qtuio depends on QT"
> +	depends on !BR2_PACKAGE_QT

This comment should be below the examples config option in order to
make sure that the examples config option gets "indented" under the
main qtuio config option.

> +
> +config BR2_QTUIO_EXAMPLES
> +	bool "qtuio_examples"

Make this "qtuio examples".

> +	depends on BR2_PACKAGE_QTUIO
> +	help
> +	  Build and install qtuio examples
> diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
> new file mode 100644
> index 0000000..efaeae8
> --- /dev/null
> +++ b/package/qtuio/qtuio.mk
> @@ -0,0 +1,68 @@
> +#############################################################
> +#
> +# qTUIO
> +#
> +#############################################################
> +QTUIO_VERSION = abe4973ff6
> +QTUIO_SITE = git://github.com/x29a/qTUIO.git
> +QTUIO_DEPENDENCIES = qt mtdev2tuio

Is mtdev2tuio really a build-time dependency? I don't think so. If it
isn't, then keep the select in the Config.in file, but remove the
build-time dependency here. Add a comment above the select in Config.in
that explicitly says that it is a runtime dependency only.

> +QTUIO_LICENSE = GPLv3+
> +QTUIO_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_QTUIO_EXAMPLES),y)
> +define QTUIO_CONFIGURE_EXAMPLES
> +cd $(@D)/examples/dials && $(QT_QMAKE)
> +cd $(@D)/examples/fingerpaint && $(QT_QMAKE)
> +cd $(@D)/examples/knobs && $(QT_QMAKE)
> +cd $(@D)/examples/pinchzoom && $(QT_QMAKE)
> +## pong depends on QtOpenGL cd $(@D)/examples/pong && $(QT_QMAKE)
> +endef
> +endif

Mention the pong thing as a comment somewhere, only once, and don't
include the compile line if it isn't supported. Also, you could
simplify this as follows:

	for example in dials fingerpaint knobs pinchzoom ; do \
		(cd $(@D)/examples/$${examples} && $(QT_QMAKE)) ; \
	done

And indent the code with one tab.

> +define QTUIO_CONFIGURE_CMDS
> +cd $(@D)/src && $(QT_QMAKE)
> +$(QTUIO_CONFIGURE_EXAMPLES)
> +endef

Indent with one tab.

> +ifeq ($(BR2_QTUIO_EXAMPLES),y)
> +define QTUIO_BUILD_EXAMPLES
> +$(MAKE) -C $(@D)/examples/dials
> +$(MAKE) -C $(@D)/examples/fingerpaint
> +$(MAKE) -C $(@D)/examples/knobs
> +$(MAKE) -C $(@D)/examples/pinchzoom
> +## pong depends on QtOpenGL $(MAKE) -C $(@D)/examples/pong
> +endef
> +endif

Ditto: use a for loop + indent with one tab.

> +define QTUIO_BUILD_CMDS
> +$(MAKE) -C $(@D)/src
> +$(QTUIO_BUILD_EXAMPLES)
> +endef
> +
> +ifeq ($(BR2_QTUIO_EXAMPLES),y)
> +define QTUIO_INSTALL_EXAMPLES
> +$(INSTALL) -D -m 0755 $(@D)/examples/dials/dials $(TARGET_DIR)/usr/share/qtuio/dials
> +$(INSTALL) -D -m 0755 $(@D)/examples/fingerpaint/fingerpaint $(TARGET_DIR)/usr/share/qtuio/fingerpaint
> +$(INSTALL) -D -m 0755 $(@D)/examples/knobs/knobs $(TARGET_DIR)/usr/share/qtuio/knobs
> +$(INSTALL) -D -m 0755 $(@D)/examples/pinchzoom/pinchzoom $(TARGET_DIR)/usr/share/qtuio/pinchzoom
> +## pong depends on QtOpenGL $(INSTALL) -D -m 0755 $(@D)/examples/pong/pong $(TARGET_DIR)/usr/share/qtuio/pong
> +endef
> +endif
> +
> +define QTUIO_INSTALL_TARGET_CMDS
> +$(INSTALL) -D -m 0755 $(@D)/lib/libqTUIO.so* $(TARGET_DIR)/usr/lib

Normally, install -D requires the complete destination filename as
second argument. We usually use cp when multiple files need to be
copied at once.

Doesn't the qtuio package has a usable 'make install' ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
