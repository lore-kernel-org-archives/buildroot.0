Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5792DC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C4D6070B;
	Sun,  5 Jul 2026 13:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1vmC6zCJxOi; Sun,  5 Jul 2026 13:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C47606F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783259485;
	bh=HYQwohOwi0DuogqB8Xh6EBlGQ61AbIR/S49UBo9aHo8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ICJOwGg8iclfAfeKwPNLnHSjK1/73uhjJTY5VRhbTx/0ZrDhoPBN1Z6jKmEzAk9yh
	 muRd2IQsabsfEMTX9LWdipQqUjmD6/Te03v8rrC95NdAqv2m978XuxXNgGw7UxxQOu
	 0ToUF67s75/d6VKKHoTeFDlSqx+F0y1Nofv1hZOKTZZg1P5Az7QRslHz61r2neEprI
	 ZDOF/cbEUb59v9zQ/d3yG0JSAsXKkxJeSfySM+doMHBJUCfIJtyEq+OAXk14SL/Zqz
	 PZb/mtDJs+i78TmAK1Aa/A46uocIPc/OIPrn9fwgDNw1i3WZhdjc1/RNtvHAOJYnEG
	 43E3dC4As6ovg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C47606F1;
	Sun,  5 Jul 2026 13:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 871282A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78404406E2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq0RXpgxzwsp for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 13:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78D82406E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D82406E1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78D82406E1
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 13:51:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so13085875e9.1
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 06:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783259480; x=1783864280;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u7ajPoNKr7f8LhWUKPcfuZN/0F0xyEMBtHjVzeBseak=;
 b=Yg/Co6v++iS5ZcRntITTeSQ4IKcATRdA+v7hbwZmkhOBBEqYJ4gdmjqDkBtGfjEeMO
 4GG4kNRZeFwS+TOn58seHb32PfnqVS+UrU14Nkv8aPHqUfGRvmYxbvYn3cgAt6dRDvDY
 W1w96fZPO+DClVEeIjOE8u3xx+eEUjW5DJGw/delsVMkWmi0uucal0w3/WQOGHsKtD/U
 bXHfcGnTmc2Ukeq3NslwykXc3tyI8MUwHfVWy/+Z1swRl4NK/MhZ0LKPb9ZoNR0QnUP0
 ZGR1bdCRmp2PArO669H0BHj01HnnEUxX3oUw6Y4XTNQfACIwI+xGduiagEddWaIz1glm
 Euiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//6pCV2RH0MuSW8cXHZTrLINufHQStD7/76Bz3VRsrvS5KfiUPUcEsOEaEuW7zKiReEEc+IbKFtyU=@buildroot.org
X-Gm-Message-State: AOJu0Ywjy5bBHdFXHn/YExxe9MXXFkzLAr2PrS9hK8RyasCZFajaVeas
 d1Pb+bsWs27ZbmlwVu/eCcx040n0q/mLBafgNG8OrxIPdeVlTiuY+t0iKxYT4pJxl/g=
X-Gm-Gg: AfdE7cl0A5Zr/ikbgaRfKykVvKGiOtZRY8JswTKPSkuVcEJaKLlzUUs8kFVLAspweoz
 Vv3uvnFXL8SSvrsSkFfycbjnYC3AK3Wnk/6lkHWKoZ7DXdY4bctNmDC1rknVaEhI/rAT1Bnd7xW
 O/1SLnGsqj/7XKIIdzSI7xFAsFnBWeKFSb4u11u1uI246sEbxPWu7BK7C+sO+RWriV7vmWRRujs
 rK93l5sWXm5twci+GgLL0c22El59uqDsMTH/daR/RvuBcnsvoxQoX4gHc2dMy6cfj/wgYDpwyv1
 EsLZNmVj3v4ZdNpKuwwcTNVQrWkQ2iLs1faDRDacX9zAE29zMSttj5i+kh1EqNxLaTOZ9v3MC3v
 UA3RFke5JKc/J3LOFZi956JwtG6qMfHzZh5kSv28QooozV9GM0mXPz8eXk4elj3R6Iy6cblb/zO
 +eT6fxal1UfONWcCzFT6lKlbilM37xIZdT+2l2R8JihWB10bDu+KnHsdJa7shutIbl0AkTqhteX
 7hQtpYiOcE2zZCJS7cO3zZvhglQ2nk3QhYlPyJaz8vFjUmCfpMc86o=
X-Received: by 2002:a05:600c:4ecb:b0:493:b8cd:2555 with SMTP id
 5b1f17b1804b1-493d11d3be9mr80794135e9.3.1783259480236; 
 Sun, 05 Jul 2026 06:51:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6?
 (2a01cb0594a2a2005e8944d0fdb416c6.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:5e89:44d0:fdb4:16c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef183e7sm374800335e9.2.2026.07.05.06.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 06:51:19 -0700 (PDT)
Message-ID: <a90e9c26-f462-4680-b193-098fe33ab619@smile.fr>
Date: Sun, 5 Jul 2026 15:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com
References: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
 <20260202142359.2577937-3-jimmy.wesolowski@mobileye.com>
Content-Language: fr
In-Reply-To: <20260202142359.2577937-3-jimmy.wesolowski@mobileye.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783259480; x=1783864280; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7ajPoNKr7f8LhWUKPcfuZN/0F0xyEMBtHjVzeBseak=;
 b=oteuATDwwGlOa9KTOcaNUOd+LbILeobC1zzf7GAn6eBDZJijZCRQo0WQFegrC2ay1M
 0lhjsiM0dkIxQfAzXIwjhKc0n04OxqhT6rxZmhsHCGr0HlOjDPpg8mUVc9hWskt+SVK8
 EYazriZTTCJjVg9TBgh9TyvYQSgEukJJsE+m4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=oteuATDw
Subject: Re: [Buildroot] [PATCH 3/3] package/xdp-tools: add new package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmltbXksIEd1ZW50aGVyLCBBbGwsCgpMZSAwMi8wMi8yMDI2IMOgIDE1OjIzLCBKaW1t
eSBEdXJhbmQgV2Vzb2xvd3NraSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhpcyBhZGRz
IHRoZSBYRFAgdG9vbHMgbGlieGRwIHN1cHBvcnQuCj4gU29tZSBwYXRjaGVzIGFyZSByZXF1aXJl
ZCB0byBhbGxvdyBidWlsZGluZyBhZ2FpbnN0IEdDQyBCUEYuCj4gCj4gU29tZSBtb3JlIHdvcmsg
aXMgbmVlZGVkIHRvIGFsbG93IGJ1aWxkaW5nIGFnYWluc3QgR0NDIG9yIGFnYWluc3QgQ2xhbmcs
Cj4gYW5kIHRvIHZlcmlmeSB0aGUgc3VwcG9ydCBvZiB0aGUgb3RoZXIgY29tcG9uZW50cyBvZiBY
RFAgdG9vbHMgKHhkcC1iZW5jaCwKPiB4ZHAtZHVtcCwgLi4uKS4KPiAKPiBDaGFuZ2UtSWQ6IElj
Mzg5YmNhYTA0NGJhOGMxNzZjNWI5MjI5NGQzZDgwOGJiMGFlZmE2Cj4gU2lnbmVkLW9mZi1ieTog
SmltbXkgRHVyYW5kIFdlc29sb3dza2kgPGppbW15Lndlc29sb3dza2lAbW9iaWxleWUuY29tPgpT
ZWUgbXkgcmV2aWV3IG9uIG9uIGNvdmVyIGxldHRlcjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnVpbGRyb290L2M3NDUzNTgzLWFmNWYtNGNkYS1iNjA5LTY0OTU1MzVmY2E1Y0BzbWlsZS5mci9U
LyN1CgpJJ2xsIG1hcmsgdGhpcyBwYXRjaCAiQ2hhbmdlcyByZXF1ZXN0ZWQiIGluIHBhdGNod29y
ay4KCkJlc3QgcmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
