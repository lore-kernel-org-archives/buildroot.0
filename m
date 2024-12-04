Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD7E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED454134D;
	Wed,  4 Dec 2024 19:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2gzYYEPHdX5; Wed,  4 Dec 2024 19:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA37C41349
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA37C41349;
	Wed,  4 Dec 2024 19:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72FBF1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6088984569
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrS3vyCq5ElT for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 19:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3658A84567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3658A84567
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3658A84567
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:49:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a1639637so1691985e9.1
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 11:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733341740; x=1733946540;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wbiDXwLhztsh1RMGjfOeRHjWGxbW15pGxoBkYWRWp94=;
 b=niPxZwSjmWRWP2rrxFIOPWEA0kfg+SQRbk1ChVvQuWfyEkgVreozWzNNyHounyy13z
 MaMy4Hper9KPTZCMrrpuqqcKwk7ITRSQBRCrypqrwT3GCtgmhqip957zyx1F7kAMTvWn
 tQZV6GPHuSrjDU5SX8xdhki/wJFfsLaLhbfkaH0JezmbcrgHMao/wD8vDHKNrBa9aeG7
 pRw540JZZFtCm2/BErFCiNem9lKUHO59cyz7m0edY1ix51XaAlyMW7QQQhyGcrg6k6P3
 w2zej4GIL0ThUPtFujA8/Vf8lRx+17eyvYmN7qlMQtHq+RWbbIpERuhYBdFjmKa8N9vN
 yhZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPOI8qzbTMai1jwknRVub5IYz4trMwer74PqtpHHyG8azj9GtzZbki0yw9eXwnC0RxswSegGvL5CQ=@buildroot.org
X-Gm-Message-State: AOJu0YyYJcRn0Gnn3VFcc69HhMFY7VMxc3bVSFCIeBykz4t06F1IsvmS
 t5C5iDUQWBjqS6RSKFGErYTLZPM77Cpofvy6UGLOewEaDJ6DHNlP+FYLJAum7cIop5rbOWzmgrI
 I
X-Gm-Gg: ASbGncuLAtvj0FSCkDPKpajn6YHQ5dkpBGZO2WBF2wdTKCRFyfLrc/VadisaWXqTJI1
 OvFrVeNbOjrkjJN0KzCwpNh0OpIRMxFbYRqi1ykuaWeX8qJQfn/KeZ7G4v1TZE3RUJHdmKQcb1F
 Y1NLaSgcnWWBuyAIOXo4fK5aePIhGC42WVxcMuMhx1Q15l6rZxyJWncF4XNhIPz2dKI+2kHIeNq
 P1GUGPMgmBhxudTqzYMrdKUMRwDWd6E4kUw5fvQ1z92cXvNiHDsLHsFw4s4zu4Ak3BTjBwuKLn7
 iwnXFsl5ov1VWdpUWzEiQYDa/GiAS48UemVZ3YUyj5ep8mopqTyow2Ao/yKTDJF/eA03hXhJrf4
 y3WEy
X-Google-Smtp-Source: AGHT+IHXfxTwETz4KNT9Q6JDOOsE1eHTIL/Mu8lIkZ2I7iJR3LfZgsJtCtaH5kw6vce2igZDcd2Z9w==
X-Received: by 2002:a5d:5f4b:0:b0:385:f38e:c0a3 with SMTP id
 ffacd0b85a97d-385fd3cca39mr6643165f8f.5.1733341739914; 
 Wed, 04 Dec 2024 11:48:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbf57sm33956655e9.39.2024.12.04.11.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 11:48:59 -0800 (PST)
Message-ID: <ff363f21-4fc5-4ac5-a9f6-f866ad6e523b@mind.be>
Date: Wed, 4 Dec 2024 20:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julio Merino <julio@meroh.net>, buildroot@buildroot.org
References: <52f63db5-124e-4be0-8ebf-3c177b9f9b03@app.fastmail.com>
Content-Language: en-GB
In-Reply-To: <52f63db5-124e-4be0-8ebf-3c177b9f9b03@app.fastmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733341740; x=1733946540; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wbiDXwLhztsh1RMGjfOeRHjWGxbW15pGxoBkYWRWp94=;
 b=QM5c+w9ro0uLTwL1Z4jfCGLI6FKdWQW6tC7rs6/2h7TSgCBnF71bBqV5j0lKmJMpRd
 PlvCjvnTvIJVzFGJwXZyGgklazpikrS7g6MiGq8qqMG26UJUhGL863K14xCLWGb8sEeb
 kb/CFn+j6ulaIonXUy6845lH1Tj83QeCb6Dtt+HUFEtMmIK8b1AmMDQ7Fdj7Dqek3epH
 8UhhZOVK3aW+0RvVRMk+72kTJ+BwtADIfg7+tYxoust7VeBUoX9kcelKXmew0TRQzB5c
 SPIoxDWeD0eVfNS57nl0D4jCJy2CElJFdSGx+gSsRxR1zDL+aPCTMjTQOZQsKJORef3O
 Q1og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QM5c+w9r
Subject: Re: [Buildroot] How do I generate the vendored Cargo sources?
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



On 28/11/2024 04:11, Julio Merino wrote:
> Hello,
> 
> I'm exploring creating a package in Buildroot that uses Rust for building. The process seems very easy, and I think I've got everything in place... but I do not know how to handle the "cargo2.tar.gz" file and I cannot find any information about this in the documentation.
> 
> As I understand it, this cargo2.tar.gz file is a "vendored" copy of the upstream sources with all Cargo dependencies bundled and locked at specific versions to guarantee reproducible builds.
> 
> So my question is: how do I generate such tarball given just the upstream tarball?

  If you use the cargo package infrastructure [1], this is handled automatically 
for you.

  If for some reason you can't use that, you can set the _DOWNLOAD_POST_PROCESS 
variable to cargo. This is not documented because you sometimes need to do some 
additional things that require good understanding of the infrastructure. And the 
cargo package infrastructure should simply work in almost all cases.


  Regards,
  Arnout

[1] 
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cargo_based_packages


> 
> Thank you!
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
