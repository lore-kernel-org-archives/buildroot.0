From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:18:35 +0100
Subject: [Buildroot] [PATCH] qt-webkit-kiosk: new package
In-Reply-To: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <20150221141835.466b6821@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerome Oufella,

On Sat, 21 Feb 2015 00:45:49 -0500, Jerome Oufella wrote:
> Qt-webkit-kiosk is a simple browser working in kiosk-mode, powered by
> Qt & Webkit. It provides a convenient way to deploy a full-screen
> browser on embedded system platforms.
> 
> This commit adds the appropriate packaging to Buildroot, including
> options to parametrize the deployment of the optional sound files and
> the customization of the browser configuration file.
> 
> Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>

Thanks for this contribution. This definitely looks like a useful
package to have in Buildroot! See below for some comments.

> diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
> new file mode 100644
> index 0000000..4371ac8
> --- /dev/null
> +++ b/package/qt-webkit-kiosk/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK
> +	depends on BR2_PACKAGE_QT5WEBKIT
> +	depends on BR2_PACKAGE_QT5MULTIMEDIA

Please put the dependencies after the "bool" statement. Also, I would
prefer something like:

	depends on BR2_PACKAGE_QT5
	select BR2_PACKAGE_QT5WEBKIT
	select BR2_PACKAGE_QT5MULTIMEDIA
	depends on !BR2_STATIC_LIBS # qt5webkit
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
	depends on BR2_ARCH_HAS_ATOMICS # qt5webkit
	depends on !BR2_BINFMT_FLAT # qt5webkit

This way, your package becomes visible as soon as Qt5 is enabled,
without requiring the user to know which particular Qt5 modules have to
be enabled.

> +	bool "qt-webkit-kiosk"
> +	help
> +	  Simple browser working in kiosk-mode, powered by Qt & Webkit

Line seems too long. Also, use "and" instead of "&".

> +
> +if BR2_PACKAGE_QT_WEBKIT_KIOSK
> +
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
> +        bool "Install browser sound files"
> +        help
> +          Deploy browser sound files on target
> +
> +choice
> +	prompt "Browser configuration file"
> +	help
> +	  Select what configuration file to use
> +
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_DEFAULT
> +	bool "Default configuration file"
> +
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM
> +	bool "Custom configuration file"
> +
> +endchoice
> +
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE
> +	depends on BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM
> +        string "Custom configuration file"
> +        help
> +          Enter the path to the custom configuration file. The file
> +	  will be deployed as qt-webkit-kiosk.ini in the browser'
> +	  resource directory.

I don't think we want to have an option for this. Just install the
default configuration file unconditionally. People who want to override
it should do so in their rootfs overlay or in a post-build script.


> diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
> new file mode 100644
> index 0000000..a6325a5
> --- /dev/null
> +++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
> @@ -0,0 +1,51 @@

Missing comment header. See all other packages in Buildroot. Yes, I
know it's a silly rule, but most rules are silly, no? :-)

> +QT_WEBKIT_KIOSK_VERSION = 7fe40a350abfbe5ec194e7c6c740f7099e8704cd
> +QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
> +QT_WEBKIT_KIOSK_SITE_METHOD = git
> +QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
> +QT_WEBKIT_KIOSK_LICENSE = LGPLv3
> +QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
> +
> +ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_DEFAULT),y)
> +QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS += install_config
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM),y)
> +ifneq ($(call qstrip,$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)),)
> +define QT_WEBKIT_KIOSK_INSTALL_CFG_CUSTOM
> +	if [ -f "$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)" ]; then \
> +		$(INSTALL) -D -m 0644 "$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)" \
> +			$(TARGET_DIR)/usr/share/qt-webkit-kiosk/qt-webkit-kiosk.ini; \
> +	else \
> +		printf "Error: '%s' is not a valid file, check your BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE setting\n" \
> +		"$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)"; \
> +		exit 1 ; \
> +	fi
> +endef
> +endif
> +endif

Please replace this by something that always installs the default
configuration file.

> +
> +ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),y)
> +QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS += install_sound
> +endif
> +
> +ifneq ($(call qstrip,$(QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS)),)
> +define QT_WEBKIT_KIOSK_INSTALL_DATAFILES
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_ROOT=$(TARGET_DIR) $(QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS)
> +endef
> +endif

Please put all the install related logic right before the
<pkg>_INSTALL_CMDS variable.

> +define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake PREFIX=/usr)
> +endef

Please use $(QT5_QMAKE) instead of calling qmake directly.

> +
> +define QT_WEBKIT_KIOSK_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/src/qt-webkit-kiosk $(TARGET_DIR)/usr/bin/

You can use install_target instead, no?

> +	$(QT_WEBKIT_KIOSK_INSTALL_DATAFILES)
> +	$(QT_WEBKIT_KIOSK_INSTALL_CFG_CUSTOM)
> +endef

Something like:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		INSTALL_ROOT=$(TARGET_DIR) \
		install_target \
		install_config \
		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)

Could you take into account those comments, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
