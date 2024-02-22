Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E1C47DD9
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 22:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F27A40118;
	Thu, 22 Feb 2024 22:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1Qi1-D8S5Gz; Thu, 22 Feb 2024 22:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1587540338
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1587540338;
	Thu, 22 Feb 2024 22:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC471BF379
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 387C640338
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiUtGUDlVbWV for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 22:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9D1240118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D1240118
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9D1240118
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 22:49:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412767742a0so1842625e9.3
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708642154; x=1709246954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yrf8DKUzZjUGEmv7wfSiCaKz+cU7knkQnSloKBAzsvk=;
 b=owzZI6O2QI4Da3lX+I3JhKumprQFnhCG56b2IFJ802OjwRIRsMA/vr6ua7gCHJoPal
 Lzvpmpk+A8D/b7GqyzlQjZcQfDXCdvGB5//hYKLoItW29O8g0orWFXjUZdzFds/YOezh
 dprWpyPTHulnFmx9EajPQiHR27nFpZOJuXsb+5Keby154fbqqdNIIeo8oTZtEDBIp+1w
 xXw78Lq4uNT8RRGoL9vlku6OXbqpyMompBkijgCJKBioQVAG5taQzOxJtAFHN+7TEiyN
 lAMYtO2gRP5AzySn2bTNouhgnWlqAruHeatfvOMDFwz6ZallLc0MR6qpHrmD1XMpLEUf
 5Kfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9+Le9XY2szCfKjG1J62Fjc+QoKBA1VeQLUCYX8sCBG7/OxvjMfljBKfv/jQTiGlEWwalM2PR/Utd5W3OZvwcAwM7FUxrEAg==
X-Gm-Message-State: AOJu0YxWEWbbroc/iAQfEw8kntWJUN0qxxq1OVph3DLJyvGmpeWGF0yo
 6UFthEiSubP6Pc/QgebJ6nk1sdu4rkB+SytMBkIK9zCZbyLiUsyYSOI1GMuCIVo=
X-Google-Smtp-Source: AGHT+IHZTpYTDR3DjkAqxbBzusn6NM8cvZeM76uBQT7PPbTXQjMv2uAk/r/9BpQi0+vOsmgwAT2Hbg==
X-Received: by 2002:a5d:5583:0:b0:33d:9232:5aed with SMTP id
 i3-20020a5d5583000000b0033d92325aedmr316836wrv.52.1708642153772; 
 Thu, 22 Feb 2024 14:49:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b0033cf7eb4a85sm418635wru.65.2024.02.22.14.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 14:49:13 -0800 (PST)
Message-ID: <62b63f26-4e2e-4538-a422-bc7f7e131fb9@smile.fr>
Date: Thu, 22 Feb 2024 23:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-15-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222101617.18422-15-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708642154; x=1709246954;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yrf8DKUzZjUGEmv7wfSiCaKz+cU7knkQnSloKBAzsvk=;
 b=T/ZK1efCpYnj/a8AYYfVv+QheJsuTPE7gC/vnG7Juf33+DT+XfRQZtvz4vjiGF/BOc
 7gq7v4oCoNSOfEkMTMmah1jZF7IB/7GE+pRva7GORQHVtI99/UrMdqGdk07dGhHJhQtC
 P5bjsf56RYQjfQQH/kNE4lTGRqmwhduo+x7BxwzC9llPIUEpzZBxuasWAhMKKNlecukZ
 CDzi4RaCDpjB9zzLn4Qh24rGafy4CXK99aP4T1w5nmgiMtlX7SfGXf98r8F03uwMnF27
 kqWxR/L1VWVaxfP7K6rtQhLxbrL9x7dnDlBUJyJH+nudVWiKzwIuigS4JeYVOCDa1Ykh
 IFZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=T/ZK1efC
Subject: Re: [Buildroot] [PATCH v5 14/16] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyMi8wMi8yMDI0IMOgIDExOjE2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVpbGRp
bmcgdGlib290My5iaW4gdXNpbmcKPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBp
dCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAK
PiBDaGFuZ2VzIGluIHY1Ogo+IC0gUmVwbGFjZSB0aWJvb3QzLSotJChUSV9LM19SNV9MT0FERVJf
U0VDVFlQRSktKi5iaW4gd2l0aAo+ICAgdGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQo
VElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4gCj4gQWRkZWQgaW4gdjQKPiAKPiAgYm9v
dC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgNCArKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLm1rCj4gaW5kZXggZmRiMDU4ZjNiNzJhLi5lMGM0YzkyYmQ0Y2MgMTAwNjQ0Cj4gLS0t
IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gKysrIGIvYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gQEAgLTcwLDggKzcwLDEyIEBAIGRl
ZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+ICAJJChUQVJHRVRfQ09ORklHVVJFX09Q
VFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVSX01B
S0VfT1BUUykKPiAgZW5kZWYKPiAgCj4gK1RJX0szX1I1X0xPQURFUl9TRUNUWVBFID0gJChjYWxs
IHFzdHJpcCwkKEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEUpKQo+ICtUSV9LM19SNV9MT0FERVJf
U09DID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX1RJX0szX1NPQykpCj4gKwo+ICBkZWZp
bmUgVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTX0NNRFMKPiAgCWNwICQoQEQpL3NwbC91
LWJvb3Qtc3BsLmJpbiAkKEJJTkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5iaW4KPiArCWZpbmQg
JChARCkgLW5hbWUgInRpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJX0szX1I1X0xP
QURFUl9TRUNUWVBFKS0qLmJpbiIgLXR5cGUgZiAtZXhlYyBjcCB7fSAkKEJJTkFSSUVTX0RJUikv
dGlib290My5iaW4gXDsKCkkgZG9uJ3QgdGhpbmsgImZpbmQiIGlzIG5lZWRlZCBoZXJlIHNpbmNl
IHdlIHNob3VsZCBjb3B5IG9ubHkgb25lIGZpbGUgdG8KJChCSU5BUklFU19ESVIpL3RpYm9vdDMu
YmluCgoKCj4gIGVuZGVmCj4gIAo+ICAkKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
