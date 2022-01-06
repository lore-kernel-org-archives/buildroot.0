Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 13:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1A76FB91;
	Thu,  6 Jan 2022 13:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AI6Cuw0ot6uh; Thu,  6 Jan 2022 13:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE416FBDA;
	Thu,  6 Jan 2022 13:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3FAC1BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCFAC40A1C
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0cHnD10Muc5 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 13:07:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7289740A16
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 13:07:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t26so4666512wrb.4
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tnSqq3mPyDxvNJ+lWSGCtvFrzm5ZR85LDYh0tmDXc0g=;
 b=vYabtilE/8kbCiXfMbCyN/1B4SEzkd+25zbCUIvfv0+70XJlXqNCEqJqBFDzLKyp13
 qLd/88U607GmZVsMnlFw5GNuVx9bWoZfq7YVgwPH8ouIhMhC8tRvgN1c8rLH9tqnMOtY
 1G2M7iwscFhTbQn4TLziVSRCY/uqDhsknpfwcmBhTsezBbBUPETq00VsE3bxRP+tMUda
 33NEJiE5p3ZhxOzttVAG2V1uecGyiqna8RnHdU7Qi3tI79Rui5uUsC4v5eu8kx39wLhO
 D20TM+ilNQE4cJRfITyrzIMLT+mziAP/W8r+NBsYj1tmxffYazFoesBCjn7yv2wEDDtM
 +wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tnSqq3mPyDxvNJ+lWSGCtvFrzm5ZR85LDYh0tmDXc0g=;
 b=Y+/C3Cwswsbz+YBWIqwxGiUSQazO8Yhmj2aayotirC75u1TQjFfylWJROqCWqoRJ2K
 N270SaCucuRVSIMuDZPPZKfWmtuxvRkUYWQDX+/+kebMLiyoCvPVbniy3IemW338BURN
 Pl+aGDPlKVBpdLs16gXbJk9W+ZvAc5PjIhHAAr8jdm+xsshPKBVn9hicrjfjl2Tlsro4
 qh9Fhy3+4XPYlmnRBg/mtI7Xn5FXTaYpxarcVH/mW0Tka9CPceglCapHMO7lNjSK5R7w
 j7OEIkvo29uFKQpYxH4fFM4Nkft38ae1kI7cDnIDYgQS5KGjKdzHGP1XEKCT8oYuoYm5
 4huQ==
X-Gm-Message-State: AOAM532FQOTM2P/lV9GBwxPdXJhN3NF6KkaXeOnzlZiVH4gujprCqmCa
 KQU1bkWtCD05HEWGem2ILCSOkxaL++tY7w==
X-Google-Smtp-Source: ABdhPJy9eW/+ZdcB2QTT5Xu1kU0LwodN10Tv9yQsbpWNdxp5WX2/XZFL/ABBotUUViktTE4O3cWFvw==
X-Received: by 2002:adf:f188:: with SMTP id h8mr50555383wro.663.1641474436512; 
 Thu, 06 Jan 2022 05:07:16 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id w9sm2016273wrq.70.2022.01.06.05.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:07:16 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 14:07:14 +0100
Message-Id: <20220106130714.347453-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt5: remove qt5webkit-examples from
 qt5/Config.in
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qt5webkit-examples was removed by commit [1]

[1] b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6f2428d800..5751d6cb70 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -67,7 +67,6 @@ source "package/qt5/qt5virtualkeyboard/Config.in"
 source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
-source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5webview/Config.in"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
