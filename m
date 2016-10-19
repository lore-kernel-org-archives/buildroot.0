From: Chris Frederick <cdf123@cdf123.net>
Date: Wed, 19 Oct 2016 11:08:29 -0500
Subject: [Buildroot] [PATCH 1/2] sudo: Add ldap support for sudoers rules
Message-ID: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added Config.in options to enable/disable the option, and check options
in sudo.mk to add openldap as a dependancy and compile with --with-ldap.

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
---
 package/sudo/Config.in | 12 ++++++++++++
 package/sudo/sudo.mk   |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d..2e9e35a 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -9,3 +9,15 @@ config BR2_PACKAGE_SUDO
 	  but still allow people to get their work done.
 
 	  http://www.sudo.ws/sudo/
+
+if BR2_PACKAGE_SUDO && BR2_PACKAGE_OPENLDAP
+config BR2_PACKAGE_SUDO_LDAP
+	bool "ldap integration"
+	depends on BR2_PACKAGE_SUDO
+	help
+	  Allows you to manage sudoers rules in a centralized ldap
+	  directory.
+
+	  http://www.sudo.ws/man/1.8.15/sudoers.ldap.man.html
+endif
+
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f28312a..b4d071c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -30,6 +30,11 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_SUDO_LDAP),y)
+SUDO_DEPENDENCIES += openldap
+SUDO_CONF_OPTS += --with-ldap
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.7.3
