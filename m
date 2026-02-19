Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDCAE9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633C2611E3;
	Thu, 19 Feb 2026 17:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZzRxxVpxLzD; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F07610B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521990;
	bh=ppqXxh78HasTJvMeOwfUuwr0da4Dy+eg7TSDhaxsuD4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aGi1Q5Bsa7lUznCMdK7pgTgI0GdEQH4ABBuWuraxH/aPtwG+UCScoV2NeH9pbhvUQ
	 EkSQdTODoCWpT8lzbZ4dQre+9l4ksGS9yKdNzqOXUvZSejpU8XH2P0BGNZUmYYPRaF
	 /JaH7YCfhGyxj8a2psKMjd/3SXVNpvwH+xJXPMVup4yZRJkRsjm12Y0m7WxtIr7G/f
	 y/5kJg6XT1rJj6PHBkyVBMmSrzVcp9LBPBgJffUKaX8m1M9E6AcqnyoMNNxcme5kYn
	 387NyrvHZO4fyJG+MNvkEDUXJ70iqQuTNpZt1u7xMQ6C8Wy4DIsqxLhFHq5J7JY+XA
	 qQDeKyeDZVkZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F07610B2;
	Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E6E4206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21EE1405DA
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWPTui4ImUtC for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0897405BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0897405BE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0897405BE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso9662305e9.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521987; x=1772126787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8cyMA1sQl4EsE/YH5keUSMHBTyulqycxAIqi69GDLEg=;
 b=HkWfd252Qtnw29VXjTeHgRs3skgcBysVmKAGN9H92y1HLVObfiX5nT3MQb4FPX5HOw
 KzPwbSvE9X9+TIrI2AJUDGj+bowAUKFprggb9z/j7iU9ZGEQJaTS/Szy6fSs+hJiIzJy
 BT4ykePCIgJ5LBg+8dhnXcwIcpN4ZV+O+j/xLnbHmtQHp/24nV6o8rZQKl+WwamMCgt8
 avKXmystj9B/NvPJfvdxrzu0LKXeI0585qB2ZfQm0kGpN3uSbIE+7ooNqQksHEcEmixT
 jT+Up6ApS40Naq+UfoAEfnSJTjaak6xZ6oDx3MXpZF/YqBpzas3OUBWxq7avt7ti3mri
 Pquw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbfkKWqi5nvCQzjK+zJrByVr0g0oPoG12UUDjFc+fk+VesvlyDw2u69e00cksA5sc4uG01V7m4bhk=@buildroot.org
X-Gm-Message-State: AOJu0YwCvI74cKwT6o+vq8ZwsEuxOc8qsit6hs1X2kLB3jgcs0m/VqIB
 gyQjCYjAMu9Mauu894P0qBYjLqJwOQWsESMd/z5eF+oxmPXJlDvUF3ZRrwYbeW2QzzE=
X-Gm-Gg: AZuq6aIQASW9iyzF0vpGXnFC/NQoSLvFBHbN0ZEtRmpIGet8Vim2+GHMKd6ngthZNOS
 9Ly5N3PM5Uuo68KvVXNgh7mhOrC+UfR0yaQ5bVbWtUDtjltUXI7eZOTYEGUyR+LSy/DRVPv+0mb
 s7i2YkxBJKkvQe+m/Fn++StA2v048EBiyYuzJFiapY00inMY9bgo0no5w8oYWgqjHb3TZ7kyzFW
 SUAXesDjzYLdNfPsWfXZHCGuLSP9fjT++NxNE6Iu5iHhg4WHJE36EdkG9chwNMfKGh2Sd8Hfa1u
 2VsEFarVnZ5cX14ei/oFq+ry/SSc0qdPbh1n3rn4NwmJ3VuwCITVAtldupJWWde572svpDryk8Y
 /1kJgvVVOFG10ssGw6ZbHmFWt47wGoGy/feszAQFTjUK7I6D0rrXu5jY5A0NI85yCZvKjIpZrF0
 9b/FSILOxr0O5wxm9GN3nIi5GemQ==
X-Received: by 2002:a05:600c:1f0f:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-48398a42873mr109085855e9.7.1771521986748; 
 Thu, 19 Feb 2026 09:26:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31f9af5sm14099335e9.12.2026.02.19.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:26 -0800 (PST)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot development <buildroot@buildroot.org>
Date: Thu, 19 Feb 2026 18:25:38 +0100
Message-ID: <20260219172626.340379-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
References: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521987; x=1772126787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cyMA1sQl4EsE/YH5keUSMHBTyulqycxAIqi69GDLEg=;
 b=HtNEAMSryycHY2Xh9ItqfMmWp5cTgLfprqHLRYGg3Ond22Mp6or6OuJbGTWjn5/7Fc
 spUerkpymN9Eyt7BNaD3qWs3RqZiviZX2b2LkGnxb8Z5bivIFe54VwpH4OFZP1m8vqYS
 AE4v89BoElOtNsStz2XJ7lOPlNsx+aNCdB1kRV5nBBfNxWi8J+ExJf4HW2yDn4v5x7Ga
 HWfhFb635Jj/sFL4WsQH7k8LZWPiz2ZiBBrJLshYKU2y6CPBuwVkW0T6xtT82oTMPf+h
 2Ya9xdUylWSBcjKuIVLrzZV2ULHlEOfQCjlwxQEhkc6mpYJPR55TYFpB2UJiS5RURDPk
 WRgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HtNEAMSr
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: remove
 at91bootstrap3 licence
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gV2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFuZCB2ZXJzaW9u
IGZvciBhdDkxYm9vdHN0cmFwMywKPiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VOU0Vf
RklMRVMgZGVmYXVsdHMgdG8gIkxJQ0VOU0VTL01JVC50eHQiLgo+IEhvd2V2ZXIgdGhlIGdpdCB2
ZXJzaW9uIHdlIHVzZSAobmFtZWx5IHYzLjEwLjMpIGRvZXMgbm90IHByb3ZpZGUgdGhpcwo+IGZp
bGUuIEFjdHVhbGx5LCBpdCBkb2VzIG5vdCBwcm92aWRlIGEgbGljZW5jZSBmaWxlIGF0IGFsbC4g
VGhpcyBjYXVzZXMKPiDigJhtYWtlIGxlZ2FsLWluZm/igJkgdG8gZmFpbCB3aXRoOgo+IAo+ID4+
PiBhdDkxYm9vdHN0cmFwMyB2My4xMC4zIENvbGxlY3RpbmcgbGVnYWwgaW5mbwo+IHNoYTI1NnN1
bTogL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYXQ5MWJvb3Rz
dHJhcDMtdjMuMTAuMy9MSUNFTlNFUy9NSVQudHh0OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Cj4gRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIGJvb3QvYXQ5MWJvb3RzdHJhcDMv
YXQ5MWJvb3RzdHJhcDMuaGFzaAo+IEVSUk9SOiBMSUNFTlNFUy9NSVQudHh0IGhhcyB3cm9uZyBz
aGEyNTYgaGFzaDoKPiBFUlJPUjogZXhwZWN0ZWQ6IDVhMzgwOWIxYzJiYTEzYjcyNDI1NzIzMjI5
NTEzMTFjNTg0NDE5ZjFmODUxNmY2NjVkNmMwNmYwNjY4ZDc4ZGUKPiBFUlJPUjogZ290ICAgICA6
Cj4gRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxlIChNSVRN
KSBhdHRhY2sKPiAKPiBMZXQncyBiZSBleHBsaWNpdCB0aGF0IHRoZXJlIGlzIG5vIGxpY2VuY2Ug
ZmlsZSB0byBjaGVjay4KPiAKPiBGaXhlczoKPiAgLSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyOTkyODE1Mzg2Cj4gIC0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk5MjgxNTM5MAo+IFNpZ25lZC1v
ZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgoKQXBwbGllZCB0byAy
MDI1LjAyLnggJiAyMDI1LjExLnguIFRoYW5rcwoKPiAtLS0KPiAgY29uZmlncy9hY21lc3lzdGVt
c19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcgfCAxICsKPiAgY29uZmlncy9hY21lc3lzdGVtc19h
Y3F1YV9hNV81MTJtYl9kZWZjb25maWcgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8y
NTZtYl9kZWZjb25maWcgYi9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNv
bmZpZwo+IGluZGV4IGNhNGJhMjdhMjguLmYyYWI2NjYzMWYgMTAwNjQ0Cj4gLS0tIGEvY29uZmln
cy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2Fj
bWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+IEBAIC0yMyw2ICsyMyw3IEBAIEJS
Ml9UQVJHRVRfQVQ5MUJPT1RTVFJBUDM9eQo+ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NV
U1RPTV9HSVQ9eQo+ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1VSTD0i
aHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwLmdpdCIKPiAgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fUkVQT19WRVJTSU9OPSJ2My4xMC4zIgo+ICtCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VOU0VfRklMRVM9IiIKPiAgQlIyX1RBUkdFVF9BVDkx
Qk9PVFNUUkFQM19ERUZDT05GSUc9ImFjcXVhLTI1Nm0iCj4gIEJSMl9QQUNLQUdFX0hPU1RfRE9T
RlNUT09MUz15Cj4gIEJSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+IGRpZmYgLS1naXQgYS9j
b25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYWNt
ZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4gaW5kZXggMjQwZGZjNDZiNi4uMTcy
ZWFlZjM5ZiAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1i
X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVm
Y29uZmlnCj4gQEAgLTIzLDYgKzIzLDcgQEAgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQMz15Cj4g
IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX0dJVD15Cj4gIEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vbGludXg0c2Ft
L2F0OTFib290c3RyYXAuZ2l0Igo+ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9S
RVBPX1ZFUlNJT049InYzLjEwLjMiCj4gK0JSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfTElDRU5T
RV9GSUxFUz0iIgo+ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0RFRkNPTkZJRz0iYWNxdWEt
NTEybSIKPiAgQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiAgQlIyX1BBQ0tBR0VfSE9T
VF9HRU5JTUFHRT15Cj4gLS0gCj4gMi40My4wCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
