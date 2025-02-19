Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899DEC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D36B40D8D;
	Wed, 19 Feb 2025 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZONRHvTImhUr; Wed, 19 Feb 2025 22:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FEA40D9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FEA40D9D;
	Wed, 19 Feb 2025 22:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBDE0F12
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB0498354D
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sLqs8r1R6tD for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D10983578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D10983578
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D10983578
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f265c6cb0so136504f8f.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740003035; x=1740607835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1+Z82dTkThtbjg5z4GpMvr7DlkZZy5x36k2jYa/OyHM=;
 b=j9+abbT6bFBcwz4CX0E23PKeUchWDMwJQEN6zVYz2c+JIkmbgqUD4xfcVrg+pNyYF/
 8aS/PUaJ6xIo0kAnSfRGeSMhqVeRqCaC7cXjbR6Gc+V50cgOa2a5FjSUmHyAyCWjqE48
 LvP2Ls+nSDI7dxuuxvIoaIGPBpiZcS+X71Khu6gmQH0XzaE+V1UytRl19D2BJXAS++y2
 DQSdx6JkSvbehT89kwBDkutA4dD6Wr6pEgem8whH29zsCq3Yu7T+zX+HXiLLyfK+OVVr
 sTQjwJc0cGGjNMQuSzZt9ITq7Z5xmWv37iBN02RrhPmIBe2UzQftLs0FyMeeUR/ZXv1c
 9UNA==
X-Gm-Message-State: AOJu0YxGGmFM6KNEJ/+mma01nRMk9U/fVnV8Q3pV80H5XsSQkTauwqLv
 5RhBZfBNpWiRal1Ip1ft6t7/ATVQWHuwY2C0atM9O6jYeF9twJDPludg1Q==
X-Gm-Gg: ASbGncsdqIAjHvdk9yaSO1w7Tr0GwRYlXq5+10tDH9Tr1+TU+kepc/NGKcR8SjksVMj
 dDVp0OyJfPWG+9a7HO+lhDXSN9RjBrzx7RVttT+lBtAaH2ZQKWl+YaGAaPo9sCP/AxqOl6fG9nr
 DUh2afNLWccQTKb65VOpQketkQ34D50MFX3hDWLrn/R2g8S7ahYPoo3uIcAZFs42t9/e5Rz3HJC
 zy94Jrtxe+tkUJejr5C00oGcBkuUlCaOSyKy2PNY1jVxDECYtOLrxhVgL3G6t4By6QeU3TmtgCg
 rswi/p+dxXV/6upDojYGcWgW+A==
X-Google-Smtp-Source: AGHT+IHX32NmfujpBBL2y2sSVGj8YouTT+y23JTJbVwg5gAOMue0IlifJkPO2R/8/DTiXAjKmvHMaw==
X-Received: by 2002:a5d:5f45:0:b0:38d:dffc:c133 with SMTP id
 ffacd0b85a97d-38f33f4b882mr20159708f8f.44.1740003034967; 
 Wed, 19 Feb 2025 14:10:34 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8443sm224799365e9.35.2025.02.19.14.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:10:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Scott Fan <fancp2007@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 19 Feb 2025 23:10:32 +0100
Message-ID: <806968c61a8cb626a63149dfbe9fae40b88b4409.1740003029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740003029.git.yann.morin.1998@free.fr>
References: <cover.1740003029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740003035; x=1740607835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+Z82dTkThtbjg5z4GpMvr7DlkZZy5x36k2jYa/OyHM=;
 b=RxFcYqIQNkWSag4SQNxQvN+S+5FxNbj470Ump23SxlaymnaeLVChET0upoPep/eLMv
 Vv64hMm9+CeWvdB8qI8pSCnTShgLKw4GKU3EvjJwdyXO5dUDwRCx4v3YNIxKNe50ojwM
 Hme9cGX9VJ8ezo6eWJ/uniidWnY9NCd61WQR6yXNq5cL9ZusvBGWKwGAX5FtMpRzV+UG
 KP46IkVNe7TAo2MyXbZhSHA+XuonFNpoLXQaYSScgYB2Z6105KFyJPfUTiKNuOmzm+SN
 EPRXjVE8SCNU9nzfsrVCLJKHRfLwTq1DB6121wJjQR3AqL+Ri/eztkj38HLubNwnYjJh
 UCeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RxFcYqIQ
Subject: [Buildroot] [PATCH 3/4] Revert "package/sqlite: fix build issue
 since bump to 3.49.0"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit a93680be30bc35f7d2465ef576035fb937ea1d64.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/sqlite/sqlite.mk | 82 ++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 54 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5a8b033ce0..a23f6e1d66 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -21,6 +21,14 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
@@ -42,64 +50,30 @@ else
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
 endif
 
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
+else
+SQLITE_CONF_OPTS += --disable-static-shell
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+SQLITE_CONF_OPTS += --enable-threadsafe
+else
+SQLITE_CONF_OPTS += --disable-threadsafe
+SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
+SQLITE_CONF_OPTS += --disable-editline --enable-readline
 else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --disable-readline --editline
+SQLITE_CONF_OPTS += --enable-editline --disable-readline
 else
-SQLITE_CONF_OPTS += --disable-readline
+SQLITE_CONF_OPTS += --disable-editline --disable-readline
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
-SQLITE_CONF_OPTS += --fts3
-endif
-
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
-SQLITE_CONF_OPTS += --disable-json
-endif
-
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
-
-define SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
-		--prefix=/usr \
-		--host="$(GNU_TARGET_NAME)" \
-		--build="$(GNU_HOST_NAME)" \
-		--sysroot="$(STAGING_DIR)" \
-		$(SQLITE_CONF_OPTS) \
-	)
-endef
-
-define SQLITE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define SQLITE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
-endef
-
-define SQLITE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
-endef
-
-define HOST_SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
-		--prefix=/usr \
-		--host="$(GNU_HOST_NAME)" \
-		--build="$(GNU_HOST_NAME)" \
-		--sysroot="$(HOST_DIR)" \
-		$(SQLITE_CONF_OPTS) \
-	)
-endef
-
-define HOST_SQLITE_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_SQLITE_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) DESTDIR="$(HOST_DIR)" -C $(@D) install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
