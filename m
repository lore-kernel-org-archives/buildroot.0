Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F92CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1CB60A75;
	Sat, 10 Oct 2026 09:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lqie8pxhY2Aw; Sat, 10 Oct 2026 09:24:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 424C960A70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624261;
	b=tQ6y5evz72x7uZO06FXvsHDyT4EzJwCxFt1qEd57sIGyjYsvW15d03FIZrCUKKcJTtCV
	 /Ly/iQrInm2GPoSlNB1+jAxKAUygHfdgHZlzJmOvbfLaEC68C83/raWc0e8+7AhLQq5e/
	 +6za8YB/t8ECTMLnLReIby/RB6HM+mar8In3nCLfSy8fT47WhjYH0EiqjrF7W/qDxVbfR
	 eTLnRFQbK/3pwPh1L8XXRmyHshPQZxb6pRyXUHezcudk560NGuueRmsx59ffxEnkMVnrE
	 483ANLi1JY0G3J2gO7FUQ9re/rb4aoJMbpZNtyXgz7kR8HNBt7gp1QOFtYJDpRIpiFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QdvzMbVyOWROMXx+2f3xpTJ+xwMVy+nF7Jct+FZQbyk=;
	b=To26/j7IXV46NQwF52LxInxSumFlpNxdmBBsiJtEEgsdg8G109CjRMZ8EpcFPrDczSCx
	 3pU2QHY1/3iBa7oghV7G7YZmHQ+ZtInz8IGylWjWR/cOynqBZI9GS817eUNmIqGz5kdix
	 oOsfsYNkMvT3jA/4Wi4GKCdCCrV3kN5y5nFllDJDeNerJXBf6IsHrubzZuMsuO6Y5CBBq
	 nvW/vu7FX3fOUbeLUYTroFHJu1jOYrzluYGOyDZZm6P81Oe6BzpmfYPAzSwm61V5rRyqw
	 VXLaikDBqRtKvsBA+eS7P4rOaHi670KaImSPJL/EVF5QN0VtqQcbkVQAhKUZFeyPtVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624261;
	bh=QdvzMbVyOWROMXx+2f3xpTJ+xwMVy+nF7Jct+FZQbyk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrJGMxScM3/07hGcTbWqNwPPdFjt/ZRJYAi1GOWqdT3xtNFlGsfk4dBplSvGduusc
	 bD7sQmKbRQwCk0Y+qWYoLzuANivSKe6BLYUFX3V1TFEDcJBVQ/FcaTKOZAAamT3Q+L
	 KOhJIr/tT4I1eriXh7HYfc2oOcZ/R9SFuSe4s5Xhty7ST9LcGbSiXzjhKhKm5oNLIL
	 GY7ZNX/1K5lay/17FleUNU4BpLi4w6l//SDNuOPwbA1eZvWKgbgL+7CDjhK0kris2a
	 b65xv0P8Z6Haoo1W7qV2/saeoww3yPq8VCSxL2Hr8TpFo0Yjjq9OItwXrJDxHOwZtX
	 AITaMjlhGnNVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424C960A70;
	Sat, 10 Oct 2026 09:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E02775
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD0581296
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVnjC7mJPmNY for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62EE181287
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624256;
 b=R2GBe0hx6f61D3HCIrfyfHxRoy/skGUfriTYs3ePUXtmRLR0PXQwesaap+esAzP90LyC
 b1mph2KF86otv69SbnS/9viU7YXYyGZrbhJW1S8YlcxEXAvpaQnjyT6TckbB+DuljocaX
 Sh0pnrzSZv05R884+77skyYCTBbvEjfzWh+U3wHWnMDlXNu2Vk0oertG278mLrqdqnb/S
 Qw8mlQZS4KIq0SheqWY+OlVDV2jOoOpClZM04LwrG2r25qToitsfBE/6pqWN3nevEF7kw
 SmkWjlNMECtDrka15pZCK322s30kKWkvQkzuWcT+LKHLz3G1OcdkzpBaELm7Z1tZ7Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624256;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=FOGEoHW4cgWYjggh0RM61mPOLoOxLwKZsdDMxlM46RM=;
 b=NeJ8hjAYpopDAn2fBhm/Nbf5lEMuFCEOay8GfkKhFyBOHFqXwx8jJCJ9ljgFvHkhge25
 LGamdJAEDvgJkPTAopNkSzZSuhm4LfTOTgOivFW3OaWrJZ7kVDLa4//9vuxySiG0urkBg
 +LlgAzQzVkD4+Ox0WntGDQLkqiYiugIfyX9Ruym5VLDLStAziLKzXMxtif66xOfTWThVK
 JmtPHFuFtrUaTfDPc4LjuABa/njJFF54SvdQ3sxWYzvRAce/JAIXssXOlgdb8nONrl6RH
 vyacRAc4OLBJSbH/D3qXqQvXLw2f7n90cw6ueb/iOqXsGWed0Ma+S3RjNttcUGAd1Bg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OBEvmpgB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62EE181287
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a02753c04fso2510235e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624254; x=1792229054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FOGEoHW4cgWYjggh0RM61mPOLoOxLwKZsdDMxlM46RM=;
 b=QNVVGmkNWBPCKnrxLddtuOzO5cHWb2Dr4D7FQu0ppd+QrCDXEP7ksH+89QOP9GVxmC
 A81/Y+zRH6OPVqWZhzeHT1wN9r39EaBv9vYvpQGCw4Ml+PJNieJhiNbARRklvJo1U9Zi
 BYpCMhjB3/frctJFPMUWJ5oNCTetory7Y76CZdqleekJeP1/Bagocj/vY88Oc0qm+1GW
 6LcxNtLnK64eX0q6saNeZYVXLZXByjh39e7EXA0VfAkTaoVpDho6y1eY0RoJAfw2ZmKK
 yrBZDMMnjZuBYtNM6bEXKI1oAlCXDEsGy7CfywQMHxqw2dCc7mwIgxYs/Vy9BhAc2ZOw
 iIiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByeSmPSt8cdynvZMw58Wa4mn9dSUyNjrVX8C86cMioGZDqmNCgXYgzWg1wGffbWQFsbDuZI2iZVles=@buildroot.org
X-Gm-Message-State: AFq9FYIBLcv+KWR8e8zbsWoGIol9y5AddthQQQLCnO7j52tx2u64lKpD
 tj1yhMdv2StvH3CusR23UuxNDa++4FoQ0j5yBn5NHFxMd4CAEmJQ8hNJBRwDHYhSIcg=
X-Gm-Gg: AYBFou2jb2TxvGq0uAoVzC/9PR+HZoYTrtoYi0R2Yg0VRmK9PfIx/qwPSTDBfJqaWts
 MoEwm/Q2xne15/NoN4TytyhD8rJEkc4RYXPDrDT/8Uu5v+tjoUldkMATpE8xN0anaJJpKgH/pHF
 h7LUEK4+8NSLv5Z7x+cCQURDikK2Ri8Rlgw+yJa5HxUt24o+5V+qVSpHuskqR09zcyqx6BFnUOt
 yZYYH5Ksz94Vr4PaAjyijb/FMC4XFr1uq/0ceptuzHHQ4vDVPs+ZsiDcqp5euqsHyz3PazZWnRZ
 TFPwklluyua7z8H6MIfNshOYtFyqSMEqm2WuUtR2hV7DIMFQGbLiB/IhpMrBo6r2pwsBTnUuxRs
 Dj2bLpoT+DMsZOt86U48RlmQx9EJlyetuIPfFrZwKxeTI1qvvWQPk++jgyV8yZbo3fXynI1PBbo
 0XJjBwa4c3X96r40ojZeZgsOYIUjj01TNJ9LF5xWT5fhXUNJFHaSTFDMg1Q21w2KDIjSd5kk68m
 nEqAFXQnozjnWtSvsLJkEv4GjDydf4laZc4HA+c/wN1nosgsYKl2tuP
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id
 5b1f17b1804b1-4a18e49d251mr80081925e9.5.1791624254442; 
 Sat, 10 Oct 2026 02:24:14 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c601sm118226225e9.3.2026.10.10.02.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:14 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:13 +0200
Message-ID: <20261010092413.140018-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151226.867507-3-fiona.klute@gmx.de>
References: <20261002151226.867507-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/lvm2: set unconditional
 dependency with "=", not "+="
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This is a simple style fix.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> This patch could also be applied without the rest of the series, no
> functional change.
> 
>  package/lvm2/lvm2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 8db1899ed4..21fd5134c1 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
>  	--disable-nls \
>  	--with-symvers=no
>  
> -LVM2_DEPENDENCIES += host-pkgconf
> +LVM2_DEPENDENCIES = host-pkgconf
>  
>  # LVM2 uses autoconf, but not automake, and the build system does not
>  # take into account the toolchain passed at configure time.
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
