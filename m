From: Chris Frederick <cdf123@cdf123.net>
Date: Mon, 24 Oct 2016 10:34:23 -0500
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
Message-ID: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added Config.in options to enable/disable the option, and check options
in sudo.mk to add openldap as a dependancy and compile with --with-ldap.

When sudo is built with ldap, /etc/sudoers is only read in for defaults,
all rules need to be provided via ldap which is configured by the user
in /etc/ldap.conf.

Since the user explicitly has to provide /etc/ldap.conf, we use 'depends
on' so that the user is obliged to explicitly enable openldap before the
option becomes visible.

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
---
 package/sudo/Config.in | 13 +++++++++++++
 package/sudo/sudo.mk   |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d..72bb5d7 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -9,3 +9,16 @@ config BR2_PACKAGE_SUDO
 	  but still allow people to get their work done.
 
 	  http://www.sudo.ws/sudo/
+
+if BR2_PACKAGE_SUDO
+config BR2_PACKAGE_SUDO_LDAP
+	bool "ldap integration"
+	depends on BR2_PACKAGE_OPENLDAP
+	help
+	  Allows you to manage sudoers rules in a centralized ldap
+	  directory. This restricts the /etc/sudoers file from
+	  defining rules, only defaults will be read. All rules will
+	  need to be provided via ldap configured in /etc/ldap.conf
+
+	  http://www.sudo.ws/man/1.8.15/sudoers.ldap.man.html
+endif
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f28312a..45273bb 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -30,6 +30,13 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_SUDO_LDAP),y)
+SUDO_DEPENDENCIES += openldap
+SUDO_CONF_OPTS += --with-ldap
+else
+SUDO_CONF_OPTS += --without-ldap
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.7.3
