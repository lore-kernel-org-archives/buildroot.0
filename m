Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C4AE67814
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 22:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62188445B;
	Sat,  2 Nov 2024 22:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L76bTpMDawc; Sat,  2 Nov 2024 22:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C431484443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C431484443;
	Sat,  2 Nov 2024 22:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C04459D9
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A8C341036
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrvobCDFn7nD for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 22:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7CD940F27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7CD940F27
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7CD940F27
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:04:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso2027446f8f.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 15:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730585040; x=1731189840;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TdViTJS25tBkoUvwvYXC2GuJWCoBkFO8IwVKDwkbnDE=;
 b=A2FQymsg0a26OWhh65qTxnpgiRMz5aHSZ4COlX9nLX2rpvsOU6Fh+oiWupxBTy+Pk5
 UBGaYyyFpsqviJ+NeZmQqPdrTHEXp8+LyU+1xqrxymQayPpdCc5M146p1w+u3bv0D5FY
 ty1o92oVRnVfZIDkHVR48BPeAVlAeqJNaQ2XDypMnZgivaJUxWCyXzuvSbcSjjczwU2i
 NVbzabDOSt5akDqCaMGt0X1Tpg9Q6GlZbt4YeYp+hW1NVwXt9OlppRVTxrDhP9ITiJ74
 taFBE6YE++PFDROYL/gXUyK4GJ2KaOx5O9zS6jKXG49xkUuQ0gnFueVe0nJy0xtZA6Rq
 u4iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVexoyczrhNkPshFQynlc8Lr+ZCbYhL2UrZd+Zz+9ZZhx5MQZVLoxys/aE4tsI0Hmsk/nSWdkEqm/k=@buildroot.org
X-Gm-Message-State: AOJu0YzWOyfnjW65pY1V+rxyKOMbxtC+QD/7uSFrTEGUefIO4UI/ss8n
 UFIF8a21X1vWAO3j7W0hMFhwvGO017IxlLwJAJcBaV8i0ZTopBhY9EJT/hBDPsA=
X-Google-Smtp-Source: AGHT+IErBheDNWmUsKTYQT58dtaix0qHpvpHP9Ag8CrEjc2sf438W7hC5/20DBpB321oxCmqtkLBaA==
X-Received: by 2002:adf:f18c:0:b0:374:c621:3d67 with SMTP id
 ffacd0b85a97d-38061137930mr20330157f8f.24.1730585038684; 
 Sat, 02 Nov 2024 15:03:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5bf225sm105361915e9.11.2024.11.02.15.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Nov 2024 15:03:58 -0700 (PDT)
Message-ID: <e0025ae6-4171-4f25-bc49-d0e6b9881b3d@smile.fr>
Date: Sat, 2 Nov 2024 23:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-12-adam.duskett@amarulasolutions.com>
Content-Language: fr, en-US
In-Reply-To: <20240916151206.947484-12-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730585040; x=1731189840; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TdViTJS25tBkoUvwvYXC2GuJWCoBkFO8IwVKDwkbnDE=;
 b=YwUJMMIF7/2lhEAbo8ICzt1oeVnx502WtQQtsQ7qCFdvZnHNWeyez5XIm+t+s51VdH
 hzp8Xf6/dkd0mywIovI9nA119VTDeO3AQ0bgQ1os1Pk8kSJcMg6VfPXjg2kI1FLviusw
 ngA3DqsRTRkCCcV+QgUSZizVzvc3botmvN5aw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YwUJMMIF
Subject: Re: [Buildroot] [PATCH 11/13] package/polkit: bump version to 125
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

SGVsbG8gQWRhbSwgQWxsLAoKTGUgMTYvMDkvMjAyNCDDoCAxNzoxMiwgQWRhbSBEdXNrZXR0IGEg
w6ljcml0wqA6Cj4gQWxzbywgY2hhbmdlIHRoZSB1cmwgdG8gaHR0cHM6Ly9naXRodWIuY29tL3Bv
bGtpdC1vcmcvcG9sa2l0IGFzCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BvbGtp
dC9wb2xraXQgVGhlIG5ldyBhZGRyZXNzIG9mIHRoZSBjb2RlYmFzZQo+IGZvciB0aGUgcG9sa2l0
IHByb2plY3QgcG9pbnRzIHRvIHRoZSBnaXRodWIgVVJMLgoKVGVzdFBvbGtpdEluaXRkIGZhaWwg
c2luY2UgdGhlIHBvbGtpdCB2ZXJzaW9uIGJ1bXAgdG8gMTI1IFsxXQoKSXQgc2VlbXMgYW4gdXBz
dHJlYW0gaXNzdWUgdW5kZXIgaW52ZXN0aWdhdGlvbiBbMl0uCgpbMV0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy84MTk5OTkyNTk2ClsyXSBodHRwczov
L2dpdGh1Yi5jb20vcG9sa2l0LW9yZy9wb2xraXQvaXNzdWVzLzQ1MQoKQmVzdCByZWdhcmRzLApS
b21haW4KCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9wb2xraXQvcG9sa2l0Lmhhc2gg
fCAyICstCj4gIHBhY2thZ2UvcG9sa2l0L3BvbGtpdC5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3BvbGtpdC9wb2xraXQuaGFzaCBiL3BhY2thZ2UvcG9sa2l0L3BvbGtpdC5oYXNo
Cj4gaW5kZXggNWVhZGM4OTc1My4uYTM4NTVhZGVjZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Bv
bGtpdC9wb2xraXQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcG9sa2l0L3BvbGtpdC5oYXNoCj4gQEAg
LTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgYjY5Mjc4ZjZl
YTBlYWM0MDYzNTBjNDVmNTcyMGUyZmU1ZTRiZWFmOWY1M2MxNmQ5OTAyZTAyNTk2NTQxODg2NCAg
cG9sa2l0LTEyMy50YXIuZ3oKPiArc2hhMjU2ICBlYTVjZDZlNmUyYWZhNmJhZDkzOGVlNzcwYmYw
YzJjZDkzMTc5MTBmMzc5NTZmYWViYTI4NjlhZGNmMzc0N2QxICBwb2xraXQtMTI1LnRhci5nego+
ICBzaGEyNTYgIGQyZTJhYTk3M2UyOWM3NWUxYjQ5MmU2N2VhN2I3ZGE5ZGUyZDUwMWQ0OWE5MzQ2
NTc5NzFmZDc0ZjlhMGIwYTggIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb2xraXQv
cG9sa2l0Lm1rIGIvcGFja2FnZS9wb2xraXQvcG9sa2l0Lm1rCj4gaW5kZXggY2RiYmY4ZjliMC4u
ZmI0OWY2Y2UyYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BvbGtpdC9wb2xraXQubWsKPiArKysg
Yi9wYWNrYWdlL3BvbGtpdC9wb2xraXQubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtUE9MS0lUX1ZFUlNJT04gPSAxMjMKPiAtUE9MS0lU
X1NJVEUgPSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcG9sa2l0L3BvbGtpdC8tL2Fy
Y2hpdmUvJChQT0xLSVRfVkVSU0lPTikKPiArUE9MS0lUX1ZFUlNJT04gPSAxMjUKPiArUE9MS0lU
X1NJVEUgPSAkKGNhbGwgZ2l0aHViLHBvbGtpdC1vcmcscG9sa2l0LCQoUE9MS0lUX1ZFUlNJT04p
KQo+ICBQT0xLSVRfTElDRU5TRSA9IEdQTC0yLjAKPiAgUE9MS0lUX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HCj4gIFBPTEtJVF9DUEVfSURfVkFMSUQgPSBZRVMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
