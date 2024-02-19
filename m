Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFE6C48260
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C8F405DA;
	Mon, 19 Feb 2024 09:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqZLIcmeVzgR; Mon, 19 Feb 2024 09:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB50405C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB50405C8;
	Mon, 19 Feb 2024 09:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CDFE1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4629B40607
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKK12M-gcB5Z for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C28AF40144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C28AF40144
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C28AF40144
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:30:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512bde3d197so117315e87.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 01:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708335017; x=1708939817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4S66xGOZI1nwa7KcGatIcV/wtcXwMZY+6ns2nM4Q6Y=;
 b=tKa1aLzOYVHxUQHbAlyADKUbhjYHh3SlbvPk4VBEh9PiC2OG/rRyVHYo0iGTZUjDPK
 4cp+w8Vsigkfss2NvEGUy7vXYMnRoHIIq4XGgaVseEbtBeXY00XcOizBPP9OaNK5BU6w
 S9KSXyrIVJ7zvyrzR9TZUXiJTbMx7FU4k6Dp7z172s2EMBUii6sXAUCYOQkr25UCILE9
 CLW3LSHAl4cA0QFc0X8m9K//4Tn3f+dgdMGcT6T+q7+QNGrYVGMFJT5rmBpX/tAyIJ8A
 hUxAl68A1eCHY0r8Cb1nCtcIOoQ6WeQTDi+5YMxWBxbXwKWEh43sztB+p5aWYZlOUusz
 Sh2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAnsuoVRqlb9tbStWwCnahOzQba1htI5YFS7xZxOH2hzgNE95pXH4pFbrePvD4cEcBwjw1MCDUMfPXFe8d+jnkB9b7DofzYA==
X-Gm-Message-State: AOJu0YxsZfDdmkuz7r0ypKOKaBkqxKdTbMWdso0jpcpYjMsiuIFIr4Jw
 v6a/vsqUc52howIIN6koLO3956uE83C2JS6vxByRmUyGOtFAzBoF/A/siXleIQo=
X-Google-Smtp-Source: AGHT+IEm8XL4k1V+ifNWbzqWmGCk6gmeigc3l5wRXVHvBGa70W7Nkm3U0MbqUKch2o5OEw6jOEjptg==
X-Received: by 2002:ac2:5e89:0:b0:512:bc0f:b9d6 with SMTP id
 b9-20020ac25e89000000b00512bc0fb9d6mr471841lfq.47.1708335016632; 
 Mon, 19 Feb 2024 01:30:16 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b00412696bd7d9sm850303wmo.41.2024.02.19.01.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:30:16 -0800 (PST)
Message-ID: <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
Date: Mon, 19 Feb 2024 10:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708335017; x=1708939817;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4S66xGOZI1nwa7KcGatIcV/wtcXwMZY+6ns2nM4Q6Y=;
 b=axNDD+9zU090G5oBDLzwatLOYhWEkUuT+o7oV4rI9dUNpeXPukmTsRK6UL5TwOI8Q8
 TCKMHyi9ANh57knVfTSZkx1CsRzhYVPNRFKXBK54Cys87Zmzka8KYm4YrPKVxG0x73DH
 RK6gRtsMuql+UQHD6W7ePuUO1G+PCPTzn0/kb2SNSlyuBn5ff+Ax9srHNigRmtbh7eOJ
 FCGK0XpsNWr3aT56+N+sVQLw+8kjPyl8q8azbRU0YWTwHfDAK64ZgzpPFjRbChc4TKUj
 eE6WId6tQT8eqr19nUpRvI7QZz2mizIZo2gxXUF4hQz5leMttNG1fcQpeCOSEN4x3Xm2
 clow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=axNDD+9z
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBTSy1BTTYyQi1QMSBpcyB0aGUgbmV3ZXN0IHZlcnNpb24gb2YgU0stQU02
MiB3aGljaCBpbmNsdWRlcwo+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxlIChIUy1GUykg
c2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4gYW5kIGVuY3J5cHRpb24gZm9y
IHNlY3VyaXR5IGFwcGxpY2F0aW9ucy4KPiBUaGlzIHJlcXVpcmVzIGVuYWJsaW5nIHRoZSBCUjJf
VEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTIG9wdGlvbiwKPiB3aGljaCwgaG93
ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZXJyb3JzIGFuZCBidW1wcyB0
aGUgTGludXgKPiBrZXJuZWwgYW5kIFUtQm9vdCByZXF1aXJlZCBmb3Igc3VjaCBhIG5ldyBkZXZp
Y2UuCj4gCj4gVGhpcyBzZXJpZXMsIHdoaWNoIGluIG15IGh1bWJsZSBvcGluaW9uLCBzaG91bGQg
aGF2ZSBiZWVuIGltbWVkaWF0ZWx5Cj4gY29uc2lkZXJlZCB0byBjb3JyZWN0IHRoZSBjb21waWxh
dGlvbiBlcnJvcnMgaW4gY2FzZSBvZiBIUy1GUyBkZXZjaWVzLCBoYXMKPiBzZWVuIGFuIGluY3Jl
YXNlIGluIHBhdGNoZXMgaW4gdmVyc2lvbiA0IHRvIHJlbW92ZSB0aGUgdGktazMtaW1hZ2UtZ2Vu
Cj4gcGFja2FnZSB0aGFua3MgdG8gQmlubWFuLiBBZGRpdGlvbmFsbHksIGl0IHNoYXJlcyBzb21l
IG1vZGlmaWNhdGlvbnMgYW5kCj4gdmlld3Mgb24gaG93IHRvIGltcGxlbWVudCBjZXJ0YWluIGNo
YW5nZXMgd2l0aCB0aGUgc2VyaWVzCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9Mzk0ODQwLgo+IFRoZXJlZm9yZSwgSSB0aGluayBp
dCBpcyBuZWNlc3Nhcnkgbm90IHRvIHJ1biB0aGVtIGluIHBhcmFsbGVsIGJ1dCB0byBkZWNpZGUK
PiB3aGV0aGVyIHRvIG1lcmdlIG9uZSBiZWZvcmUgdGhlIG90aGVyIG9yIHRvIGNvbnNpZGVyIGEg
c2luZ2xlIHNlcmllcyB3aGVyZQo+IHRoZSBwYXRjaGVzIGNhbiBiZSBjb2hlcmVudCB3aXRoIGVh
Y2ggb3RoZXIuIEkgYW0gYXZhaWxhYmxlIGZvciBib3RoIHNvbHV0aW9ucy4KPiBMZXQgbWUga25v
dy4KClRoYW5rcyBmb3IgdGhpcyBuZXcgdmVyc2lvbi4gSSBiZWxlaXZlIGJvdGggc2VyaWVzIHNo
b3VsZCBiZSBtZXJnZWQgaW50byBvbmUKc2luY2Ugd2Ugd2FudCB0byBmb2xsb3cgdS1ib290IHN3
aXRjaCB0byBiaW5tYW4sIGFkZCBtb3JlIFRJIEszIFNvQyBzdXBwb3J0IGFuZAprZWVwaW5nIGV4
aXNpbmcgYW02MnggYW5zIGFtNjR4IHdvcmtpbmcgaW4gR1Agb3IgSFMvSFMtRlMuCgpNeSBtYWlu
IGNvbmNlcm4gaXMgdG8gYXZvaWQgYWRkaW5nIGEgbmV3IHBhY2thZ2UgZm9yIGEgdG9vbCB0aGF0
IGlzIGFscmVhZHkKZGVwcmVjYXRlZCB0aS1rMy1pbWFnZS1nZW4gKG5vdCBzdXJlIGlmIHRpLWsz
LWNvcmUtc2VjZGV2IGlzIHJlYWxseSBkZXByZWNhdGVkKSBbMV0uCgpBbHNvIHRoZSB0b3BpYyBp
cyBub3Qgb25seSAiQU02MngtU0sgSFMtRlMgZGV2aWNlcyIgYnV0ICJUSSBLMyBIUy1GUyBkZXZp
Y2VzIi4KClsxXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDI0LUZlYnJ1YXJ5LzY4NTgyMC5odG1sCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBEYXJp
byBCaW5hY2NoaSAoMjApOgo+ICAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6IGZpeCBC
UjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNCj4gICAgIHNldHRpbmcKPiAgIGNvbmZpZ3MvdGlf
YW02NHhfc2tfZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STQo+ICAg
ICBzZXR0aW5nCj4gICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogZXhwbGljaXRseSBz
ZXQgdGhlIHRpLWszLXI1LWxvYWRlcgo+ICAgICB2ZXJzaW9uCj4gICBjb25maWdzL3RpX2FtNjR4
X3NrX2RlZmNvbmZpZzogZXhwbGljaXRseSBzZXQgdGhlIHRpLWszLXI1LWxvYWRlcgo+ICAgICB2
ZXJzaW9uCj4gICBib290L3RpLWszLXI1LWxvYWRlcjogYnVtcCB0byB2ZXJzaW9uIDIwMjQuMDEK
PiAgIGJvb3QvdGktazMtY29yZS1zZWNkZXY6IG5ldyBwYWNrYWdlCj4gICBib290L3RpLWszLWlt
YWdlLWdlbjogbWFuYWdlIEhTIGhhcmR3YXJlCj4gICBwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1h
OiBhZGQgaG9zdCB2YXJpYW50Cj4gICBwYWNrYWdlL3B5dGhvbi1hdHRyczogYWRkIGhvc3QgdmFy
aWFudAo+ICAgcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmc6IGFkZCBob3N0IHZhcmlhbnQKPiAg
IHBhY2thZ2UvcHl0aG9uLXJwZHMtcHk6IGFkZCBob3N0IHZhcmlhbnQKPiAgIHBhY2thZ2UvcHl0
aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnM6IGFkZCBob3N0IHZhcmlhbnQKPiAgIGJvb3Qv
dGktazMtcjUtbG9hZGVyOiBzZXQgYmlubWFuIGVudmlyb25tZW50Cj4gICBib290L3Vib290OiBz
ZXQgQklOTUFOX0lORElSUyBmb3IgVEkgSzMgRE0KPiAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVm
Y29uZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKPiAgIGNvbmZpZ3MvdGlfYW02
Mnhfc2tfZGVmY29uZmlnOiBidW1wIExpbnV4IHZlcnNpb24gdG8gNi42LjEKPiAgIGJvb3Q6IG1v
dmUgdGktazMtKiBwYWNrYWdlcyB0byAndGktazMnIGRpcmVjdG9yeQo+ICAgYm9vdC90aS1rMzog
bW92ZSBUSV9LM197U0VDVFlQRSxTT0N9IG91dCBvZiB0aGUgaW1hZ2UtZ2VuIHNjb3BlCj4gICBi
b290L3RpLWszL3RpLWszLXI1LWxvYWRlcjogaW5zdGFsbCB0aWJvb3QzLmJpbgo+ICAgY29uZmln
cy90aV9hbTYyeF9za19kZWZjb25maWc6IGRvbid0IHVzZSB0aS1rMy1pbWFnZS1nZW4gYW55bW9y
ZQo+IAo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4gIGJvYXJkL3RpL2FtNjJ4LXNrL2dlbmltYWdlLmNmZyAgICAgICAgICAgICAgICB8ICA3
ICstCj4gIGJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2ggICAgICAgICAgICAgICB8IDQ5
ICsrKysrKysrKysrKwo+ICBib2FyZC90aS9hbTYyeC1zay9wb3N0LWltYWdlLnNoICAgICAgICAg
ICAgICAgfCAgNSArKwo+ICBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQo+ICBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4gICAgICAgICAg
ICAgICAgfCA3NyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGJvb3QvdGktazMvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDU5ICsrKysrKysrKysrKysrCj4gIGJvb3QvdGktazMv
Y29tbW9uLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgLi4uL3sgPT4gdGkt
azN9L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluIHwgIDAKPiAgLi4uL3RpLWszLWJvb3Qt
ZmlybXdhcmUuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDAKPiAgLi4uL3RpLWszLWJvb3QtZmly
bXdhcmUubWsgICAgICAgICAgICAgICAgICAgIHwgIDAKPiAgYm9vdC90aS1rMy90aS1rMy1jb3Jl
LXNlY2Rldi9Db25maWcuaW4gICAgICAgIHwgIDkgKysrCj4gIC4uLi90aS1rMy1jb3JlLXNlY2Rl
di90aS1rMy1jb3JlLXNlY2Rldi5oYXNoICB8ICAzICsKPiAgLi4uL3RpLWszLWNvcmUtc2VjZGV2
L3RpLWszLWNvcmUtc2VjZGV2Lm1rICAgIHwgMjIgKysrKysrCj4gIGJvb3QvdGktazMvdGktazMt
aW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICB8IDI1ICsrKysrKwo+ICAuLi4vdGktazMtaW1h
Z2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoICAgICAgfCAgMAo+ICAuLi4vdGktazMtaW1hZ2Ut
Z2VuL3RpLWszLWltYWdlLWdlbi5tayAgICAgICAgfCAyMCArKysrLQo+ICBib290L3sgPT4gdGkt
azN9L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgfCAgNCArLQo+ICAuLi4vdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoICAgICAgfCAgMiArLQo+ICAuLi4vdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayAgICAgICAgfCAxNiArKystCj4gIGJvb3QvdWJvb3Qv
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICstCj4gIGJvb3QvdWJvb3Qv
dWJvb3QubWsgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGNvbmZpZ3MvdGlf
YW02Mnhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICAgICB8IDIzICsrKy0tLQo+ICBjb25maWdz
L3RpX2FtNjR4X3NrX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgfCAgOCArLQo+ICBwYWNrYWdl
L3B5dGhvbi1hdHRycy9weXRob24tYXR0cnMubWsgICAgICAgICAgfCAgNiArKwo+ICAuLi4vcHl0
aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMubWsgICAgICAgfCAgNSArKwo+ICAuLi4vcHl0
aG9uLWpzb25zY2hlbWEvcHl0aG9uLWpzb25zY2hlbWEubWsgICAgfCAgNiArKwo+ICAuLi4vcHl0
aG9uLXJlZmVyZW5jaW5nL3B5dGhvbi1yZWZlcmVuY2luZy5tayAgfCAgNSArKwo+ICBwYWNrYWdl
L3B5dGhvbi1ycGRzLXB5L3B5dGhvbi1ycGRzLXB5Lm1rICAgICAgfCAgMSArCj4gIDI5IGZpbGVz
IGNoYW5nZWQsIDI2MyBpbnNlcnRpb25zKCspLCAxMDUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBt
b2RlIDEwMDc1NSBib2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoCj4gIGNyZWF0ZSBtb2Rl
IDEwMDc1NSBib2FyZC90aS9hbTYyeC1zay9wb3N0LWltYWdlLnNoCj4gIGRlbGV0ZSBtb2RlIDEw
MDY0NCBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvb3QvdGktazMvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszL2Nv
bW1vbi5tawo+ICByZW5hbWUgYm9vdC97ID0+IHRpLWszfS90aS1rMy1ib290LWZpcm13YXJlL0Nv
bmZpZy5pbiAoMTAwJSkKPiAgcmVuYW1lIGJvb3QveyA9PiB0aS1rM30vdGktazMtYm9vdC1maXJt
d2FyZS90aS1rMy1ib290LWZpcm13YXJlLmhhc2ggKDEwMCUpCj4gIHJlbmFtZSBib290L3sgPT4g
dGktazN9L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tayAoMTAwJSkK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMvdGktazMtY29yZS1zZWNkZXYvQ29uZmln
LmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszL3RpLWszLWNvcmUtc2VjZGV2L3Rp
LWszLWNvcmUtc2VjZGV2Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMvdGkt
azMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYubWsKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvb3QvdGktazMvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgo+ICByZW5hbWUgYm9vdC97ID0+
IHRpLWszfS90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2ggKDEwMCUpCj4gIHJl
bmFtZSBib290L3sgPT4gdGktazN9L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsg
KDY3JSkKPiAgcmVuYW1lIGJvb3QveyA9PiB0aS1rM30vdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
biAoOTclKQo+ICByZW5hbWUgYm9vdC97ID0+IHRpLWszfS90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLmhhc2ggKDU0JSkKPiAgcmVuYW1lIGJvb3QveyA9PiB0aS1rM30vdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayAoODUlKQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
