From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Wed, 26 Nov 2014 01:00:15 +0100
Subject: [Buildroot] [PATCH v2] samba: Add support for libnss_win*.so*
	installation
Message-ID: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnss_wins and libnss_winbind libraries are required in order to
add support for the wins and winbind sources to the Name Service Switch
(NSS), so make it possible to install them. This is useful in order to
resolve NetBIOS names or user and group information from a Windows NT
server.

These libraries are installed to /lib/ like the standard libnss_*
libraries from (E)GLIBC.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

---

Changes in v2:
- Make BR2_PACKAGE_SAMBA_LIBNSS_WIN* depend on BR2_TOOLCHAIN_USES_GLIBC
  and BR2_PACKAGE_SAMBA_WINBINDD.
- Use full path for target in 'install -D'.
- Move the definitions of the hook functions inside the corresponding
  conditional blocks.
---
 package/samba/Config.in |   19 +++++++++++++++++++
 package/samba/samba.mk  |   18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 8dd0bf2..e2cac9e 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -240,6 +240,25 @@ config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
 	  standards POSIX functions available for manipulating local
 	  files.
 
+config BR2_PACKAGE_SAMBA_LIBNSS_WINS
+	bool "libnss_wins"
+	default y
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_SAMBA_WINBINDD
+	help
+	  libnss_wins is a library that permits the Name Service Switch
+	  to resolve NetBIOS names.
+
+config BR2_PACKAGE_SAMBA_LIBNSS_WINBIND
+	bool "libnss_winbind"
+	default y
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_SAMBA_WINBINDD
+	help
+	  libnss_winbind is a library that permits the Name Service
+	  Switch to resolve user and group information from a Windows
+	  NT server.
+
 endmenu
 
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1957997..c87b391 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -135,6 +135,24 @@ endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_UNNEEDED_BINARIES
 
+ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
+define SAMBA_INSTALL_LIBNSS_WINS
+	# install libnss_wins
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so
+	ln -snf libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
+endef
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINS
+endif
+
+ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINBIND),y)
+define SAMBA_INSTALL_LIBNSS_WINBIND
+	# install libnss_winbind
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so
+	ln -snf libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so.2
+endef
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINBIND
+endif
+
 define SAMBA_REMOVE_SWAT_DOCUMENTATION
 	# Remove the documentation
 	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
-- 
1.7.10.4
