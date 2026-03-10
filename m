Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73299FD88C7
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4316F4046C;
	Tue, 10 Mar 2026 22:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKxONOjBqAhj; Tue, 10 Mar 2026 22:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334B54043B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773181918;
	bh=KkXUmf+S55vAXe9fsIcHOK37NaK08JRmynGz0PEV4Gc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L+xGxVUfjEyCK69OSBcVin2aO9rlDb0mnjT6P/XOe0A5l7ZV0kVnpye9x+kDao9Sg
	 L22D9rf6EJ4BZkLoYKJRlKjyXcAUsAiiGzO0TO4SMFXgcItUWmQZEH5s3he6KrXkZC
	 ASrz74GWgWYJLR+yBqPmFmHHRA1xyZhABE6xP80jiygU0GJub0oA9e3E8ba7eEmhAt
	 s/m4rgkcqH7M9yjuuORETrX9kx305LUY9bKORlxpOgKaMGj8RUqw92AdJvubmTnods
	 /L+B2Z0JUmnxocRPN1rPQpIWHNWGGWGMQLDQFbbYaADKJ64Y08gFlKQII/svlgWu5N
	 w7sXSMeftdpkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334B54043B;
	Tue, 10 Mar 2026 22:31:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 955D333A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871BB4043B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5aCs4iv27uC for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 990484040F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990484040F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 990484040F
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:31:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so32493625e9.3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773181914; x=1773786714;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FkEr2nDlAhqCtUSFAuoahuM84OIpuRDTQkXECBPWEdY=;
 b=tYLfw2iT6I+U2YXFgrHzSg7UY/qZDNV+dvwpPx5WWzF+L2TyH/u9fJ2xuZ0Bd+ulOy
 SsNjlMrXJXmgFCNnZSh5J1/sTFHvM88gwpGU1WzxcGCqHbNe8NedCX2MYvBnzf3zhIj8
 Eq/hwVpH2pkrT5w6JWhi63jbNHuYZ6pcgL9wqLokepxe+BzmispBnXnBEf4I6mIBRPDM
 XcRen8s6+9ZX+i/qAMHpYSCSiMAP0HgUvW+7dHRgtI4wGoiTLj3efZIKI/h3XMH0lPlP
 VmSZszZpyul6AsV0/D4oqAmLfKwk2ujIpkA+T5TMIDwb4ZdXPgL8wQUKITd3HBravugJ
 JLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURSCsbcg/Lqc5jrtYXO/Jy63y7CMcRRLZWcN3JOmha0j99fWK/PFuHHUSKeWBMp4VpXtyaLXrLUhE=@buildroot.org
X-Gm-Message-State: AOJu0YxicBm/7XW76LTqZ6o3mke8TDupStbFVyri/0r528CuPnvf0kLV
 3d/oDOFTuHx8Rnqo1MvH1owp2+ROsw7bwm62yq9uXb0cYaAgQf1i0KO4zr/93FSuZIM=
X-Gm-Gg: ATEYQzx/CQSfhddRs2ZvYG4hXXcUdVDaBn9nT+FXi/MOy/EMP8H4CpgcUB3M7pL+z9g
 eLg3zVrwzETQVJkf0+T9ZDekShPbSZ8GSopd6vjRyuU54BvjZpx3Z2AQRS5Wqw9/jMia1gXcfnm
 niUudWhdJb3Yij8RTSx2Pt6Z6hSzaTuYc4X2P/vZYH7OnzZDXuQxGUuPd9TwRJ/NE5OerXWEyg/
 MFmM62R2dUcM9DMXJSutaSP70rdqxfnNHb6NYDKI/o++vVLeaLy0b4PFTSoBlTvCja52XzAFq3S
 ET+PzlXjJjJ1AD5KZq41amFqf0AmZWCUBVfYzifAnmBbrCyCXp7uzqEpKQtLCBptzRzsEP7W9LA
 fb3/VvsmjDT+TUTEdRZkwF8KmR/HvaT/i1ahnKy6kY991OXfaPG0tN3FDI84p8PSzMnvh/Ejh6b
 h1pmFZu0tc623OLaY3Urk7oZnrVBCFFsFvHOWTlR5tHCbj2L/AGvEOG/nHiFRwEdZfOCJWIgooQ
 qV8fAZ4lA/UdPpyuB5dGp/X6PhI0+kTlZvs8TN4BYwvQgQRvjCeJ/Q777bSHMcO2A==
X-Received: by 2002:a05:600c:8209:b0:485:3a93:3aa3 with SMTP id
 5b1f17b1804b1-4854b0c75b8mr7434225e9.12.1773181914512; 
 Tue, 10 Mar 2026 15:31:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f255sm106562575e9.12.2026.03.10.15.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:31:54 -0700 (PDT)
Message-ID: <38c86436-f815-43fc-aa51-65d4dc4c272e@smile.fr>
Date: Tue, 10 Mar 2026 23:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-6-alex.bennee@linaro.org>
Content-Language: fr, en-US
In-Reply-To: <20260225105537.1420002-6-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773181914; x=1773786714; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FkEr2nDlAhqCtUSFAuoahuM84OIpuRDTQkXECBPWEdY=;
 b=wRcQAYSA2VOEx2hq10klfm5tXRbaK9POsN1rG2iwjeVkQwcF/Q6fi7gVJBW+zvzi+O
 7EhKqtn+6BLcPLGK6sIQFsaUntAwOS1iMJBCjO4OLhCMQ0Fpc0XE+Af2iTW6Y+Vq25pc
 tLwFH3tfqguHHmA94f+6VNxOrWTZMzD4+OUwY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wRcQAYSA
Subject: Re: [Buildroot] [PATCH v6 5/6] support/testing: add test for
 kvm-unit-tests
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
w6ljcml0wqA6Cj4gTm93IHdlIGhhdmUgdXBkYXRlZCBrdm0tdW5pdC10ZXN0cyB3ZSBzaG91bGQg
ZGVmZW5kIGl0IHdpdGggYSB0ZXN0LiBUbwo+IHN1cHBvcnQgdGhhdCBlbmFibGUgS1ZNIGluIHRo
ZSBxZW11IGtlcm5lbCBjb25maWcgYW5kIGJvb3QgYW4gaW1hZ2UKPiB3aGVyZSB3ZSBjYW4gcnVu
IHRoZSBiYXNpYyB0ZXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGJvYXJkL3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4
LmNvbmZpZyAgICAgIHwgIDIgKwo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X2t2bS5weSB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9hYXJj
aDY0LXZpcnQvbGludXguY29uZmlnIGIvYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGludXguY29u
ZmlnCj4gaW5kZXggOTcxYjlmY2Y4Ni4uOWQxOTM0YzY0OCAxMDA2NDQKPiAtLS0gYS9ib2FyZC9x
ZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcKPiArKysgYi9ib2FyZC9xZW11L2FhcmNoNjQt
dmlydC9saW51eC5jb25maWcKPiBAQCAtNzQsMyArNzQsNSBAQCBDT05GSUdfVklSVElPX0ZTPXkK
PiAgQ09ORklHX09WRVJMQVlfRlM9eQo+ICBDT05GSUdfVE1QRlM9eQo+ICBDT05GSUdfVE1QRlNf
UE9TSVhfQUNMPXkKPiArQ09ORklHX1ZJUlRVQUxJWkFUSU9OPXkKPiArQ09ORklHX0tWTT15CgpU
aGlzIGNvbmZpZ3VyYXRpb24gZmlsZSBpcyB1c2VkIGJ5IHFlbXVfYWFyY2g2NF92aXJ0X2RlZmNv
bmZpZyB0aGF0IGlzIHVzZWQgZm9yCmJhc2ljIHRlc3Rpbmcgb24gR2l0bGFiLWNpLiBNYXliZSB5
b3UgY291bGQgZW5hYmxlIEtWTSBhbmQgVklSVFVBTElaQVRJT04Kb3B0aW9ucyB1c2luZyBhIGRl
ZmNvbmZpZyBmcmFnbWVudCBpbiBUZXN0S1ZNPwoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X2t2bS5weQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uZGE1ZWJmYjFiNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2t2bS5weQo+IEBAIC0wLDAgKzEsNDcgQEAKPiAraW1wb3J0IG9zCj4g
K2ltcG9ydCBpbmZyYS5iYXNldGVzdAo+ICsKPiArS1ZNX1RJTUVPVVQgPSAxMjAKPiArCj4gKwo+
ICtjbGFzcyBUZXN0S1ZNKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gKyAgICBjb25maWcgPSBc
Cj4gKyAgICAgICAgIiIiCj4gKyAgICAgICAgQlIyX2FhcmNoNjQ9eQo+ICsgICAgICAgIEJSMl9j
b3J0ZXhfYTcyPXkKPiArICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKClRoaXMgc2Vs
ZWN0IHRoZSBBUk0gcHJlYnVpbHQgdG9vbGNoYWluLCB3ZSBub3dhZGF5cyBwcmVmZXIgdXNpbmcg
dGhlIEJvb3RsaW4gb25lLgoKPiArICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNf
VVRJTFNfQ09QWT15Cj4gKyAgICAgICAgQlIyX09QVElNSVpFX1M9eQoKV2h5IGVuYWJsaW5nIC1P
cyBoZXJlIGluc3RlYWQgdXNpbmcgdGhlIGRlZmF1bHQ/Cgo+ICsgICAgICAgIEJSMl9UQVJHRVRf
Uk9PVEZTX0NQSU89eQo+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICsgICAgICAgIEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICsgICAgICAgIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5j
b25maWciCj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15CgpTZWUs
IHlvdSBlbmFibGVkIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eSB0byBzZWxlY3QK
QlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMgd2l0aG91dCBpc3N1ZS4KCj4gKyAgICAgICAgQlIy
X1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFM9eQo+ICsgICAgICAgICMgQlIyX1BBQ0tBR0VfUUVNVV9T
WVNURU1fVENHIGlzIG5vdCBzZXQKPiArICAgICAgICAjIEJSMl9QQUNLQUdFX1FFTVVfQkxPQlMg
aXMgbm90IHNldAo+ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQoKVGhpcyB0ZXN0
IGluc3RhbGwgbWFueSBwYWNrYWdlcyBhbHJlYWR5LCBtYXliZSB5b3Ugc2hvdWxkIGluY3JlYXNl
IHRoZSByb290ZnMKc2l6ZSB3aXRoIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMjU2TSIg
KG1heWJlIG1vcmUpLgoKPiArICAgICAgICAiIiIKPiArCj4gKyAgICBkZWYgdGVzdF9ydW4oc2Vs
Zik6Cj4gKyAgICAgICAga2VybiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2Vz
IiwgIkltYWdlIikKPiArICAgICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwg
ImltYWdlcyIsICJyb290ZnMuZXh0MiIpCj4gKwo+ICsgICAgICAgIHFlbXVfb3B0cyA9IFsiLU0i
LCAidmlydCxnaWMtdmVyc2lvbj0zLHZpcnR1YWxpemF0aW9uPW9uIiwKCklzIGFueSBkZXBlbmRl
bmN5IG9uIFFlbXUgdmVyc2lvbiB1c2VkIGZvciB0aGlzIHRlc3QgPwpCeSBkZWZhdWx0LCB0aGUg
cnVudGltZSB0ZXN0IGluZnJhIHVzZSBxZW11IGluc3RhbGxlZCBvbiB0aGUgaG9zdC4gSXQgY2Fu
IGJlIGEKdmVyeSBvbGQgdmVyc2lvbi4gWW91IGNhbiBmaXggdGhpcyBieSBzZWxlY3RpbmcgaG9z
dC1xZW11IHBhY2thZ2UuCgpCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQpCUjJfUEFDS0FHRV9IT1NU
X1FFTVVfU1lTVEVNX01PREU9eQoKCj4gKyAgICAgICAgICAgICAgICAgICAgICItY3B1IiwgImNv
cnRleC1hNzIiLAo+ICsgICAgICAgICAgICAgICAgICAgICAiLXNtcCIsICIyIiwKPiArICAgICAg
ICAgICAgICAgICAgICAgIi1tIiwgIjUxMk0iLAo+ICsgICAgICAgICAgICAgICAgICAgICAiLWRy
aXZlIiwgZiJmaWxlPXtpbWd9LGlmPXZpcnRpbyxmb3JtYXQ9cmF3IiwgIi1zbmFwc2hvdCJdCj4g
Kwo+ICsgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhYXJjaDY0IiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAga2VybmVsPWtlcm4sCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGtlcm5lbF9jbWRsaW5lPVsicm9vdD0vZGV2L3ZkYSBjb25zb2xlPXR0eUFNQTAiXSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1xZW11X29wdHMpCj4gKwo+ICsg
ICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICsKPiArICAgICAgICAjIFJ1biB0aGUgc2Vs
ZnRlc3RzCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiL3Vzci9zaGFyZS9rdm0tdW5pdC10
ZXN0cy9zZWxmdGVzdC1zZXR1cCIpCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiL3Vzci9z
aGFyZS9rdm0tdW5pdC10ZXN0cy9zZWxmdGVzdC1zbXAiKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0
UnVuT2soIi91c3Ivc2hhcmUva3ZtLXVuaXQtdGVzdHMvc2VsZnRlc3QtdmVjdG9ycy1rZXJuZWwi
KQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIi91c3Ivc2hhcmUva3ZtLXVuaXQtdGVzdHMv
c2VsZnRlc3QtdmVjdG9ycy11c2VyIikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
