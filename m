Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B980C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9AC081E4B;
	Tue,  7 Feb 2023 14:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9AC081E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8LzP6WDD_Mf; Tue,  7 Feb 2023 14:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E67ED81759;
	Tue,  7 Feb 2023 14:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E67ED81759
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EBB21BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4650C41583
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4650C41583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id di-WCfJqptxG for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F1641529
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4F1641529
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id ba1so9679526wrb.5
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UHCyiE2tvR1Z344Yrp+QDspM8BwMoWfmOL8t0xRif4o=;
 b=BgVYPi+wkdf4CKLui+a3D10XfJYoXgDG3dNoXhwbiRllpCugi1jYKpP1r9Jjp/MuXk
 bgEL2OSkSUJNS4yMaD5DgF9lIChaCm45TrzZO7agV9+YR3cbbK5s7+M2TPql4bzuoe3J
 rA3QvpX0S+9nYrtBaZoUTrsVP5Lpr2+eVNf47zECZuGHwDhj33R7PWk57U5U6xc31paP
 J8q/FhytSMmIWYr2KHO1YYToXII+ymrNJDVBzslin04/AiiR7yeNbvRraBOpR+3tHh69
 EqmKKyySkazcLtkCAFKBPpiB2ewIFaGR0pIup3StJZEp7Xt/IX8t3YyOCh3tnbG5hozk
 oDTA==
X-Gm-Message-State: AO0yUKV2jU2i8U0AGKJd8JjuyK1+cQzN04k4R6UjeeEm3Z4VKjpbVYHF
 JxzQeoX09zg3A3QMDwBKMSk+lmgPUClgaihUnynpaw==
X-Google-Smtp-Source: AK7set+f2ZY0RMKPQ0KhtTea/pOStKit5AAUoqleku+a8aVVgRSn0Ed7w4wpLpa49FLxto8M2g94Wg==
X-Received: by 2002:a5d:4a12:0:b0:2c3:c647:a520 with SMTP id
 m18-20020a5d4a12000000b002c3c647a520mr3265932wrq.36.1675780209621; 
 Tue, 07 Feb 2023 06:30:09 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:08 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:29:54 +0100
Message-Id: <20230207143006.2681335-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UHCyiE2tvR1Z344Yrp+QDspM8BwMoWfmOL8t0xRif4o=;
 b=IRxnc/w2UBMPyRoUkvDqhS2O6nXhvSas7PLDAEemKt7T7OZWklydwLyGVseVkjks/l
 c9zAPMKSiaLI6LCil0OubrtD3EURR7FPd+YH1mu+4E3PgukzO25LgiVZrfgf3i0xBHv0
 4n4DZau0uFYIJcCJlBbE0ZkG9XY6QgNygM8UA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IRxnc/w2
Subject: [Buildroot] [PATCH v5 00/12] Extend Qt6 configuration
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is an attempt to revamp the QT6 series from Jesse Van Gavere
to be included mainline. It reworks a bit of things we discussed during
the developer days in Bruxelles.

Angelo Compagnucci (4):
  package/qt6/qt6base: add support for widgets
  package/qt6/qt6base: add support for widgets gtk backend
  package/qt6/qt6base: add opengl support
  package/qt6/qt6base: add QPA backend selection

Jesse Van Gavere (8):
  package/qt6/qt6base: add support for gui module
  package/qt6/qt6base: add support for gui module fontconfig/harfbuzz
  package/qt6/qt6base: Add support for gui module jpeg/png/gif image
    format
  package/qt6/qt6base: add support for gui module tslib
  package/qt6/qt6base: add support for gui module libinput
  package/qt6/qt6base: add support for gui module kms
  package/qt6/qt6base: add support for gui module printsupport/cups
  package/qt6/qt6base: add support for building examples

 package/qt6/Config.in            |   5 +
 package/qt6/qt6base/Config.in    | 161 +++++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.hash |   1 +
 package/qt6/qt6base/qt6base.mk   | 150 ++++++++++++++++++++++++++++
 4 files changed, 317 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
