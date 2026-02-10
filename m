Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3CBEA3F2A
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 09:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF13612B1;
	Tue, 10 Feb 2026 09:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTMdGkREG0a1; Tue, 10 Feb 2026 09:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41A861114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770715550;
	bh=vwnp3JzGkc0ePswFFa9dEghYQR3KwvFJmf+XqKKb168=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XBt3MyFXlGenFrpI3KS+ZOqpPCNJtkUjZqHS60JudGmvBT7AYBO5Af5R3VBfEm5HQ
	 PHe+3Ef0pUNwv5jMA36zJOwwF2OHlzAWxlDbUnAVNAl30c0Sy7Og9zdcIB7xFqtCCX
	 xJpeNbQBKxnMACkfKxvZDX8n7Wkr4jYw8zBwbpO6NnwWziTv0eDU+ZuBqR0MtzLqny
	 5GX3sxrpSsKE6DXMsoR6zYQg7IX1g0luM71X2ws25+o0nT+yMaAbGifma/6gw+kb4B
	 xYroDSiP4Jv3ZxtQ74V09K7fULWiq1+av2H9d7dZlNfFWrqrsU8Ma9Y6lTr/qePEQd
	 OXRwpnYjzOsrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41A861114;
	Tue, 10 Feb 2026 09:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB38CF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 09:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C05FF40D8C
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 09:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4Q20t_iW3X7 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 09:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C26B740D62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26B740D62
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26B740D62
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 09:25:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b8842e5a2a1so838486366b.2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 01:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770715543; x=1771320343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0rsql3WmEktXe/RD7Wdrhg58SlZYMADGbYzZm74bnQ=;
 b=FqJ9dCr4eiY8vroWfcx8ibCCQ7G6ru+yKCQUspHQfGXVOh1eixJoEO0FlYr96CDRRT
 QgbrLG5sPcrU/lvKqLEHxUvMkryIMihiL1+dBq8bBcdYwxjw/T0HlHOjLW0N7DuXx9pR
 BQ8Y5kHU/uDXuhRwwmn/KC3Y8o+YO9k3px5BZTwt8buHil/JpyGmnk2hHhi2F3ME1d73
 AVqzT6ZdQBqEsr1f36fZS6GzVjBWgQrKRX4LbMbjSVcvIZwbvhLcQ3yPI3x/UwWjf7I7
 bCXCnX+v83ZLGZI0qnnlj5VJMqzNgvjemQX6c81IhOL+CIviJT5RyCwGEjcNU3uUNHpb
 qjsw==
X-Gm-Message-State: AOJu0YxpoXtQ3m2ctv5xc7hi/ehrmBEjQi+rMgH5F60GsD5Aj/HgSKzJ
 4EcHf+VLrV3k4vAuHrPdIDSC9JrdF0Z07Fz0YPRnIhOGJ85EuRbMRAOr5ZMOOkd9OPxm7yPFCS1
 sDyIejBk=
X-Gm-Gg: AZuq6aK55tqDsHyKC6ed1jCWbPUf8GXUKw9N8dOuHHx5xpFebq+Ly6iC45BUERLp7uu
 TIM0rzlEJHYAvjyNJ/4FAaIN3Hm+XZMIA4RlTBf0ohzidWY0vEPC16dLqvjHD6F97PBBAzQ80ed
 zj06LHMS3EcrWawFEA68pXgBTsqq8YEfedxUBqcz6HstIbmkQg7dyrqXRGUXZgXM1DBVxG9aAsl
 GKiKuuAmw125uTB56wbMIFdce0jRqKKPS9gdWLTvn5EndnTrPbdA6MnPusDPpRuW2qLWjDKsaDH
 e/jn+Pt9+JkPnMJhmnE8GOilZBqoecV1CSCLr18eboP5GCxI6geTUkgMfKPItjh4cfZZakJvHqk
 /H/Qcys64tMGf8k2/BuGlU/u11BegSbR1Vr8cxAU11fT07BEsH8vbDalhu/RoKs2cIhXfNjjmEp
 tWpJa69gD2GWrtvmG7i8dobh/vzuSxR+fBOpu6EaqHnQdKgses60Y1TXyD2sNLB9QVLMCQFjgs8
 mT+RB5zagI=
X-Received: by 2002:a17:907:25cb:b0:b8a:fae9:5c60 with SMTP id
 a640c23a62f3a-b8f546bbe20mr82323366b.51.1770715542905; 
 Tue, 10 Feb 2026 01:25:42 -0800 (PST)
Received: from ?IPV6:2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7c310bsm489227166b.26.2026.02.10.01.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 01:25:42 -0800 (PST)
Message-ID: <8ea6c2c9-ab1e-4262-878c-bbbefa35b554@mind.be>
Date: Tue, 10 Feb 2026 10:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Scott Fan <fancp2007@gmail.com>
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 <87tsvpqeqz.fsf@dell.be.48ers.dk> <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770715543; x=1771320343; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m0rsql3WmEktXe/RD7Wdrhg58SlZYMADGbYzZm74bnQ=;
 b=AOIMN83Xn41Q1ZGXMD/8fFkPd3FlIv83quRSDTE7R03rUEU4gPhRGIvFwS/ohgzT4z
 b2yLL3m4xJ/UCQXKVL8RMBNsk3IKGvCmzsOoV2rMyoWqaPvp3/OTOb2/ndl5GCyXljfd
 LvGNVb2n2YRePJZ7Ts/krTlhJYe9kQz8BI4vJ7GNjUt92RgzYEgSB50Gp4hFlqmN2zSz
 J3jrXn8dMk2xn246w6Nt97UDar12dAXQKucNQ6Jv+TlXEfIn2913O5ZEZs4VanWp0LR3
 1osTpzq8KN5t2vGLSWwI2++6MMm6O6mmGv2t0eMo0iAcS30W8WrDX1A/Oj+pR94lHJRw
 /dww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AOIMN83X
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann and all,


On 10/02/26 08:21, yann.morin@orange.com wrote:
> Peter, All,
>
> On 2026-02-10 07:44 +0100, Peter Korsgaard spake thusly:
>>>>>>>    <yann.morin@orange.com> writes:
>>   > mosquitto 2.1.x has been released recently, but has changed quite a bit,
>>   > which needs quite a bit of tinkering in the .mk file. This commit also
>>   > serves as a sign that I am working on the version bump.
>> Great, please coordinate with Titouan who was also working on it during
>> the Buildroot dev days.
> Sure thing!
>
> Titouan: were you working on migrating to using cmake, or were you
> planning on doing just the bump first?

I didn't look into the CMake conversion yet, but I had to look into 
compilation issues, as the 2.1.* release contains many changes (some of 
which were even untested upstream, see 
https://github.com/eclipse-mosquitto/mosquitto/issues/3469)

Unfortunately, FOSDEM flu just kicked in, so I haven't touched that 
patch since last week. You can find my work in progress over there: 
https://gitlab.com/essensium-mind/buildroot/-/commit/114db281da52b342a95d2aea6199bbf9c2e20cdb 
. As you can see, I still need to redact the patches messages, send them 
upstream, etc

At the moment, it "almost works":

|./utils/test-pkg -p mosquitto bootlin-armv5-uclibc [1/6]: OK 
bootlin-armv7-glibc [2/6]: OK bootlin-armv7m-uclibc [3/6]: FAILED 
bootlin-x86-64-musl [4/6]: FAILED br-arm-full-static [5/6]: FAILED 
bootlin-aarch64-glibc-old [6/6]: FAILED|

For the remaining failures:
- Is getrandom() supported on musl ?
- We may need to exclude no-MMU platforms from now on (armv7m) ? As 
there has been some rework in mosquitto's memory allocator
- Old glibc is not supported (because of getrandom())

I hope to make this move forward "soon", otherwise feel free to reuse 
the commit I just linked above ;-)

Regards,
Titouan

> I dived head-first into the cmake conversion, because in the end I found
> that it made things easier (the Makefile-based build was anyway borken,
> so the switch to cmake was inevitable I believe; and it helps clean up
> the .mk a bit while at it).
>
> Hopefully I can send an RFC patch by the end of the day...
>
>> Also notice that upstream released 2.1.2 yesterday with more build
>> fixes:
>> https://mosquitto.org/blog/2026/02/version-2-1-2-released/
> Yeah, there has been 2.1.0, soon folowed by an untaged-but-released
> 2.1.0.1, then 2.1.1, now 2.1.2... I was planning on waiting a bit for
> the dust to settle before actually sending the bump, specifically
> because of all those fixes.
>
> Regards,
> Yann E. MORIN.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
