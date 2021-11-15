Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7693FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEA4619E3
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBEA4619E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7739060643;
	Mon, 15 Nov 2021 21:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_9qpJ__IoKf; Mon, 15 Nov 2021 21:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA069607B5;
	Mon, 15 Nov 2021 21:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8561BF2F9
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27FB980C02
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCn7QmczsaTk for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 21:46:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B75280BDF
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 21:46:53 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so994104pjb.1
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 13:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=hvVAz/R/udeCbyomxjfhOari9EfJ2zrXzyueuSlytfY=;
 b=MBnS3MiMuLFDtENaXzEfsXEOsjJhDpyGHmJoFNx1N8dqoAP61Q5Bkf18827ttzHWOb
 2wAqZYLA/SsuhSL4mCAtI2z1JnFLZYS+AXHbl4FAub6S/IfidnT5tekJzZ6zCxVODdbL
 fJk3+61pL68EiEcEJhJNDn4bg2BqJajFCyrN/wQYkRrhLIxVIyV2Rf+hhi9/EqRLxb+n
 OKUfLhqPAYKZDJIwwVXiQZPbqmvl1FPj154DhGAoPnIb1WR8E2cfOE3eRFz5XN1paGd8
 /0yS5Bj2a0hnONfFiJakmEGsj4ZRJf04K7l+nQiJ3Jv2Xz61Ono98vPE5+Rn6nLeV5nU
 pDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hvVAz/R/udeCbyomxjfhOari9EfJ2zrXzyueuSlytfY=;
 b=J53al0VWmEfvtiAqI584COIdHzYjxQBqxvEvoQV7qRBLJ2uW+nh62aDaMpp8DOOZAZ
 FM/xzStLRzZ6cL8aOVI6lDinbXtSO7aQYh1/AuIk68scRwj38a8nv4tuJEakx4M2W+qV
 RAMMR1WjZL53p3L20NgVKqGr2HxprBV+uL/Khdgh47paWDthgLVi698cJg952/uHECig
 pYk8ynyPzx+uCxy1e1PfD5/rTZRjBv4YoD/BxAjPZ816ePliswyJOGf7Si7TjsIR8P9r
 nkUITjZBXIgvdkeRChXxVRPRMtuErSjNz8bPegS9KR52bMwH95ySidVEmAQ20rL6pgoZ
 vcVA==
X-Gm-Message-State: AOAM532jx/+ZM1hMwfLVAcSPu2PFQqeQRdBI8fr4JNPPuqgaIiDjStng
 JL9sQLHxLJTT5Cna4S3PyywTF16+WEjDA4zszNvfRTvqb/B8FA==
X-Google-Smtp-Source: ABdhPJzkw4qj0d5bRtqMVM/HDwqIJJuZ2svArP2e09zUUkFOwmBT1LObjXJMHnh5SuO/AbixiLlIsjDVKoKIJaH9tLw=
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr23405580pll.46.1637012811733; Mon, 15
 Nov 2021 13:46:51 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 15 Nov 2021 13:46:40 -0800
Message-ID: <CAJ+vNU0pupEcDjVschLgBW9tdjy6MpnA0WCJE8cSzxqnCy9GGA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] BR2_ARCH_IS_64 NEON support
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

Greetings,

I'm curious why NEON is not available for BR2_ARCH_IS_64?

I'm working with boards with IMX8M SoC's which are arm64 and do have
NEON support (per the NXP literature and I've run binaries using NEON
on IMX8M). Is this a simple oversight or is there something wrong with
my understanding of this?

Best regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
