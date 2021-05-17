From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 09:19:42 +0200
Subject: [Buildroot] [git commit] package/lvm2: drop BR2_PACKAGE_LVM2_LVMETAD
Message-ID: <20210517071542.9881387955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b10ed0d581145cc1c35e1f1eb33581350db63b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lvmetad has been dropped since version 2.03.00 and
https://github.com/lvmteam/lvm2/commit/117160b27e510dceb1ed6acf995115c040acd88d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy       |  6 ++++++
 package/lvm2/Config.in | 17 -----------------
 package/lvm2/lvm2.mk   |  6 ------
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ce6aeed87d..39a44f3026 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_LVM2_LVMETAD
+	bool "lvm2 lvmetad removed"
+	select BR2_LEGACY
+	help
+	  The lvm2 lvmetad was removed upstream.
+
 config BR2_PACKAGE_MONKEY
 	bool "monkey package removed"
 	select BR2_LEGACY
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index a9c5c453fc..de5b972e99 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -47,23 +47,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 comment "lvm2 application library needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
-config BR2_PACKAGE_LVM2_LVMETAD
-	bool "install lvmetad"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2-app-library
-	select BR2_PACKAGE_LVM2_APP_LIBRARY
-	help
-	  Install lvmetad
-
-	  The lvmetad daemon caches LVM metadata so that LVM commands
-	  can read metadata from the cache rather than scanning disks.
-	  This can be an advantage because scanning disks is time
-	  consuming and may interfere with the normal work of the
-	  system.  lvmetad can be a disadvantage when disk event
-	  notifications from the system are unreliable.
-
-comment "lvmetad daemon needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1194044537..84ec75530a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -61,12 +61,6 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2_LVMETAD),y)
-LVM2_CONF_OPTS += --enable-lvmetad
-else
-LVM2_CONF_OPTS += --disable-lvmetad
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
