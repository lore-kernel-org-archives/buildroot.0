From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 15:10:33 +0100
Subject: [Buildroot] [git commit branch/next] connman: add support for ofono
	and neard
Message-ID: <20131128141416.08C869BD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f432b545badec4a45077aef3108c8b2c7d774516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in  |    8 ++++++++
 package/connman/connman.mk |    8 +++++++-
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 5345c80..1cf93e2 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -38,9 +38,17 @@ config BR2_PACKAGE_CONNMAN_BLUETOOTH
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
 
+config BR2_PACKAGE_CONNMAN_NEARD
+	bool "enable neard support"
+	select BR2_PACKAGE_NEARD
+
 config BR2_PACKAGE_CONNMAN_NTPD
 	bool "enable ntpd support"
 
+config BR2_PACKAGE_CONNMAN_OFONO
+	bool "enable ofono support"
+	select BR2_PACKAGE_OFONO
+
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index db74c03..cf54abc 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -18,7 +18,13 @@ CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
-	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
+	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd) \
+	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono)
+
+CONNMAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono)
 
 define CONNMAN_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
