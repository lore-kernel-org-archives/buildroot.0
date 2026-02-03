Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26ECE8784D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2D3608C5;
	Tue,  3 Feb 2026 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8XKrHPpInwR; Tue,  3 Feb 2026 17:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3300860717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770138249;
	bh=ouZkrGLAEHpVC3t8fk5izrk+sTFeCWQ89gSuM9jS8Bk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4xt4ONzoT4haVDbPBPKPBhUA8ynhBbsKlBfWv1FC/hIfu6EugVTJ//V8RTszD+7/
	 8Qk80oGzHJLzeeiQR2PtOksNerYBYhPs3GBYbunjNwmwDzo2zagj26/u521/4zeTYe
	 rqvt9U2yZ6ap5ngMFRRttpaXtZVWWYIXcl+thCNFTmr5c8P5gOACyFxYj4OPMSp7hW
	 kL1KURxhffH2maG4KhraIQNMKUX8kU4RQohuBnDPVJljh/wmWBRyf5SYy/3P91+TjS
	 EvSPEZ0f9YC3IczYTbsEqLr9kMeGBa2O+veq56tmDsjLj722UDyDeFR7ehvyFAym/p
	 fffjhU36vPxfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3300860717;
	Tue,  3 Feb 2026 17:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70489F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5220840BA5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAq5CYRI4CKQ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33092407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33092407BE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33092407BE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:04:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so64414805e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 09:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770138244; x=1770743044;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoUM4xVq7okiyT8CASCye0+SRVUIZBKNCGv6S4mCIWY=;
 b=iyKYHqT/KPlfeO5uv7+UNwDj+MHnOaLUo48tsUBDHLStUpAxDte9T+ALDefjuIGTcJ
 c2E+84plxsOP6y2o9ssjQI7fD5uovdEfcWKSu7zjHAOnCjD2A0E19PiAi4OJolnXMEMd
 hwWMQFJsDP+u/3k/4TrVpwXoKsDA6GHPtgjo6PqlpCPCtA2IY62w+qU8Xil9UiplFapX
 o3gFNbnao6kSVzwfSJLLfA2p2DH8ndLihXDA6rehZd9nMYnGc5BwOloeOry12X8wLiPf
 oWkG6a5iP67D+0sp+wYKDE5CYPMNTff9GIXbo99ZxEWBO6D/Rn9g4VSWk4zwtM+B/Ch2
 ki1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxfrrTKjIQi5APe7Gi6zI2H5UFux9xCZb/jjY/91OTHFpuq9c2lz6QUI8/r8g1Jd94q71QgNxgrnQ=@buildroot.org
X-Gm-Message-State: AOJu0Yza905OXGWMQ0NxZc1tWPFrkrPEdWQAH14LuUCaHFkAPiSGa7TK
 gPvbEM47em3pVVMVNts2qKGXy5elBcv8Dp1pytk9X+S0ks3QxzIQ8XwfsxRGebMZeKAQqxVEFsk
 SiYfC2Vg=
X-Gm-Gg: AZuq6aKsxXYJ/8rJoGnf9t1eWHw3kz0QdbbrLIp9H633RE0WEzSFAQLBnmDEKz03jii
 4VUqZDI8T4cVlhgQOy7ShFZ4KdXq+sz14fHQPprrz6eaDurlUVb/0R93PM+xsAFGKKk9ltpHJiC
 1MrE3aehbjGi+q3v3VzAEetd13haQc4gluRS4ucQmRoxPUXXywSYuwjsxmkeEn8XNHzZfnBSeZW
 6g3019/pjBmdWOGiy7EEPIOK2qAqXAlyahD6aQz5ydiYojcFVN7CE6cUQPCVLeRv3q59egIeNrA
 BXvFJ2ytXQVwJrJ42FIv4CZavgwT7bp2l4cX4p9xuRu7kgNUa8V6mMA9T1KREJqjJ5Ijj1oM1oq
 +MwZ8cQnoQ4038dS7KuJFbT3MzNBIJg0vLYVo25AzZYO6TKy4xZ/I0o7TtPXxb+jjwFd132ley6
 HPFhbQUDGrIxPhoL4fD2hbQL8S5mcSu0j4byLud9PxtGI+Qf2L7myW
X-Received: by 2002:a05:600c:4fd0:b0:482:f564:d60f with SMTP id
 5b1f17b1804b1-4830e93049fmr4556945e9.15.1770138243836; 
 Tue, 03 Feb 2026 09:04:03 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830eb3c3e8sm1178295e9.13.2026.02.03.09.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 09:04:03 -0800 (PST)
Message-ID: <d2ef7e4f-64fc-491a-9a6f-c1fd6db206d5@smile.fr>
Date: Tue, 3 Feb 2026 18:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: bernd@kuhls.net, romain.naour@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com
References: <20251226101445.2b29f439@windsurf>
 <20260103084002.2045193-1-thomas@devoogdt.com>
Content-Language: fr, en-US
In-Reply-To: <20260103084002.2045193-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770138244; x=1770743044; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LoUM4xVq7okiyT8CASCye0+SRVUIZBKNCGv6S4mCIWY=;
 b=H2t4P8lRU60B/zABn7ubr1mwOsETGbqRx2Ew5iX9ZatDntXiE1AgapbILqxfUkhnd2
 HQtXL5qVt0J/CQfJW1HxhXS45d8JAY8pCDLOsu4+OoSrRAVo97htpi3MiYdRfkWEWRf+
 Ecxj50VXGw/I3ZEwDWl6ZuOYtv0WDFG9gTeIw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=H2t4P8lR
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mesa3d: explicitly enable
 llvm for host-mesa3d
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

SGVsbG8gVGhvbWFzLCBCZXJuZCwKCkxlIDAzLzAxLzIwMjYgw6AgMDk6NDAsIFRob21hcyBEZXZv
b2dkdCBhIMOpY3JpdMKgOgo+IExMVk0gaXMgYWxyZWFkeSBpbXBsaWNpdGx5IGVuYWJsZWQgZm9y
IGhvc3QtbWVzYTNkIHdoZW4KPiBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfUFJFQ09NUF9DT01Q
SUxFUiBpcyBzZWxlY3RlZC4gVGhpcyBibGluZAo+IG9wdGlvbiBpcyBhdXRvbWF0aWNhbGx5IGVu
YWJsZWQgd2hlbiBMTFZNIGlzIHJlcXVpcmVkIGJ5IGRyaXZlcnMgc3VjaAo+IGFzIGludGVsLWly
aXMsIHBhbmZyb3N0LCBpbWFnaW5hdGlvbiwgb3IgaW50ZWwtdnVsa2FuLgo+IAo+IFRoZSBCUjJf
UEFDS0FHRV9NRVNBM0RfTExWTSBvcHRpb24gYWxzbyBpbmRlcGVuZGVudGx5IHNlbGVjdHMgaG9z
dC1sbHZtLAo+IGJ1dCB0aGlzIGNoYW5nZSBtYWtlcyB0aGUgZGVwZW5kZW5jeSBtb3JlIGV4cGxp
Y2l0IGZvciBob3N0LW1lc2EzZAo+IGJ1aWxkcy4KPiAKPiBOb3RlIHRoYXQgZGlzYWJsaW5nIExM
Vk0gaXMgbm90IHBvc3NpYmxlIGZvciBob3N0LW1lc2EzZCwgYXMgdGhlIGJ1aWxkCj4gd2lsbCBm
YWlsIHdpdGg6Cj4gLi4vLi4vLi4vYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xpYmMvYnVp
bGQvaG9zdC1tZXNhM2QtMjUuMy4yL21lc29uLmJ1aWxkOjg0NzozOiBFUlJPUjogRmVhdHVyZSBs
bHZtIGNhbm5vdCBiZSBkaXNhYmxlZDogQ0xDIHJlcXVpcmVzIExMVk0KCkluZGVlZCwgaG9zdC1t
ZXNhM2QgaXMgb25seSByZXF1aXJlZCB0byBwcm92aWRlIHN1cHBvcnQgZm9yIGRyaXZlciBzZXR0
aW5nCkJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19QUkVDT01QX0NPTVBJTEVSLgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjYwMTAzMDg0MDAyLjIwNDUxOTMtMi10aG9tYXNA
ZGV2b29nZHQuY29tLwoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZv
b2dkdC5jb20+Cj4gLS0tCj4gdjI6IEV4cGxpY2l0bHkgYWRkZWQgdGhlIGxsdm0gZmxhZyB0byBo
b3N0LW1lc2EzZCBjb25maWd1cmF0aW9uLAo+ICAgICBzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnVpbGRyb290LzIwMjUxMjI2MTAxNDQ1LjJiMjlmNDM5QHdpbmRzdXJmLy4KPiAgICAgQGJr
dWhscywgSSBjYW4gc2VlIHRoYXQgQ0xDIHN1cHBvcnQgaXMgbmVlZGVkIHRvIGNvbXBpbGUgdGhl
IGludGVsLWlyaXMKPiAgICAgZHJpdmVyLCAoY29tbWl0IDMxNzI2MGYgInBhY2thZ2Uve21lc2Ez
ZCwgbWVzYTNkLWhlYWRlcnN9OiBidW1wIHZlcnNpb24gdG8KPiAgICAgMjUuMC42IikgYnV0IGNh
biB5b3UgZWxhYm9yYXRlIHdoeSB0aGlzIGlzIHJlcXVpcmVkIGZvciB0aGUgZ2VuZXJpYwo+ICAg
ICBob3N0LW1lc2EzZD8gUGVyaGFwcyBzb21lIGxsdm0gcmVsYXRlZCBsb2dpYyBzaG91bGQgYmUg
YWRkZWQgZm9yIHRoZSBob3N0Lgo+IC0tLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gaW5k
ZXggZTQxYmY2OGQ4ZWMuLjA5YjA5ODYyOGFiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNk
L21lc2EzZC5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0yOTcsNiAr
Mjk3LDcgQEAgSE9TVF9NRVNBM0RfQ09ORl9PUFRTID0gXAo+ICAJLURnYWxsaXVtLWRyaXZlcnM9
JChzdWJzdCAkKHNwYWNlKSwkKGNvbW1hKSwkKEhPU1RfTUVTQTNEX0dBTExJVU1fRFJJVkVSUy15
KSkgXAo+ICAJLUR0b29scz0kKHN1YnN0ICQoc3BhY2UpLCQoY29tbWEpLCQoSE9TVF9NRVNBM0Rf
VE9PTFMpKSBcCj4gIAktRGluc3RhbGwtbWVzYS1jbGM9dHJ1ZSBcCj4gKwktRGxsdm09ZW5hYmxl
ZCBcCj4gIAktRG1lc2EtY2xjPWVuYWJsZWQgXAo+ICAJLURwbGF0Zm9ybXM9IFwKPiAgCS1EcHJl
Y29tcC1jb21waWxlcj1lbmFibGVkIFwKPiBAQCAtMzA2LDYgKzMwNyw3IEBAIEhPU1RfTUVTQTNE
X0NPTkZfT1BUUyA9IFwKPiAgSE9TVF9NRVNBM0RfREVQRU5ERU5DSUVTID0gXAo+ICAJaG9zdC1s
aWJjbGMgXAo+ICAJaG9zdC1saWJkcm0gXAo+ICsJaG9zdC1sbHZtIFwKPiAgCWhvc3QtcHl0aG9u
LW1ha28gXAo+ICAJaG9zdC1weXRob24tcHl5YW1sIFwKPiAgCWhvc3Qtc3BpcnYtdG9vbHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
