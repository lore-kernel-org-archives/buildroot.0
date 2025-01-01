Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8AAE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 19:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 800A341333;
	Wed,  1 Jan 2025 19:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xndNi3EVQKuY; Wed,  1 Jan 2025 19:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AE641237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AE641237;
	Wed,  1 Jan 2025 19:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D78F27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22AD760861
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pN05qYCHXKwD for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 19:48:51 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=drew@beagleboard.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4C58605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C58605D4
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4C58605D4
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:48:50 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2165cb60719so147074135ad.0
 for <buildroot@buildroot.org>; Wed, 01 Jan 2025 11:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735760930; x=1736365730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMOuuzQvILd0vl6JqHI2bdp+4gSAD+PMfmQfNZlaWIg=;
 b=BRAN8Yp36W6Odu0osKbnDwphd3mpcyzqkssmMif/gi49qoJvO45vbS4sEgKg9GDmZd
 PUlgmMYw8OcYDyZfOT0sKnpScJkYCG2+pasFgnf0G2rvAWPyukpcqW6EPe3WpbOScl6E
 mdwb9rsA9ZUraAmBKeZkySRPUegLrphbB1es6HRGtRcTSX1ZOSXLAgsdFFtXkK2zosrh
 F/2JeDQj/VWLfI9NAHVsLdG++SEd0m7fLBtYZy5XQeQiaoXMbyZWVc/Li7u5bgolK8j9
 S/ii7bBpKNRv33XsakEZLeZoybaLBzoV536CNzCx8WryRgLGYSPt5BTREpHOFnJs70pT
 Npgw==
X-Gm-Message-State: AOJu0YzKSPb4DO9CJiElOj//PQhbtkRqhyLF7bDZss3E47jY+YkQuoIe
 4vUuqWtYNs4iEtmInTAmZs9936vxu6zdMiVmD+ZvXw/Stj4hGYw6/bEp8Z6nbP4LBDlBAMSZ8CA
 =
X-Gm-Gg: ASbGncuRuDYW8wgt9t0GyGGt957Se0R+OhbwjXJmcTDbJuPpMoPxy67xW1mVXGXssOl
 3cjTe/P+ibc0nyCkxzP2AKRZFbjddV+nqh5wq5K0gviuVQkqjr6vVxsNEP80oz0FaOk4LaVf9Xj
 KJESnBX6PX0USRtx1DlU96rN3J2TFJP1W+T9k9UC5gYeH8Ojq5dl/B3g5CcFby6QYPXdd3ufW1u
 /EVwSOR5VCeIMFZsK2LgQ2nh/PKEH7gAjGTIF14mcRUeZgVUn/lp43mNfwV6+6sVTfos1hfXYY=
X-Google-Smtp-Source: AGHT+IERnOrDjbaFUvBgPB7FSlXWV+1ykUeyGVL5iwmibMTIwj1KjKPXS4iNYLjXYKBSvKkL+74aNg==
X-Received: by 2002:a05:6a20:12cc:b0:1e0:d533:cb2f with SMTP id
 adf61e73a8af0-1e5e081d14bmr64798151637.44.1735760929945; 
 Wed, 01 Jan 2025 11:48:49 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-8e2478b59bcsm8925118a12.72.2025.01.01.11.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 11:48:49 -0800 (PST)
Date: Wed, 1 Jan 2025 11:48:48 -0800
From: Drew Fustini <drew@beagleboard.org>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Revy <rabenda.cn@gmail.com>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org
Message-ID: <Z3WcIOKr8jnCUVCY@x1>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <3603154.iIbC2pHGDl@kilian-laptop> <Z3R34e8Z22ujM2mG@x1>
 <1907661.tdWV9SEqCh@kilian-laptop> <Z3WblFPOphrna9FD@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z3WblFPOphrna9FD@x1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1735760930;
 x=1736365730; darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMOuuzQvILd0vl6JqHI2bdp+4gSAD+PMfmQfNZlaWIg=;
 b=eFPzREtHufuEdK1qGyAhTOdH5vR7pWilwbN4a1M7FD7+SrVKnjrDMXWt0K/It4W1R5
 RpQYuxxb2zyhqFyhY+EaLVvrHUSUZ8wNsAvwe6QUMXDEq61S23Of8PX0JnxOlHfi/Mkz
 RNKOzyJpxmIEjlps1h1C7TsZc9IIrUsoz2D2zl5edFyO3kIHsTJkrfVkPcKB8+ghnajh
 PHxzzk5TA0f0FYCn/UzSfjSqFAq/t8UovjAtlCYRMcqYVx78+zVb+2vpDcItXKR2LZ1x
 Do0MyoDB5am2wYmf0kSadZdYiKPA52acjANzEaC0T9yZHZ64RjyehfnzQtgQdgckTAS5
 2iDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=beagleboard.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=beagleboard-org.20230601.gappssmtp.com
 header.i=@beagleboard-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=eFPzREtH
Subject: Re: [Buildroot] [PATCH v5 0/2] Add board support for the
 BeagleV-Ahead
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 01, 2025 at 11:46:28AM -0800, Drew Fustini wrote:
> On Wed, Jan 01, 2025 at 06:13:21PM +0100, Kilian Zinnecker via buildroot wrote:
> > Hello Drew,
> > 
> > [--SNIP--]
> >  
> > > When the TH1520-based Ahead and LPi4a boards launched, there was a
> > > device tree node that was parsed by OpenSBI to start up the other harts:
> > > 
> > [--SNIP--]
> > > 
> > > The node was handled by OpenSBI in lib/utils/reset/fdt_reset_thead.c.
> > > The problem was that the design of this device tree node had flaws from
> > > the viewpoint of the device tree maintainers. Therefore, the upstream
> > > th1520.dtsi doesn't have the reset-sample node. One would need to keep a
> > > downstream version of th1520.dtsi that adds that reset-sample node.
> > > 
> > > However, this functionality was removed last year from OpenSBI, I think
> > > the change made it in the OpensBI v1.4 release:
> > [--SNIP--]
> > > 
> > > Thus for OpenSBI v1.4+, one must have an updated U-Boot SPL build that
> > > performs this reset functionality that OpenSBI used to. SPL is the early
> > > portion of U-Boot that does early setup like DDR training. There is a
> > > build of U-Boot SPL for the LPi4a from RevyOS that does this. However,
> > > I'm not sure about the status for the Ahead so I'll have to followup on
> > > that.
> > 
> > thanks a lot for your insights! I tried two things, but unfortunately so far I 
> > wasn't successful with either:
> > 
> > First, I made a patch which reverts the removal of fdt_reset_thead from 
> > OpenSBI and try to use that patch to bring back that functionality to OpenSBI 
> > 1.6. However, turn out that down the road multiple further changes were made, 
> > which would have to be reverted. E.g., some structs and possible also code 
> > handling them, does not exist anymore in OpenSBI 1.6. So I think trying to 
> > bring back the functionality to v1.6 is probably the last resort if nothing 
> > else works. I also in general don't like this approach, because it likely will 
> > break if OpenSBI is eventually updated.
> > 
> > Hence, my second approach was to try to use OpenSBI 1.3.1 instead: I created a 
> > custom device tree containing the reset-sample not you pointed out. I then had 
> > to tackle a current issue revolving using a custom device tree and Linux 
> > 6.12.x in buildroot (see [1]). However, there exists a working hotfix for that 
> > issue ([2]), so that is no problem at the moment. But unfortunately the 
> > OpenSBI 1.3.1 seems to be a problem. Uppon booting I get the error message:
> > 
> > init_coldboot: timer init failed (error -3)
> > 
> > Seems to be an error message thrown in sbi_init.c:
> > 
> > https://github.com/riscv-software-src/opensbi/blob/release-1.3.x/lib/sbi/
> > sbi_init.c#L342
> > 
> > Looking a bit deeper, it seems to come from a function 
> > "sbi_platform_timer_init":
> > 
> > https://github.com/riscv-software-src/opensbi/blob/
> > bd613dd92113f683052acfb23d9dc8ba60029e0a/include/sbi/sbi_platform.h#L581
> > 
> > I can't track further, as I don't know which "const struct sbi_platform *plat" 
> > is used here. However, seems like others had this issue in the past as well:
> > 
> > https://github.com/sipeed/LicheePi4A/issues/29
> > 
> > Their solution seem to be to switch to OpenSBI 1.4. However, I guess, then we 
> > will have the problem that the core 1-3 are not activate again? If we can't fix 
> > any of those two ways, then there might be still the revyos u-boot, you 
> > mentioned. Is it this one?
> > 
> > https://github.com/revyos/thead-u-boot
> > 
> > It does contain a commit indicating that it might also feature the BeagleV-
> > Ahead ([3]) and also has dts files for the board. What do you think, about 
> > these options? Do you know anything which could help patching OpenSBI 1.6, 
> > getting OpenSBI 1.3.1 running or using the revyos u-boot?
> > 
> > Thanks and best regards,
> > Kilian
> > 
> > 
> > [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> > [2] https://lore.kernel.org/buildroot/
> > 035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr/
> > [3] https://github.com/revyos/thead-u-boot/commit/79454e91
> 
> 
> I think that u-boot is the ideal solution since that is the direction
> that T-Head decided to go. I asked Revy on Telegram [1] and they showed
> me where in thead-u-boot [2] that reset_sample() is called.
> 
> Revy pointed me to a build of u-boot-with-spl-beagle.bin [3] that I've
> just flashed to my Ahead [4]. Unfortunately, there is an issue that
> results in the board not booting [5]. Revy is going to look into the
> issue and get back to me.
> 
> Thanks,
> Drew
> 
> [1] https://t.me/linux4rv
> [2] https://github.com/revyos/thead-u-boot/blob/fc9575fa63442ae87ced0b147ca1a14e30fd3d3d/arch/riscv/lib/bootm.c#L166-L173
> [3] https://github.com/revyos/thead-u-boot/releases/download/20241223/u-boot-with-spl-beagle.bin
> [4] https://gist.github.com/pdp7/c3b1e5aec026e92940e27169172036e1
> [5] https://gist.github.com/pdp7/a76e975304e26593eb19375ce3a1e40e

Revy just replied that I should be trying mainline OpenSBI. I have to go
offline for awhile but I will try that later today.

-Drew
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
