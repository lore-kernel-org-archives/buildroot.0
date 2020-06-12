From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 12 Jun 2020 07:31:09 +0200
Subject: [Buildroot] [PATCH 2/3] wireless-regdb: add option to rebuild
In-Reply-To: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200612053110.15316-3-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/wireless-regdb/0003-python3.patch | 24 +++++++++++++++++++++++
 package/wireless-regdb/Config.in          | 10 ++++++++++
 package/wireless-regdb/wireless-regdb.mk  | 13 ++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 package/wireless-regdb/0003-python3.patch

diff --git a/package/wireless-regdb/0003-python3.patch b/package/wireless-regdb/0003-python3.patch
new file mode 100644
index 0000000000..87226b763f
--- /dev/null
+++ b/package/wireless-regdb/0003-python3.patch
@@ -0,0 +1,24 @@
+--- a/db2bin.py	2020-06-04 12:10:59.825073819 +0200
++++ b/db2bin.py	2020-06-04 12:11:52.355229867 +0200
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ from io import BytesIO, open
+ import struct
+--- a/db2fw.py	2020-06-04 12:10:59.825073819 +0200
++++ b/db2fw.py	2020-06-04 12:11:52.365229898 +0200
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ from io import BytesIO, open
+ import struct
+--- a/dbparse.py	2020-06-04 12:10:59.825073819 +0200
++++ b/dbparse.py	2020-06-04 12:11:52.365229898 +0200
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ from builtins import bytes
+ from functools import total_ordering
diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 17350a41d8..cb8ec20977 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -12,3 +12,13 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	  application is needed.
 
 	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
+
+if BR2_PACKAGE_WIRELESS_REGDB
+
+config BR2_WIRELESS_REGDB_REBUILD
+	bool "rebuild wireless-regdb"
+	help
+	  Say no to use the pre-built wireless regdb.
+
+	  Say yes to rebuild, and make sure to deploy your wireless-regdb public key.
+endif
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 31b62e36e1..d3b30c7fce 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -10,12 +10,21 @@ WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
+WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
+define WIRELESS_REGDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_CRDA),y)
 define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
-	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
-		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -d $(TARGET_DIR)/etc/wireless-regdb/pubkeys
+	$(INSTALL) -m 644 $(wildcard $(@D)/*.key.pub.pem) \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/
 endef
 endif
 
-- 
2.25.0
