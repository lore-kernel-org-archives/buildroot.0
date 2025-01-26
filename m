Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519A0C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 08:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A0F81E78;
	Sun, 26 Jan 2025 08:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1-Ei24Pa5qo; Sun, 26 Jan 2025 08:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE53C81E60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE53C81E60;
	Sun, 26 Jan 2025 08:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C9EE941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 08:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87B71410E1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 08:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgmvX5EhTqZh for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 08:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ACC1410E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACC1410E5
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACC1410E5
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 08:30:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385e06af753so1811685f8f.2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 00:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737880244; x=1738485044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQv81rOVZXDLs28tJp1LCmpT/V6qENkC0opTLiGnurQ=;
 b=fc+einrgdu2WEKDVZcWAkCx4OVT0vBWQx1dBckuY0eRmVtfadnreRjLSwy7YDEL0LD
 u2qtObIn3IR9FLrg/2Ngwc5H/IGkEgxgDmo5GePx0Qj7KUAp7qAkcf9YZcDr53CqD2wa
 6Eb5O66HD4pff+AU0+Vfs7/SwAkVQ74Ir9lfMBzxV4H9KoaCFhrxHufFYS1sQ4P6wVbq
 J9Kuo4tc3uuFVyf5QWeqtbiSr1XKBWMS3bJ7R9nGDKL+2PuzA9alqfdenkZoCbDJstEq
 ype1VCCqFaV/ewjUugiXtv3YRtzRiv9vFsGa3yjqV3BDSd5SRClpsDeFZRl5py5MmzFE
 apUQ==
X-Gm-Message-State: AOJu0YzX2iOIioFCgdl3V/sjHeaUTpOdWxbUin/BYrKfjD3RTHJKVoBs
 OA056YN+WT/LSwzpZSwZmSyDIwgGW4D07+phKuHWQLXnA2f0yKRqsXReoA==
X-Gm-Gg: ASbGncvgSNWemC/h3WMMHd2BQFnzXszJXbBeE1QVapwfNdRvdh4Popaia7GQuY+MkQN
 l9cpo0ZtTsrZp6LTgkdjjlj1IXK0kPgMZvkX3mpLFzpH/0sy93cJnFG4VIyMc+Y72aNVlK/rRrT
 31a7MM8NMHBn/ySnhvPfno3y7X9t3sqEbriynkq0GZhR4lLlgh3K7VbdpQpzlfFRlcbt/45z9zK
 wBBn+gXtYYyiyFV7+79YI9sbb5TSb25kZgQ/Gh9Oh66bxpaYc+q4Tk0RJblpXCw/gIwB6xNx8/J
 kMzFOAex56JjmMs5gWog
X-Google-Smtp-Source: AGHT+IEI2l0tUA43kfwyqMesZaaKPZCT/hqFrnALPTZLm3XYVx+MC9G3kHaMzpFekqMRX+/KZixfvg==
X-Received: by 2002:adf:ffc4:0:b0:385:f47b:1501 with SMTP id
 ffacd0b85a97d-38bf5678f0bmr22900804f8f.32.1737880244377; 
 Sun, 26 Jan 2025 00:30:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:377:ec22:bb25:d4b0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1baf3esm7703190f8f.75.2025.01.26.00.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 00:30:43 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 26 Jan 2025 09:30:40 +0100
Message-ID: <20250126083040.629018-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/fontconfig: drop the util-linux
 dependency
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

Commit 67089f8c11d05147e3def29e226c13a10e913f76
"package/fontconfig: add util-linux mandatory dependency"
added the dependency on util-linux because of uuid [1].
This dependency was later replaced [2], so drop the util-linux
dependency.

[1] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7b48fd3dd406b926f0e5240b211f72197ed538a9
[2] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/c4324f54ee16e648ba91f3e9c66af13ab3b1754c

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fontconfig/Config.in     | 2 --
 package/fontconfig/fontconfig.mk | 6 ++----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index d274b06350..218fdb2e7a 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Fontconfig is a library for configuring and customizing font
 	  access.
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index b60086c9c8..cc6ca88585 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -9,11 +9,9 @@ FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
-HOST_FONTCONFIG_DEPENDENCIES = \
-	host-freetype host-expat host-pkgconf host-gperf host-util-linux \
-	host-gettext
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf \
+	host-gperf host-gettext
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
