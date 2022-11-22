Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF594C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 06:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA92408BA;
	Tue, 22 Nov 2022 06:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA92408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnlqUy218J8Y; Tue, 22 Nov 2022 06:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC1C4088F;
	Tue, 22 Nov 2022 06:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC1C4088F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135AC1BF333
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E302980C46
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E302980C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQc_EJ5dbk6k for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 06:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B0C580E17
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B0C580E17
 for <buildroot@busybox.net>; Tue, 22 Nov 2022 06:43:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso10599602wmo.1
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 22:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCl9u6cWpGnMnj+/RnZJy3CXSB4mdDb0uHNJTF2mdaM=;
 b=Lx/qdw5JUswKQ+RXSYYgkuOuTn+gvelk+MPG5iBErZWsfuITUILl21Iezx9ZG7utZk
 64FNlHQ8+xIOIAgupYuTl+K9+PnAnLvSABhuyd6d/6ptfD5bW72MWPKC20H4W7Sj074U
 NeeDqL1kyvv/yKn6aSJ7aS1fZtMdOp5V91L24Ua6oRBJjjOB/nAbnlkDGe1mkcxuabjc
 hkkWotnmOH0PZa8M7xjvfU9s3Sl1nFdUp9Ao/+OQRPyjHdKcEOVlHoifz4Y2zB4MzBvo
 2wNqPlGlXZp5BOa+6OER518NhCvCFFkzp3T38ozd909uvTSASLU4/+k//zfaIAHsj5xD
 00Qw==
X-Gm-Message-State: ANoB5pksfVQMfKdlv7VFK6Rmb6pWJQgpotflm5HknKFNty4EgDAPFd6n
 HpGDW1A2/6r65v+1RBnqPrs6pK2dWZ4=
X-Google-Smtp-Source: AA0mqf58mvL16m0ox4UP1KwuK/hoVvyknwgovsXqGt99nQFe8pxp9nmDgkC/IY3/N14KD+rMM32D8Q==
X-Received: by 2002:a05:600c:3d18:b0:3cf:b7bf:352d with SMTP id
 bh24-20020a05600c3d1800b003cfb7bf352dmr7210911wmb.106.1669099421861; 
 Mon, 21 Nov 2022 22:43:41 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b00241a8a5bc11sm12833981wrs.80.2022.11.21.22.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 22:43:41 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Nov 2022 07:43:25 +0100
Message-Id: <20221122064325.30941-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122064325.30941-1-francois.perrad@gadz.org>
References: <20221122064325.30941-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCl9u6cWpGnMnj+/RnZJy3CXSB4mdDb0uHNJTF2mdaM=;
 b=dTKWafJ7Keq3EbrRbYuUnW6e6YjOw70XXbdsgfTsY4q0PKxnotnb3rb8jmErlPcyDn
 kIMQMwkeymnJIOHJU69QMohw2ouWLdIWx0XatYv8TlitELN3ZgJ/OBqK29RP1hXv38U1
 HTpslJ+V4IUu5o+p5+RiMbyjgUwQfIUCYC+oBPf6LkqihhfwTxficehEwnb4xPDcG7Xl
 gVKPxOItBykLs3/WMgIVe5a3BR+V+QlvhjCxNRUrCRJCip7/1Zcv2TZDbwE8+DFE6x1t
 2u1n62XFhr5LuSxY7TG23/daOhqhD2gylFkHR8EuJt46PywykBdn7I8SQeu3R7P8BR/y
 oTRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dTKWafJ7
Subject: [Buildroot] [PATCH v2 3/3] board/freescale/ls1028ardb: more
 documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/freescale/ls1028ardb/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 2dd2e2d84..cfd1c8c49 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -8,6 +8,16 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
   - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
   - https://www.nxp.com/LS1028A
 
+for the software NXP LSDK (Layerscape Software Development Kit), see
+  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
+
+the components from NXP are:
+  - rcw, LSDK 21.08
+  - atf (fork), LSDK 21.08
+  - uboot (fork), LSDK 21.08
+  - cadence-dp-firmware (blob), LSDK 20.12
+  - linux (fork), LSDK 21.08
+
 Build
 =====
 
@@ -67,3 +77,11 @@ The Cadence DP (Display Port) firmware must loaded from uboot with the following
   Loading hdp firmware from 0x0000000080000000 offset 0x0000000000002000
   Loading hdp firmware Complete
   => boot
+
+The interfaces of Ethernet switch (Felix DSA) are bring up with the following commands:
+
+  ip link set eno2 up
+  ip link set swp0 up
+  ip link set swp1 up
+  ip link set swp2 up
+  ip link set swp3 up
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
