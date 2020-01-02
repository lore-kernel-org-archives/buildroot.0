From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:28:25 +0100
Subject: [Buildroot] [git commit] package/openvpn: enable pam plugin support
Message-ID: <20200102081853.9CE478EB6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6acd76584d6841543a57c60a28314b8a86a8dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the linux-pam package is selected, add the package to the
dependency list and explicitly set --enable-plugin-auth-pam.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index ce86b5eff7..64f459eee3 100644
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
