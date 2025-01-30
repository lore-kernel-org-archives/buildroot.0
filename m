Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E820DC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809CF426A4;
	Thu, 30 Jan 2025 16:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lU0T-1vjOW-x; Thu, 30 Jan 2025 16:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF524269E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF524269E;
	Thu, 30 Jan 2025 16:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A429412C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85211611B7
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFFv0JO6YzdT for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 16:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 886EB611B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886EB611B4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 886EB611B4
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 16:11:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B813F441B3;
 Thu, 30 Jan 2025 16:11:43 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 30 Jan 2025 17:07:38 +0100
Message-ID: <20250130161119.83312-1-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com>
References: <f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeejgeefieeuheeljeejfffhjeetkeehfedvvdffffelhfefvdetjefgvdfgiedvnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopehfvgguohhrrgdrrddpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphhhihhlrdgvihgthhhinhhgvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738253503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3QBRevxLqYFAmR5DcmbVBcW0XLWIKPb4q2B4uznWuA=;
 b=O9TPbAzNB1FWgTaKhYAmgUjhACBhjzf5z+k9TbE4OQuAp0HXgqs6BB8F1Xkq56r4/dx8VL
 jIdDTFPAcTy6o4fiHsiOCJWBlF1+qw/UC/wPnKjG8/2rOvdNjUyBrXU0Fi5BVLc05++dHi
 YDKvX6Tz0eCXZfRQVYiaJCxIMvgY9RhXYtZ/W4PauUgavkONSB+8BtDEcOk+Ka9mEJda51
 CqiNSCZn8pOBSfi7R+g3qE318f/VUrUUcRBFdLepcRzezMdXcjpzm4MOsuVf8OzxHFIpcw
 fm3UeTxDi2uMzWH3idRQRSqfnQt6Y0QZX79ZvAOgeTmWu3b/RU0z9ElhusOhAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O9TPbAzN
Subject: [Buildroot] [PATCH v2 1/1] package/psplash: add support for two
 configure options
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Small patch for the psplash package to add two configure options:
  --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
  --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG
    
Both buildroot options will default to 'y' to be compatible with
the previous behaviour, since those were enable by default by
not specifying the disable config flag.


Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
v1 -> v2:
* Fix warnings from check-package


In-Reply-To: f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
