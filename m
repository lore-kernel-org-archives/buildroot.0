Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BBED29C4C
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 17:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7867D83E37;
	Mon, 19 Jan 2026 17:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8V5MMGrmKKq; Mon, 19 Jan 2026 17:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8361C83E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768842377;
	bh=0wE569IR9pHQd57g9l7X1sNvl0gjl7M7znyNIyE/kmQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=okRWGTKlmX6beWdnFnAuMatC80W4mHYT2rCbDzMZv/TnbY8TESbFtjaAPHBdzUfT0
	 vd1X4jphiK98hDx8e55qqRKEbXht/Upv1bdUf2UgMxUhIgsFXBYaVG+2bDWq1kgccB
	 mxrIaUZMs5BpPsuIzXDwwsCDfXurF4jzbtsAYuWNxMpae4lUJjJeBDjtpYY605kMTU
	 NfyhH0ExrreDPmEkUixcLt1Kg3KzrrIkVxNF4uRWYEo/MXH2jvgZXh45CmuImswI3g
	 g0ozdxZyHPZspxNFEgOk4QiVIQ4WjFCBtpDm9V9qY+QLCDxbVG370YvhXA1eZQAoSE
	 BdZtpzuhlojNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8361C83E24;
	Mon, 19 Jan 2026 17:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4AC82A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D24F640719
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFRn7p6jvT2m for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 17:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB67D40718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB67D40718
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB67D40718
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:06:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b874c00a39fso797742766b.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768842372; x=1769447172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiQsBVn01tRIuuRiV/EZQp4RtQQmucUI0bllh3SZlfU=;
 b=rDnDPVcSCi/6MzYQIf7QD3xlN1fae6EvwBoPPUpQ1fQ1tpFicV/qGlh/lXFHp460uD
 GBBSwSMOfWqMXi1egO/cFIrcCbUErxvv6Y92EJL39U3GnsPL2Xjsj0clb4J6hGmipngV
 dJ1AoOaWbuFfw1XcWmpp2l3TBOFRgo3FE73Y+5HurscIhy2FPpQ/J5qhl/QpONNQp2gV
 xhktgCDHeqavfddb+ml9JqdN7MjUNOIvPa0jORXKDq3CddNnvt64BsHBfPKcBxS+ODM4
 Oiy2uzJSL7ACqPpCAkGIYdAC+K3tx1EEjRDgVRwY0dfHbJNEaIFMXlt9beM4n/FR38md
 uhRw==
X-Gm-Message-State: AOJu0YwLYDK6rl37hpknYXEwRiikzp+KFPGStUhRn+cBnAREZbB+yNrA
 Z0E78jz4kx/NWyPOTSi/hYwrcBit28NguwPM26dZgTa+hM2V3iHm8nutY5yLQ4zw8ItcMh1tI5g
 vlOU6
X-Gm-Gg: AY/fxX5UFLp1U/RsB+n+UkACR4TSrA0QL6HUZ+P/dH4ynIXPiPpWejS2n5WSqxp0VLU
 vYPBILeO+bbiTJSCmnwv7izhMgtt26juBSOqEvOJhi/IQOk56HZ+CAvSVMPE+MQlEpJ2dq/tvlW
 LfqXLu7smUB8AO3uN0zwVKwL3JHHwATYyfiyCtiRjTxFG43hL2+lsZ2h9IpbffdRJavh8oni+Dd
 S+cDyNKeErVC5khJkwfL8h6Co8H5rFQfdFe7vv0Ttpy8z903nL6eKgmDyd63TUItgceyhCQc9Ly
 dVNhIk53AmEL6YwA2eDX4v089zqW2AKi4z7zBAz1MoxNA4825DFCh4fVzGhV7jwOzo/OirXTcWb
 01orAMp+N/0wwA5FRz7A4VowRIBacNyOnetwIV+Q84gWmiMAgBIKXmguNA994+Y52U8ON0EnXG2
 9KW6gzcA/2I7U72huPDBU3k2ae+S5/k2tIxQ58+P7CWbQ86IENUKrdTZUOsWT+QbEHDtvdViGd3
 8YffpI6s1Nn6Qt9qFRwKMePFjgXDr6DT5QveUQC+bWrX4kodIIhwwA4919MG+w+roxPHGtOZ26Q
 LZmp63xx78k=
X-Received: by 2002:a17:907:7704:b0:b87:17f6:6f12 with SMTP id
 a640c23a62f3a-b8777a0df42mr1011668966b.1.1768842370753; 
 Mon, 19 Jan 2026 09:06:10 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879bd278fdsm1097126066b.28.2026.01.19.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 09:06:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 18:06:06 +0100
Message-ID: <20260119170606.2856291-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768842372; x=1769447172;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DiQsBVn01tRIuuRiV/EZQp4RtQQmucUI0bllh3SZlfU=;
 b=gm0v0mpEGKiI0E+u9wUN/WHwDZshaMNJQuT5vosKVYRo7borIPd6P9PwfBhZrkM+DV
 /Rdf78rfSBrTqyrd4sbWslEYR05utBukIE/zBCkfmELXZ47zqW+PRlNU6paIGNNUNFvp
 QDLcN+HyIyE6o26Mh38/8VKjXCLonQ0y6s1qs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gm0v0mpE
Subject: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.2
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.com/cmocka/cmocka/-/blob/cmocka-2.0.2/CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cmocka/cmocka.hash | 4 ++--
 package/cmocka/cmocka.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 5061cf30d0a7..2e273e7a167c 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://cmocka.org/files/2.0/cmocka-2.0.1.tar.xz.asc
-sha256  3f3533382ba29ab3abf5c4f4b27b79d165f0df51ea587de749b11b68b4019180  cmocka-2.0.1.tar.xz
+# https://cmocka.org/files/2.0/cmocka-2.0.2.tar.xz.asc
+sha256  39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416  cmocka-2.0.2.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 4dd78f39cc7f..747fd7b18992 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 2.0.1
+CMOCKA_VERSION = 2.0.2
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
