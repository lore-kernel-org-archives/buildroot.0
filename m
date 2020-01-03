From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 12:25:15 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/samba4: Do not force target python
Message-ID: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samba does not need python on the target for file server functionality.
It does need it for the Active Directory Domain Controller feature,
which is already configured in buildroot as optional and already depends
on python3 since commit 4485a75859fbae99090b065ddd7c088a65571d37.

An unnecessary target python greatly increases the size of the target
filesystem. A somewhat minimal configuration with a samba server shunk
from an 82 MB rootfs to 53 MB with this patch.

Signed-off-by: Trent Piepho <trent.piepho@synapse.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Rework patch due so it can be applied after commits 
   fe033bdf534a7892ced72c11635d863afa92d1d2 and 
   4485a75859fbae99090b065ddd7c088a65571d37

 package/samba4/Config.in |  1 -
 package/samba4/samba4.mk | 12 +++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 493c79f3f8..a34eaa8088 100644
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
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c5d2d6c6ea..31a598333c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -26,14 +26,11 @@ SAMBA4_CONF_ENV = \
 	WAF_NO_PREFORK=1
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SAMBA4_PYTHON = \
-	PYTHON="$(HOST_DIR)/bin/python3" \
-	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
-SAMBA4_DEPENDENCIES += host-python3 python3
+SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
+SAMBA4_DEPENDENCIES += host-python3
 else
 SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
 SAMBA4_DEPENDENCIES += host-python
-SAMBA4_CONF_OPTS += --disable-python
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
@@ -143,9 +140,10 @@ define SAMBA4_INSTALL_TARGET_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
-SAMBA4_DEPENDENCIES += jansson
+SAMBA4_CONF_ENV += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+SAMBA4_DEPENDENCIES += jansson python3
 else
-SAMBA4_CONF_OPTS += --without-ad-dc --without-json
+SAMBA4_CONF_OPTS += --disable-python --without-ad-dc --without-json
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
-- 
2.24.0
