Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD50BC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DED760B96;
	Wed, 22 Feb 2023 22:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DED760B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4c7dhRCdUskE; Wed, 22 Feb 2023 22:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 288C960BA6;
	Wed, 22 Feb 2023 22:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 288C960BA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B72811BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D09160BA6
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D09160BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9CGp3D4ETUb for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:20:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 335D260B96
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335D260B96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23633868E2; Wed, 22 Feb 2023 22:20:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:19:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 97c40266b1b69e101ce035c8aa73bf2665c5c256
X-Git-Newrev: f78c5cb5cae93a9e63dad4361d78e1787759382f
X-Patchwork-Hint: ignore
Message-Id: <20230222222058.23633868E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/shadow: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f78c5cb5cae93a9e63dad4361d78e1787759382f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

shadow provides utilities to deal with user accounts.

The shadow package includes the necessary programs for converting UNIX
password files to the shadow password format, plus programs for managing
user and group accounts. Especially it is useful if rootless podman
container should be used, which requires newuidmap and newgidmap.

Co-authored-by: Nicolas Carrier <Nicolas.Carrier@orolia.com>
[Nicolas.Carrier@orolia.com provided the test case]
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |   1 +
 package/Config.in                            |   1 +
 package/shadow/Config.in                     |  62 ++++++++++++
 package/shadow/shadow.hash                   |   3 +
 package/shadow/shadow.mk                     | 135 +++++++++++++++++++++++++++
 support/testing/tests/package/test_shadow.py |  55 +++++++++++
 6 files changed, 257 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 599cfe6886..d052e59122 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2429,6 +2429,7 @@ F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/shadow/
 F:	package/slirp4netns/
 F:	package/sway/
 F:	package/x11r7/xwayland/
diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..7c32305129 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2701,6 +2701,7 @@ menu "System tools"
 	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
+	source "package/shadow/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000000..e3580c2cf5
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,62 @@
+menuconfig BR2_PACKAGE_SHADOW
+	bool "shadow"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	help
+	  Utilities to deal with user accounts.
+
+	  https://github.com/shadow-maint/shadow
+
+if BR2_PACKAGE_SHADOW
+
+config BR2_PACKAGE_SHADOW_SHADOWGRP
+	bool "shadowgrp"
+	help
+	  Enable shadow group support.
+
+config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
+	bool "account-tools-setuid"
+	depends on BR2_USE_MMU  # linux-pam
+	depends on BR2_ENABLE_LOCALE  # linux-pam
+	depends on BR2_USE_WCHAR  # linux-pam
+	depends on !BR2_STATIC_LIBS  # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  Install the user and group management tools (e.g. groupadd)
+	  with setuid and authenticate the callers via PAM.
+
+comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, locale"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
+
+config BR2_PACKAGE_SHADOW_UTMPX
+	bool "utmpx"
+	help
+	  Enable loggin in utmpx / wtmpx.
+
+config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
+	bool "subordinate-ids"
+	help
+	  Support subordinate ids. Helpful to use container solution
+	  like podman without root.
+
+config BR2_PACKAGE_SHADOW_SHA_CRYPT
+	bool "sha-crypt"
+	default y
+	help
+	  Allow the SHA256 and SHA512 password encryption algorithms.
+
+config BR2_PACKAGE_SHADOW_BCRYPT
+	bool "bcrypt"
+	help
+	  Allow the bcrypt password encryption algorithm.
+
+config BR2_PACKAGE_SHADOW_YESCRYPT
+	bool "yescrypt"
+	help
+	  Allow the yescrypt password encryption algorithm.
+
+endif # BR2_PACKAGE_SHADOW
+
+comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
new file mode 100644
index 0000000000..2e5c4a8168
--- /dev/null
+++ b/package/shadow/shadow.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9afe245d79a2e7caac5f1ed62519b17416b057ec89df316df1c3935502f9dd2c  shadow-4.13.tar.xz
+sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000000..d8f913a648
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,135 @@
+################################################################################
+#
+# shadow
+#
+################################################################################
+
+SHADOW_VERSION = 4.13
+SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
+SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
+SHADOW_LICENSE = BSD-3-Clause
+SHADOW_LICENSE_FILES = COPYING
+SHADOW_CPE_ID_VENDOR = debian
+
+SHADOW_CONF_OPTS = \
+	--disable-man \
+	--without-btrfs \
+	--without-nscd \
+	--without-skey \
+	--without-sssd \
+	--without-su \
+	--without-tcb
+
+ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
+SHADOW_CONF_OPTS += --enable-shadowgrp
+else
+SHADOW_CONF_OPTS += --disable-shadowgrp
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
+SHADOW_CONF_OPTS += --enable-account-tools-setuid
+define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
+	/usr/sbin/chgpasswd f 4755 0 0 - - - - -
+	/usr/sbin/chpasswd f 4755 0 0 - - - - -
+	/usr/sbin/groupadd f 4755 0 0 - - - - -
+	/usr/sbin/groupdel f 4755 0 0 - - - - -
+	/usr/sbin/groupmod f 4755 0 0 - - - - -
+	/usr/sbin/newusers f 4755 0 0 - - - - -
+	/usr/sbin/useradd f 4755 0 0 - - - - -
+	/usr/sbin/userdel f 4755 0 0 - - - - -
+	/usr/sbin/usermod f 4755 0 0 - - - - -
+endef
+else
+SHADOW_CONF_OPTS += --disable-account-tools-setuid
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
+SHADOW_CONF_OPTS += --enable-utmpx
+else
+SHADOW_CONF_OPTS += --disable-utmpx
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_CONF_OPTS += --enable-subordinate-ids
+define SHADOW_SUBORDINATE_IDS_PERMISSIONS
+	/usr/bin/newuidmap f 4755 0 0 - - - - -
+	/usr/bin/newgidmap f 4755 0 0 - - - - -
+endef
+else
+SHADOW_CONF_OPTS += --disable-subordinate-ids
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+SHADOW_CONF_OPTS += --with-acl
+SHADOW_DEPENDENCIES += acl
+else
+SHADOW_CONF_OPTS += --without-acl
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+SHADOW_CONF_OPTS += --with-attr
+SHADOW_DEPENDENCIES += attr
+else
+SHADOW_CONF_OPTS += --without-attr
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SHADOW_CONF_OPTS += --with-audit
+SHADOW_DEPENDENCIES += audit
+else
+SHADOW_CONF_OPTS += --without-audit
+endif
+
+ifeq ($(BR2_PACKAGE_CRACKLIB),y)
+SHADOW_CONF_OPTS += --with-libcrack
+SHADOW_DEPENDENCIES += cracklib
+else
+SHADOW_CONF_OPTS += --without-libcrack
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SHADOW_CONF_OPTS += --with-selinux
+SHADOW_DEPENDENCIES += libselinux libsemanage
+else
+SHADOW_CONF_OPTS += --without-selinux
+endif
+
+# linux-pam is also used without account-tools-setuid enabled
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SHADOW_CONF_OPTS += --with-libpam
+SHADOW_DEPENDENCIES += linux-pam
+else
+SHADOW_CONF_OPTS += --without-libpam
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SHA_CRYPT),y)
+SHADOW_CONF_OPTS += --with-sha-crypt
+else
+SHADOW_CONF_OPTS += --without-sha-crypt
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_BCRYPT),y)
+SHADOW_CONF_OPTS += --with-bcrypt
+else
+SHADOW_CONF_OPTS += --without-bcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_YESCRYPT),y)
+SHADOW_CONF_OPTS += --with-yescrypt
+else
+SHADOW_CONF_OPTS += --without-yescrypt
+endif
+
+define SHADOW_PERMISSIONS
+	/usr/bin/chage f 4755 0 0 - - - - -
+	/usr/bin/chfn f 4755 0 0 - - - - -
+	/usr/bin/chsh f 4755 0 0 - - - - -
+	/usr/bin/expiry f 4755 0 0 - - - - -
+	/usr/bin/gpasswd f 4755 0 0 - - - - -
+	/usr/bin/newgrp f 4755 0 0 - - - - -
+	/usr/bin/passwd f 4755 0 0 - - - - -
+	$(SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS)
+	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
+endef
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_shadow.py b/support/testing/tests/package/test_shadow.py
new file mode 100644
index 0000000000..c5151b4fdb
--- /dev/null
+++ b/support/testing/tests/package/test_shadow.py
@@ -0,0 +1,55 @@
+import os
+
+from infra.basetest import BRTest, BASIC_TOOLCHAIN_CONFIG
+
+
+class TestShadow(BRTest):
+    username = 'user_test'
+    config = BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_arm=y
+        BR2_PACKAGE_SHADOW=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="65536"
+        """
+    timeout = 60
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=ext4"],
+                           options=["-drive", f"file={img},if=sd,format=raw"])
+        self.emulator.login()
+
+    def test_nologin(self):
+        self.login()
+
+        self.assertRunOk("! nologin")
+        cmd = 'test "$(nologin)" = "This account is currently not available."'
+        self.assertRunOk(cmd)
+
+    def test_useradd_del(self):
+        username = self.username
+        self.login()
+
+        self.assertRunOk(f'userdel {username} || true')
+        self.assertRunOk(f'groupdel {username} || true')
+        self.assertRunOk(f'useradd -s /bin/sh {username}')
+        self.assertRunOk(f'test $(su {username} -c "whoami") = {username}')
+        self.assertRunOk(f'userdel {username}')
+
+    def test_usermod(self):
+        username = self.username
+        new_home = '/tmp'
+        self.login()
+
+        self.assertRunOk(f'userdel {username} || true')
+        self.assertRunOk(f'groupdel {username} || true')
+        self.assertRunOk(f'useradd -s /bin/sh {username}')
+        self.assertRunOk(f'usermod {username} --home {new_home}')
+        self.assertRunOk(f'test $(su {username} -c \'echo $HOME\') = {new_home}')
+        self.assertRunOk(f'userdel {username}')
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
