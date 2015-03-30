From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 30 Mar 2015 02:32:36 +0200
Subject: [Buildroot] [PATCH] logrotate: Bump version to 3.8.9
Message-ID: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
---
 package/logrotate/0001-make-autoreconfable.patch | 20 ++++++++++++++++++++
 package/logrotate/logrotate.mk                   | 23 +++++++++++++----------
 2 files changed, 33 insertions(+), 10 deletions(-)
 create mode 100644 package/logrotate/0001-make-autoreconfable.patch

diff --git a/package/logrotate/0001-make-autoreconfable.patch b/package/logrotate/0001-make-autoreconfable.patch
new file mode 100644
index 0000000..89759d0
--- /dev/null
+++ b/package/logrotate/0001-make-autoreconfable.patch
@@ -0,0 +1,20 @@
+Make the package autoreconfigurable
+
+Adjust a minor detail in configure.ac in order to make the package
+compatible with the autoconf/automake versions we are using in
+Buildroot.
+
+Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ AC_INIT([logrotate],[3.8.9])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_DEFINE(_GNU_SOURCE)
+ 
+ AM_EXTRA_RECURSIVE_TARGETS([test])
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index c1bca48..ceae85c 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,23 +4,26 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.7
+LOGROTATE_VERSION = 3.8.9
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
-
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
+LOGROTATE_AUTORECONF = YES
+LOGROTATE_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)"
+LOGROTATE_CONF_OPTS = --with-selinux=no
 
-define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" \
-		LOADLIBES="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)" \
-		-C $(@D)
-endef
+ifeq ($(BR2_PACKAGE_ACL),y)
+	LOGROTATE_DEPENDENCIES += acl
+	LOGROTATE_CONF_OPTS += --with-acl=yes
+else
+	LOGROTATE_CONF_OPTS += --with-acl=no
+endif
 
-define LOGROTATE_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX=$(TARGET_DIR) -C $(@D) install
+define LOGROTATE_INSTALL_TARGET_CONF
 	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
+LOGROTATE_POST_INSTALL_TARGET_HOOKS += LOGROTATE_INSTALL_TARGET_CONF
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.1.0
