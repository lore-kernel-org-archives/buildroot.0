Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32426CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B531480F56;
	Thu, 15 Oct 2026 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_kzy9x-kWiy; Thu, 15 Oct 2026 17:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00EA480F3E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792083673;
	b=mhockWRwiw9vo8CtDIIsvSB9J0mxK+nEiO7Kclg2gZuIR6EPmkpuvlRBNy2KYHlOH32S
	 V5pPJBZNnKBvs9nmWQF92JkmFaEe5DdsLD0Xunt8AyZrb8FbrL2QBIbZZQlo/Vr3UVZRt
	 dEUE3n8yyT3flytqVykSuckgLcytd8fald+LFudLm0e8a2yO+8HuFyU4g6+d11JvoMNvA
	 MZxVAIdRjlQPT5OiPVl4/VpOakkilUyfFbYaJ2Ri1nGhoQOyDCfkfWf6k4VLKYAB2Nh9P
	 rNAk12ERiVdNwZmFIqpSe4ZOclsXGxoiMaduAslKHbk5ADLOLzx7TafOwInq79rSYrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792083673;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iqlVYRAJuAlHsu7LTjOxO1FFvHWOWXLB6YscGJZeot4=;
	b=RwUuTcy4IOTY+Bw9ScyGbPNsXIsUwaQzt5oiHWKjupK8iGwGxijGUmrknrriz4HpUvXV
	 ntRHBSQqlNSLA7Utiy4G6o7FSzPGgeoTrcKXI9tAa+FUMi1YddL5A/Us/v/GIb/6nsa+w
	 d0WrLDZJQv/m6dHhiZh1VYfPORkQxPRQizrUZFdEifyzzey7DycF2yYl/zKWUOxP48tuO
	 va0kNksFCWCajRoD5uQkkoKDYFddAvouY/oax59OqrX76cLy04PukcLtsHOp20oFAsIDJ
	 FPFDUrH1ibbZWU6AQQ+AEEOK3qjTs6Xssm7ObfhKz8UxEMuBGqq0Zhi5amoLXxSdF+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792083673;
	bh=iqlVYRAJuAlHsu7LTjOxO1FFvHWOWXLB6YscGJZeot4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dVJc20iJpasTPhRdfDn+T5LSd2r11nrZo00g7pTNNE1ID2rm1CRj66toRmuzL1iaH
	 9uN02zcBYsoCTLQnQqjVXxABfUFNWIceuXOb1xdXiEwf8K3gYkTnIkmXV1gVUMOFLi
	 FgK4umwjM0xEax2wMippk5WewsEQjtzB8N8MxEmOMTq5QLM59UIOswqOuQFH3fOCoi
	 Jbxiw+SZIzeDLEFxTwaqy8Zb5kQEIGmXGlPGkvdpAPb0/c7DKqCOiERmXrcsRLXeZ0
	 12fILk+kvavVUeyqNh76ALMRYkuZ5VbcxuaD1ZVg09CpMshaMnN+wJYNkpXjDyrQMA
	 6Q2C9Y7zcapbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00EA480F3E;
	Thu, 15 Oct 2026 17:01:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5CF1E9
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FFA3406C2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_co1VKTcfVU for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 17:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 805C340624
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792083671;
 b=WmGZqDFAV0YI/4vFLtdiqPga24b1JJOtqBIU4AS7xYLgu89t9Dh2aJA9k4eOkVM8aVCX
 McaoBRjxg+wd7giHRYx3in5kbR3qlv5xQ1dUMVklu3KztL7/V3Ar/oFIX+LG4T/MNbNx9
 SwhoZlPN2HvODBv0veTdMv9gWPy3h9XUEhCkMmWZIfFdjtoWbhp21MUAeWd7l7ayquNIx
 A+E8bcd4AEq0Vg75N3YbsAermEjHZKh25v7CYPuoxaUjjc8JT7YSMWnR3e8yRwr0YNS+r
 vGQOiS1agZndsfluQkuHu5DZF8Bpt+Yg5HGiabqgutcFQIf878+Kze1j0Pds6tqQUhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792083671;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=44ooDrOrGhqGt4Mh8r4mdBVy3dvfjwfp49ZCHAEUX7M=;
 b=YRHr7dnvgjx9/QagmOYdSPHIsVqvmTFWzI4U6t1eFCmhDXTqSjc+67+m9i5TbC9EU1x8
 Ipty1jrcBpSuZUUkXpj0WYnqDsIb1bC76aBjn3uFnr4Jql8x2sR514FrNg+r2qGaslF1R
 iQYlpQQcBAL2VDf7ms9U3gSwCdn440LoR9XXW5RDgXfLPp/qekuKnmW/zsI0yF4Z5Oo6A
 VBUyGc5Vr6DkSvNGYueVqG9+BOVgFUM96UZsfxhL+EHwVN827zFkpkzTc26d6qTF0r0GU
 9TKHByX+pof5RVav5jTVwrJ/0I3tmOfd9vFsz2dFHW/MPr52Ft/HRKumqk5NDbizGNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="RXkj/z8x"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RXkj/z8x
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 805C340624
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:01:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso3548540f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792083668; x=1792688468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=44ooDrOrGhqGt4Mh8r4mdBVy3dvfjwfp49ZCHAEUX7M=;
 b=RXkj/z8xiJuR6E+WSYOZfnx2qQRp3tCdWAGbyfKcYfTECdFvNvoy/zsbRQCFrvEzWR
 guVi80AJRU5QvpWDadiMVIaFdu7ou3L71rST9CyfVLLS/G0f6ldU2+sQJRCEiyrAMO/h
 4k6/xNwW4TEvgTnt7/Z/Ta74mNKKpzWF3gS1eFpWVqlAiIS+416+6k0QTJ8xxOmoWFnt
 C/AFRhLr6KhBOoIX3sXlIJa8qr8RFmNLDykdaxXcIokFKLYJ9dVZo2HmSXzfflJLV4MU
 hP20z3eTajrdzn0gj6xjpxpds2aa5F29ZCwsqjfnTk2QuAb3txPX4YzWZjlxC5mjQY3C
 PH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792083668; x=1792688468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=44ooDrOrGhqGt4Mh8r4mdBVy3dvfjwfp49ZCHAEUX7M=;
 b=qHecbPdBH9TaiIeL1Zrrj7ZBTA0usXLkVghCOb/lZF+midN2yMrjkOC+HOLocjAi6z
 L7gJEijbrt/s+nrjbv9fdPD0fmqcaX8mw5DiBgN7/oyjw/p/x7uyRvnVwk/QKvprYTY7
 PMZke6T1nBfaBDg1M/Oo/Y1XQYQiGTAH14H8Ffje1TWZ2NAEBHO6JCKMeVwpdVX8Ng7h
 7CIR+om9KkjAfAFp/IzPYeFajqc8+86KswOEPJ4x3ql3KH3dQepMgwUyuoqB+/FuyOZ/
 IPYQbSYCv2QG1NidXrVKzmaWwZeWIq3ZKebH5m03oVVk7i3aQuXNZV4CZfD/LLZdfaP+
 0AYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNZT8Hj0vBA2PrBlHiklEK2TY0prQPPTsE+8Mx4wjx+Yttqz93XFmyYWXjCjFi/rmbSYjWxHbMeUE=@buildroot.org
X-Gm-Message-State: AFq9FYK0TI4sf1442Z2XJwalhe9xT1AyGSlYfG4xrwto8r455g45gvqB
 kNUVnBU3YEEEhRrP7VlgMPDV49dnfH9mbBNvxYmZCJyZtVYaURRonXjY
X-Gm-Gg: AYBFou0lGOBpz1hj/0cgP9NAclY4+xzfGdxq0YHGpI+PeEgMbg2AKom640KU5KLoHwv
 KTxhmTKmky6cZngAJ0rjBDNioM9p2ejssGpgWuoFLHMWO/wOk0G5VScJDTWwxzx2A/PoUrbnyZo
 mLGiiTeVSqLzG5h7cVMdImwSQJtZ9bp0WJaWXcLoe08JHrBxDmh4S7YIYX3+/OnCGUNbzbT4Lyx
 jYE2QT7dNhHu6N9/a9hs7DvBNtBSaA6pwsmSiY1u/ndipgFPOWNWUMppygW8/SsVcmcqk3kjmkd
 aDBMz980HYpflxsTYyGFEtvEhpy1IdkX2/MFpEouW5UyyuWb6blrHIxZyP88YUp+6FBkfH9CufQ
 EiwkqP/hXb2WK6mCT/NGPsdZG6JnfFE4NdRfZ73FU5AQn6ValxG/qz/gyxZo1RHM2Sb4hnCprlA
 CICUckYm0o7ezWMywcvjFtgCvVe13p/sUpml0+fVBnmLsjjVdLVSwmuFx+Gav7N2r0jDXdEMXeh
 pC8QTOQY0HxaV1mtLK/8CcIf2HFDLxJ2PxWGXxC9ualuvBAUWNSb9JJuKg=
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id
 ffacd0b85a97d-48df14ed887mr8996738f8f.25.1792083667869; 
 Thu, 15 Oct 2026 10:01:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab6361sm16751338f8f.32.2026.10.15.10.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 10:01:07 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2026 20:01:01 +0300
Message-ID: <20261015170101.5001-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87ld80s06p.fsf@dell.be.48ers.dk>
References: <87ld80s06p.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 1/3] package/python-cramjam: new
 package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 7:42 PM, Peter Korsgaard wrote:

>Hi,
>
>>> So presumably something is not initialized to cause this null pointer
>>> exception. The fact that PyImport_ResolveNameWithPackageContext gets
>>> called with a null pointer is already odd.
>>> 
>>> Care to report it upstream? I see that there is in the mean time a 2.13
>>> release.
>
>> I saw a related issue reported with a similar topic that it can't be tested
>> on 32-bit architectures. This is way I specified depends on !BR2_ARM_CPU_ARMV5,
>
>OK, but then it should presumably have been blocked on all 32bit
>architectures and not just ARMv5. This is really the kind of nonobvious
>stuff that should go into the commit message.
>

Yes, you are write. I have checked after your initial reply and also armv7 was failing.
Once I realized that 32-bit will fail I switch directly to aarch64 and forget to
include also armv7 together with armv5.
In similar situations I will take care in the future to explain such details in the commit.

>> since at that time I found no other solution. I have tested today and version
>> 2.14.0 (released today) does not have this issue any more, so it runs on armv5.
>> James Hilliard just send a bump for 2.14.0, so for v5 I will not include this.
>> Here is the link to the bump:
>> https://lore.kernel.org/all/20261013164254.1476592-6-james.hilliard1@gmail.com/
>
>OK, good.
>
>-- 
>Bye, Peter Korsgaard

Thanks again,
Flaviu Nistor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
