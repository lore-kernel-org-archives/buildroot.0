Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107A2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EA060230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8EA060230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 948B36088B;
	Mon, 25 Oct 2021 19:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueJBD-Y2RqEu; Mon, 25 Oct 2021 19:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AC060847;
	Mon, 25 Oct 2021 19:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E11E1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F116280F25
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MapKcDkPKfq6 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9C7180F24
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w15so3276524edc.9
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOPWSBj0u8RAOOupVzmYlXTG+VybMvmCokz936puW7g=;
 b=Rs41VamgsBM+DIuSg90ASzqLkKZbkXmTPpfEkO7ZRTuUCy2x/V5RCF2viqwrvDoPrQ
 4mP5PmrP0dcH2MIOaNLmTxLXJi4WBv3vLpnewBxJwwZAcXN85pWXGy1AZ08fmpZzjnwZ
 4TL5hXXNkTjMRR9cSM4EomhqAcUBc0+3LbHTR3zgEQ+IIkqbk2lVAHOmC9BYFEdTB7r6
 /FfIl+YgCbZFD1cNwkrJ777vcCK29zwPTHuUdhHTYlcIWEU5gz6dJZIOOXbsvmdniG3t
 DoRpYJMwtiGhMjDX5XqL1EtcZHzKPwMHNdh/rNloBqR+Fsl66miRI3E1iIU3ptm72el8
 W9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOPWSBj0u8RAOOupVzmYlXTG+VybMvmCokz936puW7g=;
 b=mS2Mu/Nhm2wbI2AzviD9mEt1SIyFOHCvXMpUyQcHzNdieDR2R/oyfPs76Xg1bjaf3L
 0dNXYM/8R18LazYkHbsuTUULA5eFSGBPr4tPuICgg00u476ro+2yId5xTSI/q+iFlj2n
 4ZDAe/iw1XvY/k0DEujBXwRhkr/JPj/t3z7Wty79nu36lz2TjEgFy7zYPYpRCqEeCOyk
 xU5JZ47uSynQQ1382CNuAg7fZMzNSdi6Qji9aYgdtzhlUQnfJA17jnW5m8dbnwfAtS0C
 4RvlktNA1SwlwZCO8dbLqyMnzeeu5U2oq6y0yP0SCFiPj3xnU2DlD51ShCra5/xr9w/3
 LqaQ==
X-Gm-Message-State: AOAM533GugmEVFf4LP3r5BO8uty6l7HU6Lwm2j+G5OEikrBd2VApzbJH
 7BhNqOkKaCixI6AtxuwLpmwRAdpQFNQ=
X-Google-Smtp-Source: ABdhPJzXTFwBsFiY20bqTZBL/rIDxobwxh0r/3TAYe++ZW0QRMAylnkcycPYwLXs5dUjTP17fK6kpA==
X-Received: by 2002:a17:907:2d20:: with SMTP id
 gs32mr13476615ejc.472.1635188489304; 
 Mon, 25 Oct 2021 12:01:29 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id kw5sm7908817ejc.110.2021.10.25.12.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:19 +0200
Message-Id: <20211025190119.1273651-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdbm: bump to version 1.22
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
 package/gdbm/gdbm.hash | 6 +++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index f68a16e2f..59f9ea62d 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  a285c6e2dfed78668664c0555a7d202b  gdbm-1.21.tar.gz
-sha1  f6eec6113f04a4b5fd2c1cfead10e7d65c8f3d89  gdbm-1.21.tar.gz
+md5  0bbd38f12656e4728e2f7c4708aec014  gdbm-1.22.tar.gz
+sha1  c45cc0178cbf41828369b07749d41778741703bd  gdbm-1.22.tar.gz
 # Locally computed
-sha256  b0b7dbdefd798de7ddccdd8edf6693a30494f7789777838042991ef107339cc2  gdbm-1.21.tar.gz
+sha256  f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762  gdbm-1.22.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 3c52d1254..52624f580 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.21
+GDBM_VERSION = 1.22
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
