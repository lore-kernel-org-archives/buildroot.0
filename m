Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A300E87851
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECE86087F;
	Tue,  3 Feb 2026 17:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgUSpEXtYCTY; Tue,  3 Feb 2026 17:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A07605DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770141059;
	bh=ACKdv1cvoFuwbcnnwl9OJc1FliTdmYN4bTSkeEmanDY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kLCKeVWzVPIIjKepPEP+RinWeKLtm5ugyVkd1cJD4V9rvgUjP2b5ciYiwjxCwWolG
	 whbLjtSpzmv7yJ2v8EfJ1EjO3zkHk3sOsarkFhHEVUjMI1qIcgnqK0ZRZLCeKkJGGV
	 qVGi6mK3jvjE+XKYk/K1eoP95i+tWW/+KDlbynu3aTWxfxEJ43tSMIEOQL3zAKayBf
	 VOk7bspjgsXboXor2/QwdjAiuvmNYc5PuVUDN5CxKTYnR2eaA08qruXM8apVtAxY4v
	 kCS+8I3iTrZqruypsZ+6wqlOPTT6BWHdo4+L7y+mm8bOVzfSG93lNpTgl1pvhU7vwD
	 BZtJNXKX7FbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A07605DD;
	Tue,  3 Feb 2026 17:50:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2975F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E8A540377
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s8SyNt3iLaT for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 025EB40205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025EB40205
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 025EB40205
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:50:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43246af170aso53582f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 09:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770141051; x=1770745851;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l344GKtdc6HuZ2HuwSaSh6TgQ/ownuGX16XWn52CXaU=;
 b=UHhDncg+sqQYnLzn67XIWUlIX7pJFeCnCQG9etLvCoi0a3GNTL3wYU9DHdRGE2SfG5
 EJJj2TkFTRsKbMcBzbL6Z8o1NgmNb6wxAJD4ihsl4cQG6LSuiOIAhpneE6dB568Eh3H0
 lKWh38BdHlnE2LfyBOPQRgAucILh9QXpNOgr8QkpIcO3OlyGHhpjMB/OPOUL8auHXA+T
 kIHqYFjgiPGBxq70oHD3UwylT1EJ5IVIzqLSWmufddwTojAMCl229VS6J7jsV9B8BlSr
 QEBkBiSgWburp9Q7XSU5O96nV2K/uQCsmmc7wGPOMkV/fNh+C2lktI6iNc4NqK6fb3Fh
 fI0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvC+zP4oS3bo8SefAK9p6m0I+0vAMOkUrVClPTnxDh61kaWmgg4yHh0HQlMgWc5ZIQseOI6+SkfIw=@buildroot.org
X-Gm-Message-State: AOJu0YyNP3/7Jen2J8qHT/OXYZZXlKDBA1aRDAFehURx2SAziANJAF8w
 e20QT2DAUtmIl4Cr32Uo/xWgPaXz2x+AtZdpDrZZUUQL5VPw26EnB3M/WUiawmUZ1+I=
X-Gm-Gg: AZuq6aIHLVCppDBlPoUap+K2NSyDActoHMp9dH8Y5BBB7DqO/onN7wks6tdVjj7GxdH
 ouij5DFirAqeAmeIyOZsg9toQKVtuTXqKq5riR/sYsFJ1Vn1plUwxAfbdtPaVsVJPz+SFY2oWJV
 0op+SkBfTnUY8w8X7H3JUR9C58PtEZAM6xkpIql++ufYM018kt9tr3hvBYbjTYPK8jTNOCJUYin
 Hui6Q4wIX8B6lhkgWgRbHUcM3kfqRuPvMDQJptn2OHwxNMh3vWZPrpg7qOluztcR7xgaNt8bO3l
 sa/FePvr9iu2crlYUKBiK729RLzFLYkRa7iiH+LwHTdGeqifTyu5arg3lEZYDt7j4dSCpiX24/i
 bVP1Jf3W+4vJc+VA5pC8psL2VZQRYe8sOXkrzsLPQoBynbXZ7wTl/wXX+Sjlzb/bkT08XlYRiYE
 vu8MT0Gi6tSlmcjVn3UL1rgHBSk2MLhsELZs8IuhhzZsO7AF5txtjC
X-Received: by 2002:a05:6000:1849:b0:430:fdc8:8bd6 with SMTP id
 ffacd0b85a97d-43617c974b7mr399989f8f.31.1770141050803; 
 Tue, 03 Feb 2026 09:50:50 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618057f93sm248602f8f.24.2026.02.03.09.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 09:50:50 -0800 (PST)
Message-ID: <dc38e220-92ea-4cd7-a178-2792ebc289a6@smile.fr>
Date: Tue, 3 Feb 2026 18:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: bernd@kuhls.net, romain.naour@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com
References: <20251226101445.2b29f439@windsurf>
 <20260103084002.2045193-1-thomas@devoogdt.com>
 <20260103084002.2045193-2-thomas@devoogdt.com>
Content-Language: fr, en-US
In-Reply-To: <20260103084002.2045193-2-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770141051; x=1770745851; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l344GKtdc6HuZ2HuwSaSh6TgQ/ownuGX16XWn52CXaU=;
 b=rpMW/1oeAcRUTSShuaAcqEYDZjgE8ocVD6tS6dMSZiq9Y7i6jpuPhsdVwqxOrC8wtA
 VEkPasPK12VDI/e6dljagLAt5bnc+iqWrTqrzaOymNksF3X/CUywcG40ht020EDIlIWt
 Wvei86imaTpFBpz4VZPc3EDEVQiiydSX7bOzo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rpMW/1oe
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mesa3d: fix compilation with
 host-llvm enabled
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwMy8wMS8yMDI2IMOgIDA5OjQwLCBUaG9tYXMgRGV2b29n
ZHQgYSDDqWNyaXTCoDoKPiBGcm9tOiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBi
YXJjby5jb20+Cj4gCj4gTWVzb24ncyBjdXN0b20gTExWTSBwYXJzZXIgdXNlcyBsbHZtLWNvbmZp
ZyB3aXRoIGEgZGVmYXVsdCBzZWFyY2ggcGF0aCBvZgo+IC91c3IvYmluLCBjYXVzaW5nIGl0IHRv
IGRldGVjdCB0aGUgaG9zdCBzeXN0ZW0ncyBsbHZtLWNvbmZpZyAodmVyc2lvbiAxOC4xLjMpCj4g
aW5zdGVhZCBvZiB0aGUgYnVpbGRyb290LWNvbXBpbGVkIG9uZS4gVGhpcyBmb3JjZXMgYWxsIExM
Vk0tcmVsYXRlZCBwYWNrYWdlcyB0bwo+IG1hdGNoIHZlcnNpb24gMTguMS4zLCBidXQgc2luY2Ug
dGhlIGhvc3Qgc3lzdGVtIGxhY2tzIGxsdm1zcGlydmxpYiwgdGhlIGJ1aWxkCj4gZmFpbHMuIFRo
aXMgcGF0Y2ggZm9yY2VzIE1lc29uIHRvIHVzZSB0aGUgYnVpbGRyb290LWNvbXBpbGVkIGxsdm0t
Y29uZmlnLgo+IAo+IE5vdGUgdGhhdCBMTFZNX0NPTkZJRyBpcyBhIENNYWtlIG9wdGlvbiwgbm90
IGEgTWVzb24gb25lLiBUaGlzIGlzIGJlY2F1c2UKPiBNZXNvbiBoYXMgY3VzdG9tIGRlcGVuZGVu
Y3kgcmVzb2x1dGlvbiBsb2dpYyBmb3IgTExWTSAoc2VlCj4gaHR0cHM6Ly9tZXNvbmJ1aWxkLmNv
bS9EZXBlbmRlbmNpZXMuaHRtbCNsbHZtKS4gVGhlIEVYVFJBX0JJTkFSSUVTIG1lY2hhbmlzbQo+
IGNhbm5vdCBiZSB1c2VkIGhlcmUsIGFzIGl0IG9ubHkgYXBwbGllcyB0byBjcm9zcy1jb21waWxh
dGlvbiBzY2VuYXJpb3MsIHdoaWNoCj4gZG9lcyBub3QgYXBwbHkgdG8gaG9zdC1tZXNhM2QgYnVp
bGRzLgo+IAo+IEZpeGVzOgo+IAo+ICAgbGx2bS1jb25maWcgZm91bmQ6IFlFUyAoL3Vzci9iaW4v
bGx2bS1jb25maWctMTgpIDE4LjEuMwoKbGx2bS1jb25maWcgaXMgaW5zdGFsbGVkIG9uIG15IGhv
c3QKCiQgd2hpY2ggbGx2bS1jb25maWcKL3Vzci9iaW4vbGx2bS1jb25maWcKCiQgbGx2bS1jb25m
aWcgLS12ZXJzaW9uCjE5LjEuNwoKQnV0IGJ1aWxkaW5nIGhvc3QtbWVzYTNkIGlzIGFibGUgdG8g
ZmluZCB0aGUgb25lIGJ1aWx0IGJ5IEJ1aWxkcm9vdCBhbmQKaW5zdGFsbGVkIGluIEhPU1RfRElS
OgoKbGx2bS1jb25maWcgZm91bmQ6IFlFUyAoWy4uLl0vaG9zdC9iaW4vbGx2bS1jb25maWcpIDIx
LjEuOAoKPiAgIFJ1bi10aW1lIGRlcGVuZGVuY3kgTExWTSAobW9kdWxlczogYml0d3JpdGVyLCBj
b3JlLCBjb3ZlcmFnZSwgZW5naW5lLCBleGVjdXRpb25lbmdpbmUsIGluc3Rjb21iaW5lLCBpcnJl
YWRlciwgbGliZHJpdmVyLCBsaW5rZXIsIGx0bywgbWNkaXNhc3NlbWJsZXIsIG1jaml0LCBuYXRp
dmUsIG9wdGlvbiwgc2NhbGFyb3B0cywgdGFyZ2V0LCB0cmFuc2Zvcm11dGlscywgYWxsLXRhcmdl
dHMsIGNvcm91dGluZXMsIGZyb250ZW5kZHJpdmVyLCBmcm9udGVuZGhsc2wsIGx0bywgd2luZG93
c2RyaXZlcikgZm91bmQ6IFlFUyAxOC4xLjMKPiAgIERlcGVuZGVuY3kgTExWTVNQSVJWTGliIGZv
dW5kOiBOTy4gRm91bmQgMTUuMC4wLjAgYnV0IG5lZWQ6ICc+PSAxOC4xJyA7IG1hdGNoZWQ6ICc+
PSAxNS4wLjAuMCcsICc8IDE4LjInCj4gICBSdW4tdGltZSBkZXBlbmRlbmN5IGxsdm1zcGlydmxp
YiBmb3VuZDogTk8gKHRyaWVkIGNtYWtlKQo+IAo+ICAgb3V0cHV0L2J1aWxkL2hvc3QtbWVzYTNk
LTI1LjAuNi9tZXNvbi5idWlsZDoxODgyOjIxOiBFUlJPUjogRGVwZW5kZW5jeSBsb29rdXAgZm9y
IExMVk1TUElSVkxpYiB3aXRoIG1ldGhvZCAncGtnY29uZmlnJyBmYWlsZWQ6IEludmFsaWQgdmVy
c2lvbiwgbmVlZCAnTExWTVNQSVJWTGliJyBbJz49IDE4LjEnXSBmb3VuZCAnMTUuMC4wLjAnLgoK
aXMgdGhpcyBpc3N1ZSBzcGVjaWZpYyB0byB0aGlzIG1lc2EzZCB2ZXJzaW9uICgyNS4wLjYpID8K
CldlIGFyZSB1c2luZyBtZXNhM2QgMjUuMy40IGFscmVhZHkuCgo+IAo+ICAgQSBmdWxsIGxvZyBj
YW4gYmUgZm91bmQgYXQgL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1t
ZXNhM2QtMjUuMC42L2J1aWxkcm9vdC1idWlsZC9tZXNvbi1sb2dzL21lc29uLWxvZy50eHQKPiAg
IG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyNjM6IC9ob21lL3Rob21hcy9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtbWVzYTNkLTI1LjAuNi8uc3RhbXBfY29uZmlndXJl
ZF0gRXJyb3IgMQo+ICAgbWFrZTogKioqIFtNYWtlZmlsZTo4MzogX2FsbF0gRXJyb3IgMgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNv
bT4KPiAtLS0KPiB2MjogTW92ZWQgcGF0Y2ggdG8gdGhlIGdlbmVyaWMgaG9zdC1tZXNhM2Qgc2Vj
dGlvbi4KPiAgICAgQWxzbyB1cGRhdGVkIHRoZSBnaXQgbWVzc2FnZSB3cnQgTExWTV9DT05GSUcg
b3B0aW9uLgo+IC0tLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAzICsrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tayBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IGluZGV4IDA5YjA5ODYy
OGFiLi5kYTM4MGIzYjM4OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsK
PiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBAQCAtMjkyLDYgKzI5Miw5IEBAIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfSU1BR0lOQVRJT04pLHkpCj4g
IEhPU1RfTUVTQTNEX1RPT0xTICs9IGltYWdpbmF0aW9uCj4gIGVuZGlmCj4gIAo+ICtIT1NUX01F
U0EzRF9DT05GX0VOViA9IFwKPiArCUxMVk1fQ09ORklHPSIkKEhPU1RfRElSKS9iaW4vbGx2bS1j
b25maWciCgpPdGhlcndpc2UgbG9va3Mgb2sgZm9yIG1lLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+ICsKPiAgSE9TVF9NRVNBM0RfQ09ORl9PUFRTID0gXAo+ICAJLURnbHZuZD1kaXNhYmxlZCBc
Cj4gIAktRGdhbGxpdW0tZHJpdmVycz0kKHN1YnN0ICQoc3BhY2UpLCQoY29tbWEpLCQoSE9TVF9N
RVNBM0RfR0FMTElVTV9EUklWRVJTLXkpKSBcCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
