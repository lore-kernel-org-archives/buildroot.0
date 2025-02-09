Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E0C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 22:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1EC60A61;
	Sun,  9 Feb 2025 22:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgqTmQ2HjRhI; Sun,  9 Feb 2025 22:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72DE60A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72DE60A5B;
	Sun,  9 Feb 2025 22:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2E56C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 22:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B6081FFE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 22:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy7naUON_DjH for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 22:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CC3D81FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC3D81FF9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC3D81FF9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 22:16:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso24717675e9.0
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 14:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739139414; x=1739744214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PlI97utnqFL2VxVHG4ac9Uqcbz1DTAu2EQWoIyB/6G4=;
 b=m4NekdVTD7CSQGzC+LpHrl6WQ0sBNjfGz9/f941vOE8pYVoDW0dfNbpo4j2L7n7+Gx
 7pvEDIaiYk3/SlAyQb3wxZtKNAk5c6kMpyNxfDsaCMYMwgHe9UPMqA9H98K6Al6Oxw9b
 QlActwVzQ9ij/N2uCtG8UguvgheSBBT14Wc8J7lk4u/csRNg5FBafzplvz9xSeQBKne+
 v/3+WLJ1YzL7VmoJ1VM+WzyeTC+m9PTTp47bROdWhvpe091Q7bLCJPmshwtclFHbDZ+F
 emtVtK+SVct5e06DFpOE1ZBPMlsD1QN8zJV3VLu7XLlgDNpcmjPLTgvHvFjtz/ddz5xs
 cqyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVffbem9sKOQDy2sg9mNJEYnI6rcF/Xad0QIJ+6bDMpGZ/z2alkSyWORNNsc5MJi5WjljgcIvijlU=@buildroot.org
X-Gm-Message-State: AOJu0YxKrKyQ3Ktn3yJtbuI4gk0U8iA7VtoRX8u3IPhXO/z6+ZmSaHrL
 Y++pxO/9tul91Rs0peCmEF1uqfg7+tZhPZJgbKv/bP9c3E0xvbK9N2sAa6RdmRjfebhjFc8N9FQ
 W
X-Gm-Gg: ASbGncvG0kBTuiRgMoKskmR9tEN1zuGcsT+UCnb1vcX0WMfJQyjMH0lKREwAeMdXPCi
 hBBSll4AnmeG1J9HrtNJK8NsiksmZFHKF89KTOzP4uFKAUsZrqOYU39WRDTk0y09ZKTjzYUAhs7
 l/IVUR3qi8ucSOrvTjKMMlsj5Q9Z+jlGGvTzyec+QyEw34jipy5yMZw7MmOfx9ctE6Q8cL8Rf/t
 BkcGYy2eQa9C9mp9oIAJprgye5XGMUMs/GOxNS+qlCS5X6E0S3XXbw4kgJlx/WhKB+biboE4L6L
 xI65KjbZB1PIu1ch9GyIQDEbwsRAgGs57fbcrUypG6cvC63e+GlisFc62/U/Wi7rtWV861ZXAfy
 lhKtKimmm8v/hnjGZlAv2oQGXwNN6cUPegv0szBWMzqGtN1sEf1M=
X-Google-Smtp-Source: AGHT+IEffJWGk0rLyrwNkLNaj8Ej+FnQ1nRorpFNxYTVFm3Bw8ZO7D3jOyizvm1k2KHdQeWoK6nEYQ==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id
 5b1f17b1804b1-4393dc02be1mr24671665e9.2.1739139414031; 
 Sun, 09 Feb 2025 14:16:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc88989b5sm8363090f8f.65.2025.02.09.14.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 14:16:53 -0800 (PST)
Message-ID: <0be3003c-7320-438d-9ee8-13b33d605c95@smile.fr>
Date: Sun, 9 Feb 2025 23:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241128235949.2204076-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241128235949.2204076-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739139414; x=1739744214; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PlI97utnqFL2VxVHG4ac9Uqcbz1DTAu2EQWoIyB/6G4=;
 b=WOiR4M0oRyl6eAqOksm3RScYVUhl5QGsSAgiV88BM3qKS5bkIoHurXXOB8dOvnycx/
 U3N0BGeNHarmCbAjkWnPz2eUBdN6Fitfb/yqblQ+sKEM/WoqvlA/maRSWR6Uf4k34bfp
 4RWeT7PSETYA50wSF4tRLsg1IS1SjqG8Is0Cc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WOiR4M0o
Subject: Re: [Buildroot] [PATCH next 1/1] package/fwts: bump to version
 24.11.00
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

SGVsbG8gSnVsaWVuLAoKTGUgMjkvMTEvMjAyNCDDoCAwMDo1OSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBTZWUgcmVsZWFzZSBhbm5vdW5jZToKPiBodHRwczovL2xpc3RzLnVidW50dS5j
b20vYXJjaGl2ZXMvZnd0cy1kZXZlbC8yMDI0LU5vdmVtYmVyLzAxMzkzNC5odG1sCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiBQYXRjaCB0
ZXN0ZWQgaW46Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMv
ODQ5OTMyMTQxMwoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgoKPiAtLS0KPiAgcGFja2FnZS9md3RzL2Z3dHMuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9m
d3RzL2Z3dHMubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnd0cy9md3RzLmhhc2gg
Yi9wYWNrYWdlL2Z3dHMvZnd0cy5oYXNoCj4gaW5kZXggNmM5ZjlkYzc2Yi4uMGU5MTNiM2FlOCAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Z3dHMvZnd0cy5oYXNoCj4gKysrIGIvcGFja2FnZS9md3Rz
L2Z3dHMuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEhhc2ggZnJvbTogaHR0cHM6Ly9md3Rz
LnVidW50dS5jb20vcmVsZWFzZS9TSEEyNTZTVU1TCj4gLXNoYTI1NiAgNGYzNTJkZWRkNjMwMjE3
YTM1NTFiYjRmNmU4ZDYxZjg1MTRiZTQ1N2QzN2I5MGM5MzZjM2I2Y2ZiNmE2ZmE3ZSAgZnd0cy1W
MjQuMDkuMDAudGFyLmd6Cj4gK3NoYTI1NiAgMDlkZGU2OWM2Y2Q4ZTMzMTc3YzM3ZTA2YTk3NjNm
N2Q3ODI3MWFkNDBlOTJmMjY2MTU3YjczOWNmYWM4ZDE4NSAgZnd0cy1WMjQuMTEuMDAudGFyLmd6
Cj4gIAo+ICAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQo+ICBzaGEyNTYgIDNjZDJjNWQxMmYwMjRm
ZjJhYTIwM2UzN2Q3ZTk3MmM0ZDVhYjdiZjFhNjVlM2UwOWFlYmNjZjcxZTY0YjUyNWIgIGRlYmlh
bi9jb3B5cmlnaHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9md3RzL2Z3dHMubWsgYi9wYWNrYWdl
L2Z3dHMvZnd0cy5tawo+IGluZGV4IDkxYjVlNjEzZGMuLmZkZWQxZTY5NmIgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9md3RzL2Z3dHMubWsKPiArKysgYi9wYWNrYWdlL2Z3dHMvZnd0cy5tawo+IEBA
IC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1GV1RT
X1ZFUlNJT04gPSAyNC4wOS4wMAo+ICtGV1RTX1ZFUlNJT04gPSAyNC4xMS4wMAo+ICBGV1RTX1NP
VVJDRSA9IGZ3dHMtViQoRldUU19WRVJTSU9OKS50YXIuZ3oKPiAgRldUU19TSVRFID0gaHR0cHM6
Ly9md3RzLnVidW50dS5jb20vcmVsZWFzZQo+ICBGV1RTX1NUUklQX0NPTVBPTkVOVFMgPSAwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
