Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210D7C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 13:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DCFB605F4;
	Wed, 12 Feb 2025 13:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhnNllclCpch; Wed, 12 Feb 2025 13:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5763C60901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5763C60901;
	Wed, 12 Feb 2025 13:50:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A135C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D394066D
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi2gcmkRByrO for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 13:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1810A4066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1810A4066B
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1810A4066B
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:50:45 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6fb0de4ecd4so19108817b3.3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 05:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739368244; x=1739973044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d4fcKT9S4XeHOMLN3SB8cWeVPJLMOFmCAuvkPAA6WzE=;
 b=kmcliBJodCd2POwA36UoTA6RVBnDXbgZYdZsIFQVbnXkMR26YA02knpUPLUFJYBAUg
 LAYsnKR7uhzPaH6FebFX3bU1iyQiRRyfWR9E8Hm02T6kr7FfHNtNDCZeB8oSJHqsejqT
 DeqWKP5pXypYIJUbOFW3Qvj4G0mKluE1jAahCGEEEv36RkA8oEtELRV4J/lqavntNlKc
 5DGUGQMSCceHs5F8NXowPKt7LdB+Gqq/iKMT+IRSrY9kt7FweydccoKZo3Uf4tTDMSQn
 hanOL2hS6a0jZyMwnjSVBwhVn7QaiPLmFGR3ITRAmNq3tkCnxosQkn1W/dAy8Zz/m9rw
 AU0A==
X-Gm-Message-State: AOJu0Yyco14ov0AQ6AmVkyyPJ2ij87ApPo95vzFyVNq+9CYvCMQxC9v0
 syV6ucGg/XYPGAk51T4NdPpj9rXObXyup2yrHVsB5j2b87wJP65fwLzGUw==
X-Gm-Gg: ASbGnctAl+sJwf1GzvNCFpbnucBV7pC125TP4C/PiN9QXQG4R/CIFSB3eFCLJv7iQ6v
 5jYxzuGHSEgUy5pGZRucuN3rJI+Tb3iYSeNWlOgFsM2y1Nc/GBBvwkYglsWIc50tdQ2iBfAZbaQ
 XPmZaDjeHrQ3GdCEYer/j947KHEwhjG286X6bVaGcaiqHz9ztm+pIJK1ljZEzNdROEC53E76vw5
 JnBdOglp6zhKmLYGBlO8wx85bdqoaee7MqRJMlTwU22dTdE7feFtkCF3Q9HYWOJfQVZClhOphwT
 oNLrAgwToQug
X-Google-Smtp-Source: AGHT+IEfmUASJ8E5zTzOHm7WWFV5FhIfqnGJdaCUrXqC4B+Lw/SJRDgD6Yy44jaTVmpjUjdUPiOw6A==
X-Received: by 2002:a05:690c:4481:b0:6f8:3a62:31a with SMTP id
 00721157ae682-6fb21c254f3mr27902407b3.30.1739368244397; 
 Wed, 12 Feb 2025 05:50:44 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fb3013851bsm174937b3.9.2025.02.12.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 05:50:43 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Feb 2025 21:50:25 +0800
Message-ID: <20250212135027.759121-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739368244; x=1739973044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d4fcKT9S4XeHOMLN3SB8cWeVPJLMOFmCAuvkPAA6WzE=;
 b=FhjF+uy44hmay4eUgcRpjyyHNloDtJ/XH//NFgSNPEaadug69hiS4o9HIkYAg8LrC4
 AbDCVhMX+nZ8DiuGfmXhZ6m7Y3B2jomqNjCaCtkfd8IacMBKnjO5zFDSNksw34IY9pla
 P/V7+cCJqh6RcC1F1hJTlopxlUsRYEauTja4N5i8CLzeobD8nIcQQOuGYxMFPHzBARue
 dvWBWmMO4IPrh9zZ22sT0y+flUdyJB74mMPimg+dJ07Um1DWypRFKPKMCSUyMoHrakQn
 lAsTISrCu+eyXmuTXCpsPkd1eqvJ79ruYo3FWXSRoKLT0+WlHhmTlu1mcZl6RwxujygE
 qm2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhjF+uy4
Subject: [Buildroot] [PATCH] package/sqlite: fix build issue since bump to
 3.49.0
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

As of release 3.49.0, the author has replaced the configure script used in
the precompiled amalgamation tarball with Autosetup instead of Autotools.

Fixes:
  https://autobuild.buildroot.org/?reason=sqlite-3.49.0

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/sqlite/sqlite.mk | 59 ++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a23f6e1d66..30385f9821 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
 endif
 
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
-endif
-
-ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
-SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
@@ -50,30 +42,51 @@ else
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
-
-ifeq ($(BR2_STATIC_LIBS),y)
-SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
-else
-SQLITE_CONF_OPTS += --disable-static-shell
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-SQLITE_CONF_OPTS += --enable-threadsafe
+SQLITE_CFLAGS += -DSQLITE_THREADSAFE=1
 else
 SQLITE_CONF_OPTS += --disable-threadsafe
-SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPTS += --disable-editline --enable-readline
 else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --enable-editline --disable-readline
+SQLITE_CONF_OPTS += --disable-readline --editline
 else
-SQLITE_CONF_OPTS += --disable-editline --disable-readline
+SQLITE_CONF_OPTS += --disable-readline
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
+SQLITE_CONF_OPTS += --fts3
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
+SQLITE_CONF_OPTS += --disable-json
+endif
+
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
+
+define SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+		--prefix=/usr \
+		--host="$(GNU_TARGET_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(STAGING_DIR)" \
+		$(SQLITE_CONF_OPTS) \
+	)
+endef
+
+define SQLITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SQLITE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define SQLITE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
