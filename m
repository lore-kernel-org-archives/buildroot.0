Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2E9C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726D081239;
	Fri,  7 Aug 2026 11:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfl5Gye-Fp4h; Fri,  7 Aug 2026 11:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84C28115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103267;
	bh=pPremLx4OzZH5Z9Dz0onb9fpzdFTu3fAqA1dsGQiJ38=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JiixYvmKidTzvetUzoDnPx8UuJSiGNREIlguSsrobgUSdHzuRzeMXr3O1Ke95NCYs
	 e84In80AgbhoCotHmsvti9iyni5obow7V/ddwkE1u2RuPjvRUZQRayRlS7+d6rKFHu
	 R//WAaFoaCELbYEgXMauJm4mjjg45yep/1BOGQTzxaS3od28/DwmLe1jz8+tJYHHKJ
	 2hPjijgew0PBdXwqGHEpzS+eP6CVX5IrHTeRA0Hxcaf4NeSGVpWYFqNa9K9Ck8lCoD
	 VmKKmlyHFmCwM4qV0JyShtZXrT+Nc0NXPax2h7Tl2/4b6tEKCcsIcjYohzwYUVM8C/
	 m1qD9F9j3q8jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84C28115D;
	Fri,  7 Aug 2026 11:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BA6D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0749A8115A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyJFJXyeKBJo for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BD7281105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD7281105
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BD7281105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:47:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so2016867f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103262; x=1786708062;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=on8EQyOYsSSxHL1W7KGwb8FmrW5pSH4fyaAouSZ7BhY=;
 b=e4ck14xsF23HV1ynS7NqUaxnR0PfojburFpL6mosUq4kBH5hvWI6a1My38P8It3MaZ
 TJRHEP8ZGQAQqZqnpP2OfFwHMxpCcnLiyAyGsl/rLevndnpdpOiV4TCZj81sJXuAj2D5
 3Uo6uvUsJN2DH6bXrVyMWFmQhLOgNy/Kg+/D2SzsAhu8/8Uq2r6pA99tsmJG5a7YtTk6
 laYHHLczS/S601bySh6zXPnEbngKy6D9gSKCFDUmlPBGwcjP+5DWln4SZbQlhxxb0mMU
 B/vvutinKUhBeOZGnRP2xwVq7sOAGyCs6Qdg1jfZUo3yxmMYiWzKwXXNlwfBkKoEGI6a
 uvfw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqF5K1xp/phkdar4V9OhjiqCrsVRtJXvD5ZsP7h6OQuAcQnu70r9LIntpBO449Ghf8LiMqelhYbFKg=@buildroot.org
X-Gm-Message-State: AOJu0Yxnp3nj//I9ikWxmK+BBOf9stTFcyOHPrHZdiSeFDhDjzeCG/at
 vExcXVGeSdosyKl45AKI80V9ls+S35HGQ3ekpAGFc5E5QevfeVpNMkfwg/ShupUFpv0=
X-Gm-Gg: AR+sD12TvQSK6qI/PIMBDMxZlJzxtBqhnPDUt503W9j+DLY/v4pdT+n1iF0lIl+4A9O
 VIZFZZfK8h2ukZoDhSF1OH2ClcjqCZ1cdCDTKoGYKkQxQdBxUajr3T1HIWRZOfukKS8A5P41K9i
 D8NQ+po44NkC7pEecDplWjo8rNxJA7tG7QPqFf2/TU1lnMcE/gbT8b86nFHzXxqQUE/NlATJgCv
 7albBxHNVkkJwrmG7sneW4ZEyG/LtQv38oTHtKW6GkuqC7KOJzByqi9uCDaGqV+YBvASvd3ssDI
 gZu8hBe8rCfETggIRamOdkeQg+g/QWF5HfzNtAkA3STbBqNGhnuWWYAFFeClrkY2NStU5RQcSPX
 JRD4n78usPEVGpoT5rEPDb7bESOVvNZgH5L6yNF+yAH3QqMOx6l4YXnUHLjuuRjDKvv2z2TJQi5
 oJZdVZUY0YPKzOd7tynr8UFxJgDHUs9FndtFjFU9tI6C97NHfrls+/f1kwgzOEgY7IYrC/E8ajs
 3YGID608zvyMp5TjIRZfxY5PSAwpIyjKnMdZryoFvvTCmdD
X-Received: by 2002:adf:e190:0:b0:47f:f20d:8d4f with SMTP id
 ffacd0b85a97d-47ff20d8d7bmr27673227f8f.18.1786103262266; 
 Fri, 07 Aug 2026 04:47:42 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002145a2bsm4956394f8f.4.2026.08.07.04.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:47:42 -0700 (PDT)
Message-ID: <d6d0615e-b71e-4dc0-9b3b-9af44f7cd649@mind.be>
Date: Fri, 7 Aug 2026 13:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michele Comignano <mcdev@playlinux.net>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
References: <20260731093425.81408-1-mcdev@playlinux.net>
Content-Language: en-US
In-Reply-To: <20260731093425.81408-1-mcdev@playlinux.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103262; x=1786708062; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=on8EQyOYsSSxHL1W7KGwb8FmrW5pSH4fyaAouSZ7BhY=;
 b=J7FzHiqoByke8pyh3s2sy/PNsDO4DV/7zmnRHDUA3lBODTt3iEfLCxtefdlBNTGDjM
 ZVdgpaRXnCIUFVUfyTUJX7EJ2kg9AZBvFpH1jWNN1HaaYwnB7w0HUZdP8N7RyX2IMVUE
 DWatYHZ5x19osnQzL45jb3/XnVyaIlLqURcJICzsE5eUdUQ053rN6alc236cr6kDJp7v
 HWFQ9eXfGbjVBPoCGWBg+a85FR5E8absYdgDTZcNxIlkEdlGlH1hloqk92vSPpTfxQKo
 AsL4S8EmYbz4dkXtFlt8Xf7MvLEPIQ3QXqx3BExweAd0peif3iahPCVW+FUJrP2U4tHK
 EJDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J7FzHiqo
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version
 1.0.9
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

On 31/07/26 11:34, Michele Comignano wrote:
> Changelog since 1.0.7
>
> - 1.0.9: This is a bugfix release, fixing minor vulnerabilities
> and expanding the test suite.
>
> - 1.0.8: This is a bugfix release, fixing minor security
> vulnerabilities and expanding the test suite.
>
> Signed-off-by: Michele Comignano <mcdev@playlinux.net>

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
