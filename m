Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD27DC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68A9260FA4;
	Sun, 15 Jan 2023 12:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68A9260FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sY-9sRl6DMlz; Sun, 15 Jan 2023 12:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B3C60DB7;
	Sun, 15 Jan 2023 12:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B3C60DB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12E3B1BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C1F40571
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C1F40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEKixJmAd_CQ for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C66D14167D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C66D14167D
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:14 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id l22so32556257eja.12
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1ufLKLBzPjIlTytBQPrame8U2+w7/NVYQET1pG0KGI=;
 b=3GtA5d0nEg1531CmSt9boHH0uuXIF7ZhmBAxWYthZni+eiVbp4CabGImr03yalAaPm
 qfjQRS2PxStEVSG8cH9NxptYP55Kp/wMWQG8y03fvPL6o6UBNbVSULPlQzUaDrQnWpUU
 4XQRKPHvEF6+OSOJJkbzvw6jfOYjAvr4tvoG3k97Amo9Uq7yootaW3qsBfoi796/rbi7
 cxWDJ39b6fSL31CPx01zFAZ+5AlS4Pu0aklxiSBLGPkMBSB9hrh/3Jcmh8hsy+Gv8g3E
 LMCOiK8OZZj/bFblFzesmkvJmqugmZmTt5ccgq38qB3KiRs5wfd0ISOR/4r09jzE2wL5
 8Cyw==
X-Gm-Message-State: AFqh2kokKXuehFfHV7+BG7qtmWYf8SVtnT5vELwOpIkvRxBbL1rxt6v1
 N/QjFZh7aUCUB6znLTyBxc5W9INlMhg=
X-Google-Smtp-Source: AMrXdXuGC+mu9c/TWQAr1Hz09oTJHjRKJsCzMwP0k1CW3uhfaYf3e2NfBUNdrmA66qq5GBrf12pjvA==
X-Received: by 2002:a17:907:a407:b0:84c:7974:8a73 with SMTP id
 sg7-20020a170907a40700b0084c79748a73mr72875333ejc.57.1673787194335; 
 Sun, 15 Jan 2023 04:53:14 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:14 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:52 +0100
Message-Id: <20230115125253.280257-8-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1ufLKLBzPjIlTytBQPrame8U2+w7/NVYQET1pG0KGI=;
 b=e3wM5hmwziDbnFZcbEIXRlShp8uVHFOo+wDkTR/MRuhJ6hW5MQCmyhB4Lbi2+ugJI1
 iVb8YyhtFhe79/iXnXkXdaXSEAX0WKVS7XroGHxBUPmuEvt55S828v9TdxsxtYZYdDRw
 VIdpHv2PIeGrMqd62C6thi/OrsbgB0ANbntQU4FBFptwDNz+AF3m/Y8hV6JYtFn/fIhy
 xP2w84VuDB1gcEf7u30HrJl1asLxS1/PNJtAx9tVT2VAiYe6s+iyAjg4YSY1f7q0IrRC
 1p9tWPKpoBpn/pWbIkBKA7SUDfGYWuU7DzLWMCyNg3dtPSWdcLkpd0jDbjzvmV3TyPQI
 nv1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e3wM5hmw
Subject: [Buildroot] [PATCH 7/7] package/systemd: create the /boot directory
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gpt-auto-generator can generate the boot.mount unit, and
report an error if this directory cant be created (read-only fs).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 420197005c..0074fa8791 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -603,6 +603,7 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 endef
 
 define SYSTEMD_PERMISSIONS
+	/boot d 700 0 0 - - - - -
 	/var/spool d 755 0 0 - - - - -
 	/var/lib d 755 0 0 - - - - -
 	/var/lib/private d 700 0 0 - - - - -
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
