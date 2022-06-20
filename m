Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC0C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACF3418F7;
	Mon, 20 Jun 2022 21:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACF3418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPMol8l1nvjp; Mon, 20 Jun 2022 21:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5924941868;
	Mon, 20 Jun 2022 21:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5924941868
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 232291BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F4160BAE
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F4160BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoiCUW4r8Reo for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:41:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC8B605A5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BC8B605A5
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:41:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id v1so23543835ejg.13
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBNS4qe13ewF8pEhfrgSe/410EexVw+H7koQJ+xdgzQ=;
 b=Na5PsfFxWxJf1tfXq1YAGnx9hZYjm9yYBL+fG5+hNVZQU7tJvliLvxGJ5mNkKZYso0
 Wy5UTs0QRmZV2iTYhIjSb8p/hIJKRrttc+ivBD9rSkGUplmsXp4o06MKq46NFgQxN5oI
 79PowRe8CdxTS34VdryKS2NZ1M4eMrniy2V9VWjl23xpzZOpqoQJ4VK7zI5gmf8S+uPs
 1iLIagn1B0ASTgzkOctuvIvxCivZ2Kdxodov0+TuZEaZG+w7QnmrUDrHO2fnEUmVZdF9
 hNBYrWmJKnltMHL0bQdXj/TMvL9GWz6BFvDqufAUpSyH+7EAotFkH1+P4FFOkl4oZuBG
 NVPA==
X-Gm-Message-State: AJIora+QqroiHOV0JP/7QiJ5PYNDnnsG9nbDPC6Xf9ZzBTg2zlPulPVY
 diY3tG9dXLka51k+coN1Erb/v7Xt6jG9Lw==
X-Google-Smtp-Source: AGRyM1tl3Ot7SctsWYGFYCuLBYlw9va/1XZzDH2Kvr3C0haT5N7Y73jD0jyJDosiQhBlrxd7CZRKeg==
X-Received: by 2002:a17:907:6d12:b0:711:d524:8c88 with SMTP id
 sa18-20020a1709076d1200b00711d5248c88mr22948077ejc.615.1655761261720; 
 Mon, 20 Jun 2022 14:41:01 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm11696111edd.34.2022.06.20.14.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:41:01 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:40:54 +0200
Message-Id: <20220620214058.1435436-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBNS4qe13ewF8pEhfrgSe/410EexVw+H7koQJ+xdgzQ=;
 b=K1hLIFPR7l2vQtTKdQg6hTKzus1Lwq667pbYiUY0ovHzAb+d3EpZnn1rw3hpJi7XGe
 R2RCoQdSBPnVlvpCZrZEZKw0HkVvhl6MsKMNqTWD1IDZuEoalDBI1/m6JXD2pKArBT8G
 WHk9q1Lp6PSPTNWRxNqSyw/COCONI/tNUg4KI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=K1hLIFPR
Subject: [Buildroot] [PATCH 0/4] Configure default wifi through kconfig
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series was born while adding support for a board and feeling the
necessity to have the networking options available in .config.
I understand that something like that could be done by adding an
overlay, but it requires a lot of boilerplate only to be able to connect
to a wifi network.

Angelo Compagnucci (4):
  system: adding options for configuring wifi
  package/wpa_supplicant: configure wifi when enabled
  package/ifupdown-scripts: add wifi configuration when enabled
  package/busybox: add service to load kernel modules at boot

 package/busybox/S02modules                   | 56 ++++++++++++++++++++
 package/busybox/busybox.mk                   |  2 +
 package/ifupdown-scripts/ifupdown-scripts.mk |  2 +
 package/wpa_supplicant/wpa_supplicant.mk     | 14 +++++
 system/Config.in                             | 15 ++++++
 5 files changed, 89 insertions(+)
 create mode 100644 package/busybox/S02modules

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
