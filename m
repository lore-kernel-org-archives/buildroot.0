Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E53D1BDEB
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38A340506;
	Mon,  4 Nov 2024 20:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZunODfYtbhkK; Mon,  4 Nov 2024 20:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 643A0404F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643A0404F6;
	Mon,  4 Nov 2024 20:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2A4B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BAC480EEE
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OncuZTN14tQc for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:11:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DCC880EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCC880EEA
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DCC880EEA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:11:48 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-539f72c913aso7563933e87.1
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 12:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730751106; x=1731355906;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1JXmk6C05tK3z4t+CboZvH11sOdZUKah0KfW6nJhJ0=;
 b=bTfAtvwSFraEkPO23LYaE3/QLTYjr6/M0+WvKQ86jR+PZAuNonN4qhAx+aSD0EJSST
 5ILo7Ps+YDb3UoGKBSx8C7yhQltW4k9a6blN45Fgk2mTyJcPaW6xmm51Q4g4B8IGx/N8
 XnBho4G2l9OSWsdcrpDLX/MBopoP1tl7XRkyGCHB14XSJ3kr2mkiYSUFQK1KmtZFp/Qf
 jc4/ZkO1qh5a69QBlJemkzZu0pjsv23IRfyqCGiBvKoxD+9d2sJ0/R0GTtdmX4BzvX47
 wuEu7BWsiRtjHesJrlVloTm+MJs1Ru6FELd0aFNsga2hfSsicCRXmgdyzU/HMnf9ihXv
 fl6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ3eDfp7aJgM05RLn4AmKJkwUzHS2xmOTCFNJmLy8D7uR+1cen2oOWBwUfp598X7m3byBhrIf/PN0=@buildroot.org
X-Gm-Message-State: AOJu0Yykd3yL6NQ2wriSShdYfCJ58FsOTSa25ea26wVu6nZ9KJh9AVAi
 2p2dSUrQzzLDEvY0RlwCwwxhjnS5L3s0PoltqA8lUk/p5S3EC62gjlzqC63uCjA=
X-Google-Smtp-Source: AGHT+IGBVR6OSU402nlI3ZSbAYTAlrVYPda3QhahmA31dkNa6C1kz7Cy5UfBvjrSR/KVX08bGRJKVg==
X-Received: by 2002:a05:6512:3512:b0:53c:7652:6ca2 with SMTP id
 2adb3069b0e04-53c76527182mr8633760e87.59.1730751105884; 
 Mon, 04 Nov 2024 12:11:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd910902sm197216285e9.14.2024.11.04.12.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 12:11:45 -0800 (PST)
Message-ID: <349dca54-4070-4f4f-b3ab-6f453a2f4aa3@mind.be>
Date: Mon, 4 Nov 2024 21:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20241101180635.1028681-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241101180635.1028681-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730751106; x=1731355906; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T1JXmk6C05tK3z4t+CboZvH11sOdZUKah0KfW6nJhJ0=;
 b=HTxUwDkARFFO6rcyxnwyCleaTOpSYciSyyi6VD1iOzlE9qNTLVe+OxX3UVVd6i4+VR
 HkUcfzIfGqwpaT3efviMULfG9LeqfOpTkqcm3Ch/kWvwNI4XfdAIzq3+LvzUQw2gHmVS
 7QfmnnWb2ceUmDoooh8cv+rzoEAEBWRWp2KXxkNkijQJbvp5Ex1DcZ5RXUkUrb7MohV4
 CyTJF3+EFp2sgwjL2nuWQxNWIi6tTYNhCoAOYAc0K5YvRL94/MPdco5HE1bQhoWd9YPJ
 uKg4Ulylkm9Zb5pOj+7m8Dpb94QDsIR2vs5W3ozMu/9OtnZxAT/MSqmpA2hzfJh9HEMt
 PJ+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HTxUwDkA
Subject: Re: [Buildroot] [PATCH 1/1] package/swig: bump to version 4.3.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBKYW1lcywKCk9uIDAxLzExLzIwMjQgMTk6MDYsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+
IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
Pgo+IC0tLQo+ICAgcGFja2FnZS9zd2lnL3N3aWcuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2Uvc3dp
Zy9zd2lnLm1rICAgfCA0ICsrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N3aWcvc3dpZy5oYXNo
IGIvcGFja2FnZS9zd2lnL3N3aWcuaGFzaAo+IGluZGV4IDIxNTkwYzQyMmEuLjljMWRiY2MyZmMg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zd2lnL3N3aWcuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvc3dp
Zy9zd2lnLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgTG9jYWxseSBjb21wdXRlZDoKPiAt
c2hhMjU2ICAyYWYwOGFjZWQ4ZmNkNjVjZGI1Y2M2MjQyNjc2ODkxNGJlZGM3MzViMWMyNTAzMjUy
MDM3MTZmNzhlMzlhYzliICBzd2lnLTQuMS4xLnRhci5nego+ICtzaGEyNTYgIGY3MjAzZWY3OTZm
NjFhZjk4NmM3MGMwNTgxNjIzNmNiZDBkMzFiN2FhOTYzMWU1YWI1MzAyMGFiNzgwNGFhOWUgIHN3
aWctNC4zLjAudGFyLmd6Cj4gICBzaGEyNTYgIGY1M2FiYWVlZDc3NTAxOGQ1MTlhMWI5NjE1ZjBj
YTE3ODk0NzcyYmQ5Y2EyMWMyYTE1NmJmMzQwYWM0MWMxM2UgIExJQ0VOU0UKPiAgIHNoYTI1NiAg
OGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVl
YjY1YjkwMyAgTElDRU5TRS1HUEwKPiAgIHNoYTI1NiAgN2Y1MGQ5NDIzNzNhODcxMjExYzVlZmVl
MDNmM2RiMmY5ZWZkMWNmZjEwMDJiMGVmOGUzNzQ4YmFhNjExYTVjMiAgTElDRU5TRS1VTklWRVJT
SVRJRVMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zd2lnL3N3aWcubWsgYi9wYWNrYWdlL3N3aWcv
c3dpZy5tawo+IGluZGV4IGFkNTg1YzNmOTcuLjdlODRiZGQ0MzEgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9zd2lnL3N3aWcubWsKPiArKysgYi9wYWNrYWdlL3N3aWcvc3dpZy5tawo+IEBAIC00LDgg
KzQsOCBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1TV0lHX1ZF
UlNJT05fTUFKT1IgPSA0LjEKPiAtU1dJR19WRVJTSU9OID0gJChTV0lHX1ZFUlNJT05fTUFKT1Ip
LjEKPiArU1dJR19WRVJTSU9OX01BSk9SID0gNC4zCj4gK1NXSUdfVkVSU0lPTiA9ICQoU1dJR19W
RVJTSU9OX01BSk9SKS4wCgogIEkndmUgdHJpZWQgYnVpbGRpbmcgbGlic2VsaW51eCBhbmQgcHl0
aG9uLXB5bGliZmR0IGFmdGVyIHRoaXMgYnVtcCwgYW5kIGJvdGggCmdpdmUgbWUgYW4gZXJyb3Ig
bGlrZSB0aGlzOgoKMjAyNC0xMS0wNFQyMTowMzo1NSBsaWJmZHQvbGliZmR0X3dyYXAuYzogSW4g
ZnVuY3Rpb24g4oCYX3dyYXBfZmR0X2dldF9wcm9wZXJ0eV934oCZOgoyMDI0LTExLTA0VDIxOjAz
OjU1IGxpYmZkdC9saWJmZHRfd3JhcC5jOjY4Mjk6MTk6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50
cyB0byAKZnVuY3Rpb24g4oCYU1dJR19QeXRob25fQXBwZW5kT3V0cHV04oCZCjIwMjQtMTEtMDRU
MjE6MDM6NTUgNjgyOSB8ICAgICAgIHJlc3VsdG9iaiA9IFNXSUdfUHl0aG9uX0FwcGVuZE91dHB1
dChyZXN1bHRvYmosIApidWZmKTsKMjAyNC0xMS0wNFQyMTowMzo1NSB8ICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoyMDI0LTExLTA0VDIxOjAzOjU1IGxpYmZkdC9s
aWJmZHRfd3JhcC5jOjEyNTk6MTogbm90ZTogZGVjbGFyZWQgaGVyZQoyMDI0LTExLTA0VDIxOjAz
OjU1IDEyNTkgfCBTV0lHX1B5dGhvbl9BcHBlbmRPdXRwdXQoUHlPYmplY3QqIHJlc3VsdCwgUHlP
YmplY3QqIApvYmosIGludCBpc192b2lkKSB7CjIwMjQtMTEtMDRUMjE6MDM6NTUgfCBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KCgogIE5vdywgSSBoYXZlbid0IGludmVzdGlnYXRlZCB0b28gbXVj
aCwgYW5kIEkgaGF2ZW4ndCBkb25lIGEgY2xlYW4gYnVpbGQgc28gdGhhdCAKbWF5IGJlIHRoZSBw
cm9ibGVtICh0aG91Z2ggSSBkb24ndCBpbW1lZGlhdGVseSBzZWUgaG93KS4gQnV0IEkganVzdCB3
YW50ZWQgdG8gCmNoZWNrOiBoYXZlIHlvdSBidWlsZC10ZXN0ZWQgYSBidW5jaCBvZiBwYWNrYWdl
cyB0aGF0IHVzZSBzd2lnPwoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gICBTV0lHX1NJVEUgPSBo
dHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0L3N3aWcvc3dpZy9zd2lnLSQo
U1dJR19WRVJTSU9OKQo+ICAgSE9TVF9TV0lHX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9z
dC1wY3JlMgo+ICAgSE9TVF9TV0lHX0NPTkZfT1BUUyA9IFwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
