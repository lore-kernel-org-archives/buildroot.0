From: Trent Piepho <trent.piepho@synapse.com>
Date: Thu, 14 Nov 2019 17:48:51 +0000
Subject: [Buildroot] [PATCH] package/samba4: Do not force target python
Message-ID: <acf9214ffd0058cb896594d7c846a510a51dab86.camel@synapse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samba does not need python on the target for file server functionality.
It does need it for the Active Directory Domain Controller feature,
which is already configured in buildroot as optional.

An unnecessary target python greatly increases the size of the target
filesystem.  A somewhat minimal configuration with a samba server shunk
from an 82 MB rootfs to 53 MB with this patch.

Target python will no longer be selected by SAMBA4 and is instead
selected by the SAMBA4_AD_DC option.  Samba will be built with/without
python support based whether target python is enabled/disabled.  This is
the same as other optional samba features, which are only enabled when
the package they need is also enabled.

Signed-off-by: Trent Piepho <trent.piepho@synapse.com>
---
 package/samba4/Config.in | 2 +-
 package/samba4/samba4.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index a6997c13eb..841fd2d5ca 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZLIB
 	help
 	  Provides secure, stable and fast file and print services
@@ -32,6 +31,7 @@ if BR2_PACKAGE_SAMBA4
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  Enable Active Directory Domain Controller functionality.
 
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 201328fe4b..24720b741a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -34,7 +34,13 @@ else
 SAMBA4_PYTHON = \
 	PYTHON="$(HOST_DIR)/bin/python2" \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config"
-SAMBA4_DEPENDENCIES += host-python python
+SAMBA4_DEPENDENCIES += host-python
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+SAMBA4_DEPENDENCIES += python
+else
+SAMBA4_CONF_OPTS += --disable-python
+endif
+
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-- 
2.23.0
