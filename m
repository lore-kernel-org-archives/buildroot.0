Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC994C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 11:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8BD610DB;
	Tue,  8 Aug 2023 11:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D8BD610DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGrpl151M2Nl; Tue,  8 Aug 2023 11:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FBCB610D7;
	Tue,  8 Aug 2023 11:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FBCB610D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFFB1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 11:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55C3A81F58
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 11:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C3A81F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjBAhf71jaL1 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 11:22:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB34681CBA
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 11:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB34681CBA
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2b9ab1725bbso87336771fa.0
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 04:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691493754; x=1692098554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LsEQW2nrZRCpkjmWf3DJcypy80EEslYS1RSBq7G42QU=;
 b=Zt0njAfWV3kFA8oY1PfCm0acM1RNfaA+tEYULxQKsMO8kkDGM4BMwug/iTOwUi43mi
 cnus48gW7q/kbcdJ0HLBZkLTqYQq9e6mCEADo9gJmBEXxw97LxrH6JrQBfsXi30Vfum4
 vZ8dxjlIxDoi0zLClrCGy3yWPIc4YMBvsx02QrXKKOgoD3qxXR1zynBXWdOOELP2uLpB
 xkKdJWZxkmMmejwJixgXtTBKD/z8INwz79NTVqBMHrpyjlLWadyWG2rC9cn8Fz72ZxZL
 UmJ1vOcv/yonFuDiEyLKnaszMtvI8/nHaVkmW/MzWtpVLX1iyHsI35JACErzdYgj3MWy
 74Yg==
X-Gm-Message-State: AOJu0YxVfM78ocVbcSGv2HyTwDUpDqXNMxDFKHrVDSgcrQN6rWqbSaN0
 iF1Zulizpk+YpVk2aDEanrh5xZH950c/h29D
X-Google-Smtp-Source: AGHT+IFAiCOvL3h8fs08o/k7+Egh24IccRYppefvNtRST4imvKrf95w5yL8yVYFo5Do7WwANo5bHKw==
X-Received: by 2002:a2e:6a10:0:b0:2b6:c2e4:a57a with SMTP id
 f16-20020a2e6a10000000b002b6c2e4a57amr8180635ljc.38.1691493754245; 
 Tue, 08 Aug 2023 04:22:34 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 t9-20020a2e9c49000000b002b6e15ccf88sm2215076ljj.135.2023.08.08.04.22.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 04:22:33 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4fe0fe622c3so8724977e87.2
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 04:22:33 -0700 (PDT)
X-Received: by 2002:a05:6512:401b:b0:4fd:c785:58b with SMTP id
 br27-20020a056512401b00b004fdc785058bmr8582775lfb.4.1691493753244; Tue, 08
 Aug 2023 04:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230808090407.558957-1-thomas@devoogdt.com>
 <20230808112016.226ac8be@windsurf>
In-Reply-To: <20230808112016.226ac8be@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 8 Aug 2023 13:22:21 +0200
X-Gmail-Original-Message-ID: <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
Message-ID: <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v1,
 next] package/llvm-project/compiler-rt: fix build with Ninja
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <dalang@gmx.at>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Yann, All,


> Not sure to understand: the default backend for CMake is still
> makefiles, and compiler-rt was not switched to using ninja. So?

No, ninja is not yet the default.
Yann did some tests to find out if it makes sense to make ninja the default.
If only a few packages break on it, then we can force them to use make.
But if there are too many of them, then we can just keep make as the default.

Either way, see this mail:
https://lore.kernel.org/buildroot/20230806205447.GW421096@scaer/,
where Yann told me that compiler-rt fails on ninja, so that's the
reason for the patch.


Kind regards,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
