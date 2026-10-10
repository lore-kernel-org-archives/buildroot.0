Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD39CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AC860718;
	Sat, 10 Oct 2026 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26eWqgJ7gE-f; Sat, 10 Oct 2026 20:32:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F5AD60638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664335;
	b=hcT/KBPFs3Q9m+67mN7lSwpL7MkFskEJ8AKOGgN266vdWPsO2ISwsQVr9CHyeseFRK1Y
	 9wOfMaebrbP77vcB6mpdE57xSxG5sfpIIOlGwYn0FB4y0t3dg6b7hUwreCk82ktFXRBXN
	 Gm7+tgjxtNh6B1TKiJVZ9f+CzLGoHoiLwNhDRD6Y6LCpeiqpSxEo+JKdnjKE3CXKirLWH
	 tduGejC59oU/YGY2tJwfxaSKqJNIH/eI12wt9PPh3RSrRhiuwN8HNagbMtbPUxhpPPnEQ
	 PKqr3/xGBERSSrbTaV6XWwIa7w/Iz5fGCH1DMK/XXwegqwhFM4yz/pX1m5YP6uXtV0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:Cc:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=/G0fWcWWZQn1HY0HxKxnAcf8hewA0jPt4H0ssfneBjU=;
	b=amRhPiIftBMHemjMOsAm7co39M6XZw+VMYr1yyRXL73/kxUPWNImtDSYfmt/ooJEzObr
	 Yg4+rdTlP/5A2idB2ohceLUV8yR/lDyIrczlun/4oGC1R6JPJdHRXpLVGEeCBx1evCZwD
	 3/Ta0Rd0H80r3EE3kWHxuQHgabK4RW5f3cWPfXiPYaPe3rRb0DX3kJpE21wvZAwtvT0DR
	 umMmK/SSNvsGNV9vzpjRSjXOgXJebcWgTwO3nZhvFBQ5earQ0SsdaIrPnzgVTZi4hbnfW
	 0w+dDgljYG8J78kIE6kNYrF37JupQ2ani+VjdpjAwezoFZNtaClZKcDU0AJqaO1v1Ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664335;
	bh=/G0fWcWWZQn1HY0HxKxnAcf8hewA0jPt4H0ssfneBjU=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VlVpvU/uoRxzpMCydhr6xInEmXDXK/+acB/UO8KmiFzJd7DojRWXQucX479AgRM5f
	 4hX8JTdSlo7TTZv1VGO8fiCytPkYYi3EZ2250+Jajd4PQ3vtrImFSX09ZsZgDq5ooI
	 Ue+hFBpqb+eBZ5HN4O3gsbtqxf0mq20QO/cLvK8zeUGroYW3ULurq5axf2U3BrqCul
	 87C4g9ZXTL7KMGJFSutYwz2A1N9K7sqJyHRvruLxQGHpzIyHqylddOhlKzNfd1R2rM
	 IgggXyhyQRfZIxT9hpvIOhwSu2LKTgL54zmrhibuCUtKa5j3/ioA0rqHRA7af1ZM5B
	 91ujxMYBshrfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5AD60638;
	Sat, 10 Oct 2026 20:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AF90356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CA4C606DA
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX0slzSFXh1T for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4AD9B6062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664333;
 b=q5IflZEpXRxV5V05MstuHjl2lGm08DLPbuK27zfY6wuevRDcsc5JlktSkf9P+2jcwj4L
 tqjvoftBJqxxlF466h2DZG0GOl0sKGX2L3qL825Bo1VjJ08pXNxHtFzKN/nTVuLDNZ4G1
 2/e20R0a1Gj/O1sZgntJlHI7Lv9M+Ye8uOKprqgpxhQlzlWoOYcuCUK3rXKsJrIltLo+x
 nJuxQ/rVomL4BbIeRrdmS3XV/r50QsHf5oQK9EeRGsTycEgxu/NT5EuycZMogk7Z2Rahu
 bPNX16FKSWPsSpkIDQZMI1UJzBO+PB2MIIyqj37dD4/bzXg9VVCdYzZcN2BdUgOZpjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664333;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
 Content-Language:Cc:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=uOSNbO4La82HKNAJ9cjONBe5Rb8zNEWFyMjn0KAY290=;
 b=M1cZVIVkGUXFNNbZZLxWo4M+QiLIADY9Ned5ByGPd3iE/sx4iUpY4wh7AbrkKytr+DBd
 6n1MFj965B7Nr+a+agRDmzaGDRNAh+EeuzINSLfJlhasJciOG4MRwylt1/WAAJlt01x63
 KflsQUoQHPqw5YG3Fn7/OXZBtB0yqGNthQNHlsgtdMEfcBV/1UHp4GuKd1WFzxKRUpjuo
 FEBI2TEgV/V//s0K73N+W9p5qtpr36azKJPYMw5tWx9iGMqLYAgO5uvyqSpweu97ZXSD0
 0kMwrPMrxGKme/kJyzTT0qCkXBYjLk9ve/OBmeujWUsyf3lI2ybosKcKOlnx037CpTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YT8c6Fai; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AD9B6062D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:32:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso5050535e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791664330; x=1792269130;
 h=content-transfer-encoding:content-type:in-reply-to:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uOSNbO4La82HKNAJ9cjONBe5Rb8zNEWFyMjn0KAY290=;
 b=em8FOzBsPSUIYQ8iQbWUzB7cPJPC5aVkFvLxFw5Vp54OfoiVLqoWhBHfGwza3dmnlR
 IFmpmufZjsIN8rtQ51Ssw65GOtJTVGpLJWLn6j//9xi8IIRDSW4uMes1SC+WorxBpCDK
 wuu3uT6s3U8gxEp0yi8q0j7svdP/HDLCtWi6uah3jRBavXbjqSGdR/OgwGGfxgsR1yRf
 OmLr6B3tTiaXurF9Q8S653A+iTx0jtKGp8us+wmELOxuc2DehoYceZHVvzHzQZrMmPm/
 y8dQvOghQ/KvoxveqQH2pWKXzHcosuwArWtKb8BuCemXO6YN/VcwIu7zWoPcpCDPNrxv
 pYDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSuy+N8i0O9f5GLEBhnDyiivC/1JJB4pNIDlOxO5eBJKFiy0zeASTaM8odChEEvqpfpL//ZfnMYCo=@buildroot.org
X-Gm-Message-State: AFq9FYIzxosSTe2UrQAYfTpjrNsQQtO4lQA67ywHiOWCE6Pq8Noo1Pc5
 zOZv/oPv03ref+uMMcXZ9enowuLUuuDruoMj67bFWOvgD7xD1a6FoEueTLNkiovCcEWrYGeptw8
 EQMbRXI0=
X-Gm-Gg: AYBFou2nbDPma0GbQPpa8PEwh+GmiWV0VIWj+SGxHCmGGiyRf4W3/2UscPszb04Wdpo
 JkTYsXtLPCPNkqu6YatxoZyZB6PHnW+E4k01I6j31p3x/g/wmRjlLqAYNa1ZKHWiNcUTQc3pSug
 ibPJUghKvaWeQLEJITOCKxMK4dgP1f0mJXf+yG037Ce6ZIdmeYghEzzOQi6V5lobg4fQAGbl/4D
 PL/KRTZvzwoWQu4hW5UmgXMIPJLnTSfeT02xn92TwrGjEkz5+WdszdEnmbz0Ax3aITUyT7PK8mY
 g8dC1L+zOwg0eR22jadC8vmFMmjhA08uQQtEIiGARUflmsintfQFEHxtL9Qph7IQyJIig+ij6GV
 +rRpG82wL74Iorxrn4D20Ova8XxYzvsDv84kbiZUsLz3Z+b2pwUMQtgJqTomQVjQsQ5nv26oR8w
 c48qZUjiXiWUmp4WyjkljMZ/9ZKYalnzRryobfaeaoTkzUJI1hyr5xx4jrmOhRuaWqo7WstTrRT
 uMXmij+c5NrmmV9mB1PhELmKzngKTMM/a4G/McntVHzMxDMoBl3xVl5Q5bFIuX0I3m9sVkctgd7
 +sfq6+KI142qb1b5WmZjeH1bOTsusPyitw==
X-Received: by 2002:a05:600c:821a:b0:4a1:7ba9:da34 with SMTP id
 5b1f17b1804b1-4a18e3ee7afmr97497275e9.0.1791664329546; 
 Sat, 10 Oct 2026 13:32:09 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea1021sm145021745e9.10.2026.10.10.13.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 13:32:08 -0700 (PDT)
Message-ID: <11b63ec8-57f0-42d6-93af-984a820c56db@mind.be>
Date: Sat, 10 Oct 2026 22:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20251215142540.2961761-1-yegorslists@googlemail.com>
Content-Language: en-US
Cc: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251215142540.2961761-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-cmake.mk: suppress warnings
 about unused command-line variables
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

Hi Yegor and all,

Somehow Bernd's reply and your follow-up didn't make it to 
lore.kernel.org or Patchwork, so the patch was still dangling in the queue.

Like Bernd, I am against merging this patch. When working on CMake 
package recipes, these warnings have proved very useful to me in the 
past, for example to spot options that are wrong, or that became 
obsolete after a version bump.

If this is really too much of an issue for you, a Kconfig option such as 
BR2_SUPPRESS_CMAKE_WARNINGS that applies this conditionally could be an 
acceptable compromise imho.

Kind regards,
Titouan


On 15/12/25 15:25, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Suppress warnings about unused command-line variables that we add by
> default. Like, for example, BUILD_DOC, BUILD_DOCS, etc.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>   package/pkg-cmake.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index ba287d244a..b723ff8fdb 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -118,6 +118,7 @@ define $(2)_CONFIGURE_CMDS
>   		-DBUILD_TESTS=OFF \
>   		-DBUILD_TESTING=OFF \
>   		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
> +		--no-warn-unused-cli \
>   		$$(CMAKE_QUIET) \
>   		$$($$(PKG)_CONF_OPTS) \
>   	)
> @@ -163,6 +164,7 @@ define $(2)_CONFIGURE_CMDS
>   		-DBUILD_TESTS=OFF \
>   		-DBUILD_TESTING=OFF \
>   		-DBUILD_SHARED_LIBS=ON \
> +		--no-warn-unused-cli \
>   		$$(CMAKE_QUIET) \
>   		$$($$(PKG)_CONF_OPTS) \
>   	)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
