From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jan 2019 15:18:23 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: bump to version 3.19.1
Message-ID: <20190111141851.AF4AD8B6E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d5f0ed2a0f722290dc1bc9673c3f442fbbeae70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings lots improvements and bug fixes, especially bug #1720[1], which
causes problems on some of our (DATACOM) products.

1. https://github.com/balabit/syslog-ng/issues/1720

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-modules-json-Adaptions-for-json-c-v0.13.patch | 39 ----------------------
 package/syslog-ng/syslog-ng.conf                   |  2 +-
 package/syslog-ng/syslog-ng.hash                   |  5 ++-
 package/syslog-ng/syslog-ng.mk                     |  8 ++---
 4 files changed, 8 insertions(+), 46 deletions(-)

diff --git a/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch b/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch
deleted file mode 100644
index b307ab5acf..0000000000
--- a/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1b824dd6389e209eab752d5a698c6093f311e3e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
-Date: Mon, 11 Dec 2017 15:46:06 +0100
-Subject: [PATCH] modules/json: Adaptions for json-c v0.13
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 1b824dd6389e
-
- modules/json/json-parser.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/json/json-parser.c b/modules/json/json-parser.c
-index 0368ed8f7ffe..356df48b9fc7 100644
---- a/modules/json/json-parser.c
-+++ b/modules/json/json-parser.c
-@@ -20,6 +20,8 @@
-  * COPYING for details.
-  */
- 
-+#define JSON_C_VER_013 (13 << 8)
-+
- #include "json-parser.h"
- #include "dot-notation.h"
- #include "scratch-buffers.h"
-@@ -28,7 +30,10 @@
- #include <ctype.h>
- 
- #include <json.h>
-+
-+#if (!defined(JSON_C_VERSION_NUM)) || (JSON_C_VERSION_NUM < JSON_C_VER_013)
- #include <json_object_private.h>
-+#endif
- 
- typedef struct _JSONParser
- {
--- 
-2.15.1
-
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index e767255d71..9a56a1302d 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.10
+ at version: 3.19
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index d9c51e9f1c..1f83e39ff0 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,5 @@
 # Locally computed
-sha256 a905fe7bad09dcf40bf03650ef1c287b511bf262d004464b8993a28ce58c9136  syslog-ng-3.10.1.tar.gz
+sha256 5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178  syslog-ng-3.19.1.tar.gz
+sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
+sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 29e284a4bf..4316382153 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,10 +6,10 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.10.1
+SYSLOG_NG_VERSION = 3.19.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
-SYSLOG_NG_LICENSE_FILES = COPYING
+SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
 # rabbit-mq needs -lrt
@@ -42,9 +42,7 @@ SYSLOG_NG_CONF_OPTS += \
 	--enable-python \
 	--with-python=$(PYTHON3_VERSION_MAJOR)
 else
-SYSLOG_NG_CONF_OPTS += \
-	--disable-python \
-	--without-python
+SYSLOG_NG_CONF_OPTS += --disable-python
 endif
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
