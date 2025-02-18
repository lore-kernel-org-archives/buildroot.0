Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6DDC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 08:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 738B341235;
	Tue, 18 Feb 2025 08:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI0LihDK7cdM; Tue, 18 Feb 2025 08:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8AE41293
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8AE41293;
	Tue, 18 Feb 2025 08:00:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A336968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6849D4033F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STcYYAKgQt3R for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 08:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 724DC405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 724DC405C7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 724DC405C7
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so1736929f8f.2
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 00:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865624; x=1740470424;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExxzpTfRx0VCl5QMcpUBEmynUNuHS2JU9V9J4P+/0XI=;
 b=wkEYJh6419MdK6y1YrUr+MyPug1nfqj+7Sj3pnzWTr86R5VR6ZtdBnPJbzgORrPZ1A
 MwOHdpjMUJhdVsvsRsCMqoeNZgDAhD3JPzELThuvyOmdYjnhNItZnLae6xUto4/SaISy
 vMoznFP3bj5Y9sa32Z4ZYlCeHjJG30dThZ92NOV4KvwsumtMmZOpW9X3ZtskciewZJ2K
 Y/z7nvd/noYjwNdsNKCme4JBHx1DSCfCKpp4yEgAr4etVKEZh+gJVlgWB/QWh0lxvefb
 BDPp8vjewr0i07CwIDaFoGIkj3qY7p86Aj1GK/HWiP4olv6eWb0tfTBWb8aXhsWQKp9n
 cMCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCjBqbf+Vc9T43tcbN8qa49AkVfeT0JRvaFXKgyFjSshSoXALt1M5MdLpSJwBE1x2WQ/aC3Pu1lBU=@buildroot.org
X-Gm-Message-State: AOJu0YzdJwINumY0BXp3Xzxxie75qKMlRh4TyovRYhG0ZLZ0+vKxAvK2
 ordjUJo+5/jQjvbq4t3aV0ZCRlpeRVcnhahuSRQhfdQ3hp74CWsj5NIfGGSuE94=
X-Gm-Gg: ASbGncujbUh886Uaex28Eo5hVYCcHmlqSOxO4q9HPyIJ1eS+N6pori7aImWajrRXies
 LxS4t9WGHuuDpW+Dr/b9DppVGNncBQVvzmCArLtKdIdp7wTn3oLQX2Vb1y3Fzs7qC51b1S3ooII
 +ML6rJWfNx5FQxtFes8ISM5Tl9pxWwNYABfFCvzewc6XVQgUiRdOFw/BsmfweUvZ2TkuyojcyIQ
 iPXTIZxKhuhOc9idFYCMrNNX532Z9lfw2SeauUona3BAtDcCznZlER/d8R3lUU+SP+3azT8AGUb
 Erzn6Khj4+nLeezhj977kqENNjAm/f+assK20JOAE+xupcgt038=
X-Google-Smtp-Source: AGHT+IEzL84CzQYzxJcubaRNL7rCi/5h88oEU5I2zx1V5itoEhlnUfzyX7fb7tNXgc3NRs7CCRhsUg==
X-Received: by 2002:a05:6000:186e:b0:38f:457e:3f2b with SMTP id
 ffacd0b85a97d-38f457e403emr6074804f8f.6.1739865624384; 
 Tue, 18 Feb 2025 00:00:24 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b439dsm14118103f8f.8.2025.02.18.00.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 00:00:23 -0800 (PST)
Message-ID: <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
Date: Tue, 18 Feb 2025 09:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
 <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739865624; x=1740470424; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ExxzpTfRx0VCl5QMcpUBEmynUNuHS2JU9V9J4P+/0XI=;
 b=cczq7cP2ryiheiks7sgRFaf1/HbY7Uwos9iQVZsbqgIwVrdd/SL4yefckLQblBC3+i
 TttVAROIRvR+QRluI3Qf3Uq1qJZsoPdXANdPeFbHd4JG/zLAhWyWgbrReCxkGy3JUI0c
 Jjl4NrzxonXXzmHsYQuIObKYnoReeEjk9lVhzOX+7Y9Ya8r3assmw0TcviLQp1bN4DAW
 YZ7yKTBAvvN03yuJfMaeu/v8W5Ac9PIx4Klh7SW0uNiECF56Zcn/8mA77slABjJQHr0K
 J17750YcfRS5rl6uvCfnm9CVLEVAuBRdlb8sXN2b7kZYiTIcC1o/PeHbLNL1zU98pMGA
 1AXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cczq7cP2
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



On 18/02/2025 07:11, Frager, Neal wrote:
> Hi Arnout,
[snip]
> Even though Microblaze only ever exists on Xilinx silicon, if someone
> wanted to run Linux on a Microblaze core, they would get a toolchain
> named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.
> 
> Since we are using Buildroot as the build system, and since the vendor name
> does not change functionality, it is probably better if we re-name the
> bare-metal toolchain to microblazeel-buildroot-elf instead of
> microblazeel-xilinx-elf as it is named today.

  It might have been better, but changing it now means that anybody who has a 
current config which includes xilinx-embeddedsw will also already have the tuple 
set to microblazeel-xilinx-elf and will get a build failure when 
xilinx-embeddedsw tries to build with microblazeel-buildroot-elf.


> The toolchain package is called toolchain-bare-metal-buildroot and not
> toolchain-bare-metal-xilinx after all...
> 
> Assuming you agree with this, I will submit a patch that changes the name.

  I don't think the consistency aspect is important enough to be worth the churn 
and the backward incompatibility.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
