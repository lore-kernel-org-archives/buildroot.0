From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:43:56 +0100
Subject: [Buildroot] [git commit] openldap: Make client binary install
	configurable
Message-ID: <20150308134417.4822580734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6aa56e081bd31981a547d8f2db060fe05a75d57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some OpenLDAP deployment only need the client libraries and not the client
tools, so make the tool installation optional.

[Thomas: implement the for loop in make rather than in shell.]

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openldap/Config.in   |   12 ++++++++++++
 package/openldap/openldap.mk |   12 ++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

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
index 332b2c4..991d369 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -55,4 +55,16 @@ OPENLDAP_CONF_OPTS += \
 # executable it is supposed to install, resulting in an error.
 OPENLDAP_MAKE_ENV = STRIP="$(TARGET_STRIP)"
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_CLIENTS),)
+OPENLDAP_CLIENTS = \
+	ldapurl ldapexop ldapcompare ldapwhoami \
+	ldappasswd ldapmodrdn ldapdelete ldapmodify \
+	ldapsearch
+define OPENLDAP_REMOVE_CLIENTS
+	$(RM) -f $(foreach p,$(OPENLDAP_CLIENTS),$(TARGET_DIR)/usr/bin/$(p))
+	$(RM) -rf $(TARGET_DIR)/etc/openldap
+endef
+OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_REMOVE_CLIENTS
+endif
+
 $(eval $(autotools-package))
