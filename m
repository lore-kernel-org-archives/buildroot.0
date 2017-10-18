From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:39 -0400
Subject: [Buildroot] [PATCH 12/13] mosquitto: fix building against libressl
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-13-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mosquitto has tls_psk enabled by default, which libressl does not support.
This is fixed with passing WITH_TLS_PSK=no to the make opts if libressl
is selected, and WITH_TLS_PSK=yes if libopenssl is selected.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/mosquitto/mosquitto.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c763f48ab1..ef34cee3f0 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -33,6 +33,11 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSQUITTO_DEPENDENCIES += openssl
 MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+MOSQUITTO_MAKE_OPTS += WITH_TLS_PSK=yes
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+MOSQUITTO_MAKE_OPTS += WITH_TLS_PSK=no
+endif
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
-- 
2.13.6
