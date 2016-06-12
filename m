From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 23:19:35 +0200
Subject: [Buildroot] [git commit] fwup: new package
Message-ID: <20160612212023.D5C937FDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fe8f3974fa9be5e7b230f879ca102ac648fdb39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wojciech Nizinski <niziak@spox.org>
[Thomas:
 - Add missing dependency on wchar
 - Rewrap Config.in help text
 - Add missing "depends on BR2_USE_MMU" on the comment about wchar
   dependency.
 - Switch to upstream 0.7.0 version
 - Replace the hook calling autogen.sh by a hook simply creating the m4
   directory, which is what prevented <pkg>_AUTORECONF from working.
 - Add patch to fix build with uClibc.
 - Split in separate patches the addition of the host variants of
   libarchive and libsodium.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/Config.in.host                             |  1 +
 .../0001-Add-missing-sys-types.h-includes.patch    | 64 ++++++++++++++++++++++
 package/fwup/Config.in                             | 18 ++++++
 package/fwup/Config.in.host                        |  7 +++
 package/fwup/fwup.mk                               | 22 ++++++++
 6 files changed, 113 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2f42038..ff08f27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,6 +177,7 @@ menu "Filesystem and flash utilities"
 	source "package/exfat-utils/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
+	source "package/fwup/Config.in"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 13acb22..04b7f19 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ menu "Host utilities"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/faketime/Config.in.host"
+	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
diff --git a/package/fwup/0001-Add-missing-sys-types.h-includes.patch b/package/fwup/0001-Add-missing-sys-types.h-includes.patch
new file mode 100644
index 0000000..aa22348
--- /dev/null
+++ b/package/fwup/0001-Add-missing-sys-types.h-includes.patch
@@ -0,0 +1,64 @@
+From 782ffa564236b79d49a88e63da65ac01b6f2cfc1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 12 Jun 2016 22:57:02 +0200
+Subject: [PATCH] Add missing <sys/types.h> includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+<sys/types.h> is needed for the definition of off_t, otherwise building
+with uClibc fails with:
+
+In file included from cfgfile.c:17:0:
+cfgfile.h:25:87: error: unknown type name ???off_t???
+ int archive_read_all_data(struct archive *a, struct archive_entry *ae, char **buffer, off_t max_size, off_t *size_read);
+                                                                                       ^
+cfgfile.h:25:103: error: unknown type name ???off_t???
+ int archive_read_all_data(struct archive *a, struct archive_entry *ae, char **buffer, off_t max_size, off_t *size_read);
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/cfgfile.h | 1 +
+ src/mmc.h     | 1 +
+ src/util.h    | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/cfgfile.h b/src/cfgfile.h
+index 1a6ffbb..8982b1d 100644
+--- a/src/cfgfile.h
++++ b/src/cfgfile.h
+@@ -17,6 +17,7 @@
+ #ifndef CFGFILE_H
+ #define CFGFILE_H
+ 
++#include <sys/types.h>
+ #include <confuse.h>
+ 
+ struct archive;
+diff --git a/src/mmc.h b/src/mmc.h
+index 56f85eb..626570a 100644
+--- a/src/mmc.h
++++ b/src/mmc.h
+@@ -20,6 +20,7 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ #define MMC_DEVICE_PATH_LEN 32
+ 
+diff --git a/src/util.h b/src/util.h
+index 83f82ec..23359c1 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -20,6 +20,7 @@
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ struct tm;
+ 
+-- 
+2.7.4
+
diff --git a/package/fwup/Config.in b/package/fwup/Config.in
new file mode 100644
index 0000000..fd40cf3
--- /dev/null
+++ b/package/fwup/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_FWUP
+	bool "fwup"
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBARCHIVE
+	# required by libarchive to include zip compression
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  Fwup is a scriptable embedded Linux firmware update creator
+	  and runner.
+
+	  https://github.com/fhunleth/fwup
+
+comment "fwup needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/fwup/Config.in.host b/package/fwup/Config.in.host
new file mode 100644
index 0000000..4e21c7d
--- /dev/null
+++ b/package/fwup/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_FWUP
+	bool "host fwup"
+	help
+	  Fwup is a scriptable embedded Linux firmware update creator
+	  and runner.
+
+	  https://github.com/fhunleth/fwup
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
new file mode 100644
index 0000000..0f857fc
--- /dev/null
+++ b/package/fwup/fwup.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# fwup
+#
+#############################################################
+
+FWUP_VERSION = v0.7.0
+FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
+FWUP_LICENSE = Apache-2.0
+FWUP_LICENSE_FILES = LICENSE
+FWUP_DEPENDENCIES = libconfuse libarchive libsodium
+FWUP_AUTORECONF = YES
+
+define FWUP_ADD_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+
+FWUP_POST_PATCH_HOOKS += FWUP_ADD_M4_DIR
+HOST_FWUP_POST_PATCH_HOOKS += FWUP_ADD_M4_DIR
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
