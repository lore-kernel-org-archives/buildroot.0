Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3C4C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3955A41A26;
	Wed, 16 Apr 2025 20:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2vLtPa_geWC; Wed, 16 Apr 2025 20:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731B441A3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731B441A3D;
	Wed, 16 Apr 2025 20:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B72159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F9160766
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWf4RORIRTRX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA02A608C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA02A608C7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA02A608C7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:06:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so37671f8f.0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 13:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744833978; x=1745438778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=quv3ZsoK4OW15AVyjZQTBdGO/umN4nqRITRy23Y4d9c=;
 b=u5sVZCh1S/BjSmGCRcXj1KQoPG7NEzdaRnB79kf6SfjpiX3vFcw5UR6cIalrW/sloj
 wMO6QhLO7+P/YFdALYiweJx+82LEqq/Wox2xigjiWIcD35R+3HhlStWvjwFrUikmJEfC
 4tH6lYFsfi/zoNUfupn6wQLa1li6YHEu/A3sOB4KqgBeobjQdpQJsdrHTFFkKXJZ12ve
 9Pbieg4X04A/no2drB4gZ7QlhnjetX+9zCXeHZ0gmaQpyUmNEVeI5UGA1LgEhQD5kSdB
 J3CsyEDRwiSAu/COQ0gsb2dL/h1nIB0q6Gt8ey5EBZJ+XuRmk36MENhzKn7FFOgGeIi1
 zIDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3R3pGw6jf1Ukcz+Gj+PUSVrVOWz0xHRbh4RQyDQpxJ2i8pdG2yBkCDuY1coFCAIR4SaQdrZ5AzXE=@buildroot.org
X-Gm-Message-State: AOJu0YympCo6VxxIpz7zyUf8yrJKKYVILBLhkYeJEFw3sK6ev948ryDH
 RXLWpNe1qc7L/UMjlCWs143uB/kDwZA7+8EnO05wbOh3jmpiPtqKsxtDm8VofbakGGwWV6pm6BO
 2
X-Gm-Gg: ASbGnctWD659nozPmLw88Uz/B2oi4nZSIbO1/oBX7eVZViXq/lRA8Pqxt+xB++I67II
 sSJHVhRWFPGKLmoOPQPApHXIQmagPVJ2pYy7shBdHrUauj7r84nymMw677ZHpzMQkXtqPnTkVSP
 UKnMmPMvidZDEAQOoFFh5MmD+YR/UyfcJ8ktUqeVaKPuC8RqgXyOSNkrFZaq7IG/jlmxVNNfbFj
 /Diu4huWgcVikJ+JZ6K3VhlziBi5Wjqr913K7b18WkulsLjZV00H55mXopxKiIU+LbLFeWEe9gU
 aC8CxXwBcZilXf6l16Ozk8UUnQsd5B4jyEaTbsE6ASmVGw==
X-Google-Smtp-Source: AGHT+IHWSLVp0FoxzGElLftrclEB7HKE4rcQ9EMdS9zUBc1jW2AK/nnV8wR4IhlvYxBDfcjv4FpQVg==
X-Received: by 2002:a05:6000:1a8d:b0:391:4095:49b7 with SMTP id
 ffacd0b85a97d-39ee5b32392mr3170643f8f.25.1744833978456; 
 Wed, 16 Apr 2025 13:06:18 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ee2172a12sm3540003f8f.99.2025.04.16.13.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 13:06:17 -0700 (PDT)
Message-ID: <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
Date: Wed, 16 Apr 2025 22:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@essensium.com>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
Content-Language: en-US
In-Reply-To: <20250416215812.6a8ae1a5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744833978; x=1745438778; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=quv3ZsoK4OW15AVyjZQTBdGO/umN4nqRITRy23Y4d9c=;
 b=S2ak/+IfZomy2zAYIbIR2NxjDGcBSAxGbhSNmZiMHvvdVS0FguZFD6zSX+bEwwKAjy
 zVuYPB+fZFB/pxe0BVz0yjwgw3TUEqopfR9S9ekq0mRmDwrSVfjELxceKPACXFe0Fogz
 /CIxGZ+2oLAX2eJkaswh5YZfimmgHe7WAwQ80DU8V+xfQJv+bLyn4wQ9OU9DNAriTXkz
 vbozSUg9P2g/mGIsgMph84NP9/o4gPV91np5Xe8UBuglCkcePJtp3NfbcB0N0hy5rbu3
 u+/1StpPmKcnOxS5AFOvfTI9RM5uJQVCGex/XCgXNt56jN60F/fjVT2G6+8ls8YDSamR
 1fOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S2ak/+If
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

DependencyTrack uses NVD annotation unfortunately.

Regards,
Thomas

On 4/16/25 9:58 PM, Thomas Petazzoni wrote:
> Hello Thomas,
>
> On Wed, 16 Apr 2025 21:50:48 +0200
> Thomas Perale <thomas.perale@essensium.com> wrote:
>
>> The second advantage I see is that OSSIndex (that works with PURL) seems
>> to have a better matching of the CVE with packages. For instance
>> https://nvd.nist.gov/vuln/detail/CVE-2025-27556 is not reported for the
>> Django package and not associated to any version.
> That's because it has not been annotated by NVD. However
> https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/27xxx/CVE-2025-27556.json
> does have it annotated, and associated to
> "cpe:2.3:a:djangoproject:django:*:*:*:*:*:*:*:*".
>
> Best regards,
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
