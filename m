Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C83E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA0141339;
	Wed,  1 Jan 2025 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVguhxbWw7UT; Wed,  1 Jan 2025 19:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5DA4123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5DA4123F;
	Wed,  1 Jan 2025 19:46:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 754DDF24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F18880DBD
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAGPyEYitfQg for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 19:46:32 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=drew@beagleboard.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 190BB80C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190BB80C2D
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190BB80C2D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 19:46:31 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21680814d42so125560615ad.2
 for <buildroot@buildroot.org>; Wed, 01 Jan 2025 11:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735760791; x=1736365591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38VfO/0VQ6/WkLLen8hH1/yly3VRs91k6L7B7sUW+d4=;
 b=GnDFnM2f8j8k0eTLvL+fXZo42XerE4GrAkbHRPLshCCpIqp6SNiGxvzDyl7CzE1S4L
 dFsikOK6bEKslULWAIjyTgF4A/ZGIjB1rrn82SwQICpVwg4xAuMl8KlC0W95MV7Hl8kF
 05wQz+myuyB7maKu27RNuaugvQntbBTsCGF0dI32SEur9R1upegM17fn1gQLbw6VVbGq
 foszJ9zP7vb3V24WxG4NTsnnISo5zTGBcBNb68/rPadO52faFrzpYSaW23qrw+Cwp04I
 DFIUwFST9zLWuTVj5HqMQf6Yvd6JXuSkP+lTI8uGPwF+ajLxqpBK/6kQptr5Z6hQqXBf
 Ojpw==
X-Gm-Message-State: AOJu0YxDLribtOaXK5BcFua55lpD7woYpjMaRptRnB7XPjtt5uF914Ti
 nV8KcuIQ2Nt0vcGTxG9K6rgLpB9UCyeHpDX2LeiIDnGjNU/63r/TC7eyWSB2EA==
X-Gm-Gg: ASbGnct4EdrO0GVKxnUi0XsewY1p4HsWp61ch+SKNOd2rP4HVGddq7bE4kyCAGG09I2
 eh4J2RfGmsbyoyoSyLGxKpB66xNaNUN5EaB+Idq+zLLc4iQiwdGAVtdCoa+SVuYOSyr5GKBPghJ
 wSGc7KD85sLz4hYy9S1WK8SYuAyC8dJRfTw5m8fu2cp1ttBzzglq+AWgscgOVeFUGj0AY+g9dZy
 NlgoRfLxab8ojLjX80514CnXcxW6jfdaOCjTT7Rvf861g2uTI2YwwWbii43w2CEAgbokHX0I84=
X-Google-Smtp-Source: AGHT+IEIaklWL3DTPMq9ROs+OwEfKh18vR3kACgfXa1F+Me+6QPI06g2SFxD9AZQXQqTgeGdd/o1hQ==
X-Received: by 2002:a17:902:e5cc:b0:212:4c82:e3d4 with SMTP id
 d9443c01a7336-219e70bf156mr537023605ad.46.1735760791241; 
 Wed, 01 Jan 2025 11:46:31 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc962d15sm214164555ad.11.2025.01.01.11.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 11:46:30 -0800 (PST)
Date: Wed, 1 Jan 2025 11:46:28 -0800
From: Drew Fustini <drew@beagleboard.org>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Revy <rabenda.cn@gmail.com>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org
Message-ID: <Z3WblFPOphrna9FD@x1>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <3603154.iIbC2pHGDl@kilian-laptop> <Z3R34e8Z22ujM2mG@x1>
 <1907661.tdWV9SEqCh@kilian-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1907661.tdWV9SEqCh@kilian-laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1735760791;
 x=1736365591; darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=38VfO/0VQ6/WkLLen8hH1/yly3VRs91k6L7B7sUW+d4=;
 b=d5AuJE5qOv9sM39ZK8BUx02td8CuJ92FKvBqgDuvd3miF/uXsFNP6a79wdedKVSAc2
 mLv6kzt5rHMDkwyuvd6F0+DfN/cvXNt77ODuBxPxI2ni6ANfNrkGYdHrR5ppU18ZZjgd
 rbcz8owiO6Uepz4KYSqoeeb0MG9HMoevWi0ieXf9sNX2xPAhgLVaTihcQgDWuN6D9+K1
 5HLeWfj5VAFW6owhRDyDLfwFzzoTEA9k80wJ7TwqrMuuMjeqfxJakvz9wJ8ed+IlkYCG
 dF/JA0QP4JCr+UHHhsTJsuuU1O40XvtTJX/WMqy0mI1H8UAU0XYJmEP3lpjIJzaNMNyA
 8JTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=beagleboard.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=beagleboard-org.20230601.gappssmtp.com
 header.i=@beagleboard-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=d5AuJE5q
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

On Wed, Jan 01, 2025 at 06:13:21PM +0100, Kilian Zinnecker via buildroot wrote:
> Hello Drew,
> 
> [--SNIP--]
>  
> > When the TH1520-based Ahead and LPi4a boards launched, there was a
> > device tree node that was parsed by OpenSBI to start up the other harts:
> > 
> [--SNIP--]
> > 
> > The node was handled by OpenSBI in lib/utils/reset/fdt_reset_thead.c.
> > The problem was that the design of this device tree node had flaws from
> > the viewpoint of the device tree maintainers. Therefore, the upstream
> > th1520.dtsi doesn't have the reset-sample node. One would need to keep a
> > downstream version of th1520.dtsi that adds that reset-sample node.
> > 
> > However, this functionality was removed last year from OpenSBI, I think
> > the change made it in the OpensBI v1.4 release:
> [--SNIP--]
> > 
> > Thus for OpenSBI v1.4+, one must have an updated U-Boot SPL build that
> > performs this reset functionality that OpenSBI used to. SPL is the early
> > portion of U-Boot that does early setup like DDR training. There is a
> > build of U-Boot SPL for the LPi4a from RevyOS that does this. However,
> > I'm not sure about the status for the Ahead so I'll have to followup on
> > that.
> 
> thanks a lot for your insights! I tried two things, but unfortunately so far I 
> wasn't successful with either:
> 
> First, I made a patch which reverts the removal of fdt_reset_thead from 
> OpenSBI and try to use that patch to bring back that functionality to OpenSBI 
> 1.6. However, turn out that down the road multiple further changes were made, 
> which would have to be reverted. E.g., some structs and possible also code 
> handling them, does not exist anymore in OpenSBI 1.6. So I think trying to 
> bring back the functionality to v1.6 is probably the last resort if nothing 
> else works. I also in general don't like this approach, because it likely will 
> break if OpenSBI is eventually updated.
> 
> Hence, my second approach was to try to use OpenSBI 1.3.1 instead: I created a 
> custom device tree containing the reset-sample not you pointed out. I then had 
> to tackle a current issue revolving using a custom device tree and Linux 
> 6.12.x in buildroot (see [1]). However, there exists a working hotfix for that 
> issue ([2]), so that is no problem at the moment. But unfortunately the 
> OpenSBI 1.3.1 seems to be a problem. Uppon booting I get the error message:
> 
> init_coldboot: timer init failed (error -3)
> 
> Seems to be an error message thrown in sbi_init.c:
> 
> https://github.com/riscv-software-src/opensbi/blob/release-1.3.x/lib/sbi/
> sbi_init.c#L342
> 
> Looking a bit deeper, it seems to come from a function 
> "sbi_platform_timer_init":
> 
> https://github.com/riscv-software-src/opensbi/blob/
> bd613dd92113f683052acfb23d9dc8ba60029e0a/include/sbi/sbi_platform.h#L581
> 
> I can't track further, as I don't know which "const struct sbi_platform *plat" 
> is used here. However, seems like others had this issue in the past as well:
> 
> https://github.com/sipeed/LicheePi4A/issues/29
> 
> Their solution seem to be to switch to OpenSBI 1.4. However, I guess, then we 
> will have the problem that the core 1-3 are not activate again? If we can't fix 
> any of those two ways, then there might be still the revyos u-boot, you 
> mentioned. Is it this one?
> 
> https://github.com/revyos/thead-u-boot
> 
> It does contain a commit indicating that it might also feature the BeagleV-
> Ahead ([3]) and also has dts files for the board. What do you think, about 
> these options? Do you know anything which could help patching OpenSBI 1.6, 
> getting OpenSBI 1.3.1 running or using the revyos u-boot?
> 
> Thanks and best regards,
> Kilian
> 
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> [2] https://lore.kernel.org/buildroot/
> 035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr/
> [3] https://github.com/revyos/thead-u-boot/commit/79454e91


I think that u-boot is the ideal solution since that is the direction
that T-Head decided to go. I asked Revy on Telegram [1] and they showed
me where in thead-u-boot [2] that reset_sample() is called.

Revy pointed me to a build of u-boot-with-spl-beagle.bin [3] that I've
just flashed to my Ahead [4]. Unfortunately, there is an issue that
results in the board not booting [5]. Revy is going to look into the
issue and get back to me.

Thanks,
Drew

[1] https://t.me/linux4rv
[2] https://github.com/revyos/thead-u-boot/blob/fc9575fa63442ae87ced0b147ca1a14e30fd3d3d/arch/riscv/lib/bootm.c#L166-L173
[3] https://github.com/revyos/thead-u-boot/releases/download/20241223/u-boot-with-spl-beagle.bin
[4] https://gist.github.com/pdp7/c3b1e5aec026e92940e27169172036e1
[5] https://gist.github.com/pdp7/a76e975304e26593eb19375ce3a1e40e

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
