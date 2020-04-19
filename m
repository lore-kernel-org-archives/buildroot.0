From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:30:20 +0200
Subject: [Buildroot] [git commit] package/exfatprogs: new package
Message-ID: <20200419131603.CCE6B8D48A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5bc21559b524d70c1ff3b74cabd4262a3fdef1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

exFAT filesystem userspace utilities

We need a patch to fix:
error: unknown type name ???ssize_t???

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/Config.in.host                             |  1 +
 ...xfatprogs-add-missing-include-sys-types.h.patch | 49 ++++++++++++++++++++++
 package/exfatprogs/Config.in                       | 13 ++++++
 package/exfatprogs/Config.in.host                  | 13 ++++++
 package/exfatprogs/exfatprogs.hash                 |  3 ++
 package/exfatprogs/exfatprogs.mk                   | 16 +++++++
 8 files changed, 97 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 68b3f6a5c4..4f8a9255ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1173,6 +1173,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
+F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
diff --git a/package/Config.in b/package/Config.in
index 46d3c75ee2..5e72b750ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,6 +199,7 @@ menu "Filesystem and flash utilities"
 	source "package/erofs-utils/Config.in"
 	source "package/exfat/Config.in"
 	source "package/exfat-utils/Config.in"
+	source "package/exfatprogs/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
 	source "package/fscryptctl/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index eb8f63f689..f1246c708f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -20,6 +20,7 @@ menu "Host utilities"
 	source "package/e2tools/Config.in.host"
 	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
+	source "package/exfatprogs/Config.in.host"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fatcat/Config.in.host"
diff --git a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
new file mode 100644
index 0000000000..6019e5952b
--- /dev/null
+++ b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
@@ -0,0 +1,49 @@
+From da03ba80944668817c374a816b8b0c515af0ac89 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 17 Apr 2020 13:10:49 -0600
+Subject: [PATCH] exfatprogs: add missing #include <sys/types.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+../include/libexfat.h:72:1: error: unknown type name ???ssize_t???
+ ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
+ ^
+../include/libexfat.h:72:52: error: unknown type name ???off_t???
+ ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
+                                                    ^
+../include/libexfat.h:73:1: error: unknown type name ???ssize_t???
+ ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
+ ^
+../include/libexfat.h:73:53: error: unknown type name ???off_t???
+ ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
+                                                     ^
+../include/libexfat.h:75:1: error: unknown type name ???ssize_t???
+ ssize_t exfat_utf16_enc(const char *in_str, __u16 *out_str, size_t out_size);
+ ^
+../include/libexfat.h:76:1: error: unknown type name ???ssize_t???
+ ssize_t exfat_utf16_dec(const __u16 *in_str, size_t in_len,
+ ^
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status: https://github.com/exfatprogs/exfatprogs/pull/50]
+---
+ include/exfat_tools.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/exfat_tools.h b/include/exfat_tools.h
+index 45de4aa..105fd2a 100644
+--- a/include/exfat_tools.h
++++ b/include/exfat_tools.h
+@@ -6,6 +6,7 @@
+ #ifndef _EXFAT_TOOLS_H
+ 
+ #include <stdbool.h>
++#include <sys/types.h>
+ #include <wchar.h>
+ 
+ #define KB			(1024)
+-- 
+2.20.1
+
diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
new file mode 100644
index 0000000000..99defb5b69
--- /dev/null
+++ b/package/exfatprogs/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_EXFATPROGS
+	bool "exfatprogs"
+	help
+	  exFAT filesystem userspace utilities.
+
+	  This is the set of tools that works together with the exfat
+	  driver in the official Linux kernel (merged in Linux 5.7).
+
+	  If you're using the FUSE-based exfat support (from
+	  package/exfat), you must use the corresponding user-space
+	  programs in package/exfat-utils.
+
+	  https://github.com/exfatprogs/exfatprogs
diff --git a/package/exfatprogs/Config.in.host b/package/exfatprogs/Config.in.host
new file mode 100644
index 0000000000..d4a0b0c249
--- /dev/null
+++ b/package/exfatprogs/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_EXFATPROGS
+	bool "host exfatprogs"
+	help
+	  exFAT filesystem userspace utilities
+
+	  This is the set of tools that works together with the exfat
+	  driver in the official Linux kernel (merged in Linux 5.7).
+
+	  If you're using the FUSE-based exfat support (from
+	  package/exfat), you must use the corresponding user-space
+	  programs in package/exfat-utils.
+
+	  https://github.com/exfatprogs/exfatprogs
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
new file mode 100644
index 0000000000..424cc2b1fa
--- /dev/null
+++ b/package/exfatprogs/exfatprogs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9cd3b71b0d90695969b83a68d5412898c120a60893e01434ef5e2be9f14fe570  exfatprogs-1.0.1.tar.gz
+sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
new file mode 100644
index 0000000000..a69f119582
--- /dev/null
+++ b/package/exfatprogs/exfatprogs.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# exfatprogs
+#
+################################################################################
+
+EXFATPROGS_VERSION = 1.0.1
+EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
+EXFATPROGS_LICENSE = GPL-2.0+
+EXFATPROGS_LICENSE_FILES = COPYING
+EXFATPROGS_AUTORECONF = YES
+EXFATPROGS_DEPENDENCIES = host-pkgconf
+HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
