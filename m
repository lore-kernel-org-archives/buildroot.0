Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999DDC27C55
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 18:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 420F8415EA;
	Thu,  6 Jun 2024 18:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjPvuZkM616T; Thu,  6 Jun 2024 18:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2D2141678
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2D2141678;
	Thu,  6 Jun 2024 18:09:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 202491BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D11482139
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8oERPTkylwh for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 18:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78A4782134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A4782134
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78A4782134
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 18:09:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52b912198f1so1879502e87.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 11:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717697368; x=1718302168;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wij1JJF0eMHbdHDd6tV4tdJmoJMfhyEZw6ZMZCVVBIs=;
 b=q0xNFbVXLMiEMJBhE+ABPW/fMzY7oA6KjR9+HYqFGLURICyrqKCTXVf8z2rxwsQaYN
 BlMhc2BIjWA54sJYWRTgql+hCooO210DOUa8v1K2b9/irHW+6qO/5EibzTiQ7YKy+E+t
 cRHApSLQvRJEr1X88zlIqk8UnLA9TwSs2Akc1Mcn5AhBaWxkPNyC2yo2WzM7/n1nvOOw
 7ckCGT/xK6VRCL2ImqFONSlFmxjjE1pYGe8Jf1DGGiT4EElPS67YNa3HkaMTOEpmGcsM
 rvg+dOr2lQVMQc8lXd5SuykoCVi9QCIqkTRWTioAkRPBSBpAzOeYlUaEuWnhMK1J38vH
 3New==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrFN52laHXrHIZHDqsGIRautelwbpz05rJs30DRo7AbPDi3B82DLRuCf+8JUJl/PNv1DFMENt1u1sD4RwA5UujJhDmYLrJlw==
X-Gm-Message-State: AOJu0YwS+J/JYGV+qKTw2t3PTcaAF6g1Gn4BXKhh+ce1z4gYW7JDobeM
 5Ext7IK4G3jKhuYfGp9BxjCPZWIjTFW8w5oCy72LUDjD4uLg8KKG1CBTh2KO3Tk=
X-Google-Smtp-Source: AGHT+IFRsHVPDt/156VQynI2jRtYIUY3kWAotcbyRtOK+py/VxhNmqozqwrjHwqAhvk3X19b3tQv7g==
X-Received: by 2002:ac2:4c15:0:b0:52b:4924:5348 with SMTP id
 2adb3069b0e04-52bb9f67b31mr261355e87.12.1717697367336; 
 Thu, 06 Jun 2024 11:09:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d685c9sm2208728f8f.53.2024.06.06.11.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 11:09:26 -0700 (PDT)
Message-ID: <13f2f3fb-31ed-4a20-a0c8-304f359da64d@mind.be>
Date: Thu, 6 Jun 2024 20:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda>
Content-Language: en-GB
In-Reply-To: <ZmHU1-EPxRFiHZDl@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717697368; x=1718302168; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wij1JJF0eMHbdHDd6tV4tdJmoJMfhyEZw6ZMZCVVBIs=;
 b=GQ+tZbsuXiizXOYcpZ4Uu5hjwpZncXtu7509+OdhG6ZCNqmWrCe7oPrO9HonsxQGrU
 jPFsGLERR1yocdZSUpz5gbq4nw06+w56/vEeK9PSigv+C0xnUonpoHuG47OCGdjgNTkU
 /+xbHjIQlB8eXkoS9yZzhN0PWUnudgnRdU+VHW8P9wNntZ6f8YSS4zsvlzUAeojlmGFT
 RpFGknuCNb61KMdN5WveMAZtqlnWH/xEzYO8SK+bRuve4S+Ik+SPP8rYe+3qReMM6iMz
 9zWvC8L4I0I9hwMlxdGrP9u8yXZSmhw7K9v5mpNQM3qgUww3guasqJnsw5NtvL4v3cB2
 HTIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GQ+tZbsu
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2024 17:25, Yann E. MORIN wrote:
> However, while applying, I noticed that those boards do not have
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y (so my post-apply hooks triggered).
> 
> I wanted to add that and point to the newly introduced
> board/xilinx/patches, but that will not be possible.
> 
> Indeed, those defconfig use BR2_TARGET_UBOOT_ZYNQMP_PMUFW, and that is
> added to the extra downloads, and we would need a hash for that file.
> 
> But the filename is unversioned, which means that we can't differentiate
> between pmufw.elf from yesterday, the one from today, and the one from
> tomorrow.
> 
> So, when arbitrary downloads of unversioned files are done in a
> defconfig (or in a package enabled by tht defconfig), we will not be
> able to force checking the hashes...

  We could re-introduce the "none" hash method... But that is perhaps going in 
circles...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
