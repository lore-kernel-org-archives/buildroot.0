Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215BACCF9FE
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 15:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91B284588;
	Fri, 31 Oct 2025 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtUriYgU1raW; Fri, 31 Oct 2025 15:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0C284568
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0C284568;
	Fri, 31 Oct 2025 15:00:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D1E2A3
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8AC661731
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1kQA0djTQYz for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 15:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51E316172F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E316172F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51E316172F
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:00:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47719ad0c7dso20960625e9.0
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 08:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761922814; x=1762527614;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1NaZx5V0oOPBkXEnV7pAYnPdwSGP/T4alwPF6Opv5M=;
 b=JpkP6CYU3ZJVjNVg5W4+xCOGQe79Uh9W2GlAo8e/yHlow6PnW/7Mo1/ODXgxOJR8hZ
 GItr+BadY4tdLylHk+NwcejQcKYXK0sKH7OtRS1c6O2hAe3fIFeCVC6KLtGRHkwTnyAo
 QkvOWp3J26t67bv1WTylJG1bYRiqySED/Ku/UJIEx6/HPFPRcK+jiiwBiarwhrSI3Rry
 lz5ardXR8myj7siEMSla6Gq9GcrqZIpTG9IfTEV5+NnOrLFXbYMg+KO8IkGfOQxcUp49
 Z5bDZHDkeb4cIg0NrIqzxi6Yw3ZyQHz5NojgKo6giGFn1mNCiauuoONyO+cnpLtVR+Zx
 HZCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhnAx4It55T6T39jKoTouvgtpWN+e9uRwPlcpcGKkeiWGKWqG3HVDSpN5Qtb0q7mMu64yQBeoly4g=@buildroot.org
X-Gm-Message-State: AOJu0YzKmtybhq7kB6Gib1ELOwziya7DJtgV6JtFmNje7VgrLpLrkwKq
 QYPVMNvt/BRyNdxccL0PXKge55Z/VoD7vr7qgledibeEDtVE4RpWU5oDHTL9mDZnMko=
X-Gm-Gg: ASbGncuW/IEfj+aaUasaarA+uCvhgdslwIb/1EQqB0kcj44aiw10LSmiJpqPWvMuUJj
 ilDs51Then+voU2gi9BVquLZIT/GuJTRGS3GApuVS9o9KKH5LCwSeZQLwqyJ03w9IRBMrfEXiGo
 0+qTuaZDAm36JzWfvCaeDrz1W0SgNfzFXopft0vE8RqjhHGjWshBfl0x/LXDGTQKxol/uFLtznP
 9sD2x9TFUHmIm/D//bAtGxYJsjMlYjvp60UY9erAbsH8qq4KEkG41ad7+vlqzSz4nwEp4a1hBj6
 Sac69vtswPOMrI3TyzBMhHoqWdZf0lbAPx6YgL9OqbN1NpcE10yDHMJ1GFKJuCrmJJAcT2kcIi+
 oQDsCb3MRsGFtrW5F9Ivz3XkOr9hy6deN51aVljV7edS6l5w3KvjGSpSXbqiHrB57grfwfeuel0
 mnDNZ38qe4d8rRoaNP95Tb7XRDM8cX7+owwmXV+ANpM3f/NOAcRA==
X-Google-Smtp-Source: AGHT+IHVzO0BkjrI3lBzh3/17erN/+h8icbLVr1dqIMe4/xFQ0ljuysSxLkiRtS4tNjjmnowM5wigg==
X-Received: by 2002:a05:600c:4f0b:b0:46e:4783:1a7a with SMTP id
 5b1f17b1804b1-47730793c43mr37560675e9.3.1761922813555; 
 Fri, 31 Oct 2025 08:00:13 -0700 (PDT)
Received: from [192.168.4.20] (77.109.92.202.static.edpnet.net.
 [77.109.92.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394f0csm1665645e9.16.2025.10.31.08.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 08:00:12 -0700 (PDT)
Message-ID: <8cc5e53c-edaf-4fc6-806e-e834e12190a2@mind.be>
Date: Fri, 31 Oct 2025 16:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Baruch Siach <baruch@tkos.co.il>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be> <87ldmjesxl.fsf@tarshish>
 <DDWEX0A8U40C.1J7DHEPBK82OY@bootlin.com>
Content-Language: en-US
In-Reply-To: <DDWEX0A8U40C.1J7DHEPBK82OY@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761922814; x=1762527614; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M1NaZx5V0oOPBkXEnV7pAYnPdwSGP/T4alwPF6Opv5M=;
 b=Wiq1yWHNZpP0epymz8MwgJ3fnKbN3H/QKoA+PvmZk0QQyYM26dDy9I3SW3MGBgjO2V
 PhjRwVsA2fKWk09Lv6yEcsnOUov7hjK2jLNqjOkhNUqXnxoflPLK0dNbTD3ebl8MC7rM
 bv6MigKyBnikA5JHIkC010EC7DHfcEv7agPuBl64jdUbUhyw1POKC3leiTsE4Uk5cDWF
 mL8NT8NvKJxaUwkbZ2pzPRLkpbtk3b9oK6Mc8YRjNXCQJ6e2V1PauJc7VG4TQpsj5mdn
 abav67mgvgsCbXPSlkro5J/z1fj6NwhLMlMN7y0GXvfqlUTZwtr+hYPilGbV7CgUtk9J
 uCIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Wiq1yWHN
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGlzLAoKT24gMTAvMzEvMjUgMTA6NTAgQU0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToK
PiBIZWxsbywKPgo+IE9uIEZyaSBTZXAgMTIsIDIwMjUgYXQgMjo1MCBQTSBDRVNULCBCYXJ1Y2gg
U2lhY2ggdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gSGkgVGhvbWFzLAo+Pgo+PiBPbiBUaHUsIFNl
cCAxMSAyMDI1LCBUaG9tYXMgUGVyYWxlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+PiBJbiByZXBs
eSBvZjoKPj4+PiBBcHBseSBhIHBhdGNoIGZyb20gbWV0YS1vcGVuZW1iZWRkZWQgZml4aW5nIGEg
Y3Jvc3MtYnVpbGQgaXNzdWUgWzFdLgo+Pj4+Cj4+Pj4gWzFdCj4+Pj4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5lbWJlZGRlZC9tZXRhLW9wZW5lbWJlZGRlZC9ibG9iL3dhbG5hc2Nhci9tZXRhLW9l
L3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lMy9wYXJhbGxlbGlzbS5wYXRjaAo+Pj4+
Cj4+Pj4gRml4ZXM6Cj4+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy8xMTE3Njc3NDQwNSAoVGVzdElvem9uZSkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Pj4gQXBwbGllZCB0byAy
MDI1LjAyLnggJiAyMDI1LjA1LnguIFRoYW5rcwo+PiBOb3QgaW4gMjAyNS4wMi54IG9yIDIwMjUu
MDUueCBhcyBvZiBhNGFjNDJmNGU3YTc0ICgiUmV2ZXJ0Cj4+ICJwYWNrYWdlL2ZpcmV3YWxsZDog
YWRkIG1pc3NpbmcgbmZ0YWJsZXMganNvbiBydW50aW1lIGRlcGVuZGVuY3kiIikgYW5kCj4+IDAy
ZjRkNjJiYmY5NSAoInBhY2thZ2UvcHl0aG9uMzogZG8gYnVpbGQtdGltZSBkZXRlY3Rpb24gb2Yg
bm9uLXdvcmtpbmcKPj4gdG9vbGNoYWluIiksIHJlc3BlY3RpdmVseS4KPiBJIHdhcyBpbnZlc3Rp
Z2F0aW5nIGEgYnVpbGQgZmFpbHVyZSBvbiB0aGUgaW96b25lIHBhY2thZ2Ugb24gYnVpbGRyb290
Cj4gMjAyNS4wMi54LCBhbmQgZXZlbnR1YWxseSBmb3VuZCB0aGlzIHNlcmllcyB3aGljaCBpbmRl
ZWQgZml4ZXMgdGhlIGlzc3Vlcwo+IG9ic2VydmVkIGxvY2FsbHkuIEFzIEJhcnVjaCBzdGF0ZWQs
IGl0IGRvZXMgbm90IHNlZW0gdG8gYmUgYXBwbGllZCBvbgo+IDIwMjUuMDIueCwgZGVzcGl0ZSBU
aG9tYXMncyBub3RpZmljYXRpb24uCj4KPiBBbnkgcGxhbiB0byBldmVudHVhbGx5IGFwcGx5IGl0
IG9uIDIwMjUuMDIueCA/Cj4KPiBUaGFua3MsCj4KPiBBbGV4aXMKCkFyZSB5b3UgdGFsa2luZyBh
Ym91dCB0aGUgcGFyYWxsZWxpc20gaXNzdWUgPyBXZSBkaWRuJ3QgZW5kZWQgdXAgcGlja2luZyAK
aXQgYmVjYXVzZSB0aGUgZml4IGNhbWUgYWZ0ZXIgdGhlIHZlcnNpb24gYnVtcCB3aGljaCBjb3Vs
ZCBpbXBseSB0aGlzIAplcnJvciBvbmx5IGhhcHBlbnMgYWZ0ZXIgdGhlIHZlcnNpb24gYnVtcC4K
CkZvciB0aGUgYnVtcCBhbmQgdGhlIGdjYyBmaXhlcywgaWYgaSByZW1lbWJlciBjb3JyZWN0bHkg
SSB0cmllZCB0byBidWlsZCAKaXQgbG9jYWxseSBhbmQgaXQgZGlkbid0IGZhaWwuIFNpbmNlIHRo
ZSBjb21taXQgbWVzc2FnZSB3YXMgbm90IHNwZWNpZmljIAplbm91Z2ggYWJvdXQgdGhlIGVycm9y
IEkgZGlkbid0IGluY2x1ZGUgaXQuIEJ1dCBJIG1heSBoYXZlIGRvbmUgCnNvbWV0aGluZyB3cm9u
Zy4KCldoYXQncyB0aGUgZXJyb3IgeW91IGFyZSBydW5uaW5nIGludG8gPyBUaGUgYnVtcCBsb29r
cyB0byBiZSBzbWFsbCBzbyB3ZSAKbWlnaHQgaW5jbHVkZSBpdCBhcyB3ZWxsIG5leHQgd2Vlay4K
ClRoYW5rcyBmb3IgdGhlIG1lc3NhZ2UsClBFUkFMRSBUaG9tYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
