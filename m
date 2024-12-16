Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B3EE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 18:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696F580C6A;
	Mon, 16 Dec 2024 18:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRK2MYYRDQEL; Mon, 16 Dec 2024 18:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E5D80C49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E5D80C49;
	Mon, 16 Dec 2024 18:17:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF970E3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B162440183
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcGyBDUIdKQX for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 18:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.42;
 helo=mail-ej1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51D1E401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D1E401A2
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51D1E401A2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:25 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so892693466b.0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373044; x=1734977844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoVbPdTD6ANVh6OH2a/iFv93i7NFedpGja0tHxHZ55A=;
 b=h2rUTwGU3PqcC3hObNXvlKDXZBCctu+Mx+/D9lncGVbOVKsgmw8wZoactdHxyJd8OZ
 XITS1hWBl1WsjJzaea8bqoYWfA0zc5gDmSxuf1uaXXz3yEaZhaBhViiZmXNI++2DwqxL
 XL4ZFIjn5AoGXOyWswSCZUH4D7eKZP6Ii5CDnuAjf43sKwGFCBw9W+yRHrIxdLzDskqf
 Xa4vynjjaPsjBUuLMWIg1P0X1GHbMdZ8KRq/bv3M1yxeAg1i4xVVKiFuzeRc8EFt6pDF
 RMbp9qCeiwSDeiQsyz54a9Z1IrG35bpFp2f8Ahuh56/X84XppoRf14fYMGsT8yBqBYMk
 CQ+Q==
X-Gm-Message-State: AOJu0Ywhy1YqtE0E+le+Nz21BtwB0y9xlsjaGUTcCEtjyNBUzS0sNWUS
 LkqjFPMam8L8bQ6elTI0L72zyIroNvW9Lal63gXHzmnCG6jRgAvDlNQSUmvz
X-Gm-Gg: ASbGncvVP1HbVDsts4ehP5LVt3O603eSp6vAk9ZCjgtUGs2Z1T0dwhDNcS++GuwF9BU
 15KMccis8DzwJ5jfro19XRZv7dxxSwLw9Xb5MYeUuYZBRBDQIcaZntC8TrB3qYQDy035qRrUeeg
 IJNVrUph7+qEgJ5fu/GzvdN1c9pkY/sBoMoBPYcpDnllsFfNtcIlIKEAdc+HSa3yUHmRJbXfc+k
 Ol0TRjf8jdu5B0WcQ4ujI9elp1p63qAXJ5JtoS4BlPsYStsw5G8oxexKZ5z2FOHPXIq5Aj62awY
X-Google-Smtp-Source: AGHT+IEyLTGoyZ3ZPf7cnl2nx7mxtzr399+q5E4zgWBupKqaY56tdp+77nB3XCKRmt5tqM0QorlJEg==
X-Received: by 2002:a17:906:31d2:b0:aa6:6c08:dc79 with SMTP id
 a640c23a62f3a-aab779b4b83mr1241399466b.35.1734373043450; 
 Mon, 16 Dec 2024 10:17:23 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:9c94:3a1:94:d6bf])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9608834fsm355109566b.86.2024.12.16.10.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 10:17:23 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 16 Dec 2024 19:17:18 +0100
Message-ID: <20241216181719.770389-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917203311.1241557-1-thomas@devoogdt.com>
References: <20240917203311.1241557-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 1/2] package/webkitgtk: bump to 2.44.4
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

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
CVE-2024-40789, and CVE-2024-4558.

Release notes:

  https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
  https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2024-0004.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: bump to 2.44.4 iso 2.44.3
v3: no change
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7da0e97e5d..49f758d6a8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
-sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
-sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
+sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
+sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ecdb3c788c..49a532d9aa 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.2
+WEBKITGTK_VERSION = 2.44.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
