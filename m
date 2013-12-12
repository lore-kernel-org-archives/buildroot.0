From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Dec 2013 00:02:01 +0100
Subject: [Buildroot] [ PATCH v4 16/20] busybox: add option to install
 individual binaries
In-Reply-To: <1386872840-22051-17-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
 <1386872840-22051-17-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <52AA4069.3000707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/13 19:27, Clayton Shotwell wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
>   package/busybox/Config.in  |    3 +++
>   package/busybox/busybox.mk |   24 ++++++++++++++++++++++++
>   2 files changed, 27 insertions(+), 0 deletions(-)
>
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 2d55aa6..7f00fb8 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -55,6 +55,9 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>   	  Show packages in menuconfig that are potentially also provided
>   	  by busybox.
>
> +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
> +	bool "Individual binaries"

  This really lacks some help text, even I had no idea what it meant at 
first. I guess the text from busybox can just be reused - though for 
SELinux there's obviously a different reason.

         If your CPU architecture doesn't allow for sharing text/rodata
         sections of running binaries, but allows for runtime dynamic
         libraries, this option will allow you to reduce memory footprint
         when you have many different applets running at once.

         If your CPU architecture allows for sharing text/rodata,
         having single binary is more optimal.

         Each applet will be a tiny program, dynamically linked
         against libbusybox.so.N.N.N.

         You need to have a working dynamic linker.

  That last sentence makes me think that we're missing a depends on 
!BR2_PREFER_STATIC here.

> +
>   config BR2_PACKAGE_BUSYBOX_WATCHDOG
>   	bool "Install the watchdog daemon startup script"
>   	help
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index f6f542e..13de7ed 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -50,10 +50,16 @@ ifndef BUSYBOX_CONFIG_FILE
>   	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
>   endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_PERMISSIONS
> +/usr/share/udhcpc/default.script f 755  0 0 - - - - -

  Isn't setuid root needed anymore for /bin/login? Same for passwd, su, 
probably others...


> +endef
> +else
>   define BUSYBOX_PERMISSIONS
>   /bin/busybox			 f 4755	0 0 - - - - -
>   /usr/share/udhcpc/default.script f 755  0 0 - - - - -
>   endef
> +endif
>
>   # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
>   ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> @@ -152,6 +158,22 @@ define BUSYBOX_SET_INIT
>   endef
>   endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(BUSYBOX_BUILD_CONFIG))
> +endef
> +
> +define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
> +	for i in `find -L $(TARGET_DIR) -xtype l -samefile $(TARGET_DIR)/bin/busybox` ; do \
> +		$(INSTALL) -D -m 0755 $(@D)/0_lib/`basename $$i` $$i ; \
> +	done

  Icky, perhaps it's better to make an upstreamable patch that fixes the 
Makefile so it properly installs the binaries if INDIVIDUAL_BINARIES is 
selected?


  Regards,
  Arnout

> +	cp $(@D)/0_lib/libbusybox.so.* $(TARGET_DIR)/lib
> +	rm -f $(TARGET_DIR)/lib/libbusybox.so.*_unstripped*
> +	rm -f $(TARGET_DIR)/bin/busybox
> +endef
> +endif
> +
>   define BUSYBOX_INSTALL_LOGGING_SCRIPT
>   	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
>   		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
> @@ -187,6 +209,7 @@ define BUSYBOX_CONFIGURE_CMDS
>   	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
>   	$(BUSYBOX_SET_INIT)
>   	$(BUSYBOX_SET_WATCHDOG)
> +	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
>   	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
>   		-C $(@D) oldconfig
>   endef
> @@ -205,6 +228,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>   	$(BUSYBOX_INSTALL_MDEV_CONF)
>   	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
>   	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
> +	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
>   endef
>
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
