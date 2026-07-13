Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455DC43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A5280B34;
	Mon, 13 Jul 2026 14:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XT6s1xCA42Nj; Mon, 13 Jul 2026 14:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE74880B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783954610;
	bh=grKgOtnAPYE0u09F4FOsHt2wPNXi1OoGOGVEbPlww2k=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=A0kP7nDjqOzTJ/fmOzkHqfOFJnLI2jK90QHY///PeOVvzzk0G78yojbVfzanY88+h
	 djdtp4JYNjyQMCykbETya1I+ImgA8blAeoGmfQ/TUhxbLX3cW6pqtCsFd815rnr5g9
	 kXwgCratVbBcjDx48jxj3PDhs5Ea2H0A8s89hKttfuir3wl/eSfRr/joRQc7xJ4aff
	 xIkWSMG9qD9G9ogUhar+1KrlHiluqqFmRMRTopXl/7uaDEj/7GeECB527RFBRYrZ/o
	 IpJC2+aBMHjzPayh0KGXsQFfU0QKtWSagMQEeBA8p/TpaQoaryt9DgnxMAgmZ+zUBj
	 sz8S5UPl7BNvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE74880B3C;
	Mon, 13 Jul 2026 14:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E8C028D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C4F60849
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lruYi6apD9t for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 14:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C61460847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C61460847
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C61460847
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:56:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so148645e9.1
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 07:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783954605; x=1784559405;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=zJjuvzcLPEDaehtTN5g4PUI+yU0quH5ddrnELy9Hw5k=;
 b=RQIxH4P23OOe7a1tUmO4zHaOuxoTCO0sGKKYP9Qa+zJN1g2cHAUPYcezoeZTd/emHe
 mmmxi4WFxTz9DBLXuW8zTh2hJEeAO+vADU3oQw0JoYS8awgfnLTdA/WjuVS/X8sSBKT2
 4Z9TQl02Q1jKoaj25UiRMQZ4MVFFPOT3w+8oBCPSiG84zPPvKtIkRPBZdEbQrq0Ndra5
 Q9QWHaiFTCPnGR1neBvnu9g7G9TJQP9GnxPe65LCRpR8L0GjTPB3CO8A4gKUFp12dyAo
 XdT4d0hdIYPuJHc8+5cQl9/W60cHytJhup8j1HMEIYCqbqDI/ZpMqjFlhT4n/mcNfwQ2
 wGtw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjX0Qo9qcWPetM1Wfb2Y4YOf0QrIYRHCq1+8CLxgf9H/aMG8AiBMzlFcazP5t9P7C/Ew49PPo+zTw=@buildroot.org
X-Gm-Message-State: AOJu0Yy87l9zeENSCFKzlfi67YJmPExDA/yZOuK8UK6vuctApr4czmR6
 agoFFaO1DSshYcuAjcNldEH1KLsEEMZfAkm8/hVAjjKj9dyk/J0yfOi/Lr6Mny5Vpl6JwA/b4vk
 Itz+hNXc=
X-Gm-Gg: AfdE7cmwN+XmtaLyaCTc7vfMxeK4Kfe15FiNwgDa6/lUThKJRYj+ta29liqst7ExlBp
 tmvC+4Q/VDggsvTlo28iTPaojtX4lQohfjRjgTCXUcZFjDFFSDXiBEyvxivf985YzaAsf6zVxyr
 1tcmV0ZdGuOlwFCt6Ir83kE4xtWH52B1OCsum5hQKohnn3EwpFbE1dNmcva5gq7cIlAlOYywmBt
 bQ1n6kXWC2b4npHSeW17YxSN+rICl0METmdJIZqHHCGCB3ZMqDMhdTzC3NpV+1TD8MdzHVhJYXt
 oT+byGBwUvpAWm2s4tGAwjckBTHjipVHmEzHo/QM/rcCD6G3dpIfFA0d5OEkuLUg2WfU6zK8dj1
 MXxuDN5gtn6Ee9Dw6JJxraq86834edOdkZUlGaFk6kYwGNSfZoj4yRJMEsNYkQOYk2YsYFn2wSG
 ACS8sYcaq7TUBOnfcv5YsGd7iZKzT30iI4Eyq9myyrLeImvVg7C+Ts/DjEgzvYhGJJJ4l9YPR6z
 4q5XnI=
X-Received: by 2002:a05:600c:4504:b0:493:fbc3:78c8 with SMTP id
 5b1f17b1804b1-493fde56da1mr68850605e9.38.1783954605545; 
 Mon, 13 Jul 2026 07:56:45 -0700 (PDT)
Received: from [10.5.90.81]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d97527sm314668855e9.2.2026.07.13.07.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 07:56:45 -0700 (PDT)
Message-ID: <af3bd67c-c197-4d2f-ade8-6f9675e12762@smile.fr>
Date: Mon, 13 Jul 2026 16:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: selman.cetin@t3gemstone.org, buildroot@buildroot.org
References: <20260706183939.79062-1-selman.cetin@t3gemstone.org>
Content-Language: en-US
In-Reply-To: <20260706183939.79062-1-selman.cetin@t3gemstone.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783954605; x=1784559405; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:subject:from:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zJjuvzcLPEDaehtTN5g4PUI+yU0quH5ddrnELy9Hw5k=;
 b=Fs9HguEUaGtSA7gLTmU/n11XyOjLDzuEbUFxm06YzS4I9rYY7Y7a/YmuZY8bKo8Em8
 NcKr0qeVT1w4SBwRdXM+APFdGL3Io9VcUubRh8H/C5rO8WozQ9XGF/G9ZRercxFB++cM
 wtZ1+0pr6IknwIr0Bk+yZq/RNX6DGPE4IQQG4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Fs9HguEU
Subject: Re: [Buildroot] board/t3/t3-gem-o1: add new board
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2VsbWFuIMOHZXRpbiwgdGhhbmtzIGZvciB5b3VyIHBhdGNoIGFuZCBmb3IgdGhpcyBu
ZXcgYm9hcmQgIQpJIGhhdmUgZmV3IGNvbW1lbnRzIDoKPiBib2FyZC90My90My1nZW0tbzEvcGF0
Y2hlcy90aS1rMy1yNS1sb2FkZXIvMDAwMS1maXgtYmlubWFuLWltcG9ydGxpYi5wYXRjaAo+IGJv
YXJkL3QzL3QzLWdlbS1vMS9wYXRjaGVzL3Vib290LzAwMDEtZml4LWJpbm1hbi1pbXBvcnRsaWIu
cGF0Y2gKClRoZXNlIHBhdGNoIGZpbGVzIGFyZSBtaXNzaW5nIGEgcHJvcGVyIGhlYWRlci4gQSBt
ZXNzYWdlIGV4cGxhaW5pbmcgd2hhdCAKdGhlIHBhdGNoIGRvZXMgYW5kIHdoeSBpdCBpcyBuZWVk
ZWQgc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBoZWFkZXIgCmNvbW1lbnRhcnkgb2YgZWFjaCBwYXRj
aCwgYWxvbmcgd2l0aCBhIFNpZ25lZC1vZmYtYnkgc3RhdGVtZW50LiAtIApbU291cmNlOiAKaHR0
cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2Zvcm1hdF9h
bmRfbGljZW5zaW5nX29mX3RoZV9wYWNrYWdlX3BhdGNoZXNdCgo+ICt0cmFwICdybSAtcmYgIiR7
R0VOSU1BR0VfVE1QfSIgIiR7Uk9PVFBBVEhfVE1QfSInIEVYSVQKPiArUk9PVFBBVEhfVE1QPSIk
KG1rdGVtcCAtZCkiCihZb3UgbWlnaHQgd2FudCB0byBtb3ZlIHRoZSBgUk9PVFBBVEhfVE1QYCBh
c3NpZ25tZW50IGJlZm9yZSB0aGUgYHRyYXBgIAp0byBlbnN1cmUgdGhlIGNsZWFudXAgdHJhcCB3
b3JrcyBjb3JyZWN0bHkgYnV0IHRoYXQncyBqdXN0IGEgZGV0YWlsLCAKaXQncyB3b3JraW5nIHRo
aXMgd2F5IHRvby4pCgpBbHNvLCB3aGVuIGFkZGluZyBhIG5ldyBib2FyZCwgeW91IHNob3VsZCBh
ZGQgYW4gZW50cnkgZm9yIHlvdXJzZWxmIGluIAp0aGUgREVWRUxPUEVSUyBmaWxlIHNvIHlvdSBj
YW4gYmUgbm90aWZpZWQgb2YgYnVpbGQgZmFpbHVyZXMgb3IgCm1haW50ZW5hbmNlIGlzc3VlcyBv
biB0aGlzIGJvYXJkLsKgLSBbU291cmNlOiAKaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fk
cy9tYW51YWwvbWFudWFsLmh0bWwjREVWRUxPUEVSU10KCgpBcGFydCBmcm9tIHRoYXQsIHRoZSBw
YXRjaCBsb29rcyBnb29kIHRvIG1lLgoKQmVzdCByZWdhcmRzLCBHdWxsaWVudC4KCkFzc2lzdGVk
IGJ5IEJ1aWxkcm9vdCBSZXZpZXcgQXNzaXN0YW50ICh1c2VkIG9wZW5yb3V0ZXIpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
