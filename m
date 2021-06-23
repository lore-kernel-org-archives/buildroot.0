From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Jun 2021 18:59:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/usbguard: fix libgcrypt build
In-Reply-To: <20210623165924.200759-1-fontaine.fabrice@gmail.com>
References: <20210623165924.200759-1-fontaine.fabrice@gmail.com>
Message-ID: <20210623165924.200759-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with libgcrypt fails since the addition of the package in
commit fbff7d7289cc95db991184f890f4ca1fcf8a101e:

checking for sparc64-buildroot-linux-gnu-libgcrypt-config... no
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.5.0... no
configure: error: The selected crypto backend library is not available.

Fix this build failure by helping usbguard to find libgcrypt-config

Fixes:
 - http://autobuild.buildroot.org/results/4c19e50a2a5308cb31a62f1b4b538a30353022bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 3aff254b3e..ff5a311a7b 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -20,6 +20,8 @@ USBGUARD_DEPENDENCIES += libopenssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+USBGUARD_CONF_ENV += \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
-- 
2.30.2
