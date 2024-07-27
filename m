Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE0AC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E890340730;
	Sat, 27 Jul 2024 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8ku1OHtlvhB; Sat, 27 Jul 2024 16:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B527F40750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B527F40750;
	Sat, 27 Jul 2024 16:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF2961BF82F
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCB22401FB
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwKr8fS4F5o5 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 16:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8230C400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8230C400FE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8230C400FE
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 16:57:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso2737205e9.2
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 09:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722099439; x=1722704239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRvNhOtlo6jwyXepkvoyF9rnBszdCNPKmGJ/1XDkUoA=;
 b=xTrwAFXMxL6cHzoNVQni7paD+iIFaxqUw1/P8QLyaWde8sksMK4zW0L/Vpsd1mKjwq
 WG2VF1vC3tOxSPSTQ30J2G1J2LJxEsDOZ1KjrhEIfZ3txrJvUTCZueW8+9YjEei9IDso
 uMkotUUsSMTzG3qom93CYDbsJqcTJAYi0Q6S573fwTTfYTJBcohiRLfXF1FgSC5vFfi+
 5cJ2gsBVQOvWAm0QXpPHc7kcZl2As8GYKatIksbQOcwkWyn/b1RpbBGx36/bB88nQv68
 iEoFBZKY/ScIjzzGrqWb3wjAvHuBx/EbHrtVJGdgXS/wxbzCGk/0mkTIkyOsDYslVHkS
 pXlA==
X-Gm-Message-State: AOJu0YzZ67zAqKNFeS5rnCxw4bEpK3i5TlHqwId2wUOi2OcvbJhmghBz
 jYLfSrCysK3lQqp+vKc/Cwa21OvqPVVExWWq9jJP1YkyVA0zUt2V6uK3Zw==
X-Google-Smtp-Source: AGHT+IFWfDd1RiREFm2k2b2JnZ7UnuhbPIdx8CyFinOtr9ChzjS4TYQGhlokSv8/xJs/QKk2o9jLbw==
X-Received: by 2002:a5d:6d8f:0:b0:368:6d75:1bde with SMTP id
 ffacd0b85a97d-36b5cef946dmr1719309f8f.15.1722099439037; 
 Sat, 27 Jul 2024 09:57:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fc3d0sm8010863f8f.56.2024.07.27.09.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:57:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 18:57:15 +0200
Message-ID: <20240727165715.716640-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722099439; x=1722704239; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRvNhOtlo6jwyXepkvoyF9rnBszdCNPKmGJ/1XDkUoA=;
 b=HUQDI2GkD3IMS5UE2blQcxU65sjDPV4+aw2I8cyHpOG3xvKn6whGF9kya8uY3588T1
 LYT/LRlAJO5XBYHO4F0g86p7FpYB6zKKFA2rFMWyeUuimhQ3f0QBVDLkz8e3s2K36IVT
 9wHtxlkpDiFO6THgGwCXNUieOCdX2xuoyGdB/a9d60h57aA2tXazC1evawdhmz7t/Kcb
 kjzCTca7EgmUzXZxLaxvCGXAKOZyBrzVv8kLggkpeHSWTT7PBqkBRdG19Nr3+/g8KSaQ
 mCiywNVTM9tbAxrhF/ib49tHdobsCivm+JaG77f5JuLBc+TMXEqdyZtiNm9wr55Cl5Vi
 L7Sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HUQDI2Gk
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: open-isns is optional,
 not mandatory
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

open-isns is optional, not mandatory, since bump to version 2.1.9 in
commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
https://github.com/open-iscsi/open-iscsi/commit/713524df809396e11f42d7691bd8ead2ffc1ca6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open-iscsi/Config.in     | 1 -
 package/open-iscsi/open-iscsi.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/open-iscsi/Config.in b/package/open-iscsi/Config.in
index e55bbfd867..01d83615c9 100644
--- a/package/open-iscsi/Config.in
+++ b/package/open-iscsi/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPEN_ISCSI
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPEN_ISNS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index d1f40d3e20..1266db3d3f 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -9,10 +9,17 @@ OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
 OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 OPEN_ISCSI_LICENSE_FILES = COPYING README libopeniscsiusr/COPYING
 OPEN_ISCSI_CPE_ID_VALID = YES
-OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
+OPEN_ISCSI_DEPENDENCIES = kmod openssl util-linux
 
 OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
 
+ifeq ($(BR2_PACKAGE_OPEN_ISNS),y)
+OPEN_ISCSI_DEPENDENCIES += open-isns
+OPEN_ISCSI_CONF_OPTS += -Disns=enabled
+else
+OPEN_ISCSI_CONF_OPTS += -Disns=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPEN_ISCSI_DEPENDENCIES += systemd
 OPEN_ISCSI_CONF_OPTS += -Dno_systemd=false
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
