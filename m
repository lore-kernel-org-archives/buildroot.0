Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDCFC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F7F60A6D;
	Fri,  7 Aug 2026 11:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dB8HBfczm0F9; Fri,  7 Aug 2026 11:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC2F60909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103534;
	bh=T6dcLxa3fjCg3Z3V7eAPv8iYdboW5xTl7/vy6/TH0y4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CUdPZuhu1pzPIgt/UYTaKXCiQY4Apxi4uEIAymp/39B/vg/EMUk2r/nBs5p4PQlQz
	 s0bbXJHW1Bh5ZSyUG8vuZ0mvKapCv3ckDxWeBnESDYqiFeBSHhJ4EeTNGmbSXeBQcQ
	 F0ewMT58qwog6vvOK01wBfOpxDIbp4HLictDHYbeM+rPS4QrcVLoLOeZTRVb5izu/8
	 K96E7n5HOUU+cwF0Ezdbn6ZATDpYevSuQkfU3qoJ5YyCb+fqnz3/mSkVfD003MqjLC
	 DuFbB2o2HZExSWfiC4f/fc0kem4++OJJn9bPhy5rR4v0SJQ+hWcufyqJytewvCX3Uw
	 uCCTqyTMoIRmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC2F60909;
	Fri,  7 Aug 2026 11:52:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 158B8282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F00C68122D
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2-wfyzN2Anr for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E174C8116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E174C8116D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E174C8116D
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so32930935e9.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103530; x=1786708330;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RvgNCZHbnsrj31glQ6XMOB6zT55bA1OwCJg8ijUhJ6k=;
 b=L9ltAX4ATBi3GhNCBTxBAbN326D7wJciexXazPrjRDeItgl3vnsY1McK03kfgJSR9Z
 gy0DRYv6H2akG/I5zxMTOc3KOur60W48PoN1H4S7GWW/8KmtZYpzCwAgLIKczf4nm0Rk
 V9FXdzCxoANUn7tHZweBUl9HXaTZd6pFiGuNdNWEw7sPTf7r3KZ1rkpSRSCM0fnKAKdA
 iTOUmNm8h5WY+WiKlrB/nftWMCTDDOpOX73QmXVQjCLwZoH68cH7b1uomqYDsTbWqClK
 DP+GcGiUEqkeGLVSm14Ah7z5lN4YSZi/nGfW6xE1Evxe9ovAtcOFpbnAhWEObRF8wkOW
 IihQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqvITjAppIKbh+xTcm+OZIQJqJucPN/rrZ5OMOpQ/B6NWdbv4He8se+un559NUVdkrvvUbXaCgRyD4=@buildroot.org
X-Gm-Message-State: AOJu0YwvZi0c7kVVBIbx6++gYx8YR0/DaqqDJe6m0R0e2KmahWlxjDjJ
 e1f90av4DLOH09Gt7IfQadQ+PG04fpHiq04dd62s4dnCNIQJcCGGfTZD+pgu9T6Jl3E=
X-Gm-Gg: AR+sD10faGI/zNTA6LtlBhdQ1L1F/bVWSfpPdhPbse0FUIvd8DHhuMFK//SsPAGyNvx
 yHk74QpyOhoSR97kP+84UKfF3TPYkl3AMFzP3NYnmYWoT+whk3t/dvhFzKJtrufUr9y9ged7Uum
 NO33ARJ08b/NpF6xi94HFZRl4yC0EJnzVNRPNBRyfCn1H0k/JjDszdb5xW68sSVWd8rDPhXVtJ7
 0LkrOtibqlI8LnzdtrKkF5RGpPhInvxbhmPzH+8RXIZJyu7fNH8yEd7lOZPdtWbisfbR1l9IrwA
 skq26HpISOvvhGezdN1OaeT9DsmB23alkPpVckhdFyeG0Lhr6JcYzLeIC0J512pK6fFAHmw8E+I
 v+Ex5kUlfIbwGI6k3bLNTBnSiRldGIYqKX4brGgC0NnegeobO1f6HOgLmXIw813qGQIqaBtHuml
 07BO5UgZnO/iC4hfzAauL2rxs3IPim5w10Xm5+zVILIEvuEnNkGkIIKBSSkvuIkLSc8rCRcg9bk
 /aetbNEvYroPz1CqOqML4POyuEIKndzs3a7lrrpHsM+Wqtd
X-Received: by 2002:a05:600c:190a:b0:495:6a50:3fb8 with SMTP id
 5b1f17b1804b1-4994e743275mr273343565e9.1.1786103529790; 
 Fri, 07 Aug 2026 04:52:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995427a404sm147826795e9.9.2026.08.07.04.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:52:09 -0700 (PDT)
Message-ID: <c687ae83-b129-442d-96a4-445e5354c194@mind.be>
Date: Fri, 7 Aug 2026 13:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260725215737.1555933-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260725215737.1555933-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103530; x=1786708330; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RvgNCZHbnsrj31glQ6XMOB6zT55bA1OwCJg8ijUhJ6k=;
 b=ZjLWnQzqZlrUjtGJBS8iNB6KFABl189x/Baf8Br1EFKIvfUVXgOutXp9LztnXPvUn1
 7zj4zqgmcsTgJV7OWboRr8CY1RwFJdZXUiGdNGA4HraoEg09NxIZ/Hf1j8KWJP9FOeRn
 UNgg64lvar+mHDAQEazy1pZZgKXMoQ0Tqgsfn8pVrzt0Q6SsU28M/clmqf/ZI8XmxHja
 rL4UY91m0/cuGJU7LoCDXl4gVrwynvoKPKzrHLai3dy9n4vubj8Zyn7PPOY2PYLYlleI
 D3NerAqgegWdztsMjBtqCIgsoUnDdDJVLeL3hwFG2OBAUq0w0d4MjmF/i0LPlMueD8Lv
 YgcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZjLWnQzq
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: libgpiod2: new runtime
 test
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

On 25/07/26 23:57, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/15535000430

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
