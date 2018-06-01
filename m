From: Stefan Becker <chemobejk@gmail.com>
Date: Fri,  1 Jun 2018 16:30:52 +0300
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <20180601133053.27552-1-chemobejk@gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
Message-ID: <20180601133053.27552-3-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-mkpasswd was a fork from whois to provide a host version of
mkpasswd for the build. This has caused a maintenance headache.

Replace it with host-busybox which can provide "mkpasswd" functionality
from own source code. That causes less hassle for different build
platforms.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 fs/common.mk                                         | 2 +-
 package/Config.in.host                               | 2 +-
 package/skeleton-init-common/skeleton-init-common.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 9baf367729..42d5dff569 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -63,7 +63,7 @@ ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
 
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
-	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-busybox)
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
 $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
diff --git a/package/Config.in.host b/package/Config.in.host
index 38543e7390..c524333671 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/busybox/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
@@ -31,7 +32,6 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
-	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e8a0522052..99c87e3861 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -63,7 +63,7 @@ ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_INIT_COMMON_ROOT_PASSWD)),)
 SKELETON_INIT_COMMON_ROOT_PASSWORD = '$(SKELETON_INIT_COMMON_ROOT_PASSWD)'
 else ifneq ($(SKELETON_INIT_COMMON_ROOT_PASSWD),)
 # This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
+# be sure that host-busybox will have already been built by that time.
 SKELETON_INIT_COMMON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_INIT_COMMON_PASSWD_METHOD)" "$(SKELETON_INIT_COMMON_ROOT_PASSWD)"`"
 endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-- 
2.17.0
