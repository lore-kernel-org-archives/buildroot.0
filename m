Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546AEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA7BC60F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA7BC60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87F660683;
	Sat,  9 Oct 2021 09:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzLFKwXkKPTK; Sat,  9 Oct 2021 09:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E8260B58;
	Sat,  9 Oct 2021 09:29:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84A701BF27A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B9360AFE
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GE0U2qxMFIr for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 09:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2FA060683
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 09:29:50 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m3so49602336lfu.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNrKO/GCYDcIb8TouJYuFCu7VDsRKGhh8Nun8DJtx98=;
 b=i0oHdVio6yXjITag0hHV16Qj36K4T6t8c4FFmgGaY2ucd80RXJ53Ac0ItzTIXGmc7l
 uKM/sg/2H6b2QM7kL48yUAqfqh/tFqdQ2derqBLXDHqyfg3mkLnaYI9769xKkLgVayT4
 NX1oh7f3g3hW+sH4rpAxufd9k4wx1/sQtSvg7Y2CWo1r9/yvq91xbs12kf9l7ItKYjGy
 vS4ERnrKV2bk3Cp1Spr3/FBPVJGDk3D+kZaEl1nNW/utXbxKrPNh3n32JtizciLRvhzy
 rIHVt0HYbyPxwOpcrZUikvOAeuSMB3NsHPmlEW2uHaE1TXd6wpcSCn+rqFvR5lHJVLme
 ZJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNrKO/GCYDcIb8TouJYuFCu7VDsRKGhh8Nun8DJtx98=;
 b=NTWFiiJj4ixuBc06VZLLcMsr9F+fifZK54JykYGE+TWGvU41VCIYM1RT7mac3J0+EZ
 vtWQawmDMkY/poKgtqFI29uIPdHXqHNhb/u1LkIyiLHbhpB1hjIvKq9weyy2hYav1QKp
 +PNIpC6maF35kAuQOwEw4IPN4X7/ubAdUYNuYXfQduCx89vBVIiccy1BS90p3lI6X4Dj
 E4os0Z8HAebly525XgQqDLUySv8utOpwo09SgBVDm0PzYACiYFcFjkxqdcTWfPl2/E2+
 GD71qBHqCjLC/KFQ5TGxSAiARVnajGViCCw/YLGJmsZKcEyk3UKVRWk1Ngbm5UNXYFSh
 KnAA==
X-Gm-Message-State: AOAM531nN7R72z4ZLSPmCdM7uBqeR1Z7kfWS1L0WG7vYQ5rAiTjCx8ZI
 sNv41AXr3f+N2jyw0YdBY3wY5N5Gka4=
X-Google-Smtp-Source: ABdhPJwsnKW1mSRa+VyDVVRjATLBLwx/8CCgjmnIyVv/Y+3XzK4UKYRgUsAVASCpWW4+FFkwc4I0CQ==
X-Received: by 2002:a05:6512:308:: with SMTP id
 t8mr14617546lfp.684.1633771788399; 
 Sat, 09 Oct 2021 02:29:48 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id g5sm170026ljm.74.2021.10.09.02.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 02:29:47 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 11:28:56 +0200
Message-Id: <20211009092858.89370-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/libite: bump version and adopt
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series bumps the version of libite and adds myself as
maintainer.  An upcoming patch will add another package that has
libite as dependency.

Best regards
 /Joachim

Joachim Wiberg (2):
  package/libite: bump version to v2.4.1
  DEVELOPERS: adopt package/libite

 DEVELOPERS                 |  1 +
 package/libite/libite.hash | 11 +++++------
 package/libite/libite.mk   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
