Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A06CD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 22:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10DA416D2;
	Thu, 28 Mar 2024 22:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBGRpoDdo5MN; Thu, 28 Mar 2024 22:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B20416F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B20416F5;
	Thu, 28 Mar 2024 22:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6A671BF35F
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 22:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3792417EE
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 22:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWrfUrRTENIU for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 22:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59689400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59689400B8
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59689400B8
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 22:06:10 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso19927201fa.3
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 15:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711663568; x=1712268368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oY5Y2SwYpc6O2auP7gY15iBLSe/JCdQ/vUykiys0u0I=;
 b=PAXnVsHpmf5dw507Glk2ogP2WngtWF80urj0qnVC66CF13zfHRLXPO8vDObor9okEk
 UvTgVYd+fhD9VlBd/+HYChxgP1t76ocOLefsHYYIkd4rC5m0gy2zT7OySTz56vQBp/OW
 3vsXhxzW6TP01ZOFr56lnzcuZcOYwRzilZI2Ts0QhDkw033JZxlOlLwvlw0flioQMY1h
 yXJgb0xOqYz8iX2Co/KsuMHD0wiefdYuNuK/nYtrZ1KFH/z3K0G0lUE6QqGGMqXqZxsR
 qGKNYu0Fi4zGkMFaqSd2+ADZZ2tR8T397GojdmQ0D3ZZTW7LXN+RgQmpOVnu4H/4uNNc
 BOlg==
X-Gm-Message-State: AOJu0YzJjKOKCZZ1nM0/T3psVqNrKk9y+TCufwHfV7rNgFrO3sGcK8YN
 wb0pFZfRFG3WKW/ib1penC3zPdaPcnFFtrx/zYbcYUJbkAPb0r8vhA0iJgRZ
X-Google-Smtp-Source: AGHT+IFAWOK6J+bHhj53KONPvyh4xPkFhe31WGNYwKDG4RSj+/yohfp3S9Vao27dEdGgje4EPtveAg==
X-Received: by 2002:a2e:9602:0:b0:2d4:2bc5:38dc with SMTP id
 v2-20020a2e9602000000b002d42bc538dcmr281163ljh.30.1711663567835; 
 Thu, 28 Mar 2024 15:06:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg34-20020a05600c3ca200b004148cd4d484sm6705592wmb.9.2024.03.28.15.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 15:06:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 23:06:05 +0100
Message-ID: <20240328220605.145492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711663568; x=1712268368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oY5Y2SwYpc6O2auP7gY15iBLSe/JCdQ/vUykiys0u0I=;
 b=P210J25NRvVP2d8NwiMqf0P4NgPBZMFThCmEDdypNOHJEL7mj/5z6IArpSuKm2qHH1
 FuviUh5gVw2ivByGkNIUsk/OUiI/1WomCFiTi5IyYyb1La+6pEURFO7L4RafmxZYMuLH
 vINqU+H5QyCJwnNTnnTyJJXVjfmDEKmRI34aK/dqlwrq/M0dGq56ZITJfcYPw6cW23ux
 NSM6aw//1EFs5cjMECfbcPux8nzaoRyn7fvgvyl/h4IrMHU0gjW9bDibWg67oAYtp2a6
 cbTfSUD9QMu9M/tUs2F4Oitna7tuKNFzDv0ukEQNDaZIvLi3EGOHD1HYgMvScO/h9zJB
 fSGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P210J25N
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to version
 2.28.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tar.bz2 tarball
- Fix CVE-2024-28960

https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 3ec151a859..5466b0e7de 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
-sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.8:
+sha256  241c68402cef653e586be3ce28d57da24598eb0df13fcdea9d99bfce58717132  mbedtls-2.28.8.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index cdb4aef4f4..9757b8b080 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.7
-MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
+MBEDTLS_VERSION = 2.28.8
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
+MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
