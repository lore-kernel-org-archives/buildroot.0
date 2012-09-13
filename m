From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Sep 2012 00:16:29 +0200
Subject: [Buildroot] [PATCH 1/2] target: add option to set the root password
Message-ID: <1347574590-13716-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option in the menuconfig to specify a root password.

If set to empty, no root password is created; otherwise, the password is
encrypted using DES-56 (other mechanisms will come in a future patch),
because DES-56 is the standard default using crypt(3).

Add a check for 'mkpasswd' as a new dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
This will clash with Thomas' pending reorganising series:
    http://lists.busybox.net/pipermail/buildroot/2012-September/058254.html
---
 support/dependencies/dependencies.sh |    7 +++++++
 target/generic/Config.in             |   14 ++++++++++++++
 target/generic/Makefile.in           |   14 ++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9f0f6a9..edf49e9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -158,3 +158,10 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
        exit 1 ;
    fi
 fi
+
+if grep -E '^TARGET_GENERIC_ROOT_PASSWD=".+"$' $CONFIG_FILE > /dev/null 2>&1; then
+    if ! which mkpasswd > /dev/null 2>&1; then
+        /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"
+        exit 1
+    fi
+fi
diff --git a/target/generic/Config.in b/target/generic/Config.in
index b8472f4..b376c85 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -12,6 +12,20 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
+config BR2_TARGET_GENERIC_ROOT_PASSWD
+	string "root password"
+	default ""
+	help
+	  Set the initial root password. It will be des56-encrypted.
+	  
+	  If set to empty (the default), then no root password will be set,
+	  and root will need no password to log in.
+	  
+	  WARNING! WARNING!
+	  The password appears in clear in the .config file, and may
+	  appear in the the build log! Avoid using a valuable password
+	  if either the .config file or the build log may be distributed!
+
 choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..1021b10 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -1,5 +1,6 @@
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 
@@ -13,6 +14,13 @@ target-generic-issue:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
+target-no-root-passwd:
+	$(SED) "s/^root:[^:]*:/root::/" $(TARGET_DIR)/etc/shadow
+
+target-root-passwd:
+	root_passwd="$$( mkpasswd -m des "$(TARGET_GENERIC_ROOT_PASSWD)" )"; \
+	$(SED) "s,^root::,root:$${root_passwd}:," $(TARGET_DIR)/etc/shadow
+
 target-generic-getty-busybox:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
@@ -39,6 +47,12 @@ ifneq ($(TARGET_GENERIC_ISSUE),)
 TARGETS += target-generic-issue
 endif
 
+ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
+TARGETS += target-root-passwd
+else
+TARGETS += target-no-root-passwd
+endif
+
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
-- 
1.7.2.5
