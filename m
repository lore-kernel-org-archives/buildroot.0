Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B01C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9E540E78;
	Fri, 14 Aug 2026 14:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12YE6iGI1S41; Fri, 14 Aug 2026 14:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9899E40E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716782;
	bh=WjPCGwtmNsgqTxOPxNoJgGD6pIV6IdwOMIPA39rSGoI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OcOcIZ/kynQggiPkO7By7jvh/IA/OygG3yL7NJr51s/JyOdYmTrcMva1U57vvLPeY
	 3NRSAreGmytTQTB+kg6aJr8IN9BVcejdJbTod/9jQpuIxSfqC6HDBpBFnFQCOADD3Z
	 j3enWE81n88h/o6zFVXHC4aqDXoyPxL3ff0j2xg34/P30PBJM3BPrMgZAmoDTLTlWk
	 /vBmva5+TextKmoAst5d4El3dD+ARyI/a1ocBPr+gNDHEHcsRSIyGgPSLMnbsqtlBO
	 Os4lPWQL9oM1esmsK1NSNlwpbbwHFFTEgq9bDXoGenclbqbXHDXY7U9Q/U1MxrK7WK
	 O84ngVAiIr+1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9899E40E5B;
	Fri, 14 Aug 2026 14:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B7FC3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A93403B4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN9Kvf6nDG3D for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E259A400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E259A400A4
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E259A400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:12:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so921393f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716778; x=1787321578;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rM9fH4v2WKu1eRqsCxv9EHknQm4J8uwYQrKLZ3hDTvQ=;
 b=ZUvpMJxrl8+J1CFKWIk8PECFZZcpiaSgObA1TENkfVN5p/eGY5L5VUf3s1G0lJBn8V
 yAIUvb66vmHF/RPKZwyaH4nl4wlC8C2Bni2BT1gC9I9y8h88wur5QGrrJNL6Fcj6eeXE
 Qcc3MVdmyBiavB45OH749PhAwH7eIz1WJ9weY77xs6DuGHFbAYC5Y7EKWyyK9ZhejEZz
 LW7dw2thwJiCvMOroDMQt8x6ifOT+EqIHzYp3DIMYoCxmMQYgwyCyfQlaNG/eqIWIEbo
 H25AdivwZ4UjjCY/LugtCA0eP3N1GE2Y8DMyyFoQI0dqZOXaNEunhEPs5dRCSw+QrJnb
 ah9A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4W+sW7478XrWxEFmy4cF90Alkm8P5Oce7J6SiJoweTHG4PfPnAlnP1O3axX27IRhfrFrKpF4FDNU=@buildroot.org
X-Gm-Message-State: AOJu0Yz5voj7kv+vu6riWYDLom2tBfYOqTaWZ/x5HJ+ObvGuBchq8XI+
 fM4Zx5GcWWcgos/qu8JJXR4F1kZDCqhyLZ6QFSTNxMHczquhYxbeCqunM4bVrksZCDFw1Nhc2Fl
 EENa4KIo=
X-Gm-Gg: AR+sD13/RuWIKEAZPSlZ+f9e31UvN5rqAJnUUyzDcvntG+W8dqIX8S48cr6x6SHZzAa
 psAop+tfNH138ldm6IfXZuo/xrgOfABbIx4SJ4rl7+JhU1vo4O3rEEHt2kPkOrq8pDSqpKOLFMj
 AMSVlva0SKHonhEeY5mkxiAiIzu7r6P7V5AWpQBbKbgvulZbIMA6sOqqKkBPlCdbhszfNlrwpLe
 6TL4Y0CfLlgSo1D58G0IvY3di7sh5bkTuriCm3v2kkEvyncadllAFmi7TKAfzwXTK0/NRTwYcfI
 EVADHtrHzs68mStJAPLbOWWwAuDJQNos71tpmBCc3OQ+gwFCRvXBzhAVBTQcpZRn6IW0HNlGP2s
 G30i/PN0HuoIV4ejBwx6cjehub4hibaotz/qPsumn3IeEX7zF6MWeeLha9uS423QSL84lBnvoEG
 VwdelGDOuxhu7VPlE+x4mjxEar5PhNUMylxC1XL4N5OKpOh633QrTS2uu5pcAWAZ1MzG0ZxyNK0
 tr/Y9euXRbffZMVU1BLoAkyg938ZL0nO0+0VDboVqWwrEFm
X-Received: by 2002:adf:e198:0:b0:47f:96e3:530e with SMTP id
 ffacd0b85a97d-48160715c21mr9904854f8f.8.1786716777894; 
 Fri, 14 Aug 2026 07:12:57 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f20051esm9318965f8f.7.2026.08.14.07.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:12:57 -0700 (PDT)
Message-ID: <8d53cf0c-e374-42b3-b0cd-c375ede365c1@mind.be>
Date: Fri, 14 Aug 2026 16:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260806052829.4881-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260806052829.4881-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.7
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

On 6/08/26 07:28, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3147/
> https://docs.python.org/release/3.14.7/whatsnew/changelog.html
>
> Rebased patch 0010 due to upstream commit:
> https://github.com/python/cpython/commit/04735deeb2dbdc6404eb38544541abf387d71069#diff-b9d5f29e160364d4616b4bcc3b04538fca8d1d1cca809af4196bcaf16c7c5d40
>
> Removed patches 0011-0015 which are included in this release.
>
> Fixes CVE-2026-12003 and others.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
