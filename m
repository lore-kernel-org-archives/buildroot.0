Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC4BC021A7
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 04:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D23D40561;
	Thu, 13 Feb 2025 04:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtoXfuEu6yBV; Thu, 13 Feb 2025 04:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B8E404DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B8E404DE;
	Thu, 13 Feb 2025 04:51:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB2C2C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 960CA4030C
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fHKaob2Z3zh for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 04:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C36E400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C36E400E6
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C36E400E6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:51:25 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6f9cc6fefa8so3271027b3.3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 20:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739422283; x=1740027083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fYbaQaa0ihUNPL5i4FDj8uO3b8Dee/bAC2mnEHCpOE=;
 b=dMb9ANLM/gqYdpB6LlCLdYmcTevuClc5Q5Np63gAz1aIIdyfsNssiQqT2y8L5U5DZJ
 eNM0sXVWCEA4EnS8SwhYps72xJnIkyvp0S24WO9KN8t6NVAZ5dycDGFIyGRMsR5s8ZYh
 FooUBsHrA6BqOyl2hdd2tpf0QxaBHWwVw+Pt2bufqva4+tu3voro/bGM6rkbQPh0Guet
 Qx8Q++cU36KqJEWStuM4g3+ZsInBBbOW4doWTNSJHyay/vPmTnAIzlNDtWyFpGM6Dsee
 u1Nw+qB6k4QxYgwV9bqEGyHgz/Sqk5k6AJVPooZxrdtZHT/yJtyodiETNyB5Sn6M2mD/
 aqMA==
X-Gm-Message-State: AOJu0YwbZwsPjPkiodTAbBnl/H8rwm5KnK2Ve13T/EcaQpsyynyqJa+J
 NgK/Js6MSFMLy8yYyb9w/A+jSHmKXAD5Slk23YDIQZ0TCk9dPMQ/X3LYkQ==
X-Gm-Gg: ASbGncsbgER5Thw/WMPws543bshxJnjLTBtbmw3VewKIYGDrf+3+Ts/Jwd2CubZAzRu
 /aCEWix8C5jcCcySoVfB2xrQ/0LWBvtPx31Zz0poSIQpMUv5pdY5xn1X4ul4VjszZHxUQ+fM/vJ
 smQUFY0mZvYkAWt77KU03HTDR3DFD7ZPOprueaYVoQi0pYtClzczYxWzXQLEptjPFEKXD7FOtMF
 hJ855LWJYiQHbkwXzvbU+JP8z1a5qBiCz2UWzc8PuFQ0SMSesAo/JH3udE2la5X8wrKO5Etq0aD
 RG1KkEB0F9im
X-Google-Smtp-Source: AGHT+IFB9OlUswKMJv6PUSPoO8cVrQiIN/+XXmyUHiKrLVSFanUc/lCDQ1d/h5A2A1VFJm8GfGVhpg==
X-Received: by 2002:a05:690c:9983:b0:6f7:409c:f645 with SMTP id
 00721157ae682-6fb1f171dc7mr52595157b3.4.1739422283066; 
 Wed, 12 Feb 2025 20:51:23 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fb3619baf7sm1356937b3.71.2025.02.12.20.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 20:51:21 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Feb 2025 12:50:48 +0800
Message-ID: <20250213045050.816782-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212135027.759121-1-fancp2007@gmail.com>
References: <20250212135027.759121-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739422283; x=1740027083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fYbaQaa0ihUNPL5i4FDj8uO3b8Dee/bAC2mnEHCpOE=;
 b=i8o8VZy3wBHR5cUSsxgd6y7QYxDx5/Tzi/YMsOHdMBG23KEGBjCFQ5hjja+ziCVtPp
 ewO0JeYbEgcjC7jpZEOCE66bznb2rEB19XnWJrRCX2cpjJ9ZhhZQbb9vvO3AMeqwTF66
 fAKksvm84YwrqY316QJGLzN1vKc1bQdU/XQgZIe0wQfEpkreKOEzDuOSxCOFoUgp6V7j
 3FvJcjNneEWgWj1Vyl1jH3eozm2fjMZ6fj7ChPsqvBgKUKPJ0arOlVuxG38dMJ9E/IdY
 pwr+CfZk9jhnHqWbOLTGyGn9NLxpzMs4hnJJisnGjLbBdn3P2/T38P5VcO45RL8q8NPw
 daDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i8o8VZy3
Subject: [Buildroot] [PATCH v2] package/sqlite: fix build issue since bump
 to 3.49.0
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

The "autotools-package" and "host-autotools-package" lines are no longer
available, so those have to be replaced by the "generic-package" and
"host-generic-package" lines in the .mk file.

The Autosetup configuration script does not support the
"enable-dynamic-extensions" and "disable-static-shell" options,
so the relevant lines in the .mk file are removed.

The Autosetup configuration script can automatically detect whether
threads are supported and set the relevant SQLITE_THREADSAFE flag,
so the relevant lines in the .mk file are removed.

Fixes:
  https://autobuild.buildroot.org/?reason=sqlite-3.49.0

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - add the 'host-generic-package' configurations in the .mk file
  - remove the thread-safe related configurations in the .mk file
  - update commit message
---
 package/sqlite/sqlite.mk | 82 ++++++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a23f6e1d66..5a8b033ce0 100644
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
@@ -50,30 +42,64 @@ else
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
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-SQLITE_CONF_OPTS += --enable-threadsafe
-else
-SQLITE_CONF_OPTS += --disable-threadsafe
-SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
-endif
-
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
+define HOST_SQLITE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+		--prefix=/usr \
+		--host="$(GNU_HOST_NAME)" \
+		--build="$(GNU_HOST_NAME)" \
+		--sysroot="$(HOST_DIR)" \
+		$(SQLITE_CONF_OPTS) \
+	)
+endef
+
+define HOST_SQLITE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_SQLITE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) DESTDIR="$(HOST_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
