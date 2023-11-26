Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C868C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 22:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F8B60C00;
	Sun, 26 Nov 2023 22:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F8B60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VuV-3Hry4X6; Sun, 26 Nov 2023 22:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2272A60BED;
	Sun, 26 Nov 2023 22:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2272A60BED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 906DB1BF215
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6513A80EC5
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6513A80EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzeIzDDnV5Ec for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 22:16:44 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FD2C80E61
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD2C80E61
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b472f99a0so882565e9.3
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 14:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701037002; x=1701641802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzL2PwFYStUUp+9qyZaI31n4R1m5R7PZJZEJPOLSER0=;
 b=Cql3nqEhoiabgBn3UnbdQnX9wKXTrBWLWDnISHEnYYzbqC4qAPh4Fmu/mPMJfTgFeB
 NUZOc3cOuWfzbWTXax+jgJ2I8+6PYd+hdNCiNh9tUDoTOEuTH3fUQgsP3ZBxxnozqUdL
 +7huv39qbcBFCm5IFadpj1kkZoMweit9m+Kwx2aa2HVZj8GSyiFiXglRpAZQrvTQKdy7
 uOVMhmS2oVBFC+y5xB61/XdPVspmZHrfXjXTzvZlg2IWqXWBzjvaG61KSKt/CHyVe70L
 znXnqmmKnEXTdUaNsO9Gl3CIqNratHNvLK/i0JycfvLuu5W9tcluPbpXbxKtHnlLo8Ox
 wuBQ==
X-Gm-Message-State: AOJu0YwJ3HiqCtzS5cGMATfN7IRuvl739JzJqjAkT2sjc4QMfDVetMjk
 MNPhEec7lcc71A/3/43ajKSPykAAlpc=
X-Google-Smtp-Source: AGHT+IEDrnYmI77G6YaG5GIPb5prAZg0KMWL2PoA+XZERNsslnNO2N5diy2WXarRxyleXLP3UDwN9Q==
X-Received: by 2002:a05:600c:1987:b0:409:5bd2:aa03 with SMTP id
 t7-20020a05600c198700b004095bd2aa03mr7892070wmq.9.1701037001374; 
 Sun, 26 Nov 2023 14:16:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b0040b3d8907fesm7117684wmb.29.2023.11.26.14.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 14:16:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 23:16:37 +0100
Message-ID: <20231126221637.5688-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701037002; x=1701641802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzL2PwFYStUUp+9qyZaI31n4R1m5R7PZJZEJPOLSER0=;
 b=PYdlobITuBvyNoFv+BBweBLR8AqCUJaphw7/8oxYFTL0Ty2OfrNWhiseXMzN44aLcN
 3GMPPlcxNAj09yUMjrGVNq9KMrBbTVPF3YGxecrZovzkawg0XU9t0uMZPtUi8vsEXmAl
 WNjPmWA1/C5HywCKNRtuxsm+l+6GBs9oEdkWv9QrrZDfnnjOXIotQKlCJlGtP0Z4zrQw
 8z15udrWHIrFCIUI58xSKU4FFobFsQkXgmNK0BU3jTQjzN9GijC/vy+tWoDVi09NtUDn
 vySy0MCVasR+5az3MwliiYvLMB5nbCOkgRV1VeuTeBpgDtTKZK7TUqyth/Jj1UveN93T
 zntA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PYdlobIT
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-pico: add threads comment
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
Cc: Alex Michel <alex.michel@wiedemann-group.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3e76df02b324b0442eec7bfd2451ee2fbb3709e9 forgot to add a comment
about threads dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzenoh-pico/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
index cb61b0de55..5f7e91c9f6 100644
--- a/package/libzenoh-pico/Config.in
+++ b/package/libzenoh-pico/Config.in
@@ -9,3 +9,6 @@ config BR2_PACKAGE_LIBZENOH_PICO
 	  functionalities.
 
 	  https://github.com/eclipse-zenoh/zenoh-pico
+
+comment "libzenoh-pico needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
