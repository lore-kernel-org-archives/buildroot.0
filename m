From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon,  4 Aug 2014 20:14:17 +0200
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
	installation
In-Reply-To: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnss_wins and libnss_winbind libraries are required in order to add
support for the wins and winbind sources to the Name Service Switch (NSS), so
make it possible to install them. This is useful in order to resolve NetBIOS
names or user and group information from a Windows NT server.

These libraries are installed to /lib/ like the standard libnss_* libraries from
(E)GLIBC.

These libraries require the --with-winbind configuration option, but not the
files installed by BR2_PACKAGE_SAMBA_WINBINDD. That's why
BR2_PACKAGE_SAMBA_LIBNSS_* are not made to depend on BR2_PACKAGE_SAMBA_WINBINDD.

These libraries are designed to be used by the NSS provided by (E)GLIBC, but
nothing forbids to use them directly without (E)GLIBC. That's why
BR2_PACKAGE_SAMBA_LIBNSS_* are not made to depend on BR2_TOOLCHAIN_USES_GLIBC.
BR2_PACKAGE_SAMBA_WINBINDD is enabled by default, so enable
BR2_PACKAGE_SAMBA_LIBNSS_* by default, but only if BR2_TOOLCHAIN_USES_GLIBC is
enabled since using these libraries without (E)GLIBC is unusual.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/samba/Config.in | 15 +++++++++++++++
 package/samba/samba.mk  | 22 +++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 8dd0bf2..8448784 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -240,6 +240,21 @@ config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
 	  standards POSIX functions available for manipulating local
 	  files.
 
+config BR2_PACKAGE_SAMBA_LIBNSS_WINS
+	bool "libnss_wins"
+	default y if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  libnss_wins is a library that permits the Name Service Switch
+	  to resolve NetBIOS names.
+
+config BR2_PACKAGE_SAMBA_LIBNSS_WINBIND
+	bool "libnss_winbind"
+	default y if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  libnss_winbind is a library that permits the Name Service
+	  Switch to resolve user and group information from a Windows
+	  NT server.
+
 endmenu
 
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 84e525f..20cccbc 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -58,7 +58,7 @@ SAMBA_CONF_OPT = \
 	\
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
-	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
+	$(if $(BR2_PACKAGE_SAMBA_WINBINDD)$(BR2_PACKAGE_SAMBA_LIBNSS_WINS)$(BR2_PACKAGE_SAMBA_LIBNSS_WINBIND),--with-winbind,--without-winbind)
 
 SAMBA_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
@@ -135,6 +135,26 @@ endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_UNNEEDED_BINARIES
 
+define SAMBA_INSTALL_LIBNSS_WINS
+	# install libnss_wins
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/
+	ln -snf libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
+endef
+
+ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINS
+endif
+
+define SAMBA_INSTALL_LIBNSS_WINBIND
+	# install libnss_winbind
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_winbind.so $(TARGET_DIR)/lib/
+	ln -snf libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so.2
+endef
+
+ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINBIND),y)
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINBIND
+endif
+
 define SAMBA_REMOVE_SWAT_DOCUMENTATION
 	# Remove the documentation
 	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
-- 
1.9.1
