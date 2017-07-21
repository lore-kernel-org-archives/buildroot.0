From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 08:26:39 +0200
Subject: [Buildroot] [PATCH] package/qt5location: handle plugins being
 conditionally built
In-Reply-To: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
References: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20170721082639.2c98c0fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:33:29 -0700, Joshua Henderson wrote:
> This fixes a build issue where the qt5location plugins are not built, but are
> attempted to be installed.
> 
> The qt5location plugins have dependencies that are automatically resolved
> causing plugins to conditionaly be built. This change checks for the existance
> of the plugins prior to trying to install them.

Thanks for the fix. Do you know under which condition the plugins will
be built vs. not built ?

If it's related to one or several dependencies being available, then I
would prefer something like:

ifeq ($(BR2...dependencies needed for plugins),y)
define QT5LOCATION_INSTALL_PLUGINS
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
endef
endif

define QT5LOCATION_INSTALL_TARGET_POSITION
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
	$(QT5LOCATION_INSTALL_PLUGINS)
endef

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
