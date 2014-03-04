From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Mar 2014 10:35:11 -0300
Subject: [Buildroot] [PATCH 1/3] hostapd: fix static linking
Message-ID: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A rebase of Samuel Martin's http://patchwork.ozlabs.org/patch/312320/
hostapd doesn't use pkg-config and upstream likely wouldn't take a patch
to do so (hostapd/wpa_supplicant are used in android builds, and it
doesn't use any auto* stuff either) so pass it in LIBS since we
always build openssl with libz support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 37de60d..5b7dd77 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -43,6 +43,7 @@ endif
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
+	HOSTAPD_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
 	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
-- 
1.8.3.2
