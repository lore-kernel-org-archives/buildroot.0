Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B75E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 14:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6BBF607FD;
	Wed, 11 Dec 2024 14:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YED1KgF7nZNm; Wed, 11 Dec 2024 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8CC60A47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8CC60A47;
	Wed, 11 Dec 2024 14:07:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC1FC6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87B7540AE9
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfYsQVg05Cnm for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 14:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23362405F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23362405F6
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23362405F6
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso299075e9.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733926058; x=1734530858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xMSOAkMwt7LfXW344OSIpaJ1UlR3zw3Jfuwgl4aZAME=;
 b=E87o03ba57xZhcFvWawyY+5DXy6rl2Uf8O3T98Qc5ZUiSO9CsOGwHJYtKm/olwVo0v
 vYFBgkwBDQHOnM3FK4WuFhdayWG6nU/ZhXZiG9NEnaC5o8fFAVjtsS4O5zNlHc1Tcq24
 jHpNnbfFS/YXElEmKwL/KjFAIzKxZz/7h9Isq5TMBw9kHNi+vtFDX+oY/2bmEdEnRIpM
 UlKs4bsRLcNiT/2yinom6x1QMi2ZOn17XBoM8fG9wdqPsdodJ5fMX4XjkyovqA2RUTdN
 gQfQ7f5Z2lIaURJId252qqqwcqD0MNBgMtqElsxVkLC+cM2orsnAdUaNyiMMYpSUAlGc
 h8xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQWek1/zAO6fcatqpaZnisb2j4guTjbuV+vxDWcFzHBiN6bCF1rrCk8FAhgZ+47PK7uhlrtTgVECU=@buildroot.org
X-Gm-Message-State: AOJu0YzXPfRa2QVT7+SDjpojH+XawpdvNBW42g3w0nJpI6GnCTBss+Fd
 0AV2LiFLTypS9sNPrnPN7BBACBXAJcws7pPGRG90gOdxrJJG/96dnwVi5q1rWQE=
X-Gm-Gg: ASbGncvPdZrh1OnOb6tGEcMc+7BpC10U44MaeFfNzUnsKEj7oBNXUZ5mG3OWAOgh3tY
 6NJMnj7IAi6FZjk9HvjxavWHbk7aojp6Jbh4VcnDDJbz3dBgYT15SNExt9Oos2+TWa+G36ihIXs
 PqMY56ih1iLJwz6wJ9UHjSmPJ/30L6vT3ps6WWCCdAYvszN2bTKHIRAonlKHXlPZLAVCvwkzMw0
 qBsjpmRAiHKbQ9Z37IqsV7ukpU7MSj1wUsY/cw48sMwGaha61YpSDshGIvK8gBIA12PJwzFB/3f
 u6L1obsBFgi3Nnd3n3DFTuzFZFMXwxaeqyVZaQdvFQ==
X-Google-Smtp-Source: AGHT+IEMfA3x2KH5+YbOvAFXPjk/TyKVe+gah4UmWN7gHKxIKjdfx9E6wq17Ty50AyETUxrsCgKiaw==
X-Received: by 2002:a05:600c:35c9:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-4361c42e361mr27262715e9.31.1733926056514; 
 Wed, 11 Dec 2024 06:07:36 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da11935asm227054755e9.37.2024.12.11.06.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 06:07:36 -0800 (PST)
Message-ID: <533e3a66-c205-41e2-9715-8624047e73bd@smile.fr>
Date: Wed, 11 Dec 2024 15:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241117131342.551472-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241117131342.551472-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733926058; x=1734530858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xMSOAkMwt7LfXW344OSIpaJ1UlR3zw3Jfuwgl4aZAME=;
 b=kA4+J1RWj5bQ4g46afMrKlscoE0AN2Q9wEgzJeoIV1EziCZ3US0zikocwfmvOkY/Am
 pZSdMvO96kmV6DHrj4v9VK+flEVfgN1FE7HTvWWQbv710E2C8S1McWNOX9S2robX55Kg
 hawSlzdYSIEQMXcwkj6bacycEFMmODs2nSoBY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kA4+J1RW
Subject: Re: [Buildroot] [PATCH next 1/1] boot/grub2: update _SITE to use
 BR2_GNU_MIRROR
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

SGVsbG8gSnVsaWVuLAoKTGUgMTcvMTEvMjAyNCDDoCAxNDoxMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgZ3J1YjIgcGFja2FnZSBpcyBkaXN0cmlidXRlZCBvbiB0aGUgR05VIHBy
b2plY3Qgc2VydmVycy4gU2VlIFsxXQo+IGFuZCBbMl0uIEJ1aWxkcm9vdCBoYXMgdGhlIEJSMl9H
TlVfTUlSUk9SIGNvbmZpZ3VyYXRpb24gd2hpY2ggY2FuCj4gYmUgdXNlZCBmb3IgdGhhdCBwdXJw
b3NlLiBTZWUgWzNdLgo+IAo+IEZvciBjb25zaXN0ZW5jeSB3aXRoIGFsbCBvdGhlciBHTlUgcGFj
a2FnZXMsIHRoaXMgY29tbWl0IHVwZGF0ZXMKPiB0aGUgX1NJVEUgdG8gdXNlIEJSMl9HTlVfTUlS
Uk9SLgo+IAo+IE5vdGU6IENvbW1pdCBbNF0gaW50cm9kdWNlZCB0aGUgZ3J1YjIgcGFja2FnZSB1
c2luZyBCUjJfR05VX01JUlJPUi4KPiBDb21taXQgWzVdIGNoYW5nZWQgaXQgdG8gdXNlICJodHRw
Oi8vZnRwLmdudS5vcmcvZ251L2dydWIiIHdpdGhvdXQKPiBwcm92aWRpbmcgYSBqdXN0aWZpY2F0
aW9uIGZvciB0aGF0IGNoYW5nZS4KPiAKPiBbMV0gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2Fy
ZS9ncnViL2dydWItZG93bmxvYWQuaHRtbAo+IFsyXSBodHRwczovL3d3dy5nbnUub3JnL3ByZXAv
ZnRwLmh0bWwKPiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vYmxvYi8yMDI0LjA4LjIvQ29uZmlnLmluI0wyODYKPiBbNF0gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2MyNGZkYjM2ODAwMTlkMThmMGNiN2Mw
MmE5MDk3NWVlOWZlOTYxM2MKPiBbNV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0LzVmZmFmZDIzNTNmNWQ2N2RjNzRjN2YzNzg0ZGZlNDhkNDA4MDQz
NWUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAg
Ym9vdC9ncnViMi9ncnViMi5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsg
Yi9ib290L2dydWIyL2dydWIyLm1rCj4gaW5kZXggNGRmMTI3NzRhMy4uMDg5NjAyOTMyMiAxMDA2
NDQKPiAtLS0gYS9ib290L2dydWIyL2dydWIyLm1rCj4gKysrIGIvYm9vdC9ncnViMi9ncnViMi5t
awo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgR1JV
QjJfVkVSU0lPTiA9IDIuMTIKPiAtR1JVQjJfU0lURSA9IGh0dHA6Ly9mdHAuZ251Lm9yZy9nbnUv
Z3J1Ygo+ICtHUlVCMl9TSVRFID0gJChCUjJfR05VX01JUlJPUikvZ3J1Ygo+ICBHUlVCMl9TT1VS
Q0UgPSBncnViLSQoR1JVQjJfVkVSU0lPTikudGFyLnh6Cj4gIEdSVUIyX0xJQ0VOU0UgPSBHUEwt
My4wKwo+ICBHUlVCMl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
