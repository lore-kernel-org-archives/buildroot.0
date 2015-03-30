From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 21:21:51 +0200
Subject: [Buildroot] [git commit] logrotate: bump version to 3.8.9
Message-ID: <20150330192329.77A2181817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e759a07939cbd4204212d787520b60b66c6e8011
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version comes with a new build system based on autoconf/automake,
so we switch from generic-package to autotools-package. However, since
the tarball does not contain a pre-generated configure script, we have
to set LOGROTATE_AUTORECONF = YES.

[Thomas:
  - add comment explaining why AUTORECONF = YES is needed
  - expand commit log
  - use --without/--with instead of --with=yes/--with=no
  - fix indentation in the ACL condition]

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/0001-make-autoreconfable.patch |   20 ++++++++++++++++++
 package/logrotate/logrotate.mk                   |   24 ++++++++++++---------
 2 files changed, 34 insertions(+), 10 deletions(-)

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
+Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
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
index c1bca48..0af7f4a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,23 +4,27 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.7
+LOGROTATE_VERSION = 3.8.9
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
-
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
+# tarball does not have a generated configure script
+LOGROTATE_AUTORECONF = YES
+LOGROTATE_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)"
+LOGROTATE_CONF_OPTS = --without-selinux
 
-define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" \
-		LOADLIBES="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)" \
-		-C $(@D)
-endef
+ifeq ($(BR2_PACKAGE_ACL),y)
+LOGROTATE_DEPENDENCIES += acl
+LOGROTATE_CONF_OPTS += --with-acl
+else
+LOGROTATE_CONF_OPTS += --without-acl
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
