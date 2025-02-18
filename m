Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A128C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 10:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B782540BCE;
	Tue, 18 Feb 2025 10:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTuIgXb_G4dN; Tue, 18 Feb 2025 10:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D9E40BD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D9E40BD4;
	Tue, 18 Feb 2025 10:57:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A131BC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BB2282B97
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37TffVSNVwWV for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 10:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A626D814B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A626D814B6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A626D814B6
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:57:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso3838400f8f.0
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 02:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739876230; x=1740481030;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//r7Ef2jQL6DC/VSPLTp3DjXGjTzhtoOsWt2M3XYhAk=;
 b=Ctk45qkAzvNmnQxSae4jErjyiUS6+Ovno6H+eRNL0nvDTUaT90W58KO/qYP322a2Dn
 /3XPATo4KDFfglORucQRrr0lIBFv9AHIizprJzdkjLqkEkukTpUfRWRNKGafgWmtqQZP
 izpwic3JHY5DpMikK4O7dqYgVNv16AETSCnzW/Q0wLvnyBlM01KFDNjGY9oYUQx8tNM1
 Tgj9OTByS67JzOi5ReprtREaD77+k9xbIqEguo95WtjFx/wiRDDpGkJSeUUKDwoPvGr5
 GPHQzNhrKVVJ6VPuauIX62GoRtL97Ddj0jDs45VBof7llwTGvJS56B2zytg2xAtSkAaP
 avIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtAQjKpl6nEtQEmgBzN1N+TTfgFv+gXaSrPg64fjK2A7MlbivL5ESybDUCnpsW8liQcx8iTvJo5JI=@buildroot.org
X-Gm-Message-State: AOJu0YzBRSuRC6Kw71JhqemZ2UXhupTaccuIFfRswh+3AUOQPxEg9yY4
 jl0Os0i+relej5x1zdhJlhY4ddtX0W0myRySmcZmzOr4Xk1y3XoHEPuzldrcwd0=
X-Gm-Gg: ASbGncvZL8xUKy/G9kaXtcyo8kAs5TJInciw0LooFUuU0Vwp+eoJphyhJRpXKaokqjH
 X3hCjyJKYR1tlaidkLY8W9K98+VquhIX4lMxJhUbxPsVOyIKcFEkj1t1znOUR3reMyZU1x+OUIR
 mhM/+m/jorzZXP3AWO8yh+nPi2ZCI2v5RfzEHznLEP4wJmZkl15q2GCX+I2HYZPSWPHxQMdNb/V
 zCib2ic/nWkaunNdmRXricoFlJIKzzUqKvW7MA0hb7HLk3Wh27LMVfetP5n0YUaiqmEK+OUNivR
 cMS/bJbfyxHjH10FAHD1LGX/yxLWgyl+sNgqVzK5wT1x3ypP5SQ=
X-Google-Smtp-Source: AGHT+IExacF+MekXDnxsQa/4tHUUoeUNpayTsF9gBVtmiMNMyD8YEyJqjcSeJKoRfuZjzyRcmzO6+Q==
X-Received: by 2002:a5d:5888:0:b0:38d:c6b8:9fe1 with SMTP id
 ffacd0b85a97d-38f33c28898mr12722747f8f.24.1739876230290; 
 Tue, 18 Feb 2025 02:57:10 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccef7sm14952884f8f.31.2025.02.18.02.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 02:57:09 -0800 (PST)
Message-ID: <2451e9ee-a8d0-4bd1-b70f-a6582975f2ea@mind.be>
Date: Tue, 18 Feb 2025 11:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
 <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
 <SA1PR12MB5615BD8CC8188A05A71DA016F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB5615BD8CC8188A05A71DA016F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739876230; x=1740481030; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//r7Ef2jQL6DC/VSPLTp3DjXGjTzhtoOsWt2M3XYhAk=;
 b=MYQTKLLUwPNsT6ZcpZWr5cWyLGAENk9WO+nmebIPWO2/yXkejT+zAii9iJa0ZofVIJ
 /CAvC1Z0wXUAUzpQwU0JM8v1wTmfDK9/6Yyaug9SUC5VO4JBEaxxsUVccmCHDTTIyVIH
 2RrgyVfcpY8Jo+Vw/YHCPwAZDGPUuhUmgydp25MVgVjdgTCv3Rn7Q6pYV0dBX5PC53fE
 miSzKKukr/CWNFwpGBkv+fyXSnaVLJC3YATBUNF/Tq/M18cya2sesRdCAvYdhrR1zyv8
 enWUy0t6JBmukPPygF5yHHbC8ndWLMI0On1kN/aoWGgLGGvxc+9Ygb1rTAXzZBs+6izM
 QpuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MYQTKLLU
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2025 09:09, Frager, Neal wrote:
> Hi Arnout,
> 
>> Hi Arnout,
>> [snip]
>> Even though Microblaze only ever exists on Xilinx silicon, if someone
>> wanted to run Linux on a Microblaze core, they would get a toolchain
>> named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.
>>
>> Since we are using Buildroot as the build system, and since the vendor name
>> does not change functionality, it is probably better if we re-name the
>> bare-metal toolchain to microblazeel-buildroot-elf instead of
>> microblazeel-xilinx-elf as it is named today.
> 
>>   It might have been better, but changing it now means that anybody who has a
>> current config which includes xilinx-embeddedsw will also already have the tuple
>> set to microblazeel-xilinx-elf and will get a build failure when
>> xilinx-embeddedsw tries to build with microblazeel-buildroot-elf.
> 
> I understand.  However, unless I am wrong, we have not yet issued any
> release tags with xilinx-embeddedsw included.
> 
> This means that anyone working with xilinx-embeddedsw already is working
> from the buildroot master branch, and would probably catch the name change.
> 
> Do you think it is really too late to change this?

  Ah, I didn't realize that that was the case... In that case, it is worth 
"fixing" it.

  Regards,
  Arnout

> 
>> The toolchain package is called toolchain-bare-metal-buildroot and not
>> toolchain-bare-metal-xilinx after all...
>>
>> Assuming you agree with this, I will submit a patch that changes the name.
> 
>>   I don't think the consistency aspect is important enough to be worth the churn
>> and the backward incompatibility.
> 
> I understand.  It is a bit of a shame to have to live with it.
> 
> I suppose another solution is creating a symlink for backwards
> compatibility, but not sure if this is better...
> 
> Best regards,
> Neal Frager
> AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
