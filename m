Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37385FD88C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BFA81324;
	Tue, 10 Mar 2026 22:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKG91H_Mf7CX; Tue, 10 Mar 2026 22:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E86812A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180596;
	bh=rD1RJIUIzr8ZNmsfWXHKaybv72rthy9grS2/TEOZrUs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CK6uz+D5xIM8jFx824kVIQR0nqdGdcVH28eNT6+5cGJUa0Kv54119sLCWZspO0TIV
	 UecMUxkDzSjOe6ma2Zt7FRbcSJ1xHGIwx52t7YwGfyAoa9afRK/GBB0gK3NtajbPGC
	 hkhc/+XzxmkixI7LbBQwTxgz+9wDDKKVwPyG+zE9OXRMhg43DB/Mlj1dz1G9oTs5UD
	 IDFVBRYq3+vj+ejcC+XvaaQpoi2maUivfQbcz51B/pC0g2H63VX3512ZUUC9eGDvvM
	 5xAWWOFLloCqdNrb4W2JseBr5VGqKVrGGtnj8gVFFbhy8IHC5M8hODLwn1YCfW13/W
	 TpJ2vFVGq5fCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E86812A1;
	Tue, 10 Mar 2026 22:09:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 441F433A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AB66082A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pHNeZCuttBy for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 143B660789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 143B660789
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 143B660789
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:09:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so39734045e9.0
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773180592; x=1773785392;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=McBoEFWk/hqv67bMJxF+TsoGcnktdUXHmBVAG6rKQ1k=;
 b=xPhp1eGc6dqdWLbJPg2eMaaSN7UHBhEndUbAS5tsa142N96fGesVbYTpLzN6tfcB+V
 SkwUtlDbgjuS6ldfGGHKntUu2OSnJiEcQO0I4n8PkeZT4zj57H9kJXBBcMJ1hxm9oQPY
 gcnlniBZsKgi2n8S25hCJRxp4DVVorw+ihml+zV3FRcMev+Ca6JMz4Jys1Z/UHQmEWgi
 sgEfg6E1HLHKDRQUGCmPJSkUJtd7U6+Itep+iZTjfs4F0TU+rxXsd/DoLCDoWp+bMX2P
 fOctJdLIARPB/Qrn/stvFA+CtyMyE4oNAaD03NHpGF1IJn7oiemRFQhTswmPbixUaRy5
 VjlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMZv/fVnIbp+7RV9QmZ3R5rfiY3FIgKSH6IoipcSa8sFlGB1FnMWA1pCcVo3GBeqbe4sHuAHsfrqg=@buildroot.org
X-Gm-Message-State: AOJu0YyyglKMxTuAfecmvFr8wyewaXSI7alWAfuekfIp6hsCg9om3u3X
 mw3Bsj9p8ooMC8ubxInU4bybYOAYoEx0QcaBrbqbF+GGhi2hszzBWqX7FIO7GKToGrT/Gnqzg6r
 yyUCr
X-Gm-Gg: ATEYQzzn5AF0LxcfiJCXGFOVreqn/D2L8fpX7/FFX0GC7tVaupjhpB/pfnYN4m0nfiD
 NRAxBj/FmM+fpeKeIXNDH6O2tro4WSBU3B8rk6Yz3/zB4mKIAcsGMxNMgTie7yOxkuse/exqQYz
 yjf5FPqv9IJwsZns9zdyMlIo02IKA/jAzymCnJ3el6gWxyTI4K2+m/Z/cFA7QjFNyhCdohQpJUw
 rYLBFl/q/A8VLc06fEWWRGDCVps53Tl40T6koUge3anVjr/7295dBubKDHquTy3wCzySNisZ9wj
 wKvb3VvHllgHjC38/WqKzszy4zqm0Bxgl1C9GvF261d476z43QtvTRknc2NGcCyxzCbStC1GVM8
 hyx3dXrlrfcp7Gq+3HZ3EjsiYrOTCUl1geZ4eLd+MWllr0qqZrv0wcmePrWXJAXDWcBc3imfsiU
 GqDRKXMj9CrAhUfEOpzRK/5pkwM5EJs+Aze7MXIgdBPZ+WpL0eWA8wOdwOJu52M+kBIDAl6gxRZ
 ZuEFx062qryQSyNkEHnemSBLcaVg87tWOILCJkfpKlt5+7Uyt4RG1GvOwTzU1cBvA==
X-Received: by 2002:a05:600c:3b18:b0:482:e5d4:b7ca with SMTP id
 5b1f17b1804b1-4854b0b32d8mr6874395e9.8.1773180592012; 
 Tue, 10 Mar 2026 15:09:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81a0307sm1571256f8f.11.2026.03.10.15.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:09:51 -0700 (PDT)
Message-ID: <f4fcf503-63db-4e32-bf93-c4df0d8403fc@smile.fr>
Date: Tue, 10 Mar 2026 23:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <jesse@rivosinc.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-4-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20260225105537.1420002-4-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773180592; x=1773785392; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=McBoEFWk/hqv67bMJxF+TsoGcnktdUXHmBVAG6rKQ1k=;
 b=knvg1MrFMW/aVaWRS453uD6D1JXqmPu+x+Spr8Vc25H3ah68EdKxy58/lee4OwhyeR
 qCdr+eSrhR3xUDucv6LGQpZc2K7DE98T/LIlDlUUzmRqwumIsmuqvs71K+QvHf63rRNB
 bCu8eiDgavgV+WzKUeEja0KUvdyOq4E/enADQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=knvg1MrF
Subject: Re: [Buildroot] [PATCH v6 3/6] package/kvm-unit-tests: bump to
 v2025-07-31
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjUvMDIvMjAyNiDDoCAxMTo1NSwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gVXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVz
dHMuIFRoZSBtYWluIGNoYW5nZQo+IHNpbmNlIHRoZSBsYXN0IGNoZWNrIHBvaW50IGlzIHN1cHBv
cnQgZm9yIGt2bXRvb2wgdG8gbGF1bmNoIHRlc3RzLgo+IAo+IFJldmlld2VkLWJ5OiBKZXNzZSBU
YXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0
aEB0dXhmYW1pbHkub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KCkNoZWNrZWQgImxlZ2FsIGluZm8iCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
Cj4gLS0tCj4gdjMKPiAgIC0gcmV3b3JkIGNvbW1pdAo+ICAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFz
dGVyIHNvIHdlIGNhbiB1c2Uga3ZtdG9vbCBhcyB3ZWxsCj4gICAtIGRpZG4ndCBhcHBseSB0aF9o
dXRoJ3Mgci1iIGFzIG1vdmVkIHRvIG1hc3Rlcgo+IHY0Cj4gICAtIGNoYW5nZSBmcm9tIHNuYXBz
aG90IHRvIHYyMDI1LTA3LTMxCj4gICAtIHJld29yZCBjb21taXQgbWVzc2FnZSBhZ2Fpbgo+IC0t
LQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2ggfCAyICstCj4g
IHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgICB8IDIgKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMuaGFzaCBiL3BhY2th
Z2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMuaGFzaAo+IGluZGV4IGFkMDkyMmRmNTku
LjZmYjdkZWEyYzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5p
dC10ZXN0cy5oYXNoCj4gKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0
cy5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYg
IDYwMDE1YjAyM2YzNDI2MWMxMzRkNzE0ZjQ2NzA5MjZhYzgxNDgzZTI4NmExNjQ3NWViNGE1Y2Vk
YWIwMGVlZmEgIGt2bS11bml0LXRlc3RzLXYyMDI1LTA2LTA1LnRhci5iejIKPiArc2hhMjU2ICA4
MDUyZTFmNzBiZmIzYjBjODk0YjhlZjcxZTM4NDdmNTMzYjNkOTU3Mjc3ZGQwNGIzMjcwZjMzMzMy
ZDQxNzBiICBrdm0tdW5pdC10ZXN0cy12MjAyNS0wNy0zMS50YXIuYnoyCj4gIHNoYTI1NiAgYjNj
OWNhOWUyNTdmMmVhYWUwNzBjZjBjY2RmODc3MDc2NGYwNWE5NDdhMzlhODM1ZTYzMzQxMzc1MGE1
Nzc3YiAgQ09QWVJJR0hUCj4gIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5
ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0t
dW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawo+IGluZGV4IDFlZDkwMmIxYTAuLjFkN2VlYzJk
MjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5t
awo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPiBAQCAt
NCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtS1ZNX1VO
SVRfVEVTVFNfVkVSU0lPTiA9IDIwMjUtMDYtMDUKPiArS1ZNX1VOSVRfVEVTVFNfVkVSU0lPTiA9
IDIwMjUtMDctMzEKPiAgS1ZNX1VOSVRfVEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQo
S1ZNX1VOSVRfVEVTVFNfVkVSU0lPTikudGFyLmJ6Mgo+ICBLVk1fVU5JVF9URVNUU19TSVRFID0g
aHR0cHM6Ly9naXRsYWIuY29tL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLy0vYXJjaGl2
ZS92JChLVk1fVU5JVF9URVNUU19WRVJTSU9OKQo+ICBLVk1fVU5JVF9URVNUU19MSUNFTlNFID0g
R1BMLTIuMCwgTEdQTC0yLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
