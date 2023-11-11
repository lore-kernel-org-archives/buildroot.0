Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14DCC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 16:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1677B41ED8;
	Sat, 11 Nov 2023 16:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1677B41ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AluCb5ABEws; Sat, 11 Nov 2023 16:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4592341E8A;
	Sat, 11 Nov 2023 16:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4592341E8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 581201BF38A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CC6D40A92
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC6D40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tvt11ksns9t7 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 16:19:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D190D40191
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 16:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D190D40191
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso2982385e9.0
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 08:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699719580; x=1700324380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1m7pgoZFOkLRCRyWwvENrkSwwUBIgGyIXKaDwEjimCM=;
 b=SyqEL8l8mxHiBHRsUkw5fby04/qiDt8w7CzBdYWyk6vOUVawBoBJ2n1s06NoofLUFl
 GFQNGccThISInuh6sHiRzMatjuapbfNd5ed6dlYRR8AGCHSvZLHGcMLoxVuaguMgEYBb
 7yaNLTpzKUMFVaZSsjjkGMDZEhmfZGhs/OPIg5NByPM8Mg3HGo6bR83ZjkwfvBAMM3df
 X4hDRNF1EERhES3YHUWCN8Z/1aIVxDAdcghHXWyufqo+raxyluzhh3QW9ijnlA2NijRX
 a/PUwh6EpWP4tVLSMMAsxhwIDm/YeuajLs2P86Lp6VKaRLaarc1InKkwRwWpC+1CW2FM
 6eUg==
X-Gm-Message-State: AOJu0YyU4OBYMNZZ1IRaK/dZ3hYXPYCgCwaKtxJuPmmlOwzv75Bd0Dqi
 e0XFXDa7aluEovhdgPZgSiQI7moWPMWghA==
X-Google-Smtp-Source: AGHT+IHFaYmm11AdXJ8Cuuny/mX/1Q3ZLtlyO+UmNStcZUkOTsVAdmbBXhElu1n2hYYfKeWbXDubqg==
X-Received: by 2002:adf:fe8d:0:b0:319:785a:fce0 with SMTP id
 l13-20020adffe8d000000b00319785afce0mr1327674wrr.26.1699719579919; 
 Sat, 11 Nov 2023 08:19:39 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfd:ab02:5d95:c69d])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adff246000000b0032da40fd7bdsm1743380wrp.24.2023.11.11.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 08:19:39 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 17:19:31 +0100
Message-Id: <20231111161932.914611-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/2] package/libsoup3: bump to 3.4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.3.news
 - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.news

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 01313b394b..11e48b42aa 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.2.sha256sum
-sha256  78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3  libsoup-3.4.2.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.sha256sum
+sha256  291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa  libsoup-3.4.4.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 9e66b6ebd2..76105cec4e 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.4
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).2
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).4
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
