Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65B8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A48F605E3;
	Sat, 24 Dec 2022 17:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A48F605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lh-Wit3jE25F; Sat, 24 Dec 2022 17:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29006606E7;
	Sat, 24 Dec 2022 17:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29006606E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD8D1BF4D8
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC02E81433
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 17:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC02E81433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fu1GW-JQBSpB for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 17:19:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7538781431
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7538781431
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 17:19:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n3so6327249wrc.5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 09:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=My9G0JQX+ns5ZpQ4rsltdL78VHcheuzglCjJgFBaLuc=;
 b=TiF1G098t8uHKy/mwTn2o78ILodU8mhRoDi5m9nhHHtOrpODZrJ0QWPAiBnV2FWzgZ
 Dg8nJbqUxRNutbtXO+OBEtSFBpivjN6xAonKitDkBicIjUsmzQl8bk9odENJXxarutqN
 9/OKUHjgp7eLT6G/rNsfX+SZjKGYKtnZes8WSNr2LYmELJ5y8fp9Qoozv/6pHSf1DIma
 A2hJ98LjF1tywzbVbl7uX74x3NtT3oLlyNgOL/ykaNqOTIyqV4DeJJ7/WYcNRhkUUCpA
 U+XWrQccXBhWckzesaB7MNHCDYkNrIpCt+TtslsJ0+TCSIzs22qZFbBTQrfiKWqvGNHN
 hewQ==
X-Gm-Message-State: AFqh2kplh9l+fRnkzRpjGpKS3/GlorMMwo4nmNO6FSrH9ksD9T2rCXCj
 fEVrlvuebTgqUBkfrgV8laBzWYeBmOtHqw==
X-Google-Smtp-Source: AMrXdXvDtk8hD3Js324RqpLBvoJvfuKNHfFwIcD+JYTj0XEGM05uxPhzbhzbpiWkPuNKBC/EMAMZaQ==
X-Received: by 2002:a05:6000:100d:b0:278:3ddb:12d1 with SMTP id
 a13-20020a056000100d00b002783ddb12d1mr1284586wrx.25.1671902392407; 
 Sat, 24 Dec 2022 09:19:52 -0800 (PST)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056000181100b002422202fa7fsm5816792wrh.39.2022.12.24.09.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 09:19:51 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 18:19:20 +0100
Message-Id: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=My9G0JQX+ns5ZpQ4rsltdL78VHcheuzglCjJgFBaLuc=;
 b=cIavF53dTYQ/2wHoEemUjkeAShFZhwhf5FfQzh8grD/uTeIeNmwOvNMhz5Iy6nr6gQ
 AW1Kcu670KMrqZ5U28ZYnFn4p32L/3Qz9dkNVdfsZR+TH+VzBC0KtROb0QgOFvoo/29m
 uJjICeTOz9ryHnArsjtiK7/5IYqmh+NPnn7YVI8sbVv15Ev7EOIZfz1YHFBi4gqiXoKe
 EeCysMi4ud3+iN8Q9wmHZiX80r9t3nWe7vPXAFS077tN/5GHBuYQ1Vrv4v2GIPP0nJjt
 KfWV6yGlz2S8jwtRqEq3SluMLZ6lfdCeNqygTup3EgzQ1Rh1LZjM694gSBtpME/Glvkv
 +wVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cIavF53d
Subject: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shadow provides utilities to deal with user accounts.

The shadow package includes the necessary programs for converting UNIX
password files to the shadow password format, plus programs for managing
user and group accounts. Especially it is useful if rootless podman
container should be used, which requires newuidmap and newgidmap.

Co-authored-by: Nicolas Carrier <Nicolas.Carrier@orolia.com>
[Nicolas.Carrier@orolia.com provided the test case]
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v3 -> v4:
- fix formatting issues in Config.in and shadow.mk.
- bump to version 4.13.
- add SHADOW_CPE_ID_VENDOR in shadow.mk.
- add userdel in the setuid list.
- fix typo in SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS.

Changes v2 -> v3:
- remove nscd support
- remove sssd support
- remove group name max length parameter
- remove su build
- improve help text of subordinate-ids
- use a define instead of variable for SHADOW_ACCOUNT_TOOLS_SETUID
  SHADOW_SUBORDINATE_IDS_PERMISSIONS and 

Changes v1 -> v2:
- DEVELOPERS: add Raphael Pavlids for shadow

 DEVELOPERS                                   |   3 +-
 package/Config.in                            |   1 +
 package/shadow/Config.in                     |  61 +++++++++
 package/shadow/shadow.hash                   |   3 +
 package/shadow/shadow.mk                     | 135 +++++++++++++++++++
 support/testing/tests/package/test_shadow.py |  55 ++++++++
 6 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.hash
 create mode 100644 package/shadow/shadow.mk
 create mode 100644 support/testing/tests/package/test_shadow.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 20677ef8ce..18796e98a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2463,7 +2463,8 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
-N:	Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/shadow/
 F:	package/slirp4netns/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..342aa016bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2658,6 +2658,7 @@ menu "System tools"
 	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
+	source "package/shadow/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000000..b4c4d663bd
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,61 @@
+menuconfig BR2_PACKAGE_SHADOW
+	bool "shadow"
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
+comment "account-tools-setuid needs a toolchain w/ shared libs, wchar, locale"
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
+comment "shadow needs a toolchain w/ headers >= 4.14"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
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
-- 
2.38.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
