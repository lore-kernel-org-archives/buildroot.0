Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFD3CD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E28C81F11;
	Wed,  3 Apr 2024 09:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apy0nNUk6l5q; Wed,  3 Apr 2024 09:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 523568208D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523568208D;
	Wed,  3 Apr 2024 09:21:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2D991BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE2941689
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDeZHeyKrLLj for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A069A4040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A069A4040D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A069A4040D
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 3DBDDC3F17
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A8A8FF80F;
 Wed,  3 Apr 2024 09:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 11:14:38 +0200
Message-ID: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712136099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PCv/C227eTiqp4fk+JDQ5jVb4wN3J/wsbQSasoM+OL0=;
 b=nXP2m0D5lq4K8P2oXuJT27KMqRQpZswhbXw925MZ+o7zCTf0e90lgLXYR0XnkXt1WXEcCd
 Fuz/i/hpuJioFiDF7FHnBKg0o4wYDZ3CgqInZNATr+pkYf2vtfta580UaSDJiUVJa6/G57
 O2chHbnOHhehSiLMZhqCvhkMMLfcS4PT05zwUUk177WOBDo0QlcY7sgylt5xdRqoMRDPOk
 Bw4lMpg7mismHCaWTW8/iqtiY8hAtQ2Eeg8xDbVEtcxYeDTSCmvmUAVKkNuQBAHi67z4ZS
 /X6tlAS9lZUq03YWLmD7xgMsmszN6Cp/Fm9Un+YAkqJctAD+w8UrqvcHbuD49g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nXP2m0D5
Subject: [Buildroot] [PATCH 0/2] Add board support for Star64
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds all the requirement to build an image for the
Star64 board made by Pine64.

As there is currently no proper support for this board in the mainline
U-Boot, I used a custom U-Boot and a software given by Starfive (the
SoC vendor) to add headers to the SPL.

This defconfig generates an SD card image running Linux using an
extlinux.conf.

Thomas Bonnefille (2):
  package/starfive_spltool: new package
  configs/pine64-star64: new defconfig

 DEVELOPERS                                    |  5 +++
 board/pine64/star64/genimage.cfg              | 24 +++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/pine64/star64/post-build.sh             |  9 +++++
 board/pine64/star64/readme.txt                | 32 +++++++++++++++++
 .../pine64/star64/star64-uboot-fit-image.its  | 29 +++++++++++++++
 configs/pine64_star64_defconfig               | 36 +++++++++++++++++++
 package/Config.in.host                        |  1 +
 package/starfive-spltool/Config.in.host       |  7 ++++
 .../starfive-spltool.hash                     |  2 ++
 package/starfive-spltool/starfive-spltool.mk  | 20 +++++++++++
 11 files changed, 169 insertions(+)
 create mode 100644 board/pine64/star64/genimage.cfg
 create mode 100644 board/pine64/star64/overlay/boot/extlinux/extlinux.conf
 create mode 100755 board/pine64/star64/post-build.sh
 create mode 100644 board/pine64/star64/readme.txt
 create mode 100644 board/pine64/star64/star64-uboot-fit-image.its
 create mode 100644 configs/pine64_star64_defconfig
 create mode 100644 package/starfive-spltool/Config.in.host
 create mode 100644 package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash
 create mode 100644 package/starfive-spltool/starfive-spltool.mk

--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
