Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2CDC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 23:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1847640A89;
	Sat,  2 Mar 2024 23:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5l-KiWb0ioZ; Sat,  2 Mar 2024 23:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FD3040A7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD3040A7B;
	Sat,  2 Mar 2024 23:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 062611BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 23:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7875608A8
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 23:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT4V3eNTVqc2 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 23:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6139360863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6139360863
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6139360863
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 23:03:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412de14d3b2so131775e9.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 15:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709420605; x=1710025405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4H3SI834bF/gfP7+44VzdhDPVBhdmiaCDvHIKsne3UE=;
 b=EKDvWiaHTE4s4ZF+k1Z1E2pfwOwNBVIlOeYr0d7yE2aVQ6wDR2RVCd/eBNhSP6hPSv
 noDNeBECizT2JuEoef6qbOpnYQKdIaasBgv0CbBycdGH+foloiQKRSB4sEPbG4O5qCgQ
 0GEchn6P3VEqN36E2Z+8GPBDoMNGhm/ksMgD2mclrA/+K8C3PXi1Gy6TzKAr9/SMO2LL
 NMUlro/TqjcFDe6lktd7TAuSi3RS1K1b9M9Q5eOotz6NrMKLQ71mBptv2zm/ZaJP6QJ0
 BZsmd/mukWxvv4EIsSPCAFXyCHGXlAyR9FCr1rKDRfpQud2JWQYs5rQ4g9nsgpUYTk+7
 RZKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAgGqglpD3mL2fgmvi8NDQlX4kg7nhIg3fWipVvotEqOVBfHxKBfRybScdeVtUXvJvDzI/RG8MTQGf316CdHfskn07vbTBIg==
X-Gm-Message-State: AOJu0YwxhZc2I3xT6zi/sZzTvREqWlDD0ullrvpT42AzDx9opEx9mYia
 t2BSIhh6wJVEJcay9r2b/82hOv9RLJ/AkA5lLZWHh+/uI7kYCobJesusaYVuGlk=
X-Google-Smtp-Source: AGHT+IFK8eol//EUUquF6rXpUkSUNeBlMcmY89JiIobcB/bmFNzpLtk9ab7uv3OgT+ZTRPLzXrHvZQ==
X-Received: by 2002:a05:600c:4f83:b0:412:b81f:758b with SMTP id
 n3-20020a05600c4f8300b00412b81f758bmr4233181wmq.16.1709420605261; 
 Sat, 02 Mar 2024 15:03:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b00412b6fbb9c3sm9834289wmq.9.2024.03.02.15.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Mar 2024 15:03:24 -0800 (PST)
Message-ID: <d7921628-c7ad-4de1-b131-dd0b895200c5@smile.fr>
Date: Sun, 3 Mar 2024 00:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709420605; x=1710025405;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4H3SI834bF/gfP7+44VzdhDPVBhdmiaCDvHIKsne3UE=;
 b=NGlMD+EP9dMoMLGEVmC1miL1NYwE7gnuzZ+VvOp1KT61r61CgTJ1huOSzix7zwdQER
 PWE8xVCrpFVc57S7qVjHZvsfAfogdyELBSyR5U6O+z+zOM2cSJdvjbY3ftnLkOtB9SI8
 vmkgwUzzAbN3wIVxL7BXcaSl9olt63MxdbNk5Vs4RcOPR2p7wU+RG/IRuhQ5c/dN2NAC
 1Itn1vYtE3LFmP7sb3+Mu6LzeZS/u7Fevi2xynBifcfZXg9oy01yBZD4pDaeMGD6oMC0
 6NX1906QkCD8NhquP4UlsIoFF47nzSSDjJXl2zJVy+ky6gbMd43p3ahPeTSq4kvfporr
 7o5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NGlMD+EP
Subject: Re: [Buildroot] [PATCH v8 15/23] boot/ti-k3/ti-k3-r5-loader:
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

SGVsbG8gRGFyaW8sCgpMZSAwMS8wMy8yMDI0IMOgIDE0OjM2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVpbGRp
bmcgdGlib290My5iaW4gdXNpbmcKPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBp
dCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+IAo+IFRoZSB1c2Ugb2YgYGZpbmQnIGNvbW1h
bmQgaXMganVzdGlmaWVkIGJ5IHRoZSBuZWVkIHRvIHVzZSBhIHJlZ2V4Cj4gZXhwcmVzc2lvbiB0
byBzZWxlY3QgdGhlIGNvcnJlY3QgZmlsZS4gVGhpcyBpcyBub3QgcG9zc2libGUgd2l0aCBhCj4g
c2ltcGxlIGBjcCcgY29tbWFuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdl
cyBpbiB2ODoKPiAtIFVzZSB0aGUgYGZpbmQnIGNvbW1hbmQgaW4gcGlwZSB3aXRoIHRoZSBgY3An
IGNvbW1hbmQuCj4gCj4gQ2hhbmdlcyBpbiB2NjoKPiAtIFJlcGxhY2UgYGZpbmQnIGNvbW1hbmQg
d2l0aCBgY3AnIG9uZS4KPiAKPiBDaGFuZ2VzIGluIHY1Ogo+IC0gUmVwbGFjZSB0aWJvb3QzLSot
JChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4gd2l0aAo+ICAgdGlib290My0kKFRJX0sz
X1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4gCj4gQWRk
ZWQgaW4gdjQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5tayB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRl
ci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+IGluZGV4IGZk
YjA1OGYzYjcyYS4uOWEwNWQwMDUwNjdhIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tawo+IEBAIC03MCw4ICs3MCwxMiBAQCBkZWZpbmUgVElfSzNfUjVfTE9BREVS
X0JVSUxEX0NNRFMKPiAgCSQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURF
Ul9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4gIGVuZGVmCj4g
IAo+ICtUSV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FH
RV9USV9LM19TRUNUWVBFKSkKPiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2FsbCBxc3RyaXAs
JChCUjJfUEFDS0FHRV9USV9LM19TT0MpKQo+ICsKPiAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9J
TlNUQUxMX0lNQUdFU19DTURTCj4gIAljcCAkKEBEKS9zcGwvdS1ib290LXNwbC5iaW4gJChCSU5B
UklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gKwljZCAkKEBEKTsgZmluZCAuLyAtdHlwZSBm
IC1yZWdleCAiXC5cL3RpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJX0szX1I1X0xP
QURFUl9TRUNUWVBFKS1bXi1dKi4uYmluIiAtZXhlYyBjcCB7fSAkKEJJTkFSSUVTX0RJUikvdGli
b290My5iaW4gXDsKCkkgYmVsaWV2ZSB0aGVyZSBpcyBtaXNzaW5nIHN0ZXAgaGVyZSBmb3IgdGhl
IEFNNjUgdmFyaWFudCAodXNpbmcgc3BsaXQgYmluYXJ5CmJhc2VkIEJvb3QgRmxvdykgWzFdLgoK
V2l0aCB0aGUgdGktazMtaW1hZ2UtZ2VuIHJlbW92YWwsIHdlIG5lZWQgdG8gY29weSBzeXNmdyou
aXRiIGdlbmVyYXRlZCBieSBiaW5tYW4KKHRpLWszLXI1LWxvYWRlcikgb3RoZXJ3aXNlIHRoZSBz
eXN0ZW0gd29uJ3QgYm9vdC4KClRvbyBiYWQgdGhhdCB3ZSBkb24ndCBoYXZlIGEgQU02NSBkZWZj
b25maWcgZm9yIHRlc3RpbmcuCkFuZHJlYXMsIERvIHlvdSB0aGluayB5b3UgY2FuIGNvbnRyaWJ1
dGUgYSBuZXcgZGVmY29uZmlnIGZvciB0aGUgVE1EWDY1NElES0VWTSA/CgpPbiBteSBzaWRlLCBJ
IGhhdmUgYSBwYXRjaCBzZXJpZXMgZm9yIHRoZSBTSy1UREE0Vk0gdGhhdCBhbHNvIHJlcXVpcmVz
CnN5c2Z3Ki5pdGIgYmluYXJ5LgoKWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1h
aWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1NjY2Lmh0bWwKCkJlc3QgcmVnYXJkcywKUm9t
YWluCgoKPiAgZW5kZWYKPiAgCj4gICQoZXZhbCAkKGtjb25maWctcGFja2FnZSkpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
