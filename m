Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C89CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E022607B2;
	Tue,  3 Sep 2024 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJPYinIlQUWT; Tue,  3 Sep 2024 19:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BD560683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BD560683;
	Tue,  3 Sep 2024 19:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BFB11BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 288A64024D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfcooRwizdMK for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7532C40230
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7532C40230
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7532C40230
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:50:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so47736365e9.2
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 12:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725393057; x=1725997857;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CzL+Bv0fpsSGmyZOJTeRYTg7tbf4chWSbr5mFWjKU5E=;
 b=RPIIc+4JlxQ0s5/BSBKmoE5iMGJ4Ar6Qdt1iCLwQoN6L4e/MNPTrSqbrUkvF9SVlVZ
 tqbxJZ92DQyI1BWZzhqGfcTUUl2o1+eE0+vGVEvX1vTxHL2kI8VGVAJ2McTBfufzvM7R
 Bj4eweKqQOXKFHzl4G94Kbu6N78yd/sIOitIwVvSkV3CIVCVo22szBIOYgaHXeZGn/rS
 VJFpZLb5nGUpLHRvnvwhVMK1bt1qzYmER+HkDW2I6J3yMQ+j/GunuFF9DD/CQp3aUIIe
 rsZG3iv02fEPSdxYZnBrg2zfzymScD+QkszTsvxZcVvf1706pbmbHGs78t3AyqT4dWJh
 m/9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXibxnyxTTB3HQRAHqy298yIPiEMh4sVCNCJ7AnpciybB8IPheLuwqVEVHKctCZs+PSIW6bqksMWUM=@buildroot.org
X-Gm-Message-State: AOJu0YzsqwaP218XWu6/DjfafcTvLfpoVFv9VmQth3Gd0W6luPD05/+Y
 wJWYDDSJUpPMEeKB6gGuf54s11MZhrPEClnXC6CYXPgX/2+0LjnsMgSxiOZX560=
X-Google-Smtp-Source: AGHT+IESv6G2If0zw3xqmaMFDisf/dDkDgVW079IxrX5onzM+CbRqkC+i8m5NYBHavcjvVLESQ5LpQ==
X-Received: by 2002:adf:cd0c:0:b0:374:ba3f:d00c with SMTP id
 ffacd0b85a97d-374bf1e4d69mr8147981f8f.59.1725393056891; 
 Tue, 03 Sep 2024 12:50:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c610d437sm8106038f8f.97.2024.09.03.12.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 12:50:56 -0700 (PDT)
Message-ID: <a31976ae-fdf5-4a62-aece-52fb70775b39@mind.be>
Date: Tue, 3 Sep 2024 21:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf>
Content-Language: en-GB
In-Reply-To: <20240903212611.613c6d42@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725393057; x=1725997857; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CzL+Bv0fpsSGmyZOJTeRYTg7tbf4chWSbr5mFWjKU5E=;
 b=XuCV0hkEPffo14YvOYZ5prwwYnyOlcFEznyLGCtyDpNwv13vHbDo42NRW+J9LrV5LQ
 lmSWRYjzQy+8Yri9FNQ3zaRn18OkJEYdwUEpA0mIx+mKWmzG0YWX/V0VvCy+Ja9JrbLG
 SIqZXKzkMurxpoSZDXPWUtJ19RCPgEUP9rj7Z2GIVMaDAcdSRfgw5NtZ45o1wzPdcjit
 EA59iFUVByVr9jVtoZW+U3sVZTSS8ZP0MlQt9s+9sgmFnU0tpwuiQOsNxqUZHhDWGwTT
 5Szqyp5ECANfybwaDh6CNqCXe8ELUF8weQfh+Q6c0iWHRaf4zxKUzWo3LUhhl9iLV1yS
 qxow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XuCV0hkE
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/09/2024 21:26, Thomas Petazzoni via buildroot wrote:
> On Mon,  2 Sep 2024 12:44:31 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: Niklas Cassel <cassel@kernel.org>
>>
>> The arm64 defconfig enables both the R8169 Ethernet driver and the
>> PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
>>
>> Enable udev so that these modules will get automatically loaded by udev
>> after the rootfs is mounted from the SD card.
>>
>> This way, we do not need to build these modules as built-in, and we also
>> get the benefit that any device plugged in to the PCIe slot will get
>> automatically loaded.
>>
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> 
> I'm not sure what we want to do here, especially when this ends up
> needing net.ifnames=0 that you add in PATCH 4/5.
> 
> We do have already a small number of defconfigs that enable eudev. So
> far we only use net.ifnames=0 in 4 configurations.
> 
> Basically, I'm trying to make sure we remain consistent and have a
> policy that applies to all defconfigs rather than ad-hoc solutions that
> are different for each and every defconfig. That's why I'm a bit
> reluctant with applying your patches as-is because they only solve the
> specific case of this defconfig, in a specific way, without creating a
> clear rule that all defconfigs meeting a specific situation should
> follow.

  We don't really have a policy or rules at the moment. I've added this to the 
topics of the Buildroot Developer meeting in Vienna.

  For the time being, I think we generally prefer to have a kernel config that 
is as much as possible custom for the target board. Thus, we also generally 
prefer to not require loading modules. Certainly for ethernet - having ethernet 
as a module makes nfsroot impossible.

  So I've marked patches 3/5 and 4/5 as Rejected.

  Feel free to give arguments why we should prefer these drivers as module though!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
