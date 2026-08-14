Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE18FC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C6B40E52;
	Fri, 14 Aug 2026 14:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JzQHSbg4dVc; Fri, 14 Aug 2026 14:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D75B540E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716920;
	bh=Z1XDMv4X+mPK3BLB9SLl9RIOdlzpqRXpGXiV/k+Ly20=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Yg4ode13qtCtg0q0/UhOrwrQ6j8c/hQIkqUNpfAB1Vuzhq526B6yXZhF05yPD1bZm
	 /RDk6YdPSbPBvc9mZgZN+7vYlcL1ccjhDFFDvlKHbi/45nrJGIQMBiQL3VWDehqjG6
	 6frNwjM8RMDnQLgjWgzEzrzs5iQqG3wXJoKfX2favExut1NDgRGBvbcMiNlMQ0v4Mn
	 CLH85igNkCMqvfr6OLw3t2QyOvNNwaaB3TFz5JNA35T1fuVo7aagzFIJIihhE8vmSI
	 cUKw6WYNJRWu3CK0Vg7vD7YeMttiZavuiGy8l0y7ayTzQ7kzcsxPlUE6LM/aMdGi4L
	 jcL9rp9+nq3+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75B540E95;
	Fri, 14 Aug 2026 14:15:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8FFB3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAFD840E95
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znUzDBhURu7u for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C234740E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C234740E76
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C234740E76
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:15:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so699725f8f.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716917; x=1787321717;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Luf9YA1sbudOh6mJKC8oV1lgw6TqLm3j8hu2DNf9Dlo=;
 b=tIPqmwnnlcV5eDw6sYM6zn0wGttT5k7YfDH385k6KE3SZJik2EjCNEzB4jJaRzh+dp
 JniWpqz7W5RdiUt9lRFMndk2m/DguVks4mdZAPpkpsEn5FvXMVfbiQsOr3qcWligBlUB
 0iBsIZDC5VUk5RK0o4uZC3Pjxm7okyu+RZ9EwmKXN9qCB7ySS9fzq+o4ciqaYZKGesb2
 erowMscQYrDa5E6zwFCGZAhqzI18vzmrf8RytJyGbKFImD8A6OAunzcbeLn3IWuGef4l
 aPWStpp9Pon7Qdcy1Mw8R9TfcSxMvXYlslh0+S2G7ARHMmLNGJ3Z6nSg1O296M2Jqc4D
 p/Qg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6bPxhNEJqrfF5vTqMFKF9lt5uv62siLzLdabdsUdG6+sF2tby0YmkiUazuY5RRGGR1PpwTJ7RYXA=@buildroot.org
X-Gm-Message-State: AOJu0YyUhwBnBo/FYae+RoT8Ke+G4TcYrfiSB31VlH93n2Uac04J1SbV
 SZ+cgomS/am8CIiaVoQ+RmGiU4ASbcJojO0agkZfoT2+XuRoNCpojGdo4xkP8HMZhH9RaXTX/pu
 3fnjcEcs=
X-Gm-Gg: AR+sD131918toBIxXwR81kJwqCwKboP3en+OFP+fCssrhCQygdqqFTd+lU5hkYe5u3c
 VUJSYBtdR6jymLZ16xvG/Afmd1SjHUNm58DGYlgp/HhbEeUa+bF8jcb7zsLiqm+vta4jQRaXiwB
 j0pzOnwgEJfJ+f5zNboNWalTuU7ANuwa+IOR2tuBGZVxHv1RWFn4Er6XXN8C7z9s7oGH+zhjOsI
 GBV+ZvfEnk/azVIa5OREE+XlMGJpnvZ+1jvuKfoMTVdkTEQ3mIlROEIObDtGgOIsgWcAwgG6H1X
 /YKWDBocJ3oi07gCbbUYjgrAzA2m+3MCmizN8Ut1m9i70msT0v/xsw0xyPoJknBjK78wgmjryH/
 Gx6BuLElYLOP7QJbVH9CccWbg7AIFARC+0nZrjhLl9wXHKIUZqUj7+74IKhob/d/blC/GX8wAxA
 ZYOdu7u+oSD3BVqMFmpbYkt6sqeIJtfOmzXMCQnrH0btg1KiTaeayWERn4bUmMKVaZLLBQMW6un
 S5dLHAXtMv3JBNF0Cs9yzdlTpY112+v9gwerT3K6JKCoo6j
X-Received: by 2002:a05:600c:2114:b0:499:5210:c537 with SMTP id
 5b1f17b1804b1-4998792e462mr56370435e9.1.1786716916699; 
 Fri, 14 Aug 2026 07:15:16 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899bff2csm30114175e9.7.2026.08.14.07.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:15:16 -0700 (PDT)
Message-ID: <b69ab255-4865-49ef-bf3b-cfa2793dbbe9@mind.be>
Date: Fri, 14 Aug 2026 16:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260806170329.1976989-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260806170329.1976989-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.6
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

On 6/08/26 19:03, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.6/Changes.rst
>
> Fixes CVE-2026-63649 & CVE-2026-63650.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
