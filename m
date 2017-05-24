From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 May 2017 22:15:39 +0300
Subject: [Buildroot] [PATCH next] cifs-utils: bump to version 6.7
Message-ID: <125a9bff847fe48f49fc67114169f25117f3ff25.1495653339.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable autoreconf because of missing install-sh.

Add upstream patch fixing build breakage with libtalloc is missing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...001-mount.cifs-Remove-data_blob.h-include.patch | 32 ++++++++++++++++++++++
 package/cifs-utils/cifs-utils.hash                 |  2 +-
 package/cifs-utils/cifs-utils.mk                   |  5 +++-
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch

diff --git a/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch b/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch
new file mode 100644
index 000000000000..6536076577be
--- /dev/null
+++ b/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch
@@ -0,0 +1,32 @@
+From 272d523a57a4e8791d625a479128613be5e401f5 Mon Sep 17 00:00:00 2001
+From: Thomas Witt <pyromaniac@exherbo.org>
+Date: Wed, 15 Mar 2017 20:20:44 +0000
+Subject: [PATCH] mount.cifs: Remove data_blob.h include
+
+data_blob.h includes talloc.h from libtalloc, but that is only marked as
+a dependency for cifs.upcall. No symbols from that header are used by
+cifs.mount, so remove it to avoid the libtalloc dependency
+
+Signed-off-by: Thomas Witt <pyromaniac@exherbo.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 272d523a57a4
+
+ mount.cifs.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/mount.cifs.c b/mount.cifs.c
+index 13b71ef50303..2612feb4d591 100644
+--- a/mount.cifs.c
++++ b/mount.cifs.c
+@@ -61,7 +61,6 @@
+ #include "mount.h"
+ #include "util.h"
+ #include "resolve_host.h"
+-#include "data_blob.h"
+ 
+ #ifndef MS_MOVE 
+ #define MS_MOVE 8192 
+-- 
+2.11.0
+
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index 61ffbd9efbfc..ebc9c43e72ca 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d07152a807de6840566bbcc69a97ff6fa17fca4e09ceb4641d74882a83e67125	cifs-utils-6.6.tar.bz2
+sha256	b2f21612474ab012e75accd167aab607a0614ff67efb56ea0f36789fa785cfab	cifs-utils-6.7.tar.bz2
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 152a3eeccf8a..9044fdf83c51 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.6
+CIFS_UTILS_VERSION = 6.7
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
+# Missing install-sh in release tarball
+CIFS_UTILS_AUTORECONF = YES
+CIFS_UTILS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 CIFS_UTILS_CONF_OPTS += --disable-pie
-- 
2.11.0
