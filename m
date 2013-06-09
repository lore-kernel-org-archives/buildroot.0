From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Jun 2013 09:46:38 -0300
Subject: [Buildroot] [PATCH] samba: needs threads
Message-ID: <1370781998-17422-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Thomas on IRC. Fixes:
http://autobuild.buildroot.net/results/24f/24fe95a7775af10c6ed7514cbc72a2189e57bc25/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 0ab67ed..a3218b5 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_POPT
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
@@ -11,6 +12,9 @@ config BR2_PACKAGE_SAMBA
 	  NOTE: A complete Samba install takes over 50MB of space,
 		so choose only the components you need.
 
+comment "samba needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 if BR2_PACKAGE_SAMBA
 
 config BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL
@@ -240,14 +244,13 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	bool "support avahi"
 	default y
 	depends on BR2_PACKAGE_AVAHI_DAEMON
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	help
 	  Include support for avahi
 
-comment "support avahi - disabled (requires avahi-daemon and thread support in toolchain)"
-	depends on !BR2_PACKAGE_AVAHI_DAEMON || !BR2_TOOLCHAIN_HAS_THREADS
+comment "support avahi - disabled (requires avahi-daemon)"
+	depends on !BR2_PACKAGE_AVAHI_DAEMON
 
 config BR2_PACKAGE_SAMBA_GAMIN
 	bool "support gamin"
-- 
1.8.1.5
