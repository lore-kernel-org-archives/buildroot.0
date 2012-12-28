From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 22:20:53 +0100
Subject: [Buildroot] [PATCH 1/2] target: add option to set the root password
In-Reply-To: <cover.1356728899.git.yann.morin.1998@free.fr>
References: <cover.1356728899.git.yann.morin.1998@free.fr>
Message-ID: <751d161336cd6e35187e2faa67f456335908222c.1356728899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option in the menuconfig to specify a root password.

If set to empty, no root password is created; otherwise, the password is
encrypted using MD5 (MD5 is not the default for crypt(3), DES-56 is, but
MD5 is widely available, not-so-strong, but not-so-weak either).

Add a check for 'mkpasswd' as a new dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Switched to using MD5 as per Arnout's suggestion:
    http://lists.busybox.net/pipermail/buildroot/2012-September/058712.html
---
 support/dependencies/dependencies.sh |    9 +++++++++
 system/Config.in                     |   21 +++++++++++++++++++++
 system/system.mk                     |   14 ++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 7a02512..c86a5d0 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -158,6 +158,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
        exit 1 ;
    fi
 fi
+
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
     for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
@@ -166,3 +167,11 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
 	fi
     done
 fi
+
+if grep -E '^TARGET_GENERIC_ROOT_PASSWD=".+"$' $CONFIG_FILE > /dev/null 2>&1; then
+    if ! which mkpasswd > /dev/null 2>&1; then
+        /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"
+        exit 1
+    fi
+
+fi
diff --git a/system/Config.in b/system/Config.in
index a557ea0..deead86 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -12,6 +12,27 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
+config BR2_TARGET_GENERIC_ROOT_PASSWD
+	string "root password"
+	default ""
+	help
+	  Set the initial root password (in clear). It will be md5-encrypted.
+	  
+	  If set to empty (the default), then no root password will be set,
+	  and root will need no password to log in.
+	  
+	  WARNING! WARNING!
+	  Although pretty strong, MD5 is now an old hash function, and
+	  suffers from som weaknesses, which makes it susceptible to attacks.
+	  It is showing its age, so this root password should not be trusted
+	  to properly secure any product that can be shipped to the wide,
+	  hostile world.
+	  
+	  WARNING! WARNING!
+	  The password appears in clear in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either the
+	  .config file or the build log may be distributed!
+
 choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
diff --git a/system/system.mk b/system/system.mk
index 353d0ba..a23feef 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,5 +1,6 @@
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
@@ -14,6 +15,13 @@ target-generic-issue:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
+target-no-root-passwd:
+	$(SED) "s/^root:[^:]*:/root::/" $(TARGET_DIR)/etc/shadow
+
+target-root-passwd:
+	root_passwd="$$( mkpasswd -m md5 "$(TARGET_GENERIC_ROOT_PASSWD)" )"; \
+	$(SED) "s,^root::,root:$${root_passwd}:," $(TARGET_DIR)/etc/shadow
+
 target-generic-getty-busybox:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
@@ -40,6 +48,12 @@ ifneq ($(TARGET_GENERIC_ISSUE),)
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
