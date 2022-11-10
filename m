Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E732C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 01:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE45881381;
	Thu, 10 Nov 2022 01:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE45881381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSonjfHI4bhh; Thu, 10 Nov 2022 01:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE81181369;
	Thu, 10 Nov 2022 01:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE81181369
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2803D1BF33F
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 01:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F4D64034A
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 01:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4D64034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkagPm9iAxf7 for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 01:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A6740348
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40A6740348
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 01:10:56 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 78so251002pgb.13
 for <buildroot@buildroot.org>; Wed, 09 Nov 2022 17:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:message-id:subject:date:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZc0qOQPM6MMiAjgwQopiXYquIjYhgI8TCf1rvq/Ulo=;
 b=DzL0Nsuof/ZhKa4JCzqK8P4m8j+eAPv524MyTzfBVdZz1xd6xOojabgyTF83d33Q+p
 2u2CxRt8zbgO/AQDdzDNSTKKthO23FKiEmM132mLiKAYzE+dBhiTMpIh9jPrkEEsNS9K
 bG3xglVMRayKCC2us2ydVrqPDoRGrzVTlMhOwcQgf3w8bmB06B/CCbmY7BwAORqDUrpJ
 GTqLsaLxLWu8pBK7ddqKDilCChwteD4ikdDliExKPdzZCH3tW2GFXHhejtybaGqElFqT
 G0QzPUJuYk+g1iATXu2KRJcKWIEJcCZV6m3cq87RH4/NdmPpwYZvzQQV0unWD6FqrTHd
 GFvg==
X-Gm-Message-State: ACrzQf0htenZx4BQEHSPVNowk9WRj8taOikcUfhUhXDOhR1Lx6PaVjTE
 qfo3sQeVei/Z8NTq2WluQoVw8YVeocZHQQ==
X-Google-Smtp-Source: AMsMyM60e9rIYAF6dE4SfLPRkDQrOyeG5lC2BOee769X3arFUPaRsXhwvOA7G4F5fLzgNMuTclURvg==
X-Received: by 2002:a05:6a00:1889:b0:56c:3d4f:ae14 with SMTP id
 x9-20020a056a00188900b0056c3d4fae14mr62616255pfh.49.1668042655509; 
 Wed, 09 Nov 2022 17:10:55 -0800 (PST)
Received: from smtpclient.apple ([2001:420:c0c8:1002::8ae])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1709027ec200b0017dd839f2a5sm9710226plb.38.2022.11.09.17.10.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Nov 2022 17:10:55 -0800 (PST)
From: Fiero Samurai <bfxfer@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Date: Wed, 9 Nov 2022 17:10:54 -0800
Message-Id: <FFA16591-727B-4FBB-B40D-2C626BC7B921@gmail.com>
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:message-id:subject:date:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZc0qOQPM6MMiAjgwQopiXYquIjYhgI8TCf1rvq/Ulo=;
 b=lTV4r+1BDetiX5TBIbQGnayEePjq/KUCkVy31cDSvN4OiHC58y+QodfTG2aAdYpBon
 FzAPQZt0djjb6G2MjYJicHInjotcEVtmXUbdG8xE52Jyynszd3ntsgq2z0XTdvAf2Tcp
 nYXv4DZvmuux0O8NB/vOFRkrnMf0ZNurUMenqjOowbxfyPcZrOSte2oqgSKND2CCxvyh
 9TegVpbkZchDtLVLmUklrpRBo+esyKymlzyJDpeCf3ar2+xI1ituKHlj6TvblJUNaXC0
 mdj5v61YsSyXnB1FOlcVeAOliMIYrqWR2YAtSzpHX7vPLA6nx0/BbkWW4rLYLC5OiBnx
 3OgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lTV4r+1B
Subject: [Buildroot] Configure aarch64 without FPU support
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

Hi,

How to configure buildroot for aarch64 that doesn't have a FPU? I'd still
like to use FP using soft-float.

In "make menuconfig", selecting "cortex-A55" for "Target Architecture
Variant" automatically selects "FP-ARMv8" for "Floating point strategy".
Also, the menuconfig requires either FP-ARMv8 or one of the VFPs to be
selected for floating point strategy.

Thus, the final generated .config has FPU enabled.

Also, does this effect FPU support on uclibc-ng config? Because, in "make
uclibc-menuconfig", I couldn't disable "Target CPU has a floating point
unit (FPU)" within "Target Architecture Features and Options". So, the
generated .config for uclibc-ng also has FPU enabled.

I am using buildroot v2021.02.6. Any help is appreciated! 

-- 
Fiero

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
