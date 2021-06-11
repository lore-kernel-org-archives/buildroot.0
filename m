From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 11 Jun 2021 09:07:30 -0500
Subject: [Buildroot] [PATCH v9 1/3] package/libvirt: new package
Message-ID: <20210611140732.47283-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libvirt is collection of software that provides a convenient way to
manage virtual machines and other virtualization functionality, such as
storage and network interface management. These software pieces include
an API library, a daemon (libvirtd), and a command line utility (virsh).

   http://libvirt.org/

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

--
History:
v1: primitive package, for experimental purposes only
v1->v2:
  - Clarify dependence on !BR2_TOOLCHAIN_USES_MUSL
  - Add run-time dependence on dnsmask
  - Add dependence on eudev and libpciaccess when eudev is selected
    (thus detected by configure).
v2->v3:
  - Condition the use of libtirpc to !BR2_TOOLCHAIN_HAS_NATIVE_RPC
  - Check for BR2_PACKAGE_HAS_UDEV instead of BR2_PACKAGE_EUDEV
v3->v4:
  - Fix version history :-).
  - Add optional dependency on several packages (e.g. attr, libpcap),
    depending on wether they are selected or not, and explicitly disable
    features whose required packages are not selected. This is very
    important to prevent selection of features based on leaks from the
    host environment (e.g. finding /usr/bin/numad on the host machine).
  - Enable the "interface" driver if either udev or netcf is available.
  - Disable pm-utils support, since there is no package for Buildroot.
  - Use either openssl or gnutls, if available.
  - Run qemu as user "qemu", group "kvm", not as root.
  - Add a LIBVIRT_USERS variable to create user "qemu" an group "kvm".
  - Add a device table file to set the ownership and permissions of the
    libvirt directories under /etc, /run and /var.
  - If udev is not available, add an init script to set the ownership
    and permissions of /dev/kvm to root:kvm and 0660; otherwise create a
    corresponding /etc/udev/rules.d/90-kvm.rules file.
  - Enable support for systemd, if applicable; otherwise install an init
    script to start/stop/restart libvirtd.
  - Ensure that a modern netcat is available.
v4->v5:
  - Changed SOB, since I don't work for DATACOM anymore.
  - Bump to version 5.8.0.
  - Add hash for license file.
  - Drop OpenSSL options, since it's not supported anymore.
  - Use https to access libvirt.org, since http is always redirected to
    https.
  - Make libvirt daemon optional. If not selected, build only the client
    utilities. Reorganize run-time dependencies accordingly.
  - Load all vfio modules on startup, if they exist, otherwise virtual
    machines that depend on the PCI Passthrough feature fail to load.
    vfio-pci is not enough. Other modules, like vfio_iommu_type1, may be
    necessary.
  - Fix stopping dnsmasq in start/stop script. dnsmasq is not always
    started by libvirtd, so we must chech if it is running before
    attempting to stop it.
  - Move /etc/libvirt/{qemu,secrets,storage} to /var/lib/libvirt. It may
    be necessary to create persistent files (e.g. VM definitions) in
    these directories. Move them to /var/lib because /etc may be on a
    read-only or volatile (initramfs) filesystem. We could tweak the
    code to change these paths but the patch would be large and would
    break compatibility with ordinary installations and with the
    documentation.
  - Prevent an error message if pid file dissappears. start-stop-daemon
    sends a TERM signal to the process but does not wait for its
    termination, so we may reach rm_stale_pidfile while libvirtd.pid
    still exists but execute the cat command when the file is already
    gone, which leads cat to show an error message. We could use the
    '--retry' option to wait for the process termination but it is not
    supported by BusyBox. Let's just send the error messages to
    /dev/null and attempt to remove the file if any command fails, since
    'rm -f' does nothing if the file does not exist.
  - Move device table creation to LIBVIRT_DEVICES instead of using the
    device_table.txt file.
  - Select libseccomp to enable seccomp support in qemu, as required by
    libvirt.
  - Select hwdata (pci.ids). It is required by libvirt to show device
    names when we use virtual machine manager to add hardware via PCI
    passthrough, otherwise only the PCI bus information (slot, port,
    function) is shown.
  - Add systemd support.
  - Restrict to libvirt with udev support. Drop netcf usage, which
    requires a new package and is hard to test. Support for non-udev
    systems will be added later.
  - Remove package/libvirt/S30devkvmperms
  - Fine-tune the configuration and pass host/target executable paths
    in ac_cv_path_* variables via LIBVIRT_CONF_ENV.
  - Use LIBVIRT_PERMISSIONS to set directory permissions.
  - Drop hook to set user/group in /etc/libvirt/qemu.conf, since it's
    not necessary.
  - Pull two upstream patches that fix building with musl.
  - Do not check for executables existence in the startup script.
  - Use separate init scripts for virtlogd and libvirtd. Make them
    compliant to the current pattern (as much as possible).
  - Do not start/stop virtlockd, since it is controlled by libvirtd.
v5->v6:
  - Remove stray '\' in S91virtlogd

Signed-off-by: Carlos Santos <unixmania@gmail.com>

v6->v7:
  - Carlos Santos is no longer contributing to buildroot.
  - Adjusted handling of bash-completion to add dependency if it is
    enabled.
  - Bump to version 6.4.0

v7->v8
  - Bump to version 7.0.0
  - Update to mason package type.
  - Split off daemon, qemu, and lxc to separate patches within the
    series due to feedback on being a large patch in an effort to
    allow the base part of libvirt to get added while providing the
    other portions for review.

v8->v9
  - Bump to version 7.4.0
  - Update to add host-python-docutils as dependency

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 DEVELOPERS                   |   3 +
 package/Config.in            |   1 +
 package/libvirt/90-kvm.rules |   1 +
 package/libvirt/Config.in    |  42 +++++++
 package/libvirt/libvirt.hash |   3 +
 package/libvirt/libvirt.mk   | 212 +++++++++++++++++++++++++++++++++++
 6 files changed, 262 insertions(+)
 create mode 100644 package/libvirt/90-kvm.rules
 create mode 100644 package/libvirt/Config.in
 create mode 100644 package/libvirt/libvirt.hash
 create mode 100644 package/libvirt/libvirt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ab898d94d..ef4ff17cc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1264,6 +1264,9 @@ F:	package/python-pexpect/
 F:	package/python-ptyprocess/
 F:	package/zynq-boot-bin/
 
+N:	Jared Bents <jared.bents@rockwellcollins.com>
+F:	package/libvirt/
+
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
 
diff --git a/package/Config.in b/package/Config.in
index e42f579494..70ba782a2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2463,6 +2463,7 @@ menu "System tools"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
+	source "package/libvirt/Config.in"
 	source "package/lxc/Config.in"
 	source "package/makedumpfile/Config.in"
 	source "package/mender/Config.in"
diff --git a/package/libvirt/90-kvm.rules b/package/libvirt/90-kvm.rules
new file mode 100644
index 0000000000..5145c27e79
--- /dev/null
+++ b/package/libvirt/90-kvm.rules
@@ -0,0 +1 @@
+KERNEL=="kvm", OWNER="root", GROUP="kvm", MODE="0660"
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
new file mode 100644
index 0000000000..f7999fea88
--- /dev/null
+++ b/package/libvirt/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_LIBVIRT
+	bool "libvirt"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_ZLIB
+	# configure: You must install the pciaccess module to build with udev
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBXML2
+	# run-time dependencies
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
+	help
+	  Libvirt is collection of software that provides a convenient
+	  way to manage virtual machines and other virtualization
+	  functionality, such as storage and network interface
+	  management. These software pieces include an API library, a
+	  daemon (libvirtd), and a command line utility (virsh).
+
+	  https://libvirt.org/
+
+comment "libvirt needs udev /dev management"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "libvirt needs a toolchain w/ headers >= 3.12"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+comment "libvirt needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_NETCAT
+	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
new file mode 100644
index 0000000000..ec96dfc62c
--- /dev/null
+++ b/package/libvirt/libvirt.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 b366d73dee6ce77a226bedef592e0620ceb8e22e5998f60768017f79fc4ead26  libvirt-7.4.0.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
new file mode 100644
index 0000000000..b2c9eebbfe
--- /dev/null
+++ b/package/libvirt/libvirt.mk
@@ -0,0 +1,212 @@
+################################################################################
+#
+# libvirt
+#
+################################################################################
+
+LIBVIRT_VERSION = 7.4.0
+LIBVIRT_SITE = https://libvirt.org/sources
+LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
+LIBVIRT_LICENSE = LGPL-2.1+
+LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
+
+LIBVIRT_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+
+LIBVIRT_CONF_OPTS = \
+	-Drpath=disabled \
+	-Dapparmor=disabled \
+	-Ddriver_bhyve=disabled \
+	-Ddriver_esx=disabled \
+	-Ddriver_hyperv=disabled \
+	-Ddriver_interface=enabled \
+	-Ddriver_libxl=disabled \
+	-Ddriver_lxc=disabled \
+	-Ddriver_network=disabled \
+	-Ddriver_openvz=disabled \
+	-Ddriver_qemu=disabled \
+	-Ddriver_remote=enabled \
+	-Ddriver_secrets=enabled \
+	-Ddriver_vmware=disabled \
+	-Ddriver_vbox=disabled \
+	-Ddriver_vz=disabled \
+	-Ddtrace=disabled \
+	-Dfirewalld=disabled \
+	-Dfirewalld_zone=disabled \
+	-Dglusterfs=disabled \
+	-Dhost_validate=enabled \
+	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
+	-Dlibssh=disabled \
+	-Dlibvirtd=disabled \
+	-Dlogin_shell=disabled \
+	-Dnetcf=disabled \
+	-Dnss=disabled \
+	-Dnumad=disabled \
+	-Dopenwsman=disabled \
+	-Dpciaccess=enabled \
+	-Dpm_utils=disabled \
+	-Dsanlock=disabled \
+	-Dsasl=disabled \
+	-Dsecdriver_apparmor=disabled \
+	-Dssh2=disabled \
+	-Dstorage_mpath=disabled \
+	-Dstorage_iscsi=disabled \
+	-Dstorage_iscsi_direct=disabled \
+	-Dsysctl_config=enabled \
+	-Dtest_coverage=false \
+	-Dudev=enabled \
+	-Dwireshark_dissector=disabled
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+LIBVIRT_CONF_OPTS += -Dattr=enabled
+LIBVIRT_DEPENDENCIES += attr
+else
+LIBVIRT_CONF_OPTS += -Dattr=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LIBVIRT_CONF_OPTS += -Daudit=enabled
+LIBVIRT_DEPENDENCIES += audit
+else
+LIBVIRT_CONF_OPTS += -Daudit=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBVIRT_CONF_OPTS += -Dbash_completion=enabled
+LIBVIRT_DEPENDENCIES += bash-completion
+else
+LIBVIRT_CONF_OPTS += -Dbash_completion=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+LIBVIRT_CONF_OPTS += -Dblkid=enabled
+LIBVIRT_DEPENDENCIES += util-linux
+else
+LIBVIRT_CONF_OPTS += -Dblkid=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+LIBVIRT_CONF_OPTS += -Dcapng=enabled
+LIBVIRT_DEPENDENCIES += libcap-ng
+else
+LIBVIRT_CONF_OPTS += -Dcapng=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBVIRT_CONF_OPTS += -Dcurl=enabled
+LIBVIRT_DEPENDENCIES += libcurl
+else
+LIBVIRT_CONF_OPTS += -Dcurl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+LIBVIRT_CONF_OPTS += -Dfuse=enabled
+LIBVIRT_DEPENDENCIES += libfuse
+else
+LIBVIRT_CONF_OPTS += -Dfuse=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBISCSI),y)
+LIBVIRT_CONF_OPTS += -Dlibiscsi=enabled
+LIBVIRT_DEPENDENCIES += libiscsi
+else
+LIBVIRT_CONF_OPTS += -Dlibiscsi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+LIBVIRT_CONF_OPTS += -Dlibpcap=enabled
+LIBVIRT_DEPENDENCIES += libpcap
+else
+LIBVIRT_CONF_OPTS += -Dlibpcap=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+LIBVIRT_CONF_OPTS += -Dnumactl=enabled
+LIBVIRT_DEPENDENCIES += numactl
+else
+LIBVIRT_CONF_OPTS += -Dnumactl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+LIBVIRT_CONF_OPTS += -Dpolkit=enabled
+LIBVIRT_DEPENDENCIES += polkit
+else
+LIBVIRT_CONF_OPTS += -Dpolkit=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LIBVIRT_CONF_OPTS += -Dreadline=enabled
+LIBVIRT_DEPENDENCIES += readline
+else
+LIBVIRT_CONF_OPTS += -Dreadline=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBVIRT_CONF_OPTS += -Dselinux=enabled -Dsecdriver_selinux=enabled \
+	-Dselinux_mount=/sys/fs/selinux
+LIBVIRT_DEPENDENCIES += libselinux
+else
+LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LVM2),y)
+LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
+LIBVIRT_DEPENDENCIES += lvm2
+else
+LIBVIRT_CONF_OPTS += -Dstorage_lvm=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_YAJL),y)
+LIBVIRT_CONF_OPTS += -Dyajl=enabled
+LIBVIRT_DEPENDENCIES += yajl
+else
+LIBVIRT_CONF_OPTS += -Dyajl=disabled
+endif
+
+define LIBVIRT_INSTALL_UDEV_RULES
+	$(INSTALL) -D -m 644 package/libvirt/90-kvm.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
+endef
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
+
+# Adjust diretory ownerships and permissions. Notice /var/log is a symlink to
+# /tmp in the default sysvinit skeleton, so some directories may disappear at
+# run-time. Set the permissions anyway, since they are valid for the default
+# systemd skeleton.
+define LIBVIRT_PERMISSIONS
+	/etc/libvirt                             d  700  root  root  -  -  -  -  -
+	/etc/libvirt/nwfilter                    d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt                         d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/boot                    d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/dnsmasq                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
+	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
+	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
+	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
+endef
+
+# libvirt may need to create persistent files (e.g. VM definitions) in these
+# directories. Move them to /var/lib because /etc may be on a read-only or
+# volatile (initramfs) filesystem. We could tweak the code to change these
+# paths but the patch would be large and would break compatibility with
+# ordinary installations and with the documentation.
+define LIBVIRT_CREATE_SYMLINKS
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
+	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
+	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
+endef
+
+LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
+
+$(eval $(meson-package))
-- 
2.17.1
