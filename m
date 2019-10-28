From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Oct 2019 14:24:12 -0700
Subject: [Buildroot] [PATCH 3/5] package/openvpn: enable pam plugin support
In-Reply-To: <20191028212414.123964-1-aduskett@gmail.com>
References: <20191028212414.123964-1-aduskett@gmail.com>
Message-ID: <20191028212414.123964-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a configuration option to enable the auth-pam plugin. Explicitly set the
--enable-plugin-auth-pam and depend on linux-pam if the pam-plugin option is
selected.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openvpn/openvpn.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 277b072deb..202f9a94af 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -11,7 +11,6 @@ OPENVPN_DEPENDENCIES = host-pkgconf openssl
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
-	--disable-plugin-auth-pam \
 	--enable-iproute2 \
 	--with-crypto-library=openssl \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
@@ -45,6 +44,13 @@ else
 OPENVPN_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_PAM_PLUGIN),y)
+OPENVPN_DEPENDENCIES += linux-pam
+OPENVPN_CONF_OPTS += 	--enable-plugin-auth-pam
+else
+OPENVPN_CONF_OPTS += 	--disable-plugin-auth-pam
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPENVPN_DEPENDENCIES += systemd
 OPENVPN_CONF_OPTS += --enable-systemd
-- 
2.21.0
