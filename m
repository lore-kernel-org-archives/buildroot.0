Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D2C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B289831F5;
	Sun, 16 Feb 2025 12:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcf-nSb_9etV; Sun, 16 Feb 2025 12:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9895832D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9895832D4;
	Sun, 16 Feb 2025 12:10:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD87C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3127781ECE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Sz8VCq1smyk for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC912831F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC912831F5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC912831F5
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:10:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-439685e14f1so13636665e9.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 04:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739707829; x=1740312629;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3KSPIPk8QnReDkDLaKMzPUhKNMEbzGGOCkh6NfaLv8=;
 b=Rr7+LtRvzI4W7c4vP6zUo2/zRM8rc4J7XTsjEUeTrrlZLJCP84g1ulp3lLcIXfWZAr
 dyTJsRIEb3JtGpYLYDBeqCjztgRx8ZgAIpBtXac4dvl4I7nM/SKxIFuX5mDCw2SgRAZL
 HhcjyoB3S5Gfr2tRKsSZFcWhUsdGNGLOFmZDLbxxB+JrlfoVn/VXr0A1q3kcSW2iYTAb
 GlCWH12tXAZQFO5Zw7WI0jZVS3yRh/SPjf8ZAomC3bof0y4qdOIRbA0SEl/FB4iXZo1t
 oJ0VlNtFSd6S22wfqH9y+bRSfXFJ8Vo/xND05vx1cGnTaiVhgV7iMkh+mDOulpmcfjm9
 8Hmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuK2hjOSGZBg3Y2VrOXKLdmCZKyQulEiURO6oOR6U1vdUBDLn2sHm3ccSTc6s2vO8MmLM16RSlfbM=@buildroot.org
X-Gm-Message-State: AOJu0Ywdw1MWFhRMXNPvJIgsw7FzWs9lu2k1L0tnbxOFTm3tACsoI1xe
 mBY7Bk0Rc0N98kuQ1/u8ehOwlJewj/YBK0YuotCnDefi8ELhEGAhejBflkau6lY=
X-Gm-Gg: ASbGnctiW9GrGOshxMwUvrijFi8N0yvCVsdKAnR9bzJsozAs2bj07GNcxVzfY+fkAYb
 w6ZXFOSsozxT429+o6qm5WQweQ10AKvg8PXonUTiUVQSlGbnOe83h42bvXaBjaRLFouigP2E1aF
 RlZRnaRXu2cZIgOTDzxQc4pX7oNrTDrTxYN38jRw27pvbf7WNBfL2Q3ZRpfdd+eEIPUVaiz3SLI
 SG3QRbET8PgPJ6ost6U85zmMKuFMAQvi19ty1/CEaXmmTj3sG+NSCMcHu3o7hyP8XVGFCiH+NzM
 QFuI14LJi6+V4fDp0Dq5JaFa0l7ZY2/9o87j68iygDndk4zqp1OWcyImUBZiYFWnHqHdJP6LlBx
 Kdf+yMKZHqKXA6tfSlxujcVna6clRFxSYnaAEfz7HgqjzxA==
X-Google-Smtp-Source: AGHT+IGiHPV9muv+XxTkuybaAdBwrOHQBfmANu3Jp40bbKevKvdN6W0OL956UMbWYvuvbFg4rGA3+Q==
X-Received: by 2002:a05:600c:4fc6:b0:434:f739:7ce3 with SMTP id
 5b1f17b1804b1-4396e6bf6d8mr54849915e9.8.1739707829061; 
 Sun, 16 Feb 2025 04:10:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25915688sm9662477f8f.57.2025.02.16.04.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 04:10:28 -0800 (PST)
Message-ID: <5649b489-e2c5-4504-a928-58409a547768@mind.be>
Date: Sun, 16 Feb 2025 13:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214225831.23731a2d@windsurf>
 <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739707829; x=1740312629; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P3KSPIPk8QnReDkDLaKMzPUhKNMEbzGGOCkh6NfaLv8=;
 b=QEkAXHobp72AbWWDs9+eWAcirsCdXAAY4ybtH28MjQd/ius86HPOIFZ22RZRPh52YW
 rErQPv3aLpZ6oXiHEpK/z8IuvExOnq0yX0pzfkvvKW0otHL1Gr34uNtYMHdqoQYJfXkX
 gI2ApPmbbbq8+c43ixQIuBqpPCO+1NP6tTiVWlmFBb+GSt2UoJ1DeRL8Q2FlN85+G0uY
 p1azZYn2hQ9NZWvViS6ENxfaawiJcnRXes7XU7xJs54VZ4ecSFaBbOd1TvcT+wi+mMch
 G8OTh4gPqIgrB7RgzyUlJl8LbMtKimakpecHivSaOk0EzQvFpCTsGgvysWZQi7Wt4BDX
 NbTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QEkAXHob
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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



On 15/02/2025 12:02, Frager, Neal via buildroot wrote:
> Hello Thomas,
> 
>> Hello Neal,
> 
>> Thanks for your work on this topic. Overall, the approach you have
>> taken is exactly what I had in mind, so that's very good. I only have
>> some implementation details to comment on below.
> 
>> On Fri, 14 Feb 2025 16:53:59 +0000
>> Neal Frager via buildroot <buildroot@buildroot.org> wrote:
[snip]
>> +			--disable-initfini-array \
>> +			--disable-multilib \
>> +			--disable-werror; \
> 
>> I think the final semi-colon here is not needed.
> 
> Without the semi-colon, I get the following configure error:
> 
> configure: WARNING: you should use --build, --host, --target
> configure: error: unrecognized option: `-p'
> 
> It seems that the loop wraps around the next mkdir instruction with the
> configure unless the instructions are separated with a semi-colon.
> 
> However, you are correct that the semi-colon is not needed for the
> build and install steps since these are single instruction loops.

  That shouldn't make any difference though - the newline and the leading tab 
tell make that this is a new command. It shouldn't make a difference to 'make' 
if there are one or more commands on the line.

  Also, where does that '-p' even come from? I don't see it anywhere in the 
configure commands...



  Regards,
  Arnout

[snip]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
