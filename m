Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FB4C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 13:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A9881266;
	Wed, 20 Dec 2023 13:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A9881266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-yp4Qx7dcyS; Wed, 20 Dec 2023 13:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA57681253;
	Wed, 20 Dec 2023 13:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA57681253
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19AA91BF292
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 13:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41748124A
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 13:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41748124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1w4Mvycp5qlV for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 13:48:29 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90B9981220
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 13:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B9981220
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-77f642b9a22so56619085a.0
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 05:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703080108; x=1703684908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWMlkE1txMlJuI/DT3y1OcsXldEvdhsg2R6a9lWSodc=;
 b=R28AsPaUhlPf8PyXDgcBAkPUpflOTMRGLWBWww8RJm8IDHtd4hDNhkJTtRB2KOZ3W3
 8uH0ovvznBeJ3nh0t3ivsX6OcNzsDd2Q7+KXdsYzHBKfppVye8KXoqJXTRyH104f7Cds
 cGicgQFAl+V0NgQ5Bh+Ylsg0TLgNu+hu1px4rvzs6o4sQ7LZdTFAE6H/+cZte4D9tKwy
 WQ08yylpNon6naoWz5/42mQpJLEUgp8gTLpvpjy+GmnRCceP4t5/igxwxDwlGUnS1Kol
 APSJqzcTH4bQwUb+vFB1pFhRMM3YtfnK7xsiLXEpSu2EwEYwX+Lk/fL0GqFfWLISfspP
 JRyQ==
X-Gm-Message-State: AOJu0YyLZvdfECRAxeYaZeBcscHETgb9FXgouJ7sRRA16DsE7fb+/znj
 vdua7SfsFd1dX9JJAjtRan/ESqUXGlUCwA==
X-Google-Smtp-Source: AGHT+IEKJGw56rEJWg1OAJGsMwUNt9UJ9OewNru6enCbmiZkj4/JyBc81bV2fVwjb42cCWceRHLMcg==
X-Received: by 2002:a05:620a:1671:b0:781:149c:54d3 with SMTP id
 d17-20020a05620a167100b00781149c54d3mr834636qko.55.1703080107834; 
 Wed, 20 Dec 2023 05:48:27 -0800 (PST)
Received: from user-VirtualBox.. (c-68-55-200-113.hsd1.mi.comcast.net.
 [68.55.200.113]) by smtp.gmail.com with ESMTPSA id
 wa2-20020a05620a4d0200b007810de6a161sm645253qkn.55.2023.12.20.05.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:48:27 -0800 (PST)
From: "J. Langholz" <jlangholzj@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 08:48:14 -0500
Message-Id: <20231220134816.6306-1-jlangholzj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703080108; x=1703684908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yWMlkE1txMlJuI/DT3y1OcsXldEvdhsg2R6a9lWSodc=;
 b=Fc9dNSWc26IEVFQqpbAharO5qSwFnuEWwD2tPDI1ANrnbQEu8scPa0n1ClA1wBNO02
 hKsiVVt6GTiJ7VjRuGDhi3OwPWmhskh9QOFJRg+C1b/6Wvs7xk35xigcNOfKB8h6ptNA
 SiIN8BBtE3H8IeNKdBtV0hasCoKeng3DjR1UK1KiPfnaxBifXYo7ULhXhERTNBbolwgN
 6PPt1jSFlz9s+3kCsqGjxUCIlWeOkjbi8QupSfaJe1uchPImLRpT+5uTK/x9b49xmz45
 h6g09o7t2yxzN/+V7UjYB9BHqh2IiENJsaBgtsqXcRFlg8wevUMcUp+CLFP7+FtX/W9N
 sHrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fc9dNSWc
Subject: [Buildroot] [PATCH] package/python3: add tk as core module
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "J. Langholz" <jlangholzj@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/python3/Config.in  | 6 ++++++
 package/python3/python3.mk | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 38f0580aa4..65afd4e6e2 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
 	help
 	  SQLite database support
 
+config BR2_PACKAGE_PYTHON3_TK
+	bool "tk module"
+	select BR2_PACKAGE_TK
+	help
+	  tk (a.k.a. tkinter) module support
+
 config BR2_PACKAGE_PYTHON3_PYEXPAT
 	bool "xml module"
 	select BR2_PACKAGE_EXPAT
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b9c5054a21..ca797f8cda 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--disable-sqlite3 \
-	--disable-tk \
 	--with-expat=system \
 	--disable-curses \
 	--disable-codecs-cjk \
@@ -114,6 +113,13 @@ else
 PYTHON3_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_TK),y)
+PYTHON3_DEPENDENCIES += tk
+PYTHON3_CONF_OPTS += --enable-tk
+else
+PYTHON3_CONF_OPTS += --disable-tk
+endif
+
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
 PYTHON3_CONF_OPTS += --disable-codecs-cjk
 endif
@@ -184,7 +190,6 @@ PYTHON3_CONF_OPTS += \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-	--disable-tk \
 	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
