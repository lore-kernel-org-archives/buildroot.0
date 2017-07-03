From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:00:51 +0200
Subject: [Buildroot] [PATCH v14 4/4] qemu x86 selinux: base br defconfig
In-Reply-To: <20170703210051.3457-1-arnout@mind.be>
References: <20170703210051.3457-1-arnout@mind.be>
Message-ID: <20170703210051.3457-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

This will build a base SELinux system that boots with SELinux
in permissive mode. Also adding documentation on how to use it.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
[Arnout:
 - Create a 64-bit defconfig instead of a 32-bit one.
 - Move the kernel fragment to board/common_selinux.
 - Align with qemu_x86_64_defconfig.
 - Regenerate .gitlab-ci.yml.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v14:
 - Create a 64-bit defconfig instead of a 32-bit one.
 - Move the kernel fragment to board/common_selinux.
 - Align with qemu_x86_defconfig.
 - Regenerate .gitlab-ci.yml.
 - Add the defconfig only after the selinux-specific bits have been
   added.

I would really like some explanation why the following config options
are needed:
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_ROOTFS_EXT2_RESBLKS=5
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_RSYSLOG=y
BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
BR2_PACKAGE_HOST_CHECKPOLICY=y

I switched to x86_64 because the BR2_i386_pentiumpro variant fails to
build glibc:
In file included from ../sysdeps/x86_64/multiarch/strcspn-c.c:22:0,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
../sysdeps/x86_64/multiarch/varshift.h: In function '__m128i_shift_right':
../sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without SSE enabled changes the ABI [-Werror=psabi]
 {
 ^

(and more). I couldn't be bothered to debug that, switching to x86_64
was simpler.
---
 .gitlab-ci.yml                        |  1 +
 board/qemu/x86_64/readme.txt          | 17 +++++++++++++
 configs/qemu_x86_64_selinux_defconfig | 47 +++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 configs/qemu_x86_64_selinux_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ae7e5db64..4a48c560f2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -174,6 +174,7 @@ qemu_sh4eb_r2d_defconfig: *defconfig
 qemu_sparc64_sun4u_defconfig: *defconfig
 qemu_sparc_ss10_defconfig: *defconfig
 qemu_x86_64_defconfig: *defconfig
+qemu_x86_64_selinux_defconfig: *defconfig
 qemu_x86_defconfig: *defconfig
 qemu_xtensa_lx60_defconfig: *defconfig
 qemu_xtensa_lx60_nommu_defconfig: *defconfig
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index ecd7813a1e..742cf13ba5 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -7,3 +7,20 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.9.0
+
+-------------------------------------------------------------------
+
+Run the SELinux target (based on qemu_x86_64_selinux_defconfig) emulation with:
+
+    qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda rw console=ttyS0 selinux=1" -net nic,model=rtl8139 -net user -display none -serial stdio
+
+The emulation should reboot once the first time for relabeling and
+then provide a login prompt. The login is username root and password
+root because PAM requires a password in this secure configuration. To
+enable SELinux enforcing at boot, login and edit the
+/etc/selinux/config and set SELINUX to enforcing. Save and make sure
+to "sync" before restarting the emulation as the ext2 fs would
+otherwise corrupt when the emulation exits. After enforcing is
+default, the selinux= provided as part of the qemu "append" above can
+be used to turn enforcing on/off. This configuration would be tailored
+as part of a targets refpolicy customization.
diff --git a/configs/qemu_x86_64_selinux_defconfig b/configs/qemu_x86_64_selinux_defconfig
new file mode 100644
index 0000000000..28d8d45942
--- /dev/null
+++ b/configs/qemu_x86_64_selinux_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_x86_64=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+# Select SYSV init to provide selinux enabled init
+BR2_INIT_SYSV=y
+BR2_TARGET_GENERIC_ROOT_PASSWD="root"
+# Pull in SELinux specific file overlay to allow login
+# in enforcing mode.
+BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt board/common_selinux/permissions.txt"
+BR2_ROOTFS_OVERLAY="board/common_selinux/fs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/common_selinux/post_build.sh"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=5
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Internal toolchain glibc, for policycoreutils
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/common_selinux/linux-selinux-fragment.config"
+
+# Customized busybox config providing a tailored
+# balance of applets vs full apps
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/common_selinux/busybox-selinux-fragment.config"
+
+# Ensure busybox is built as individual binaries for the
+# SELinux refpolicy to work correctly
+BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_REFPOLICY=y
+BR2_PACKAGE_RSYSLOG=y
+BR2_PACKAGE_UTIL_LINUX=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
+BR2_PACKAGE_HOST_CHECKPOLICY=y
-- 
2.13.2
