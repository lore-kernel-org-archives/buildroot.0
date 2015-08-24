From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon, 24 Aug 2015 23:44:15 +0800
Subject: [Buildroot] [PATCH 2/3] package/network-manager: Now needs libgudev
	under systemd
In-Reply-To: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
Message-ID: <1440431056-25983-2-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NetworkManager uses code (originally from udev) that has since
	been split from the main systemd codebase into libgudev.

Tweak the package files for NetworkManager to require libgudev
	when building with systemd.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/network-manager/Config.in          | 1 +
 package/network-manager/network-manager.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index bcf8f90..5a0e636 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 25ad2a2..03c7d63 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -63,6 +63,10 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += libgudev
+endif
+
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
-- 
2.5.0
