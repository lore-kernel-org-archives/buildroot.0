From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 17 Nov 2019 12:33:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/systemd: set systemd generators
 instalation as optional choice
In-Reply-To: <20191117113345.159653-1-b.bilas@grinn-global.com>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
Message-ID: <20191117113345.159653-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the user to choose which systemd generator should be installed
on the target instead of installing all of them by default.
That's usefull in case of when someone is using firstboot condition
and doesn't want to have e.g getty services created automatically during
system boot by systemd-getty-generator. Set them enabled by default to
keep compatibility with old builds.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/systemd/Config.in  | 94 ++++++++++++++++++++++++++++++++++++++
 package/systemd/systemd.mk | 56 +++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index fadc1a32c8..052b69f4de 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -112,6 +112,100 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
+menu systemd-generators
+
+config BR2_PACKAGE_SYSTEMD_DEBUG_GENERATOR
+	bool "systemd debug generator"
+	default y
+	help
+	  systemd-debug-generator is for enabling a runtime debug
+	  shell and masking specific units at boot.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-debug-generator.html
+
+config BR2_PACKAGE_SYSTEMD_FSTAB_GENERATOR
+	bool "systemd fstab generator"
+	default y
+	help
+	  systemd-fstab-generator is a generator that translates
+	  /etc/fstab into native systemd units early at boot
+	  and when configuration of the system manager is reloaded.
+	  This will instantiate mount and swap units as necessary.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-fstab-generator.html
+
+config BR2_PACKAGE_SYSTEMD_GETTY_GENERATOR
+	bool "systemd getty generator"
+	default y
+	help
+	  systemd-getty-generator is a generator that automatically
+	  instantiates serial-getty at .service on the kernel
+	  console(s), if they can function as ttys and are not
+	  provided by the virtual console subsystem. It will also
+	  instantiate serial-getty at .service instances for
+	  virtualizer consoles, if execution in a virtualized
+	  environment is detected.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-getty-generator.html
+
+config BR2_PACKAGE_SYSTEMD_GPT_AUTO_GENERATOR
+	bool "systemd gpt auto generator"
+	default y
+	help
+	  systemd-gpt-auto-generator is a unit generator that
+	  automatically discovers root, /home/, /srv/, the EFI
+	  System Partition, the Extended Boot Loader Partition and
+	  swap partitions and creates mount and swap units for them,
+	  based on the partition type GUIDs of GUID partition tables
+	  (GPT). It implements the Discoverable Partitions
+	  Specification.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-gpt-auto-generator.html
+
+config BR2_PACKAGE_SYSTEMD_RC_LOCAL_GENERATOR
+	bool "systemd rc local generator"
+	default y
+	help
+	  systemd-rc-local-generator is a generator that checks
+	  whether /etc/rc.local exists and is executable,
+	  and if it is pulls the rc-local.service unit into the
+	  boot process.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-rc-local-generator.html
+
+config BR2_PACKAGE_SYSTEMD_RUN_GENERATOR
+	bool "systemd run generator"
+	default y
+	help
+	  systemd-run-generator is for invoking commands specified
+	  on the kernel command line as system service.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-run-generator.html
+
+config BR2_PACKAGE_SYSTEMD_SYSTEM_UPDATE_GENERATOR
+	bool "systemd system update generator"
+	default y
+	help
+	  systemd-system-update-generator is a generator that
+	  automatically redirects the boot process to
+	  system-update.target, if /system-update exists.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-system-update-generator.html
+
+config BR2_PACKAGE_SYSTEMD_SYSV_GENERATOR
+	bool "systemd sysv generator"
+	default y
+	help
+	  systemd-sysv-generator is a generator that creates wrapper
+	  .service units for SysV init scripts in /etc/init.d/* at
+	  boot and when configuration of the system manager is
+	  reloaded. This will allow systemd(1) to support them
+	  similarly to native units/
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-system-update-generator.html
+
+endmenu
+
 config BR2_PACKAGE_SYSTEMD_MACHINEID_FILE
 	bool "Install empty machine id file"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fc348fe120..32349980e3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -467,6 +467,62 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 endef
 endif
 
+ifneq ($(BR2_PACKAGE_SYSTEMD_DEBUG_GENERATOR),y)
+define SYSTEMD_DISABLE_DEBUG_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-debug-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_DEBUG_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_FSTAB_GENERATOR),y)
+define SYSTEMD_DISABLE_FSTAB_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-fstab-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_FSTAB_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_GETTY_GENERATOR),y)
+define SYSTEMD_DISABLE_GETTY_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-getty-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_GETTY_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_GPT_AUTO_GENERATOR),y)
+define SYSTEMD_DISABLE_GPT_AUTO_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-gpt-auto-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_GPT_AUTO_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_RC_LOCAL_GENERATOR),y)
+define SYSTEMD_DISABLE_RC_LOCAL_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-rc-local-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_RC_LOCAL_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_RUN_GENERATOR),y)
+define SYSTEMD_DISABLE_RUN_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-run-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_RUN_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_SYSTEM_UPDATE_GENERATOR),y)
+define SYSTEMD_DISABLE_SYSTEMD_SYSTEM_UPDATE_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-system-update-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_SYSTEMD_SYSTEM_UPDATE_GENERATOR
+endif
+
+ifneq ($(BR2_PACKAGE_SYSTEMD_SYSTEMD_SYSV_GENERATOR),y)
+define SYSTEMD_DISABLE_SYSTEMD_SYSV_GENERATOR
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system-generators/systemd-sysv-generator
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_DISABLE_SYSTEMD_SYSV_GENERATOR
+endif
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
 	SYSTEMD_INSTALL_TARGET_MACHINED \
-- 
2.24.0
