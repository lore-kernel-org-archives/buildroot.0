From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 3 Jul 2013 16:27:21 -0600
Subject: [Buildroot] [PATCH] system: add config item to set root password or
	not
Message-ID: <20130703222719.GA12284@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to address the difference of whether a password should get set
versus setting an empty password.

Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 support/dependencies/dependencies.sh |    2 +-
 system/Config.in                     |   17 +++++++++++------
 system/system.mk                     |    5 ++++-
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0b44c5a..912d03c 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -173,7 +173,7 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
     done
 fi
 
-if grep -E '^BR2_TARGET_GENERIC_ROOT_PASSWD=".+"$' $BUILDROOT_CONFIG > /dev/null 2>&1; then
+if grep -E '^BR2_TARGET_GENERIC_SET_ROOT_PASSWD=y' $BUILDROOT_CONFIG > /dev/null 2>&1; then
     if ! which mkpasswd > /dev/null 2>&1; then
         /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"
         /bin/echo -e "(in Debian/ubuntu, 'mkpasswd' provided by the whois package)\n"
diff --git a/system/Config.in b/system/Config.in
index c0e4f4a..6b90854 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -173,15 +173,12 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
-config BR2_TARGET_GENERIC_ROOT_PASSWD
-	string "Root password"
-	default ""
+config BR2_TARGET_GENERIC_SET_ROOT_PASSWD
+	bool "Set root password"
+	default y
 	help
 	  Set the initial root password (in clear). It will be md5-encrypted.
 
-	  If set to empty (the default), then no root password will be set,
-	  and root will need no password to log in.
-
 	  WARNING! WARNING!
 	  Although pretty strong, MD5 is now an old hash function, and
 	  suffers from some weaknesses, which makes it susceptible to attacks.
@@ -194,6 +191,14 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
 
+config BR2_TARGET_GENERIC_ROOT_PASSWD
+	string "Root password"
+	depends on BR2_TARGET_GENERIC_SET_ROOT_PASSWD
+	default ""
+	help
+	  If set to empty (the default), then no root password will be set,
+	  and root will need no password to log in.
+
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "Port to run a getty (login prompt) on"
 	default "ttyS0"
diff --git a/system/system.mk b/system/system.mk
index 50c86ad..728ce6e 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,8 +1,9 @@
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_GENERIC_SET_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_SET_ROOT_PASSWD))
 TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 TARGET_GENERIC_PASSWD_METHOD:=$(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
+ifeq ($(TARGET_GENERIC_SET_ROOT_PASSWD),y)
 TARGET_GENERIC_ROOT_PASSWD_HASH=$(shell mkpasswd -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
 endif
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
@@ -57,7 +58,9 @@ TARGETS += target-generic-issue
 endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+ifeq ($(TARGET_GENERIC_SET_ROOT_PASSWD),y)
 TARGETS += target-root-passwd
+endif
 
 ifneq ($(TARGET_GENERIC_GETTY),)
 TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
-- 
1.7.9.5
