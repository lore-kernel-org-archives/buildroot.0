Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F22E77179
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70585849AB;
	Thu,  5 Dec 2024 17:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWZNQDNTfWSt; Thu,  5 Dec 2024 17:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664A3849B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664A3849B1;
	Thu,  5 Dec 2024 17:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D92E1DD1
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A910416DA
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjXp_V7i14WF for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 17:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97D10416DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D10416DC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D10416DC
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso1142240f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 09:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420206; x=1734025006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V04OIKbTqxkwlYWoR2n59jp2mmYXKDoreTZQGJj+gmM=;
 b=YkXoWcmLzEGzyPCEedFcXcYX6LOeAUCB1Xa4FXX0M6QqMuanyv7EVOAkpaeNlERgJr
 Ly1Sh/shTim87c0dKvzg0RO3Fg7z2PXzdyveMrd6smbSeZ4UQg+d7szO3Y8fP1k9ertQ
 fxj+8JBuMaArQ2FfiQWOT3h45zX3gPMJGe7zax9UzzoZsi+jQosuH4DCE3k8FNOGu7J0
 cfBVBPTMx+kqacCudRR3PitVzF02qV3rvwoN/RiLBiqN60/6iRnIKzlzfh0fEgzNGgaY
 rE0Y9MxCpAZg3+I0sSZulhNY1Co5mBVj9BaFzE8Tq6XZ1yDzDjNv7DHpHbW0UbRziHS/
 WliA==
X-Gm-Message-State: AOJu0Yz/Xj+tw3nBXfBw5TpRo1To6zSV3zUHrBWSXsVs/qiACWDxGvVO
 oT6q9kwCQbvdx67SpVlkN26U+PWsYipZyekEFWSPNJLLJyyDyMT+fNz/8RKEDv+SG5dAzQ9GgXN
 sadU=
X-Gm-Gg: ASbGnctij7IkVoXpKZWw9jo3SkMClvCc3smwUJtqsp2o0oyOg2NA8Dgrgl2xI/p9lZN
 YeweLsohmCrvZuA3nZ+8hY70BNZVQiMitKDBAlXAz0hVsTWsudpY1uJPI95U7hwfJDz2Ve9+wRJ
 EWFAsUB4VVflm6AL0/yo2QdYpUcNSAlnyJVUpudM07Rxv7ylkPeebXQtnhPRd7TmMIEnrMCjUUf
 4vmg1txH4pP3phBLu4IixWJ0jdJLLHeNPvMAaAAkWjW0ZWz
X-Google-Smtp-Source: AGHT+IGxi94L0xX5miJtX6Go0ItE7F0TYWteGga38+V1uy43Oi1+G7yRC7iF0fX8qlVkLnnWnACWdw==
X-Received: by 2002:a5d:64e6:0:b0:385:e176:43e8 with SMTP id
 ffacd0b85a97d-385fd3f38b0mr11767739f8f.33.1733420205637; 
 Thu, 05 Dec 2024 09:36:45 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf446esm2468061f8f.20.2024.12.05.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 09:36:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1523B5F8C5;
 Thu,  5 Dec 2024 17:36:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 17:36:39 +0000
Message-Id: <20241205173643.2334343-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420206; x=1734025006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V04OIKbTqxkwlYWoR2n59jp2mmYXKDoreTZQGJj+gmM=;
 b=G01CyKjFRjgyehnXxiic95XXef4oMNRVbBfAdri2+iGiDsK4cP4Avo8fD8lBGZvR1/
 /GUfFYcWrf6EcbIrb/ymFEdIotYjcSVt7oovjZ37gt3ncyTfTkM2eQSkXVh9wi7BMQan
 ei+0xZce5uHBToIjiSB/YFy3ipmfTV0jfVw5BFN+uMXlcyVt39dHGqda1U/GmEnnxUKo
 04bIl+2hLwQilegl/oe+OStOAMehIuIqOxywj8JCPS512ggz3+k+qP02F4+eBOS0yYTU
 vXzGITdIUstmtWKW+bdaIQxmu6gPVg+8XekccgPEAnA+15DKOaB7NkxjpZgt2E5j5daI
 Qmcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=G01CyKjF
Subject: [Buildroot] [PATCH v2 0/4] Enable venus vulkan encapsulation and
 add vkmark
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGlzIGlzIGEgcmVzcGluIG9mIGEgc2VyaWVzIEkgc2VudCBvdXQgaW4gQXVndXN0LiBU
aGlzIHRpbWUgaXQKYXBwbGllcyBvbiB0b3Agb2YgdGhlIHNlcmllcyBCZXJuZCBoYXMganVzdCBz
ZW50IG91dDoKCiAgU3ViamVjdDogW0J1aWxkcm9vdF0gW1BBVENIIDEvN10gcGFja2FnZS9saWJk
cm06IGFkZCBob3N0IHZhcmlhbnQKICBNZXNzYWdlLUlkOiA8MjAyNDEyMDIxNzQwMDguMTEzNDY2
Ny0xLWJlcm5kQGt1aGxzLm5ldD4KICBEYXRlOiBNb24sICAyIERlYyAyMDI0IDE4OjQwOjAyICsw
MTAwCiAgRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCmFuZCBlbmFibGVzIHRo
ZSBWaXJ0SU8gVmVudXMgZW5jYXBzdWxhdGlvbiB0byBWdWxrYW4gZ3JhcGhpY3MgYW5kIGFkZAp0
aGUgdmttYXJrIGJlbmNobWFyayBwcm9ncmFtLgoKRm9yIHYyCiAgLSBhZGRlZCBTT0ZUUElQRSBm
aXhlcyAodGhlc2UgbmVlZCBtZXJnaW5nIGludG8gQmVybmQncyBzZXJpZXMpCiAgLSBhZGRyZXNz
ZWQgcmVtYWluaW5nIGNvbW1lbnRzIGZvciBkZXBlbmRlbmNpZXMKICAtIHR3ZWFrZWQgYSBmZXcg
bW9yZSBkZXBlbmRhbmNpZXMKICAtIGFkZGVkIGEgdmttYXJrIHRlc3QKClRoZSB0ZXN0IHdvbid0
IGN1cnJlbnRseSB3b3JrIGlmIHRoZSBzeXN0ZW0gUUVNVSBkb2Vzbid0IHN1cHBvcnQKVmVudXMu
IFRoaXMgd2lsbCBiZSBpbiB0aGUgOS4yLjAgcmVsZWFzZSAoZHVlIGFueSBkYXkgbm93KSBidXQg
d2lsbAphbHNvIHJlcXVpcmUgYW4gdXB0byBkYXRlIHZpcmdscmVuZGVyZXIgKGF2YWlsYWJsZSBp
biBEZWJpYW4KVHJpeGllL1Rlc3RpbmcpLiBJdCBkb2Vzbid0IGhhdmUgdG8gYmUgbWVyZ2VkIG5v
dyBhbmQgY2FuIHdhaXQgdW50aWwKdGhlIHJlc3Qgb2YgdGhlIHdvcmxkIGNhdGNoZXMgdXAuCgpJ
IHBsYW4gdG8gdXNlIGJ1aWxkcm9vdCBnZW5lcmF0ZWQgaW1hZ2VzIGZvciBRRU1VJ3Mgb3duIGZ1
bmN0aW9uYWwKdGVzdHMgZm9yIFZlbnVzLgoKSSd2ZSBydW4gdGhyb3VnaDoKCiAgIHV0aWxzL2Rv
Y2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCgphbmQgZXZlcnl0aGluZyBsb29rcyBjbGVhbi4g
RnVsbCBkZXRhaWxzIGFib3V0IHRoZSBjaGFuZ2VzIGFyZSBiZWxsb3cKdGhlIC0tLSdzIGluIHRo
ZSBpbmRpdmlkdWFsIGNvbW1pdHMuCgpBbGV4IEJlbm7DqWUgKDQpOgogIHN1cHBvcnQvdGVzdGlu
ZzogdXBkYXRlIHRlc3RzIGZvciBTT0ZUUElQRSAoc3F1YXNoISkKICBwYWNrYWdlL21lc2EzZDog
YWRkIG9wdGlvbiB0byBlbmFibGUgVklSVElPIHZ1bGthbiBkcml2ZXIKICBwYWNrYWdlL3ZrbWFy
azogYWRkIHZrbWFyayBiZW5jaG1hcmtpbmcgdG9vbAogIHN1cHBvcnQvdGVzdGluZzogYWRkIHRl
c3QgZm9yIHZrbWFyayBwYWNrYWdlIChQRU5ESU5HISkKCiBERVZFTE9QRVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgfCAxNiArKy0tCiBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICAgICAg
ICAgICAgICAgICAgICAgfCA0NiArKysrKysrKysrKysKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5o
YXNoICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5tayAg
ICAgICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9mbHV0dGVyLnB5IHwgIDIgKy0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3Rf
Z2xzbHNhbmRib3hfcGxheWVyLnB5ICB8ICAyICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X2dseGluZm8ucHkgfCAgMiArLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9rbXNjdWJlLnB5IHwgIDIgKy0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9u
X3B5cXQ1LnB5ICAgICAgICB8ICAyICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3ZrbWFyay5weSAgfCA3NSArKysrKysrKysrKysrKysrKysrCiBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3dlc3Rvbi5weSAgfCAgMiArLQogMTQgZmlsZXMgY2hhbmdlZCwg
MTc5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvdmttYXJrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJr
L3ZrbWFyay5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLm1r
CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92
a21hcmsucHkKCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
