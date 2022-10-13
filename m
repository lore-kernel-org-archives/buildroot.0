Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF7C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 16:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9163C40CC5;
	Thu, 13 Oct 2022 16:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9163C40CC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOMnrtZFr0Ve; Thu, 13 Oct 2022 16:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEF4404BF;
	Thu, 13 Oct 2022 16:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEF4404BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA2FB1BF28B
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 16:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C274160B13
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 16:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C274160B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yD9os7Ol0dwV for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 16:35:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6878A60B0E
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6878A60B0E
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 16:35:32 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id w18so5081800ejq.11
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 09:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWB3kOzpq6+eKMk85P460JwQ/x26zVsoKRJt3kWTVVI=;
 b=ULLuWCG2Pr6uiENEnU0FZqG+yHiVK8d33q6MJbFojwsjGm11RurcmTwMXK11lN580L
 yKLDlexl+sxHLUIqzdUH12dco6Dbgw4xEkZ4VugF5KRNJzWuWngrLA06c1Q3i2ztlmhy
 6TjTaafNXB6CrmViKW7pQJZ4VZXpfSUmbhUdtvciNUS7/YQzJexZsKqO0QbUfksr8X2+
 bXo/pNcIMCACHE/pcQAaMof37KdD9bsksuzqvDjCWh+2K8/YIDXNLW6kjpTTmkcHkQc4
 t9Qsg1gCo+9QUae0qXw0nymIVUrFNnIDe373ZByEjdNwHzB+8vNpMGa5ceqlhq29grgN
 vcbQ==
X-Gm-Message-State: ACrzQf2P9RTz9EVWSV2ISaXUZ0NzVum9w2BgEpZeaQO/GV1G/VnvqyNf
 FtzhyWp3GnXp3+2hl+HqtZTzhgEHi1gmkQ==
X-Google-Smtp-Source: AMsMyM6f0K6RPAsdMZRTfN/MrVBrF4utcEtiyYKeOM7kS9Wb1SPIZtpZiPdiauXLD5V8I4qryEjEhQ==
X-Received: by 2002:a17:907:c25:b0:78e:1a4:132 with SMTP id
 ga37-20020a1709070c2500b0078e01a40132mr411502ejc.521.1665678930553; 
 Thu, 13 Oct 2022 09:35:30 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090627cd00b0077826b92d99sm128066ejc.12.2022.10.13.09.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:35:29 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 18:34:32 +0200
Message-Id: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWB3kOzpq6+eKMk85P460JwQ/x26zVsoKRJt3kWTVVI=;
 b=Hp2Y6k9BluzrQpUUECA9HAxvbEEuAnA3/qIeavkqXs26mRtJFQrrjwffWA4HNh6X8S
 uUBJo5Ij2Ze5FZQYw6p6w74wSwjRpYTkVhV1+ftpAxFgdLEFsJqYudo2MjOgoynVDavc
 jqSFH4I/LeG8ekaiqhajWQeDscvSP68mMS1J5OsHTlECWLJkrHauTxXvW5NFRfDZi6iZ
 5hKIbksFvIVFlcdagpJlDC+Ov+tizaHxsGLNJBoCPatFXXAOt0dPeVjoXYSWJCV0oObS
 aF+NNNeBVlhHkSjoSAaWU+mIL1ruLXWzNxw36RnJGiU3pu/y5z/H3EFTAlee4piClUQX
 LnLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hp2Y6k9B
Subject: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shadow provides utilities to deal with user accounts.

The shadow package includes the necessary programs for converting UNIX
password files to the shadow password format, plus programs for managing
user and group accounts. Especially it is useful if rootless podman
container should be used, which requires newuidmap and newgidmap.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
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

 DEVELOPERS                 |   3 +-
 package/Config.in          |   1 +
 package/shadow/Config.in   |  61 +++++++++++++++++
 package/shadow/shadow.hash |   3 +
 package/shadow/shadow.mk   | 133 +++++++++++++++++++++++++++++++++++++
 5 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.hash
 create mode 100644 package/shadow/shadow.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..0dad0ba0ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2474,7 +2474,8 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
-N:	Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/shadow/
 F:	package/slirp4netns/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..d9ead48647 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2642,6 +2642,7 @@ menu "System tools"
 	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
+	source "package/shadow/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000000..6b1fe0a61f
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
+	  Install the user and group management tools (e.g. groupadd) with setuid and
+	  authenticate the callers via PAM.
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
+	  Support subordinate ids. Helpful to use container solution like podman
+	  without root.
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
index 0000000000..6b9faac10f
--- /dev/null
+++ b/package/shadow/shadow.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  41f093ce58b2ae5f389a1c5553e0c18bc73e6fe27f66273891991198a7707c95  shadow-4.11.1.tar.xz
+sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000000..261f28dd28
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,133 @@
+################################################################################
+#
+# shadow
+#
+################################################################################
+
+SHADOW_VERSION = 4.11.1
+SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
+SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
+SHADOW_LICENSE = BSD-3-Clause
+SHADOW_LICENSE_FILES = COPYING
+
+SHADOW_CONF_OPTS = \
+	--disable-man \
+    --without-btrfs \
+    --without-nscd \
+    --without-skey \
+    --without-sssd \
+    --without-su \
+    --without-tcb
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
+	$(SHADOW_ACCOUNT_TOOLS_SETUID)
+	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
+endef
+
+$(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
