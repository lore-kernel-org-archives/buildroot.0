From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 17 Feb 2015 16:43:58 +0100
Subject: [Buildroot] [PATCH] openldap: Make client binary install
	configurable
Message-ID: <1424187838-739-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some OpenLDAP deployment only need the client libraries and not the client
tools, so make the tool installation optional.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/openldap/Config.in   | 12 ++++++++++++
 package/openldap/openldap.mk | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/openldap/Config.in b/package/openldap/Config.in
index 1f0b1ea..3085a5c 100644
--- a/package/openldap/Config.in
+++ b/package/openldap/Config.in
@@ -10,6 +10,18 @@ config BR2_PACKAGE_OPENLDAP
 
 	  http://www.openldap.org/
 
+if BR2_PACKAGE_OPENLDAP
+
+config BR2_PACKAGE_OPENLDAP_CLIENTS
+	bool "openldap client binaries"
+	default y
+	help
+	  Install the OpenLDAP client tools (ldapadd, ldapcompare, ldapdelete,
+	  ldapexop, ldapmodify, ldapmodrdn, ldappasswd, ldapsearch, ldapurl,
+	  ldapwhoami)
+
+endif
+
 comment "openldap needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_USE_WCHAR
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 332b2c4..3e90a87 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -55,4 +55,15 @@ OPENLDAP_CONF_OPTS += \
 # executable it is supposed to install, resulting in an error.
 OPENLDAP_MAKE_ENV = STRIP="$(TARGET_STRIP)"
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_CLIENTS),)
+define OPENLDAP_REMOVE_CLIENTS
+	for f in ldapurl ldapexop ldapcompare ldapwhoami ldappasswd ldapmodrdn \
+		ldapdelete ldapmodify ldapsearch; do \
+		rm -rf $(TARGET_DIR)/usr/bin/$f; \
+	done
+	rm -rf $(TARGET_DIR)/etc/openldap
+endef
+OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_REMOVE_CLIENTS
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
