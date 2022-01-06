Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E41CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 06:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA37D428CC;
	Thu,  6 Jan 2022 06:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BikPULRTGhvC; Thu,  6 Jan 2022 06:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36837428A6;
	Thu,  6 Jan 2022 06:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85A401BF8C7
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7398860E82
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbOxWtOFdWdo for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 06:24:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A61760D8C
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 06:24:12 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e8so1312385ilm.13
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 22:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GjfPmadGYuaOIMmbkNaoVgg718q+j4UpoSxderLyYA=;
 b=SS1kHlngalO+OKQJaGVJLttV3zlYEG4RnytaFZJ2kgUQmhvv4C5p4q7E9kvzJPkYnq
 eUhqWb8zKnXdrM1jLxhNUuH8BWiO1IsB0WtV/bYpDqU1/58fzGU7M3JT0WFSd0zsKtCl
 NYAhTdFkxp1CRC3lb3klW4kOkTitutb9Ttoc3zrGmhuOC0Yo1vAjP8XU7s7/xNmAkv+X
 qNprCG2BNb9kdLZyAM8pqemOoVPv8oOc8KkJh88DAUEKXkDkGGS7ANAfVqIAOQz0zIac
 cZwiS02zZjRsbEsq/w1vyYbk9eFd4fmT8r/uMGeae5/La+HqzMFRq7ByL0apfaCOt2Tl
 pGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GjfPmadGYuaOIMmbkNaoVgg718q+j4UpoSxderLyYA=;
 b=Pw0445aUDQd4KTvcHUXRGhptJDeYAyy31VK2DNy5fSAAf0+ijOBD0NyXFCB88AK4bO
 fUL31pm1Q829Ou2JLBYEXMExmIgIldQQvOplw+M5nhOcFF6zmW+kCkq4koO3hWL1mHoq
 wao8pGdapC1TSHPDAmpfXzXL3JA9ZgLLj8B7LrY4V4bAVcd5A7SVPas1HQmDK6vcPY31
 RxR8T8OMa2XqJkLLf79yKBrkIR/IJOVIIlu/fzmT8ofjv59hqXBQjYNctPZaChPV8RkY
 ffkjxpZLncpWtGOFLIjUVYwu0qOYts4J3L2PUWL2gTCVXhkqnoIfZJRHwmpTYvF7catE
 zFIw==
X-Gm-Message-State: AOAM533rhmyyUloZduOUUSPk9g54RPqn5r/iUTTOojH8JlihbEDu4O4+
 D9DKnyP34LKRv49lCgFv8jc1fmhup98=
X-Google-Smtp-Source: ABdhPJxfJNJVKi3IKZbQNvXNDWr5MkysRwrTgydoMoWt38GMQBeL5r2xkUbdX/fWkxwKZiGiMtb/8A==
X-Received: by 2002:a05:6e02:19c8:: with SMTP id
 r8mr29588052ill.136.1641450251461; 
 Wed, 05 Jan 2022 22:24:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k19sm662095ilr.34.2022.01.05.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 22:24:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 23:24:05 -0700
Message-Id: <20220106062407.3131530-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106062407.3131530-1-james.hilliard1@gmail.com>
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4]
 package/qt5/qt5webengine-chromium-catapult: new package
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version of catapult is python3 compatible and will be used to
replace the python2 only version in qt5webengine-chromium.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../qt5webengine-chromium-catapult.hash             |  3 +++
 .../qt5webengine-chromium-catapult.mk               | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk

diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
new file mode 100644
index 0000000000..8190a6dd5d
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
new file mode 100644
index 0000000000..fac3c996fa
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# qt5webengine-chromium-catapult
+#
+################################################################################
+
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE_FILES = LICENSE
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
