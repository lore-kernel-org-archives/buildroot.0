Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A005BECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 12:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E847B40521;
	Sun,  4 Sep 2022 12:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E847B40521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtX0siGc-c1K; Sun,  4 Sep 2022 12:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D23B040518;
	Sun,  4 Sep 2022 12:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D23B040518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF40B1BF3FC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96F6B60BB6
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F6B60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZlXmyEuEdz2 for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 12:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DEAE60774
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DEAE60774
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 12:43:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e17so636583edc.5
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 05:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zsKBI1wmYsEnALSnb2dQBP2ScHCz2qv1xGG2HK9nqYM=;
 b=WgvTV/K+bltxhzSE/rZQx3Q3yhR/4h5rt6upUyKK3D41yDELnJF4S+5jTnR6eLM113
 zMADw8loudYeSsU2A4KJQRs9eJFsryR75unLLBbtvLf+9elychXQ+6NPyS8LVfCjWxVG
 2I3KAVbq+YTri4whxemQhf40976L76/3hgzLB7Uc3EmQo0Lz20U7ZxaQiUcJGCRB1zRA
 JTsuD0FZYgEg59SK8od4NSi39Z8iue9dFQqHEJdwmEt8D6Pb09sjozh5s4DMJb1pZd2z
 xs+UQoGHoNmoFHWLeJBV9b/v9BljoOewYdk7pvoyDFH8xYBIz9K+IA96s4ewQhVgTos3
 6B1A==
X-Gm-Message-State: ACgBeo1QyRbpBBA97oiJLQqr9DahzffOklLrq3yaSbCWmxOxwdrSP8bq
 fzWVkvsTdI5ry5DbWrC2dF36jVL1K0dCENoC
X-Google-Smtp-Source: AA6agR575FXMjWK6rDYvURa7sncjcbtr+ZI4SxCF+62vP6QypZA1q1GjdEK++83tDZpFzW/LCcTfHw==
X-Received: by 2002:a05:6402:5c9:b0:446:fb0:56bb with SMTP id
 n9-20020a05640205c900b004460fb056bbmr40659839edx.173.1662295419327; 
 Sun, 04 Sep 2022 05:43:39 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 lc18-20020a170906dff200b007307c4c8a5dsm3663916ejc.58.2022.09.04.05.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 05:43:39 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 14:43:15 +0200
Message-Id: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zsKBI1wmYsEnALSnb2dQBP2ScHCz2qv1xGG2HK9nqYM=;
 b=NzvyIQvzTdxe24v/5MUIW86t0LwFir2EyEpKbtuH1nXFbDEu6kAYfn2hUtw9hlm7Iw
 B3s6kkEiz9YvipqpCaDNdmCGgRBKYhV3/oGKBCMxA2+PPPTZxUKVJTCMPSHI5MdLv4z8
 P/LLdnDBo8N8IdeCm6jWP44X4QdMSK/X4ToUVVW9/KFAyhAo4isxUgS74qV8GoIm5tTB
 C3nqtZiANEBZ6IDdbkFbIwil49hzV0HU2u2xj6RFXUQ48O/0lESwH2Y8ZeXQOmlXfxUj
 9ph8ItkiDroGxJSO6AWFhbDL+b8yzZwQ2E8sFHn6kvGVOjpoRdfYSDoX1o/tEusLXEvx
 lwFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NzvyIQvz
Subject: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shadow provides utilities to deal with user accounts.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v1 -> v2:
- DEVELOPERS: add Raphael Pavlids for shadow

 DEVELOPERS                 |   3 +
 package/Config.in          |   1 +
 package/shadow/Config.in   |  81 ++++++++++++++++++
 package/shadow/shadow.hash |   3 +
 package/shadow/shadow.mk   | 171 +++++++++++++++++++++++++++++++++++++
 5 files changed, 259 insertions(+)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.hash
 create mode 100644 package/shadow/shadow.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..38c25a0ae2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/shadow/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..c13ba09056 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2635,6 +2635,7 @@ menu "System tools"
 	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
+	source "package/shadow/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000000..616f002618
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,81 @@
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
+	default y
+	help
+	  Enable shadow group support.
+
+if BR2_PACKAGE_LINUX_PAM
+
+config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
+	bool "account-tools-setuid"
+	help
+	  Install the user and group management tools setuid and authenticate the
+	  callers.
+
+endif # BR2_PACKAGE_LINUX_PAM
+
+config BR2_PACKAGE_SHADOW_UTMPX
+	bool "utmpx"
+	help
+	  Enable loggin in utmpx / wtmpx.
+
+config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
+	bool "subordinate-ids"
+	default y
+	help
+	  Support subordinate ids.
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
+config BR2_PACKAGE_SHADOW_NSCD
+	bool "nscd"
+	default y
+	help
+	  Enable support for nscd.
+
+config BR2_PACKAGE_SHADOW_SSSD
+	bool "sssd"
+	default y
+	help
+	  Define to support flushing of sssd caches.
+
+config BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH
+	int "group-name-max-length"
+	default 16
+	help
+	  Set max group name length. (0 equals infinity)
+
+config BR2_PACKAGE_SHADOW_SU
+	bool "su"
+	default y
+	help
+	  Build and install su program.
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
index 0000000000..140d830cb9
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,171 @@
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
+SHADOW_CONF_OPTS += \
+	--disable-man \
+	--without-btrfs \
+	--without-skey \
+	--without-tcb
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SHADOW_CONF_OPTS += --enable-static
+else
+SHADOW_CONF_OPTS += --disable-static
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+SHADOW_CONF_OPTS += --enable-shared
+else
+SHADOW_CONF_OPTS += --disable-shared
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
+SHADOW_CONF_OPTS += --enable-shadowgrp
+else
+SHADOW_CONF_OPTS += --disable-shadowgrp
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
+SHADOW_CONF_OPTS += --enable-account-tools-setuid
+SHADOW_ACCOUNT_TOOLS_SETUID = \
+	/usr/sbin/chgpasswd f 4755 0 0 - - - - - \
+	/usr/sbin/chpasswd f 4755 0 0 - - - - - \
+	/usr/sbin/groupadd f 4755 0 0 - - - - - \
+	/usr/sbin/groupdel f 4755 0 0 - - - - - \
+	/usr/sbin/groupmod f 4755 0 0 - - - - - \
+	/usr/sbin/newusers f 4755 0 0 - - - - - \
+	/usr/sbin/useradd f 4755 0 0 - - - - - \
+	/usr/sbin/usermod f 4755 0 0 - - - - -
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
+SHADOW_SUBORDINATE_IDS_PERMISSIONS =  \
+	/usr/bin/newuidmap f 4755 0 0 - - - - - \
+	/usr/bin/newgidmap f 4755 0 0 - - - - -
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
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SHADOW_CONF_OPTS += --with-libpam
+SHADOW_DEPENDENCIES += linux-pam
+else
+SHADOW_CONF_OPTS += --without-libpam
+endif
+
+ifeq ($(BR2_ENABLE_LOCALE),y)
+SHADOW_CONF_OPTS += --enable-nls
+else
+SHADOW_CONF_OPTS += --disable-nls
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
+ifeq ($(BR2_PACKAGE_SHADOW_NSCD),y)
+SHADOW_CONF_OPTS += --with-nscd
+else
+SHADOW_CONF_OPTS += --without-nscd
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SSSD),y)
+SHADOW_CONF_OPTS += --with-sssd
+else
+SHADOW_CONF_OPTS += --without-sssd
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH),0)
+SHADOW_CONF_OPTS += --without-group-name-max-length
+else
+SHADOW_CONF_OPTS += --with-group-name-max-length=$(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH)
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SU),y)
+SHADOW_CONF_OPTS += --with-su
+SHADOW_SU_PERMISSIONS = /bin/su f 4755 0 0 - - - - -
+else
+SHADOW_CONF_OPTS += --without-su
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
+	$(SHADOW_SU_PERMISSIONS)
+endef
+
+$(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
