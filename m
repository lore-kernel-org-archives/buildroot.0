Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E2CC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A8A411EE;
	Fri, 14 Feb 2025 08:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbqFNckARj5M; Fri, 14 Feb 2025 08:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DA3D411B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA3D411B2;
	Fri, 14 Feb 2025 08:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C10A5C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4FE3411B2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDiIkUk3lugy for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D8E1411B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8E1411B1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D8E1411B1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:59:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4395817a7f2so11797065e9.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 00:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739523538; x=1740128338;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/XiottyzJ4vmy9+rRpcKVheYXxUfJZIgFNY2aeZ4e4=;
 b=WckPiW+1dbJYI/Sn4fCN0M/OJuoqu34L59i3KhART61fI9LmE8JmoeG0Kf6Z3wuJPy
 EdIbP7Ixkbr5QswOWaOjp4oliG6xXN3EnZ2P+CLee6rD/R1MyWqcFk6qkT8AA2edtgHQ
 ueu8uaQ4xdUp7NjFkA8uFkqVmjM/D0HgI9Nz4ncoxmPO8QDOeMaWnEWTKoGUqkXxmpu8
 yYqGrmjU9K1LFwnRGJZ1lftLBdve1vYUdn26iyW/lfEcq6pfIb756dBArv4P5YgcnZV+
 J6FpZfRB9aUUWr3R9jslZtMWiS0r8GWsjZ8evrKGSEd8YamzBnPsdf8fD9leM8fvV3DZ
 Eu/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp/V7qlQhGt/zXjFr43rEMf19B7jGufRhFrqJDpFyYNS2+vk2j4/F2P8XvkaZud1iOp5gc21WeYuQ=@buildroot.org
X-Gm-Message-State: AOJu0YyFrasu59gBnpjd8gavPDYmT3g37UIn2JFc8mWCadxgziz7OF/a
 nJbQwzBNIVsvl8e0vUGRqYuOeUz5zZ6mvvjZaDsOz7szb/1ytRtQqlbYs9Qlcivq/14hitXZAht
 T
X-Gm-Gg: ASbGncucfCG5zcfW674OW4LgykdEH5imQ34Pcebm4DU8Mrm+YnvHOI+IPOdgJC3RO5b
 WkO1wLvRLZfudXqah39M5pxCjnwlHtkbyUnVDRYcDn27Kn8zLW0At4gMboKnQriaeikkQwvGZ7G
 QsQ60dwqFyqiCClDwbDvR0u26VgO9Uh6fWYdyAH/arNZenTVWDQNfl+5RC64sr+hqLHEaApzoiN
 UYhzct1LAHUnWE0Ro3rjucShyMPahjMG+QF4gk9g1+VpiYqcYZok5PAgVDtiSOHq1oSc5etzzBR
 35tFlf/ByehcSNC8WWFxhSwpXYW8QKpR8fria4EbgRypE7GsoO8=
X-Google-Smtp-Source: AGHT+IHK9EI9r76bP+LnBEKM+fx+iajdJ3gJ17WAVMAz/msa1grp8cQiTgFv31hYtSQIp/sScrOpPA==
X-Received: by 2002:a05:600c:3398:b0:439:66ba:bbdf with SMTP id
 5b1f17b1804b1-43966babd61mr37988565e9.31.1739523537847; 
 Fri, 14 Feb 2025 00:58:57 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5eeesm4066409f8f.63.2025.02.14.00.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:58:57 -0800 (PST)
Message-ID: <9d11aa2f-64e7-4827-a006-6d3fa8b6d332@mind.be>
Date: Fri, 14 Feb 2025 09:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
References: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <c102f1f0-9737-415e-9f51-8e98888a37dd@mind.be>
 <SA1PR12MB5615EF0BB95C7BE3F02229E5F0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB5615EF0BB95C7BE3F02229E5F0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739523538; x=1740128338; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/XiottyzJ4vmy9+rRpcKVheYXxUfJZIgFNY2aeZ4e4=;
 b=C2cQkWdJ2zJKBRYt0wIoEHNjkUnn7YcA7q1SugnXvrNEjpIs2Pl8BXd2SoEIh/DAt4
 hd2/0OiULotlzsFKUgdDy7zUItLtzqaNWhupn3oBWUMaYa/27OlahFpkvM/ZdOD6osQO
 Jd4QuPH7oo3FwhlT/cDjRpkA27eIPHuaBsx11mSBjPCLFOQmTIlx05Ypb2HuRBC94TYj
 PN17drqg4LHapBx/fcWAU3MMtCN8EGK9A8ilsmlyeZVVp+JALrpHWAPMJodgqiwJ4bv+
 ft2xj7krENy2WcpoCrlK9pDuM4pkoPyWNLokPUuWtftg8TGMDgIkvvkcMXNb1GvoMEDo
 Sp8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C2cQkWdJ
Subject: Re: [Buildroot] Example of running a host-autotools-package several
 times with different configs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2025 09:25, Frager, Neal wrote:
> Hi Arnout,
> 
>> Hello everyone,
>>
>> I am looking into expanding the toolchain-bare-metal-buildroot package to
>> define multiple bare-metal architectures in a list and build several
>> bare-metal toolchains with the single set of packages.
>>
>> Since binutils and gcc are host-autotools packages, I am wondering if
>> we have any examples for a single host-autotools package being used
>> several times with different configure options.  Is there already another
>> package which does this?
> 
>>   No, there isn't, and the Buildroot infra is actively hostile against such a
>> concept due to the splitting of configure, build and install steps.
> 
>>   You would have to define custom commands for each step and then run them in a
>> loop with a different output directory. I.e. something like
> 
>> 	mkdir ${$(PKG)_BUILD_DIR)/build-$(arch)
>>          cd ${$(PKG)_BUILD_DIR)/build-$(arch)
>> 	$($(PKG)_SRC_DIR)/configure --etc
> 
> Thank you for the rapid feedback!
> 
> Regarding the custom commands, I see how I could do this with using
> host-generic packages because I can define my own configure, build and
> install commands.  Is it possible to re-define binutils-bare-metal and
> gcc-bare-metal as host-generic packages instead of host-autotools?

  Yes it is. However, it starts to diverge so much from normal autotools that it 
doesn't make a lot o sense to keep using host-autotoos-package.

> 
> With host-autotools, it is not clear to me how I can implement my own
> commands since the commands come from the infrastructure itself.

ifndef $(2)_BUILD_CMDS
ifeq ($(4),target)
define $(2)_BUILD_CMDS
         $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) 
$$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
endef
else
define $(2)_BUILD_CMDS
         $$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) 
$$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
endef
endif
endif

i.e. if you define _CMDS in the package.mk file, that will take precedence over 
the "predefined" commands in autotools-package.

  Regards,
  Arnout


> 
>>   Regards,
>>   Arnout
> 
>>
>> Thanks for any help!
>>
> 
> Best regards,
> Neal Frager
> AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
