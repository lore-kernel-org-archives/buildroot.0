Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B6C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8A1612E6;
	Thu,  9 May 2024 20:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJnn4FIeyVpG; Thu,  9 May 2024 20:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F5F61309
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F5F61309;
	Thu,  9 May 2024 20:19:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17E711BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C7A41E44
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1eXp2IzgV3p for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 573CA41E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 573CA41E62
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 573CA41E62
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:19:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so9070375e9.0
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715285943; x=1715890743;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQhmoNiB/it/NCDGYYsuOcWCFkOlWViVQA5Edv7STLc=;
 b=IjmftvQd/0t1NrjbI0O9Fcd7zIRPEcn4JoRSGiVk2QL5iUtCr2hkvEvLGR3teBgfW9
 E69M/tQRiFccPdeKlfZaOx0xtLaMwY1yXIDFxCFhIDfYVogaAm/LTw0R8bJv4Y8HNMR0
 cX1H7eI6PEF8/oV1+oZQGogoev+7+OKYdw5CQkI5QCUIyUrh5oMQbpjZ0TWrpXGswyPB
 ZEtuP7LcrpsAdXN5wyqkVbb9VNAhDX6Rqfd/V9zzlCE7tUAQcAGnMkxjj7apjIq7DO2W
 IZariuiRczNRoL/+rFLtTfwpnOMd3rWjY90YYR6P6/D6cq3YolEfJgHK6pMJWfrQVQhp
 ApCA==
X-Gm-Message-State: AOJu0YzA9hppgroCf0AT1n6nVw6iRUWNKHhLx8K3LAqPWIy/rkO3DV6g
 CLfKoL+oDzP/1qY2hisyfTrhd5IS0WuBDUzY7fANgm9JsQJQOmaxVtBT2HmIm2zcUDXbzaO6OyE
 1
X-Google-Smtp-Source: AGHT+IEKrOibURPuRnk/dLT7v22Wbp6pJopaqft4736ojk1q1i0KcGQU7X2LRyhR+FCZMFsiMiwtrA==
X-Received: by 2002:a7b:c3c8:0:b0:41f:a9ac:1023 with SMTP id
 5b1f17b1804b1-41feab40b9fmr5706195e9.17.1715285943130; 
 Thu, 09 May 2024 13:19:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbf9esm2538491f8f.91.2024.05.09.13.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 13:19:02 -0700 (PDT)
Message-ID: <505daac1-43ce-4dc5-b883-682971cfea79@mind.be>
Date: Thu, 9 May 2024 22:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
 <6446e4c0-3501-4875-8a89-4db3fb369911@mind.be>
 <05114d73-760c-4a56-b655-3d0268158ddf@benettiengineering.com>
 <20240509174834.46a63d72@windsurf>
Content-Language: en-GB
In-Reply-To: <20240509174834.46a63d72@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715285943; x=1715890743; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQhmoNiB/it/NCDGYYsuOcWCFkOlWViVQA5Edv7STLc=;
 b=BkrhylJePjV/a0azAImOfguZjdbZuOXJDbuPTkFT3njbPjWhYIC4owBigkQI/r/KFT
 /8VzNMboO4z5ezU2VfzK5eROtnBVzdf/+ZjsM50gd11yHUrTU2uXBgUgtx8IkaoS6Sil
 gjIqNQRq8qaKFTNKhEBCB8vXv2Pa7ydgkgHNkT5YjspnbbAOCkTrEVh1Wkx/ha6AJU2F
 H1Ms6ka3RY+QLsysoDsV40JQp0EZqskRqPvQEk9MIihlpdj+7jfsTIVFvI/i1sK4C39n
 CyOB4l3czrsGXkc6QaCek5kgzi+BLy2NT9ExHk2ohbtSv9O50n9lk9cKmbFp7yVNSXFk
 Y7qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BkrhylJe
Subject: Re: [Buildroot] [PATCH] toolchain: remove gcc bug 90620
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2024 17:48, Thomas Petazzoni wrote:
> On Sun, 28 Apr 2024 20:35:30 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> But this bug is Microblaze specific and the only 2 Microblaze external
>> toolchains are the Bootlin's ones, where the oldest GCC version is
>> 12.3.0, so as we've already done in the past with this commit:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/55fcba2a7c41d29f3f93bb37eec1264af4b45fb0
>>
>> considering Buildroot free of bug 90620. If anyone will send a patch
>> for new microblaze external-toolchains it's very unlikely they will
>> contain gcc < 10.

  Note that the first few releases of GCC 10 still had the bug, it was only 
fixed in GCC 10.2 or 10.3.


> Arnout's point is not about new toolchains (which will indeed be based
> on a recent gcc), but rather on older custom external toolchains that
> people might still be using.

  GCC 11 (which is definitely fixed) is only 3 years old. So for me it feels a 
bit early to remove this workaround.

  On the other hand, microblaze is such a niche platform that it shouldn't 
matter too much...

  Regards,
  Arnout

> 
> I don't have a hard feeling on this one. Yes, supporting old external
> toolchains is nice. On the other hand, at some point, we need to get
> rid of those workarounds, but I'm not sure when is the good time.
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
