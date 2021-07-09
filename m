From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  9 Jul 2021 11:07:27 +0200
Subject: [Buildroot] [PATCH 2/3] package/systemd: Update description and
 kernel options
In-Reply-To: <20210709090729.280632-1-nolange79@gmail.com>
References: <20210709090729.280632-1-nolange79@gmail.com>
Message-ID: <20210709090729.280632-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

realign the configuration to the README.

enable CONFIG_AUTOFS_FS (kernel >= 4.18) aswell the someday
to be removed CONFIG_AUTOFS4_FS option.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 20 +++++++++++++++-----
 package/systemd/systemd.mk | 16 ++++++++++++----
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d658308213..94c5c47c7e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -51,13 +51,23 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.0 with the following
+	  Systemd requires a Linux kernel >= 3.13 with the following
 	  options enabled:
 
-	  - CONFIG_CGROUPS
+	  - CONFIG_DEVTMPFS
+	  - CONFIG_CGROUPS (it is OK to disable all controllers)
 	  - CONFIG_INOTIFY_USER
-	  - CONFIG_FHANDLE
-	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_SIGNALFD
+	  - CONFIG_TIMERFD
+	  - CONFIG_EPOLL
+	  - CONFIG_UNIX (it requires CONFIG_NET, but every other flag in it is not necessary)
+	  - CONFIG_SYSFS
+	  - CONFIG_PROC_FS
+	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
+
+	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some systemd units)
+
+	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
 	  - CONFIG_TMPFS_POSIX_ACL
 	  - CONFIG_TMPFS_XATTR
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1a25a0b8c1..0fb1c8b068 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -630,14 +630,22 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
-- 
2.30.2
