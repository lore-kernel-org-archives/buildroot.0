From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:37:47 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/wireshark: add
 lua optional dependency
Message-ID: <20190123151352.946FC849D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e055a17a3d8b115f10938c70e1f59fbef243a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- lua 5.3 or luajit is not supported
- Don't specify the path to find lua as pkgconfig is used for lua
  (this is not the case for the other options)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb59a8857ed12813d5d6ab26ef118dc4262f869b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 4569a86cb1..421338f0f8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -22,7 +22,6 @@ WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
 	--enable-static=no \
 	--with-libsmi=no \
-	--with-lua=no \
 	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include
 
@@ -99,6 +98,14 @@ else
 WIRESHARK_CONF_OPTS += --without-libssh
 endif
 
+# no support for lua53 yet
+ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2),y)
+WIRESHARK_CONF_OPTS += --with-lua
+WIRESHARK_DEPENDENCIES += lua
+else
+WIRESHARK_CONF_OPTS += --without-lua
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += --with-sbc=yes
 WIRESHARK_DEPENDENCIES += sbc
