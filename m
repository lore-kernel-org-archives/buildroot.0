From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Thu,  4 Feb 2021 08:56:58 -0600
Subject: [Buildroot] [PATCH v8 3/3] libvirt: add lxc and qemu options
In-Reply-To: <20210204145658.22974-1-jared.bents@rockwellcollins.com>
References: <20210204145658.22974-1-jared.bents@rockwellcollins.com>
Message-ID: <20210204145658.22974-3-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add lxc and qemu options for libvirt under the daemon
config option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

--
History:
v8:
  - Split off from patch adding libvirt
---
 package/libvirt/Config.in  | 36 +++++++++++++++++++++++++++++++++++
 package/libvirt/libvirt.mk | 39 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index ae5c8aac8a..ef9c10655f 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -42,6 +42,42 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+# Stateful drivers are useful only when building the daemon.
+if BR2_PACKAGE_LIBVIRT_DAEMON
+
+config BR2_PACKAGE_LIBVIRT_QEMU
+	bool "qemu"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12  # libseccomp
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	select BR2_PACKAGE_HWDATA         # libpciaccess
+	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_QEMU
+	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+	select BR2_PACKAGE_YAJL
+	help
+	  QEMU/KVM support
+
+comment "qemu support needs a toolchain w/ headers >= 3.12"
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_PACKAGE_LIBVIRT_LXC
+	bool "lxc"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # lxc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	select BR2_PACKAGE_LXC
+	help
+	  Linux Container support
+
+comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+endif
+
 endif
 
 comment "libvirt needs udev /dev management"
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 8229f9f651..3f6597cdbe 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -23,9 +23,7 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_hyperv=disabled \
 	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
-	-Ddriver_lxc=disabled \
 	-Ddriver_openvz=disabled \
-	-Ddriver_qemu=disabled \
 	-Ddriver_remote=enabled \
 	-Ddriver_secrets=enabled \
 	-Ddriver_vmware=disabled \
@@ -130,6 +128,13 @@ else
 LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
+LIBVIRT_CONF_OPTS += -Dlogin_shell=enabled -Ddriver_lxc=enabled
+LIBVIRT_DEPENDENCIES += lxc
+else
+LIBVIRT_CONF_OPTS += -Dlogin_shell=disabled -Ddriver_lxc=disabled
+endif
+
 # Can't build nss plugin without network
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBNSS),yy)
 LIBVIRT_CONF_OPTS += -Dnss=enabled
@@ -152,6 +157,12 @@ else
 LIBVIRT_CONF_OPTS += -Dpolkit=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+LIBVIRT_CONF_OPTS += -Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=kvm
+else
+LIBVIRT_CONF_OPTS += -Ddriver_qemu=disabled -Dqemu_user=no -Dqemu_group=no
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 LIBVIRT_CONF_OPTS += -Dreadline=enabled
 LIBVIRT_DEPENDENCIES += readline
@@ -214,13 +225,29 @@ define LIBVIRT_PERMISSIONS
 	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
 	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
 	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
+	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
+	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
+	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
 	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
+	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
+	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
 	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
 	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
 endef
 
 # libvirt may need to create persistent files (e.g. VM definitions) in these
@@ -231,14 +258,22 @@ endef
 define LIBVIRT_CREATE_SYMLINKS
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
+	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
+	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
 endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+define LIBVIRT_USERS
+	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 define LIBVIRT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
-- 
2.17.1
