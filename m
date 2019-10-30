From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 29 Oct 2019 17:56:02 -0700
Subject: [Buildroot] [PATCH v2] package/openvpn: enable pam plugin support
Message-ID: <20191030005604.81615-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If the linux-pam package is selected, add the package to the
dependency list and explicitly set --enable-plugin-auth-pam.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed from an explicit option to an automatic one. (Arnout)
  - Updated commit message to reflect the above.
  - Switched tabs for spaces. (Arnout)

 package/openvpn/openvpn.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 277b072deb..8ee9c1a4b4 100644
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
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENVPN_DEPENDENCIES += linux-pam
+OPENVPN_CONF_OPTS += --enable-plugin-auth-pam
+else
+OPENVPN_CONF_OPTS += --disable-plugin-auth-pam
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPENVPN_DEPENDENCIES += systemd
 OPENVPN_CONF_OPTS += --enable-systemd
-- 
2.23.0
