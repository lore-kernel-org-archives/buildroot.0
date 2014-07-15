From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:27:16 +0200
Subject: [Buildroot] [git commit] dbus: enable systemd support
Message-ID: <20140715212756.5BC2C9D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95c914fae8ff20dac278aea9ae0d74595bf03b88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable systemd support if systemd is selected as init system (require
systemd compatibility libraries).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/Config.in |    1 +
 package/dbus/dbus.mk   |    9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 653f748..7d49ce5 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DBUS
 	# uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
 	help
 	  The D-Bus message bus system.
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 429c923..63cec6e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -50,8 +50,13 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-DBUS_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system
+ifeq ($(BR2_INIT_SYSTEMD),y)
+DBUS_CONF_OPT += \
+	--enable-systemd \
+	--with-systemdsystemunitdir=/lib/systemd/system
+DBUS_DEPENDENCIES += systemd
+else
+DBUS_CONF_OPT += --disable-systemd
 endif
 
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
