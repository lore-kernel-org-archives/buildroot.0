From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 20 Jun 2016 16:04:08 -0400
Subject: [Buildroot] [PATCH 1/1] fwup: bump to version 0.8.0
Message-ID: <1466453048-3894-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version removes the need for the patch and the autoreconf
workaround. It also fixes autobuilder errors for static build
configurations:

http://autobuild.buildroot.net/results/30ad12bf0fe451aefb21cf59a76b059758746c2e/
http://autobuild.buildroot.net/results/a1503e0a053bfd724f9085908d2df51db798d068/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 .../0001-Add-missing-sys-types.h-includes.patch    | 64 ----------------------
 package/fwup/fwup.hash                             |  2 +-
 package/fwup/fwup.mk                               |  9 +--
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/fwup/0001-Add-missing-sys-types.h-includes.patch

diff --git a/package/fwup/0001-Add-missing-sys-types.h-includes.patch b/package/fwup/0001-Add-missing-sys-types.h-includes.patch
deleted file mode 100644
index aa22348..0000000
--- a/package/fwup/0001-Add-missing-sys-types.h-includes.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 782ffa564236b79d49a88e63da65ac01b6f2cfc1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 12 Jun 2016 22:57:02 +0200
-Subject: [PATCH] Add missing <sys/types.h> includes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-<sys/types.h> is needed for the definition of off_t, otherwise building
-with uClibc fails with:
-
-In file included from cfgfile.c:17:0:
-cfgfile.h:25:87: error: unknown type name ?off_t?
- int archive_read_all_data(struct archive *a, struct archive_entry *ae, char **buffer, off_t max_size, off_t *size_read);
-                                                                                       ^
-cfgfile.h:25:103: error: unknown type name ?off_t?
- int archive_read_all_data(struct archive *a, struct archive_entry *ae, char **buffer, off_t max_size, off_t *size_read);
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/cfgfile.h | 1 +
- src/mmc.h     | 1 +
- src/util.h    | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/cfgfile.h b/src/cfgfile.h
-index 1a6ffbb..8982b1d 100644
---- a/src/cfgfile.h
-+++ b/src/cfgfile.h
-@@ -17,6 +17,7 @@
- #ifndef CFGFILE_H
- #define CFGFILE_H
- 
-+#include <sys/types.h>
- #include <confuse.h>
- 
- struct archive;
-diff --git a/src/mmc.h b/src/mmc.h
-index 56f85eb..626570a 100644
---- a/src/mmc.h
-+++ b/src/mmc.h
-@@ -20,6 +20,7 @@
- #include <stddef.h>
- #include <stdio.h>
- #include <stdint.h>
-+#include <sys/types.h>
- 
- #define MMC_DEVICE_PATH_LEN 32
- 
-diff --git a/src/util.h b/src/util.h
-index 83f82ec..23359c1 100644
---- a/src/util.h
-+++ b/src/util.h
-@@ -20,6 +20,7 @@
- #include <stdbool.h>
- #include <stdio.h>
- #include <stdint.h>
-+#include <sys/types.h>
- 
- struct tm;
- 
--- 
-2.7.4
-
diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 298c5db..6d9a1ea 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	  b318875d42cf2a643da99f03ac91662ec91625d9a84a3a9bb53ac419d1cb0dc3	fwup-v0.7.0.tar.gz
+sha256	  56d30f4ddf7929d693c022455978aebef1f6adb5896437a199bde43d5459da68	fwup-v0.8.0.tar.gz
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 0f857fc..7b007e1 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,19 +4,12 @@
 #
 #############################################################
 
-FWUP_VERSION = v0.7.0
+FWUP_VERSION = v0.8.0
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
 FWUP_AUTORECONF = YES
 
-define FWUP_ADD_M4_DIR
-	mkdir -p $(@D)/m4
-endef
-
-FWUP_POST_PATCH_HOOKS += FWUP_ADD_M4_DIR
-HOST_FWUP_POST_PATCH_HOOKS += FWUP_ADD_M4_DIR
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.5.0
