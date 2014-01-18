From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:47 +0100
Subject: [Buildroot] [PATCH 10/10] hostapd: fix static build failure
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building statically hostapd with openssl support, it is necessary
to add -lz to LIBS to avoid undefined symbols when linking against
libcrypto.a.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0fbd8bc..a978094 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -32,6 +32,7 @@ endef
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
+	HOSTAPD_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
 define HOSTAPD_TLS_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(HOSTAPD_CONFIG)
-- 
1.8.5.3
