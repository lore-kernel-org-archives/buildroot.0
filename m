Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FF0C001E0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A1741565;
	Mon, 23 Oct 2023 09:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A1741565
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6il-llkAsDwz; Mon, 23 Oct 2023 09:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A1F40A94;
	Mon, 23 Oct 2023 09:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A1F40A94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2191BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBB181026
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBB181026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaMZgWFd5gDS for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:14 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 406A381006
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 406A381006
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso25033925e9.3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053112; x=1698657912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2KDR6P7UsuSt9LIkauY8PyPaqSacQjk7QNLzQ7nixE=;
 b=CgoJTFtc2n27aPPqdBP2WPftRwRAaKbKW1/HI2cRlxbSha3yiHANHxBdk5s4j/XBlx
 IqeTCla2Aa6QhdubgvkOmQ8BRMy56y0GNk7cCQcVs/pALICfhrA1BEE+Dr06v49KA1vs
 sgAviFVVZs+NJ0MCmHDNM0LAraGKYPNOWaNaWAbHQl50JzKuXrm9Y4uQ/5o5NAxSQeuk
 D3UYIbSvSZUXp/bqsNlfJYIq+QQmahjPWJGpO6bl5x2cv1q4uhe/ccbawQOdYTgU6+Qq
 UZEwcq+eL3w+OH25YAc7jvuSFL+/oayy6P3DHejiPf3BrklG3XJiijQdtJvny5L36EuI
 Jy3w==
X-Gm-Message-State: AOJu0Yzcfcynxla9zNvzHRrDyxSwhM7qQKrxq6mgjf+mK+Ycpm23Exxo
 zE2/Y/Z0RL4mDtZXsHwPr1+SjQ0TMbA5K8octL2TMf3x/pTyXA==
X-Google-Smtp-Source: AGHT+IHxRfLA+v1Zrvw3c5qeQVXm14RU3+QlLpgqfvDkDYiUo3lz+hXzgxIcI27rl0TxYJwY9zmweg==
X-Received: by 2002:a05:600c:9a5:b0:406:599f:f934 with SMTP id
 w37-20020a05600c09a500b00406599ff934mr7463106wmp.12.1698053112197; 
 Mon, 23 Oct 2023 02:25:12 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:25:01 +0200
Message-ID: <20231023092501.481436-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053112; x=1698657912;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2KDR6P7UsuSt9LIkauY8PyPaqSacQjk7QNLzQ7nixE=;
 b=rZ0PwFYVIxwTDU85Y68v6kZbih/8U1UqhHlvYQg8Q5OhOnjFuqzsIPl8FabY2VBdE+
 3rBHWNGCGMxlF5fYNzqaYMH0ba0I32ZUvfQeU3XUrYxG0Mg12u7EF6kP5Kv5fEiqdIuQ
 7RIcSAlrEmkuNfnPEQgAzb3NcN07VcVyXehUQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rZ0PwFYV
Subject: [Buildroot] [PATCH 8/8] package/opkg: add sha256sum support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/Config.in | 5 +++++
 package/opkg/opkg.mk   | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index adf39ca145..0104f48623 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -36,6 +36,11 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
 	  Enable opkg package signature checking support using
 	  gnupg/libgpgme.
 
+config BR2_PACKAGE_OPKG_SHA256
+	bool "sha256sum check support"
+	help
+	  Enable sha256sum check
+
 comment "compression support"
 
 config BR2_PACKAGE_OPKG_BZIP2
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 730aa4cfe7..ce0b74f549 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -38,6 +38,12 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_OPKG_SHA256),y)
+OPKG_CONF_OPTS += --enable-sha256
+else
+OPKG_CONF_OPTS += --disable-sha256
+endif
+
 ifeq ($(BR2_PACKAGE_OPKG_BZIP2),y)
 OPKG_DEPENDENCIES += bzip2
 OPKG_CONF_OPTS += --enable-bzip2
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
