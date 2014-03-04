From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Mar 2014 10:35:12 -0300
Subject: [Buildroot] [PATCH 2/3] wpa_supplicant: fix static linking
In-Reply-To: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393940113-3419-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa_supplicant doesn't use pkg-config and upstream likely wouldn't take
a patch to do so (hostapd/wpa_supplicant are used in android builds, and
it doesn't use any auto* stuff either) so pass it in LIBS* since we
always build openssl with libz support.

Made ugly by the fact that wpa_supplicant uses LIBS for the
wpa_supplicant binary, LIBS_c for the wpa_cli binary and LIBS_p for the
wpa_passphrase binary.

Also do f62a1d887aee642593b3f9507d6f3ebcd82219d0 here too since it
applies when libnl is used.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 17788cc..3802033 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -29,7 +29,13 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 WPA_SUPPLICANT_CONFIG_DISABLE = \
 	CONFIG_SMARTCARD
 
+# libnl-3 needs -lm (for rint) and -lpthread if linking statically
+# And library order matters hence stick -lnl-3 first since it's appended
+# in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
 ifeq ($(BR2_PACKAGE_LIBNL),y)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
+endif
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
 else
@@ -57,6 +63,7 @@ endif
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
+	WPA_SUPPLICANT_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-lcrypto -lz)
 	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
@@ -108,9 +115,12 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	       $(WPA_SUPPLICANT_CONFIG)
 endef
 
+# LIBS for wpa_supplicant, LIBS_c for wpa_cli, LIBS_p for wpa_passphrase
 define WPA_SUPPLICANT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" BINDIR=/usr/sbin \
+		LIBS="$(WPA_SUPPLICANT_LIBS)" LIBS_c="$(WPA_SUPPLICANT_LIBS)" \
+		LIBS_p="$(WPA_SUPPLICANT_LIBS)" \
 		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(WPA_SUPPLICANT_SUBDIR)
 endef
 
-- 
1.8.3.2
