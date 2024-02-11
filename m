Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABC8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4351884D9E;
	Sun, 11 Feb 2024 21:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpOLZVlTdXuF; Sun, 11 Feb 2024 21:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6034984E10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6034984E10;
	Sun, 11 Feb 2024 21:47:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBF71BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84936408D7
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_ieieGcjPqg for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2326A4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2326A4011D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2326A4011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:47:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4109b23a227so8852175e9.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 13:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707688073; x=1708292873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SflH2bRQRFM5z/drv+xRlJ/USUnhCijqnY+fy3grAxo=;
 b=wMZ/X1weNx88GHcCe3NdJwv1k/STdQjkyJBQXHsL6A7mSYUsMRaBgHGNGy0cxV78Zn
 Diicf8gVxUJbUkft9aHNYcYvPGFwxKXYiiKbOlX6p/pyefQhnSnhEGmJY3JVLnsitDGR
 SpnuTAjYIvdty0wkfJRgIFmD0kieDiM+FWhfsl6zN4nouM48qeroXkgdrbvheHcDWc4i
 gyR+VSverWE10k1kfjnpo5g8F5kHvziiH57kL6/Rbm4yEhDJ13g5yX3jevQfS8BIMKIr
 QLGnP2TtkEVXgL9fFdvUwFufHwKf6CqKgfUJqdrZEPDsXbXch5Cd+gjN4bQb3F0q4EGw
 Iu/A==
X-Gm-Message-State: AOJu0YxkuHETx5sHBByuH2sSuWNcW2TH9JaVvi6qxcJHEhChFgWJi0Xf
 sUouDZ3owc4d55w/voTU+KLtaPjhoRyEkIIXd5NK5BFHIk86qVY4mTh/3kom7MY=
X-Google-Smtp-Source: AGHT+IFeo7DlTbn4b0Qd1tyBuvheCN64SFTz8jEsUfIU23Aa/WLdMEWs8zc6FdD1H+P2wr6EkZoPGQ==
X-Received: by 2002:a05:600c:4fd0:b0:410:d3b8:9f9a with SMTP id
 o16-20020a05600c4fd000b00410d3b89f9amr800011wmq.5.1707688072964; 
 Sun, 11 Feb 2024 13:47:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVk3t1l3VfU7EdgNK0ZZL3+j3DcyqKFt0LygFTueqcQObAumtjkuX6TW2/xhqiPHYDGLme1qOr+5+/nyVR59j/55CReMCiT1g7sEQ==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q18-20020a7bce92000000b00410c04e5455sm2224386wmj.20.2024.02.11.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 13:47:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:47:51 +0100
Message-ID: <20240211214751.2522403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707688073; x=1708292873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SflH2bRQRFM5z/drv+xRlJ/USUnhCijqnY+fy3grAxo=;
 b=VSHr67ifcJRHRAPISsqOFA1wQT24tBF4Q2zoTPjF+CDdvIaBdEpjqIdOBQyAc9LxPJ
 5d40YrkYQLyJIZ6+PI8xczTIBUJhGzGV1PHtBDHmW5jEi+01DJh97G2imzrxCsN1KCob
 pl/vC9PrxuzRW0QRPFA8F4B//0xlEVx9e3vcDgOF+QtWBnaAqw2PUFX79IdWpxrjcdOp
 qtOOg0d1x9OgLf/i4Xn/02DDvq6N1H544yakvSwUjCfXH1mgVExHmgBtfEpJTzYeTm2h
 30/ynGp2j03A8LH0La8YvKXZhok8HToRm2Fm/0+R4nfYYqCzY3KxUZ1u2d2zKRB5Dr4j
 GLRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VSHr67if
Subject: [Buildroot] [PATCH 1/1] package/shadow: drop
 BR2_PACKAGE_SHADOW_UTMPX
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

utmpx is not available since bump to version 4.14.3 in commit
8a01774d9897310c00a0945865f5a6d5167dfca3 and
https://github.com/shadow-maint/shadow/commit/3be7b9d75a6b73fe24394d7ac1e315d60d45b5ee:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-utmpx

Fixes: 8a01774d9897310c00a0945865f5a6d5167dfca3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy         | 6 ++++++
 package/shadow/Config.in | 5 -----
 package/shadow/shadow.mk | 6 ------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a869279af7..576148c4af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_SHADOW_UTMPX
+	bool "shadow utmpx removed"
+	select BR2_LEGACY
+	help
+	  UTMPX has been dropped by upstream.
+
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench removed"
 	select BR2_LEGACY
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index e85e5884d2..230271af7d 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -31,11 +31,6 @@ comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, local
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
-config BR2_PACKAGE_SHADOW_UTMPX
-	bool "utmpx"
-	help
-	  Enable loggin in utmpx / wtmpx.
-
 config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
 	bool "subordinate-ids"
 	help
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 03eb16a3f4..1e7ada6148 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -43,12 +43,6 @@ else
 SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
-ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
-SHADOW_CONF_OPTS += --enable-utmpx
-else
-SHADOW_CONF_OPTS += --disable-utmpx
-endif
-
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
