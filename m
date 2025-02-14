Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE83EC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824C081218;
	Fri, 14 Feb 2025 08:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRi_culmhCnn; Fri, 14 Feb 2025 08:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A1AA8478B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1AA8478B;
	Fri, 14 Feb 2025 08:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F52C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B223C83FC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyP6_-dJoEKZ for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A509D81584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A509D81584
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A509D81584
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:17:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4395a06cf43so11032105e9.2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 00:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739521058; x=1740125858;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hy1nfdgiBRXDfZbipoISHhNsmdoYz0CSGMjNy4Q3ULE=;
 b=RzNzOi1mNvGdQI4/y7oIbWN4uBCUNxMXvs4QkjGNEwGPe1b0RjFkuvmxsdjKHisWPW
 8jfrl6nZRGSlNKKYX+O8XluaLY/nDA+R479tTjk6Bdrp4RxCkzS3TzcLmABNWficCtRy
 VDqA9zDV32YFlFN9ROOmk8YRjBwisFQKXUVt0TNwIXSgsOZ7lLj9QfQuGzRMvU0TjUfR
 7H+9CABL26W4FEOi6m9fY77cRKuK5bl292YHIua3n3zPm3M6tOSm3s4/XDeFN4hpfyUC
 /dNsdtPOW29MHaJ6A4Rc/DOaSiUKgEHl6Sccw8XH1lo1MArK5SJ7v0PxMmCBt5nGZfbC
 EU6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG5a7Y9Thvbs4QjSlspz6Eg2XZmcTMKR02UIX2JwkFPI8XybsSsyjl8FiHYADaE+ulBFuhDGATQ4s=@buildroot.org
X-Gm-Message-State: AOJu0YyjCRGyi9vk+sCfWKcVOl00g35VdaruBYXNq7P7TPf7Kj3dc3t3
 INw/gHyB9y1okMB4oxjZoYdGtcj/sWxwsPaYDn0bs3ph7jmeDli65DKSWV28CSA=
X-Gm-Gg: ASbGnct/+C9uDBdx2oqTaBgmXWRfHjdfqkCcCIiwjobANmiVSn2LVDi30clS80ZJ02s
 mHxM0m10/3I5EN+Efm1RHYObOpgCybfYhRI8NQlfAfLcOln8SP7S4HPX+7pTqwKUzmWTF1er9cZ
 vzGxzrXMDbpnaefwvW9wJmY/TqgdfIhs+FroRw1e1UeAjI9uOvukbtpbUDF+kit8ROqhScHK34P
 hqezBh1MRyGl6OlAV5f2z+im1NQha41/wmkndeTMBHShzon9whxbPrecA2MysMP8lubL3aHK1jv
 U/l9ChEDht2rus0+rX4a87ZMzemLN/9axR8WfXkqcC+yb+4nt7g=
X-Google-Smtp-Source: AGHT+IHz0UGCYdLiTzXJOWQX50Sm3fGKz7SurxaAD37+Su2UJyuEsYiA3aJDKLoW/Bs7fF5oc7CNTQ==
X-Received: by 2002:a05:600c:46cc:b0:439:5f5b:e98 with SMTP id
 5b1f17b1804b1-439601a96f3mr72274465e9.27.1739521058487; 
 Fri, 14 Feb 2025 00:17:38 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439507518dfsm49838085e9.1.2025.02.14.00.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:17:38 -0800 (PST)
Message-ID: <c102f1f0-9737-415e-9f51-8e98888a37dd@mind.be>
Date: Fri, 14 Feb 2025 09:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
References: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739521058; x=1740125858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hy1nfdgiBRXDfZbipoISHhNsmdoYz0CSGMjNy4Q3ULE=;
 b=axglMSJu5gfykAmDumPJwsMvWvLrz0HCAj679JXcrUDlb1fYgsyGFSsr8bpwWeJne5
 WZNFEj9JUZwFgTKmFi415ZpSJrVD+PmbbERzykxb6bIgWAmZoRQiLv6TLmQdye+jBRnP
 fI5l9dau+uJ/OUU5Tq9rb/BkaP4PUlhgdVgQSIiowVX/XY9AexGx4npf1TsF/f4iJNEw
 0bKxm8tbttCJnO2RdsVtBFqiZQAyTYzgCvkxeb/c0TY1DQFmQKxR7dzuf/h/IareaLWq
 DoSkFcMC//nd7B+vW+8yRBRrY0ZrAA1uV0lfV0Vnzg4BN0H3ZKFjWGZZs6dSov26rDGY
 3ddw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=axglMSJu
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



On 14/02/2025 09:06, Frager, Neal wrote:
> Hello everyone,
> 
> I am looking into expanding the toolchain-bare-metal-buildroot package to
> define multiple bare-metal architectures in a list and build several
> bare-metal toolchains with the single set of packages.
> 
> Since binutils and gcc are host-autotools packages, I am wondering if
> we have any examples for a single host-autotools package being used
> several times with different configure options.  Is there already another
> package which does this?

  No, there isn't, and the Buildroot infra is actively hostile against such a 
concept due to the splitting of configure, build and install steps.

  You would have to define custom commands for each step and then run them in a 
loop with a different output directory. I.e. something like

	mkdir ${$(PKG)_BUILD_DIR)/build-$(arch)
         cd ${$(PKG)_BUILD_DIR)/build-$(arch)
	$($(PKG)_SRC_DIR)/configure --etc


  Regards,
  Arnout

> 
> Thanks for any help!
> 
> Best regards,
> Neal Frager
> AMD
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
