From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 02:25:10 +0200
Subject: [Buildroot] [PATCH 7/8] restorecond: new package
In-Reply-To: <20171009222731.15119-7-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <20171009222731.15119-7-Adamduskett@outlook.com>
Message-ID: <e56eb30c-694e-d512-5bb6-6c4109097c92@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 00:27, Adam Duskett wrote:
> restorecond is now a seperate package released by the SELinux maintainers.
> 
> restorecond is a daemon that watches for file creation and then sets the
> default SELinux file context for that file.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[snip]
> +config BR2_PACKAGE_RESTORECOND
> +	bool "restorecond"
> +	depends on BR2_PACKAGE_DBUS # dbus-glib
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	select BR2_PACKAGE_LIBSELINUX
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  restorecond is a daemon that watches for file creation and then sets the

 This line is too long. Did you run check_package?

> +	  default SELinux file context for that file.
[snip]
> +RESTORECOND_DEPENDENCIES = libglib2 libselinux dbus-glib
> +
> +RESTORECOND_MAKE_OPTS += \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \

 You should carry over the comment about _FILE_OFFSET_BITS.

> +	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
> +	ARCH="$(BR2_ARCH)"
> +
> +# We need to pass DESTDIR at build time because it's used by
> +# RESTORECOND build system to find headers and libraries.
     restorecond (lower case)


 Regards,
 Arnout

> +define RESTORECOND_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(RESTORECOND_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
> +endef
> +
> +define RESTORECOND_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D $(@D)/restorecond.init \
> +		$(TARGET_DIR)/etc/init.d/restorecond
> +endef
> +
> +define RESTORECOND_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/restorecond.service
> +		
> +	$(INSTALL) -m 0600 -D $(@D)/org.selinux.Restorecond.service \
> +		$(TARGET_DIR)/etc/systemd/system/org.selinux.Restorecond.service
> +endef
> +
> +define RESTORECOND_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond.conf $(TARGET_DIR)/etc/selinux
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond_user.conf $(TARGET_DIR)/etc/selinux
> +	$(INSTALL) -m 0755 -D $(@D)/restorecond $(TARGET_DIR)/usr/sbin
> +endef
> +
> +
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
