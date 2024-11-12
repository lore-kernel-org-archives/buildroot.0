Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D455DD12D66
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F92080C63;
	Tue, 12 Nov 2024 12:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8r5Bbc5dVXMi; Tue, 12 Nov 2024 12:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B853280C8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B853280C8A;
	Tue, 12 Nov 2024 12:39:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30AD76C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BF35607A7
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wkt0bM-eJiGT for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBF4160777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF4160777
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBF4160777
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:38:57 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-20ce65c8e13so61409815ad.1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731415137; x=1732019937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=smVJN429NofM6rwVU7DtP0xebfbaJpyM5fdGKoTT+8QXW/UU2MriCZMfkH7/N2BnDZ
 e9m37O15wGm9yOM0Tns2b9UNpZNMu54u7JR8vURQa02wUM8MU0vrUxfObK8XNfbPk2L+
 EqIMlXGtmR7pvP3wOstwG364rCIRBeTKZrpCZQehYIurgkimV08pe39OQcg+MV5UWU9d
 19p9vTviUYvzdaxFaTsvBJjp4irpUFpqTu8qhhWT0yrAIP4Vaw/bMDpAjfJk4Yo/yMqc
 mzv+2RrJ1tAfBxr/Wr7xM3D7znCnZmrBIWKN+SF5B4/oy7faKvLFftPtXJ/yOFBPZJb3
 iNMQ==
X-Gm-Message-State: AOJu0YwqhtsPotNYLEPG49FjMYmV4q/bG8zcy5CZdu4dM0aTHrU0iiQh
 3vUcW5nCDw892tXz3ppKY16rP9Xq5T8hdg6QicwC3gkpPAk8j993Fjl1+g==
X-Google-Smtp-Source: AGHT+IGm032SgmQNz6ePzwtblM1GSgsswXzY0RNdRQ9++7n/vT8nNMMiRu/QHbeSVGHqFHgNVzbvng==
X-Received: by 2002:a17:903:1247:b0:20c:d469:ba95 with SMTP id
 d9443c01a7336-2118350f948mr179557685ad.16.1731415136682; 
 Tue, 12 Nov 2024 04:38:56 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e42782sm91940585ad.157.2024.11.12.04.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:38:56 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 12 Nov 2024 20:38:45 +0800
Message-ID: <20241112123845.7120-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112123845.7120-1-fancp2007@gmail.com>
References: <20241112123845.7120-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731415137; x=1732019937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=BXuStEKsTo+Ch5CZiiyWBg7f9h9Rf6A+rHwsHF18140eeE2HpOAfg1g4gljD4Ph7bs
 TPnn/e0VfAk/4cgX646Yh5wKGe/rTiHqlRKxfcpYW8Nt/wvqbvgCFrN+YsUL4gLbhO03
 EJm+LhK/tpA6zbAEcwdgWdeJLlRttAPAVLZrMNrktL1rk1DB9peO/nSBe/3udnKY/3+v
 JvMnpyD2tMKgSeRhUxTxDKH7jIdze3+a/dsXwjglnoM4aa68cJvaBPq/aTvcHBJz37Zy
 0AgvWmcJy5t9TkwTCW15hS1B/H9f82kLD2YjRJrjbi5gDrj3V4STFoi+Yo18jdKlq2IC
 GBKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BXuStEKs
Subject: [Buildroot] [PATCH 2/2] board/cubietech/cubieboard1: use lowercase
 keywords in extlinux.conf file
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

This commit also updates the label name, and the unnecessary "default"
entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../rootfs_overlay/boot/extlinux/extlinux.conf           | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
index 2fde683f38..5b071dce84 100644
--- a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,5 +1,4 @@
-DEFAULT linux
-LABEL linux
-  KERNEL /boot/zImage
-  DEVICETREE /boot/sun4i-a10-cubieboard.dtb
-  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun4i-a10-cubieboard.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
