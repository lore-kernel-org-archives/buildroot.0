From: Aleksandar Simeonov <aleksandar@barix.com>
Date: Tue, 12 Apr 2016 15:36:32 +0200
Subject: [Buildroot] Adding custom config files to a package
Message-ID: <570CF9E0.3000609@barix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Sorry to disturb you again, but back to our discussion sometime ago on 
#buildroot IRC channel:

Now I'm trying to implement your idea to use <pkg>_config files to copy 
some custom configuration target once the main package is built.
The idea works great, however it has certain drawbacks - It is executed 
only the first time you build the main package, and then gets added to 
the rootfs.jffs image. As soon as I have the image built, any make runs 
after that do not rut through it, as if it is not detected as a 
dependency. This is bit of a problem because when rebuilding the image 
(for this I clean the target folder before that), the make does not copy 
the <pkg> relevant files to the output/target folder, and thus not 
propagating them to the image :( Is there anything I can do about it?

I have tried adding a Config.in file, and source it in the main 
Config.in file in my BR2_EXTERNAL folder, but then the make tries to 
"compile" it, and fails with "No scheme" message. I assume that do not 
need to run $(eval $(whatever-package)) at the end because it is not a 
real package, so commenting it solves the compilation error, but still 
is not run

Attached I'm sending an example for configuring dropbear package. In my 
main Config.in file I source this one, and the path to the makefile is 
included in my external.mk

Could you advise something in this case?

Thank you very much in advance

Alex


-------------- next part --------------
#############################################################
#
# UCI
#
#############################################################
UCI_VERSION = 825be5d0cd699919fbad15901c63044f0efffe82
UCI_SITE = git://nbd.name/uci.git
UCI_DEPENDENCIES = rsync
ifeq ($(BR2_PACKAGE_LUA),y)
UCI_CONF_OPTS = -DBUILD_LUA=ON
UCI_DEPENDENCIES += lua
else
UCI_CONF_OPTS = -DBUILD_LUA=OFF
endif

UCI_INSTALL_STAGING = YES
#UCI_INSTALL_TARGET = YES

UCI_UCI_DEFAULTS_FILES = package/uci/defaults/*

define UCI_INSTALL_INIT_SYSV
	if [ ! -f $(TARGET_DIR)/etc/init.d/mount_config ]; then \
		$(INSTALL) -m 0755 -D package/uci/rc/mount_config $(TARGET_DIR)/etc/init.d/mount_config; \
	fi
	if [ ! -h $(TARGET_DIR)/etc/rcS.d/S10mount_config ]; then \
		ln -s ../init.d/mount_config $(TARGET_DIR)/etc/rcS.d/S10mount_config ; \
	fi

	if [ ! -h $(TARGET_DIR)/etc/rc0.d/K80umount_config ]; then \
		ln -s ../init.d/mount_config $(TARGET_DIR)/etc/rc0.d/K80umount_config ; \
	fi
	if [ ! -h $(TARGET_DIR)/etc/rc6.d/K80umount_config ]; then \
		ln -s ../init.d/mount_config $(TARGET_DIR)/etc/rc6.d/K80umount_config ; \
	fi
endef

define UCI_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/config
	$(INSTALL) -D -m 0755 package/uci/bin/functions.sh $(TARGET_DIR)/lib/config/functions.sh

	$(INSTALL) -D -m 0755 $(@D)/uci $(TARGET_DIR)/sbin
	$(INSTALL) -D -m 0755 $(@D)/uci-static $(TARGET_DIR)/sbin
	$(INSTALL) -D -m 0755 $(@D)/libuci.so $(TARGET_DIR)/lib
	#$(INSTALL) -D -m 0755 $(@D)/libuci.a $(TARGET_DIR)/lib
endef

define UCI_UNINSTALL_TARGET_CMDS
	$(RM) $(TARGET_DIR)/lib/config/functions.sh
	$(RM) $(TARGET_DIR)/sbin/uci
	$(RM) $(TARGET_DIR)/sbin/uci-static
	$(RM) $(TARGET_DIR)/lib/libuci.so
	#$(RM) -f $(TARGET_DIR)/lib/libuci.a
endef

$(eval $(cmake-package))
-------------- next part --------------
menu "Barix System configuration (applications and kernel modules)"
	menu "Base system"
		source "$BR2_EXTERNAL/package/barix/syswatchdog/Config.in"
		source "$BR2_EXTERNAL/package/barix/web_ui/Config.in"
		source "$BR2_EXTERNAL/package/barix/sys_id/Config.in"
		source "$BR2_EXTERNAL/package/barix/updater/Config.in"
		source "$BR2_EXTERNAL/package/override/uci/Config.in"
		
		config BR2_PACKAGE_BARIX_CONFIG_SUBSYSTEM
			bool "Configuration subsystem"
			select BR2_PACKAGE_UCI
			config BR2_UCI_TEMPLATE_DIR
				string "Directory path to store UCI templates"
				default "/barix/config/templates"
			config BR2_UCI_DEFAULTS_DIR
				string "Directory path to store UCI defaults"
				default "/barix/config/defaults"
			help
			  UCI based configuration subsystem that provides
			  dynamic configuration via Web UI, automatic service
			  restarting, database of parameters, import/export,
			  default parameters, etc.

			  http://www.barix.com/

		### source "package/barix/hardware/Config.in"
		source "$BR2_EXTERNAL/package/barix/factory_info_mng/Config.in"
		source "$BR2_EXTERNAL/package/barix/reset_reader/Config.in"
		source "$BR2_EXTERNAL/package/barix/logs/Config.in"
		source "$BR2_EXTERNAL/package/barix/ntp2hwclocksync/Config.in"
		source "$BR2_EXTERNAL/package/barix/rtc_ctl/Config.in"
		source "$BR2_EXTERNAL/package/barix/cron/Config.in"

		config BR2_PACKAGE_BARIX_SYSTEM_SERVICES
			bool "Autoselect system services"
			select BR2_PACKAGE_IFPLUGD
			select BR2_PACKAGE_NTP
			select BR2_PACKAGE_NTP_NTPD
			select BR2_PACKAGE_NTP_NTPDATE
			select BR2_PACKAGE_NTP_NTPQ
			help
			  Automatically selects following system services:
			  link monitoring (ifplugd), NTP
		source "$BR2_EXTERNAL/package/barix/watchdog/Config.in"

		source "$BR2_EXTERNAL/package/barix/locale_timezone/Config.in"
		source "$BR2_EXTERNAL/package/barix/audio_level_adjust/Config.in"
		source "$BR2_EXTERNAL/package/barix/alsa_4channel_adjust/Config.in"
		source "$BR2_EXTERNAL/package/barix/hello_world/Config.in"
	endmenu
	menu "Features"
		source "$BR2_EXTERNAL/package/barix/binary_discovery/Config.in"
		source "$BR2_EXTERNAL/package/barix/sonic_ip/Config.in"
		source "$BR2_EXTERNAL/package/barix/leds/Config.in"
		source "$BR2_EXTERNAL/package/barix/display_ctl/Config.in"
	endmenu
	choice 
		prompt "Main application"
		default BR2_PACKAGE_NO_APPLICATION
		config BR2_PACKAGE_NO_APPLICATION
		bool "no application"
		help
		  No default application

		source "$BR2_EXTERNAL/package/barix/ferdinand/Config.in"
		source "$BR2_EXTERNAL/package/barix/hubertus/Config.in"
		source "$BR2_EXTERNAL/package/barix/hubrec/Config.in"
		source "$BR2_EXTERNAL/package/barix/soundscape/Config.in"
		source "$BR2_EXTERNAL/package/barix/remote_spot/Config.in"
	endchoice

	menu "Debug"
		source "$BR2_EXTERNAL/package/barix/cpp_unit/Config.in"
	endmenu
	menu "Production"
		source "$BR2_EXTERNAL/package/barix/production_test/Config.in"
	endmenu

	menu "Version management"
	
	# copied from packages/barix/sys_id/Config.in
	if BR2_PACKAGE_SYS_ID
		comment "Firmware Global"
		config BR2_PACKAGE_SYS_ID_OBJID
			string "System/Product ID"

		config BR2_PACKAGE_SYS_ID_FW_VERSION
			string "Firmware version"
	endif

	comment "Kernel"

	# copied from linux/Config.in
	if BR2_LINUX_KERNEL_CUSTOM_GIT
		config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
		string "Kernel GIT tag/version"
		default "HEAD"
	endif

	comment "Bootloader"
	# copied from uboot/Config.in
	if BR2_TARGET_UBOOT_CUSTOM_GIT
		config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
		string "U-Boot GIT tag/version"
	endif

	
	comment "Applications"
	
	if BR2_PACKAGE_FERDINAND
		config BR2_FERDINAND_GIT_VERSION
		string "Store & Play Git tag/version"
		default "develop"
	endif

	if BR2_PACKAGE_SOUNDSCAPE
		config BR2_SOUNDSCAPE_GIT_VERSION
		string "Soundscape GIT tag/version"
		default "develop"
	endif

	if BR2_PACKAGE_DISPLAY_CTL
		config BR2_DISPLAY_CTL_GIT_VERSION
		string "Display controller GIT tag/version"
		default "develop"
	endif

	comment "Libraries"
	if BR2_PACKAGE_CPP_UNIT
		config BR2_CPP_UNIT_GIT_VERSION
		string "CPP Unit lib GIT tag/version"
		default "master"
	endif

	comment "System components"
	if BR2_PACKAGE_BINARY_DISCOVERY
		config BR2_BINARY_DISCOVERY_GIT_VERSION
		string "Binary discovery GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_FACTORY_INFO_MNG
		config BR2_FACTORY_INFO_MNG_GIT_VERSION
		string "Factory info manager GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_LEDS
		config BR2_LEDS_GIT_VERSION
		string "LED manager GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_RESET_READER
		config BR2_RESET_READER_GIT_VERSION
		string "Reset Reader GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_UPDATER
		config BR2_UPDATER_GIT_VERSION
		string "Barix Updater GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_WATCHDOG
		config BR2_WATCHDOG_GIT_VERSION
		string "Application SW watchdog GIT tag/version"
		default "master"
	endif

	if BR2_PACKAGE_WEB_UI
		config BR2_WEB_UI_GIT_VERSION
		string "System Web UI GIT tag/version"
		default "master"
	endif

	endmenu
	
	menu "Configuration packages"
	
	if BR2_PACKAGE_DROPBEAR
		source "$BR2_EXTERNAL/package/config/dropbear_config/Config.in"
	endif
	endmenu
endmenu
