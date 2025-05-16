Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37393C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D697D61333;
	Fri, 16 May 2025 21:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jvduVqkLZo9; Fri, 16 May 2025 21:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEAE61354
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FEAE61354;
	Fri, 16 May 2025 21:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B09C41142
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96003417D2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RIWqvK-pMBU for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8250D408DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8250D408DF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8250D408DF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 98F5443995;
 Fri, 16 May 2025 21:04:55 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 23:04:46 +0200
Message-ID: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuiedvteejjedujeevteduieehgeeggfdtieehteeikeeutedttdehueetvefgueenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhop
 ehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747429495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Har2ntNYk0wvgIy/7El4b2QeYCSpU0Qhm7RS7e/3DcE=;
 b=XwpKrv3bWmh+Ptjlg0mDCwtOr3sEBALSkrHtY9Tl2cU6m6Kp/qNozGP1pt8YCXAEJdyfuh
 r80oX/l9Jp46LwasFsgizH/bzQrWhjYcIxyjlrGNOdFzOiVE+m0w4r7PLO2qBO9o6UuWQe
 lqmgSnHYML4hS1FIFS4CvbhfQ7dCmlSB3NmS+iOhVpb4v/duWQF5Qz7BLw0Z+HxI5myXZc
 1T+Oq0bY4K4UVqhVyiTBevAL6muqZlcJEB6cc+ShprAimwFVEnTHxxV82CYx01KqbJFQcp
 VsJ9/tHWq5XoXLtpAH02WOL7MzabMHvSd7mk53WNvSnYgUhulxZAIJkVvcjT9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XwpKrv3b
Subject: [Buildroot] [PATCH 0/4] Qt6 related fixes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is a small series extracted from Roy's Qt6 series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=456986

but from which we extract only the fixes, to which we made some
improvements, and added two more fixes that were needed to get
everything to build.

Hopefully we can merge those fixes quickly, and then move on to
merging the Qt6 bump itself.

Thomas

Roy Kollen Svendsen (2):
  package/qt6/qt6base: fix build when xcb support is enabled
  package/qt6/qt6multimedia: fix ffmpeg plugin build for x11

Thomas Petazzoni (2):
  package/qt6/qt6multimedia: ffmpeg support needs headers >= 5.2
  package/ffmpeg: bump to latest commit in 6.1.x branch

 ...lpdsp_armv5te-fix-label-format-to-wo.patch | 63 -------------------
 package/ffmpeg/ffmpeg.hash                    |  2 +-
 package/ffmpeg/ffmpeg.mk                      |  8 ++-
 package/qt6/qt6base/Config.in                 |  1 +
 package/qt6/qt6base/qt6base.mk                |  1 +
 package/qt6/qt6multimedia/Config.in           | 12 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk    |  6 ++
 7 files changed, 26 insertions(+), 67 deletions(-)
 delete mode 100644 package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
