Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB654C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817D460A4E;
	Fri,  7 Aug 2026 11:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QU5lgewUutTA; Fri,  7 Aug 2026 11:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C3860A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103477;
	bh=twaEXKw+Xv/Y8XZucom/nM4YzJ2c0klTCatl53yAkG8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ejYhsoNck0XQVLtMr43DFIwn50Uu0sXf67XHmGix7h4tudaaJUhr930gMDrmpFBSx
	 xxny4NJTvgEyGZKmmxeajCCuHPQPYagYy8x8epmKP5nubCanOYPpMrjxpD4ejMNMB2
	 390+WoZ0SgfmV8EfGrJNRdoEyAjQPwzuGOsBhwtVpeeJ7iJRQWGOLIpjclj3s6pgtt
	 5dnUrgpywBU4sfuOtJewUoleunjagyTyT/wGP+6HAir/O3A8Xm5U7ulK7WFfJc5wpK
	 5gR6TZ/Qh0kJ0LIMb6W5i00G+gilO+h9U+v9Kml2qKw23muKlVBqLfWsFt2tBtrq9s
	 tOutVN+gKBRyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C3860A3E;
	Fri,  7 Aug 2026 11:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 599B9282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BF3640A71
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VhyuP0AoymV for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53E1E40A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53E1E40A6E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53E1E40A6E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:51:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso17971045e9.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103473; x=1786708273;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+QLysLv0Fi0SVtnRf2TZfrTf0vzv/+Q6Xp9v7jMa4jg=;
 b=T4Pt5FtAmgQFdMV0iZdaxSanxrkFotYSlpaWU2DATP66MFrfh4ovebpkstNRJcxYKf
 /T8Qu7VHz+/nnlrPkwHFZfyz5POFeOQiPeeZl3Qf6rfIyk62bEoJ2C7uAiY5i3Qf0H92
 KlQ/Yq88kXeft4nSTWLC9alz4I8oDH2VS1tA0idZBeIAOercQF8hQVrJktMYFr2TMQvs
 NIoBKREbmo6jtMnwkPsjCbjYn43WTg+Zk9GAdzTiNS9/pA5BrZ0mTU6Jpy66kc+PmGMc
 nBycKsr/+4KcxbpuV8nPJhtFfTs+GvwM8+q2ozuMNRcZ3b0Pdy/XIPAvCPdjS2dpDC2c
 Ch4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQBGHzm17ATtKDStBXeq0hKLH4mcpLPvF8hQ+ClZ6E8VPBYQt7erJujRT6FSCpFraXyDXba7ycm1g=@buildroot.org
X-Gm-Message-State: AOJu0YwdypuXxa91ZPJwVEPjavBZPxEgi3lwgSlmN7TNpAwwth6mymJ5
 5d2IjP1j9U7sYrZhd+kBUxbdPK+BE5dx9T15ou5PIBp8unZdXWXM09FLQgdUAh3E31o=
X-Gm-Gg: AR+sD10t3YO4kK4EFojONcpUMrQkZj8VfJYfar7bK+XHSEtC6cgxZCefwgf9ypbDFXm
 b9LlJI+7bi+YV4b8YYs447ruIijKm09C3AUK70d7qonsWHWOaPL2aYkbmveCtknshZFf2kBizHc
 aHR8RgrNz3HIr/jkwj/9ymTu9n++CiXNfcpXOvZqsOoS+su/U1/QmKnD47kCdjgJs8zujyDIiqM
 C3e5Uf4ngMOZsFARozYPnbHzCjJeMw5Vt1/l6GGfuSETKe8C3HSrpul+oC9u1cBBK+lGzMfFAwb
 bbK5N3/M3Nioeugpp3pDsmE4lnTw7XA2sAwyXo6677roUYoGsGGowjCLU7sa6OYM9FXMxm1cFCC
 dC3fI6tgzfj4KFL6fa3fCLEiXBo5HYV2raN9lJkjeLePm/iLueVP2enYXmdCwLG/Wew8mHBikou
 C7M1cBc909sJYyNSfINgmed55MHpfZUfXLfclKv5um1gqYj58gUVqihWIMC6Z4LPFkJz3h+0lDc
 448z5gNbIrVsenPcKpvoFYetQws9qS0dKLjP7kyj2boFCq2
X-Received: by 2002:a05:600c:310f:b0:492:45a0:dcef with SMTP id
 5b1f17b1804b1-4994e73cc33mr216323255e9.5.1786103468082; 
 Fri, 07 Aug 2026 04:51:08 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499542851d6sm157379495e9.12.2026.08.07.04.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:51:07 -0700 (PDT)
Message-ID: <c6333758-a330-4a67-972f-cc3423395cac@mind.be>
Date: Fri, 7 Aug 2026 13:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260726132650.1438371-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260726132650.1438371-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103473; x=1786708273; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+QLysLv0Fi0SVtnRf2TZfrTf0vzv/+Q6Xp9v7jMa4jg=;
 b=KLhRZVWnofHJBBkCy+8Z7vf8sdbbLDj5wrSsrKZHAWcuXhTXUZ3NOfobpUShxbQ70M
 rSFCY0u7htmObAXDaSIl9i3wIAiKHJ1Jo9MLA5FO81RO0F8bZS8pf9ippN9sqVp7+zmB
 o142CZ86/Cte/+kfWBN067ghyg2P9HSgXDo9kCRedBxalS927r1qmWxILS2FGSnPFfYH
 2FDypzI4AYu8ce4IJpOIq7r88GyQpGfjaDU1rhDbyHD+m3SdClhsQ16QFn5cXD22wv4Y
 vpIaMnMFl7sOAupeMx2PER0Sf2GSoPuv4+V9TA0oo6tPOxQ0ECJ2JO7E0uv0lPZiBYEb
 k+qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KLhRZVWn
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: php: new runtime test
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

On 26/07/26 15:26, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/15538708895
Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
