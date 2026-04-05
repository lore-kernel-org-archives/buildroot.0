Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA6AE64018
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 10:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A748120E;
	Sun,  5 Apr 2026 10:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 464ZYdVLe9NB; Sun,  5 Apr 2026 10:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AA881161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775384567;
	bh=3rAMln2LaP/as8/1EyZYvEbjKIwzMHmU9R1KBt/r/+M=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N0ZAOLZUBJG8RQUly6pn5EbcefHfL6px1tQK7OfGFxG6GVtTv72IKkkhUUMBAuSEA
	 Dw9Jivhz9lOupT0V8EmRoXBB/YjYpYwWPh6DBSmjURdlw5iGSp2TBrHXHAJURwduE/
	 8qznx1cgpv7RSzTACHXQ+lnGp1vPuLPeZgdLzeayhsXbHJ4jzjDfbCwGGrrpldNnVI
	 WrY/CIDB9aWHON6Ru2oGLPmhw6vGXd1phd9bd0co7AHCZkfYmcRw51qdSMyRx5WgfU
	 U8rPbvCcYHRBIaKh+EEnHeVEyxeWglBH7cJrA13/zDl1UF9O4z6TTQQEzq0F2kPjd3
	 lOdfe54iPFgIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AA881161;
	Sun,  5 Apr 2026 10:22:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 179A82EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0105A40A85
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BI5Ro1khrXV6 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 10:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=oxffffaa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4779340A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4779340A4F
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4779340A4F
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:22:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5a1307438ddso3112653e87.1
 for <buildroot@buildroot.org>; Sun, 05 Apr 2026 03:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775384562; x=1775989362;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2uOQ2inaxrSI8hMHWIWe1CMYThGTX+WASX5oX74nX8=;
 b=MhrWFk68M8nSgSpVVHd6bsccwCqHhc/uq9xEOUNChEOw0Q2owY5P64ogEs/oQIW6qb
 vHeHSVhhEU2rLolBvFMkSscowBhNir37jlURSi1H+hXUuD95XieSWRqsYTYaI8CRpv4N
 outmy3xzN3ON3Dbv2KXeroe1Yo+FLpNh8X1aTNwC1wfPmN4eusDDXm+QcDaYRD1UJRJe
 q/+TPx9s1ikkk6DNk048o1L6V03Rb8oBf1QRPmvCyuyFH+QsdHd8q9WHdhR8e6gePFQq
 v6EEfDbD6nS54RlmpTVSdbn215iaAW44tJhpA/FOPSRCD0F7EZ3CVk7ZxXPpfUP2wwvf
 TlsQ==
X-Gm-Message-State: AOJu0YzFQZZb78AuboyS5Dp9SJoFny6uMkWKREaRg4weLCldsGMbyPaK
 hPC5xkTMhsCUP39Erz7m0mkc/QGAGyQWKfBu4fmJzMEajjbayyq6D5vintbrj9rW
X-Gm-Gg: AeBDiesLblJgDRIWxdm4quwEkcV3OAeubLSY0UQ5QRd8ad6yRp4hn23ax2I7hLHGnif
 RsG2/ch75AcrMLkpwE4Wx2YHKPIdsiyQtr3U3//pLouP4e5JKygCQRrjp1lvqlBd2RPM+GMQ5Ww
 wyqMYUqgwQk6d8XIdwNRKvcW3Di31TMV3ihp/rgRHZAs1nhIwB+xC2QA/Y7s1DlXYefllRtvFjf
 PxMcwuK0zMmaLqDbi4CWE4zGBjJJMllsCo2/VlBElokCMucHuy1DhJ+M4dOW8nE4jkZZ6tVVrLa
 anKTiqdWdD93a+fX0L6Uclnhj28Opzglsmme0XbgzWmmv0qw1WuCgTuxOXm7l8JidKDPvZBsXg6
 +FR/SfGYG8AumV1RSNMLr3LFarLhD3mhx2L+7XPybUy+KVTOa24GsjqYwJfYfMwWxelHN0pp0zg
 fJNyyI3YmH3pGSVTvfVevd0QPnYSo=
X-Received: by 2002:a05:6512:3b8d:b0:5a2:7ab9:e12c with SMTP id
 2adb3069b0e04-5a3375807a6mr2872530e87.24.1775384562278; 
 Sun, 05 Apr 2026 03:22:42 -0700 (PDT)
Received: from [192.168.0.111] ([77.220.140.242])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2c6cc60b2sm2708832e87.38.2026.04.05.03.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2026 03:22:42 -0700 (PDT)
Message-ID: <5b80015b-6edd-426e-b54d-475361f55853@gmail.com>
Date: Sun, 5 Apr 2026 13:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru
From: Arseniy Krasnov <oxffffaa@gmail.com>
To: buildroot@buildroot.org
References: <987bd2ed-5087-4ee4-b3ce-3cb7a9030563@gmail.com>
 <9dcd5bf4-797d-47db-9010-455eda7aa2a6@gmail.com>
In-Reply-To: <9dcd5bf4-797d-47db-9010-455eda7aa2a6@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775384562; x=1775989362; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2uOQ2inaxrSI8hMHWIWe1CMYThGTX+WASX5oX74nX8=;
 b=LkCvKthkxOsWKEjcAFnwmncPI1y2I9fiqvvB01tJcIGmd5kZ7qbJT/K16dTPbYJ7YR
 I26HzRzLQwJr5yLxZMeYPxAt7YpKMw1V0VWjV4Zi6/9gJyVDA1MJDOSRQSoO/OhUlDon
 +6Y4yoQElDs7NasvCsqY3KuqxEYXY/EQy+tkazY8N9cl8ogI1/brh+XqYQWPSzEV/4mT
 9rOMwWvmtq8jcf5/RiB607NVqJDWE/b8lM6wb/p8bPH7lgPZTQx1EFexvdVSOm1JPZrz
 gEjdkDMY7wYA5B8Xl02MbqaaOWvmfQetgD2OSd1Q3591l96HZbMmi4eAZYyEVqgUnlKL
 8k1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LkCvKthk
Subject: Re: [Buildroot] [PATCH v1] package/wpa_supplicant: add option for
 bgscan "learn"
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIHBscyBwaW5nCgpUaGFua3MKCjE3LjAzLjIwMjYgMTI6MDQsIEFyc2VuaXkgS3Jhc25vdiDQ
v9C40YjQtdGCOgo+IEhpLCBwbHMgcGluZwo+Cj4gVGhhbmtzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
