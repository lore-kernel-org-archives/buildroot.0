Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB57CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 13:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7B041BDF;
	Sun, 24 Aug 2025 13:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJbSwPDUmyQA; Sun, 24 Aug 2025 13:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E31341BCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E31341BCC;
	Sun, 24 Aug 2025 13:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D12719C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3319540528
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4ayXUUCM2xS for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 13:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42299405C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42299405C2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42299405C2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:25:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3c6743a10e3so1128231f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 06:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756041944; x=1756646744;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OxxqPxLsIhc6hxkJgsIeT3ElaX5bfjdq/ATAo1YX0sA=;
 b=WIhwFubHcPyPWrXSfuv8z1YPHgz1VuePh3Dk65Fyrku/GVeRjUJz0rvi+LuBETnwuW
 dUBusTMEFLvrwP8Xf60VzKAJ3pcQnGhuDUFVvbbsGAX4J4RVZ9m7Usx+qWzjlcL0Pzxe
 vArQb3qmiqtXEBoDb1IyBSQ9EDcW6Dvfvjc9fq08BglPRQhOVeumMVoN/o8oGDIQOxsP
 d3CgZUxICspIyrDjU+DSKxN80mlmvatE43yC/uVmNGvjSTjmGswwLv1tW6VPak3QZT+X
 gTp0DKKtd9RZB6gB6qHMxVgc90pWemPVMlkAkeSz2uHkGFj8S6bFBJDC9nCyTscpQAew
 Q8Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7C04ok6dzkfP0gw8SPk96BI6DZZoS6z0qYvPNwPPsghyEWJFg0x+K9kkyA4hgd+e38EtxmK7SWU4=@buildroot.org
X-Gm-Message-State: AOJu0YwOBl8f2c1rZQ1GNNt5dVSkqkzMTQOrGJjquNw8JKce3qRxTfkl
 /ufu2WFnL5loUYTDEh7G2IuSJXNJhWwfGgG0eZqVx3rApQ+rhz7ym09E/bOHLlH4HRI=
X-Gm-Gg: ASbGnctJ7a+TDGbiBi1b0wUcvf47xfvq67tt5hJohrF1TndUfqNWDh7RNfeAF4FFfY1
 rC4NIUI++m+AK0quJ8NZycg79q5W9bEPz6SJZD1Ti7Rc9/ppI+zWhLUk2fP9uyC0JkkQ76lIpL8
 3178U0egS9ets/t8uAnPsBfmsafzDfWi4CitRCjLsXDBQP4djChgMT64EfSG9eow/2AR2S0oole
 1KLBr/PEJjFcGBO25P0R7bOswIXXqnN03o7NkFpHRZO0n/uSjDt9hVns4K+YWkHGHOt2sZo+Uih
 kVIA46SgmEJlpoTQuN1knJ9DlaNIHoIBHqxoOd6CEpgUt6YnEUvm222upzdhouBYGer3MBOzGw4
 ogQkTBfsW7fhhoc1Ae4OJHH3CV4s6jNhLpQIVs8V+PQmedSafKIuGTUWyw0fynOzciEQKXuFkJn
 WJH0W4FeeZ2mmu4NE7tbQ5+SVJyQG/VibthXXjOPjK25X6ruf4WkOSqq6Hi9LQ
X-Google-Smtp-Source: AGHT+IHe5cwtwF9gWu5AJSXY6UFpllBcoXB5+BcBF1BS1RFvP2DA2zasGCdj1XtgGJwpoUYBb/S4ag==
X-Received: by 2002:a5d:5d87:0:b0:3c8:fa6e:8cd with SMTP id
 ffacd0b85a97d-3c8fa6e1685mr683621f8f.38.1756041944058; 
 Sun, 24 Aug 2025 06:25:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711bb1e3asm7499351f8f.57.2025.08.24.06.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 06:25:43 -0700 (PDT)
Message-ID: <2b420ea1-36e8-4d02-b102-89e3a1d6178c@smile.fr>
Date: Sun, 24 Aug 2025 15:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20250818084154.2771438-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250818084154.2771438-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756041944; x=1756646744; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OxxqPxLsIhc6hxkJgsIeT3ElaX5bfjdq/ATAo1YX0sA=;
 b=eDRJvPJTMg4bxaa1bQQGnkHbbqA5B21iNBp0eC7f1qdrR5bTUmb8EzbxllPGTwfZb4
 wmObnBSM9BhcezQIZs9PrwdzZAb2lpvYvt2uyP7/OtOCBKUwhoqgMkoQ2rAGgVb306X+
 5yKu4WMWxC3NwXpCnLiT8bdLQywLWPsXwfQ+U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eDRJvPJT
Subject: Re: [Buildroot] [PATCH] package/binutils: never build readline to
 fix GCC 15.x build issue
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxOC8wOC8yMDI1IMOgIDEwOjQxLCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgYmludXRpbHMtZ2RiIGNvZGUgYmFz
ZSBpbiBHaXQgZG9lcyBoYXZlIGEgY29weSBvZiByZWFkbGluZSB0aGF0IGlzCj4gdXNlZCBieSBn
ZGIuCj4gCj4gVGhlIHJlbGVhc2UgdGFyYmFsbHMgb2YgYmludXRpbHMgZG8gTk9UIGNvbnRhaW4g
cmVhZGxpbmUgYXMgaXQncyBub3QKPiBuZWVkZWQgZm9yIGJpbnV0aWxzIGl0c2VsZiAob25seSBn
ZGIpLgo+IAo+IEhvd2V2ZXIsIHdoZW4gd2UgYnVpbGQgdGhlIEFSQyBiaW51dGlscywgdGFrZW4g
ZnJvbSBHaXQsIHRoZSByZWFkbGluZS8KPiBmb2xkZXIgaXMgcHJlc2VudCwgYW5kIHRoZXJlZm9y
ZSByZWFkbGluZSBpcyBidWlsdCBldmVuIGlmIGl0IGlzIG5vdAo+IGFjdHVhbGx5IG5lZWRlZC4K
PiAKPiBUaGlzIGNhdXNlcyBidWlsZCBmYWlsdXJlcyBhcyB0aGUgY29weSBvZiByZWFkbGluZSBp
biBBUkMgYmludXRpbHMKPiAyMDI0LjEyIChiYXNlZCBvbiBiaW51dGlscyAyLjQzKSBkb2VzIG5v
dCBidWlsZCB3aXRoIEdDQyAxNS54Lgo+IAo+IFRvIHdvcmsgYXJvdW5kIHRoaXMgcHJvYmxlbSwg
d2UgdXNlIGEgc3VnZ2VzdGlvbiBmcm9tIFdhbGRlbWFyCj4gQnJvZGtvcmI6IHBhc3MgLS13aXRo
LXN5c3RlbS1yZWFkbGluZS4gSW5kZWVkLCB0aGlzIGRpc2FibGVzIHRoZSBidWlsZAo+IG9mIHJl
YWRsaW5lLi4uIGJ1dCBpdCBkb2VzIG5vdCBhY3R1YWxseSBjaGVjayB0aGF0IHdlIGhhdmUgYSBz
eXN0ZW0KPiByZWFkbGluZSwgc2luY2Ugd2UncmUgbm90IGJ1aWxkaW5nIGdkYi4KPiAKPiBGaXhl
czoKPiAKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85NzYyNDMx
ODFmNzAwMGZlMjc5MGIzNDUwYmRhZTUxZThjMTI3NjllLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNrYWdl
L2JpbnV0aWxzL2JpbnV0aWxzLm1rIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvYmludXRpbHMvYmludXRpbHMubWsgYi9wYWNrYWdlL2JpbnV0aWxzL2JpbnV0
aWxzLm1rCj4gaW5kZXggYTlmMDMyMjVkYS4uYzc5ZjM0MTRhZiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2JpbnV0aWxzL2JpbnV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9iaW51dGlscy9iaW51dGls
cy5tawo+IEBAIC00Nyw2ICs0NywxMyBAQCBCSU5VVElMU19ESVNBQkxFX0dEQl9DT05GX09QVFMg
PSBcCj4gIAktLWRpc2FibGUtZ2RiCj4gIAo+ICAjIFdlIG5lZWQgdG8gc3BlY2lmeSBob3N0ICYg
dGFyZ2V0IHRvIGF2b2lkIGJyZWFraW5nIEFSTSBFQUJJCj4gKyMKPiArIyAtLXdpdGgtc3lzdGVt
LXJlYWRsaW5lIHRvIG5ldmVyIGJ1aWxkIHJlYWRsaW5lLCBhcyBiaW51dGlscyBkb2Vzbid0Cj4g
KyMgbmVlZCBpdCAob25seSBnZGIgZG9lcykuIEZvciBiaW51dGlscyByZWxlYXNlIHRhcmJhbGxz
LCByZWFkbGluZQo+ICsjIGlzIG5vdCBzaGlwcGVkLCBidXQgd2hlbiB3ZSBnZXQgaXQgZnJvbSBn
aXQsIGl0IGlzIHByZXNlbnQgYW5kCj4gKyMgZ2V0cyBidWlsdCB3aGljaCBjYW4gY2F1c2UgYnVp
bGQgaXNzdWVzLCBzbyBmb3JjZSBza2lwcGluZwo+ICsjIGl0LiBOb3RlOiB0aGUgY29uZmlndXJl
IHNjcmlwdCB3aWxsIG5vdCBjaGVjayBmb3IgcmVhZGxpbmUgYXMgaXQKPiArIyBkb2Vzbid0IG5l
ZWQgaXQuCj4gIEJJTlVUSUxTX0NPTkZfT1BUUyA9IFwKPiAgCS0tZGlzYWJsZS1tdWx0aWxpYiBc
Cj4gIAktLWRpc2FibGUtd2Vycm9yIFwKPiBAQCAtNTgsNyArNjUsOCBAQCBCSU5VVElMU19DT05G
X09QVFMgPSBcCj4gIAktLWRpc2FibGUtZ3Byb2ZuZyBcCj4gIAkkKEJJTlVUSUxTX0RJU0FCTEVf
R0RCX0NPTkZfT1BUUykgXAo+ICAJJChCSU5VVElMU19FWFRSQV9DT05GSUdfT1BUSU9OUykgXAo+
IC0JLS13aXRob3V0LXpzdGQKPiArCS0td2l0aG91dC16c3RkIFwKPiArCS0td2l0aC1zeXN0ZW0t
cmVhZGxpbmUKPiAgCj4gIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICBCSU5VVElMU19D
T05GX09QVFMgKz0gLS1kaXNhYmxlLXBsdWdpbnMKPiBAQCAtODIsNiArOTAsMTMgQEAgZW5kaWYK
PiAgCj4gICMgImhvc3QiIGJpbnV0aWxzIHNob3VsZCBhY3R1YWxseSBiZSAiY3Jvc3MiCj4gICMg
V2UganVzdCBrZWVwIHRoZSBjb252ZW50aW9uIG9mICJob3N0IHV0aWxpdHkiIGZvciBub3cKPiAr
Iwo+ICsjIC0td2l0aC1zeXN0ZW0tcmVhZGxpbmUgdG8gbmV2ZXIgYnVpbGQgcmVhZGxpbmUsIGFz
IGJpbnV0aWxzIGRvZXNuJ3QKPiArIyBuZWVkIGl0IChvbmx5IGdkYiBkb2VzKS4gRm9yIGJpbnV0
aWxzIHJlbGVhc2UgdGFyYmFsbHMsIHJlYWRsaW5lCj4gKyMgaXMgbm90IHNoaXBwZWQsIGJ1dCB3
aGVuIHdlIGdldCBpdCBmcm9tIGdpdCwgaXQgaXMgcHJlc2VudCBhbmQKPiArIyBnZXRzIGJ1aWx0
IHdoaWNoIGNhbiBjYXVzZSBidWlsZCBpc3N1ZXMsIHNvIGZvcmNlIHNraXBwaW5nCj4gKyMgaXQu
IE5vdGU6IHRoZSBjb25maWd1cmUgc2NyaXB0IHdpbGwgbm90IGNoZWNrIGZvciByZWFkbGluZSBh
cyBpdAo+ICsjIGRvZXNuJ3QgbmVlZCBpdC4KPiAgSE9TVF9CSU5VVElMU19DT05GX09QVFMgPSBc
Cj4gIAktLWRpc2FibGUtbXVsdGlsaWIgXAo+ICAJLS1kaXNhYmxlLXdlcnJvciBcCj4gQEAgLTk1
LDcgKzExMCw4IEBAIEhPU1RfQklOVVRJTFNfQ09ORl9PUFRTID0gXAo+ICAJLS1lbmFibGUtbHRv
IFwKPiAgCSQoQklOVVRJTFNfRElTQUJMRV9HREJfQ09ORl9PUFRTKSBcCj4gIAkkKEJJTlVUSUxT
X0VYVFJBX0NPTkZJR19PUFRJT05TKSBcCj4gLQktLXdpdGhvdXQtenN0ZAo+ICsJLS13aXRob3V0
LXpzdGQgXAo+ICsJLS13aXRoLXN5c3RlbS1yZWFkbGluZQo+ICAKPiAgaWZlcSAoJChCUjJfQklO
VVRJTFNfR1BST0ZORykseSkKPiAgSE9TVF9CSU5VVElMU19ERVBFTkRFTkNJRVMgKz0gaG9zdC1i
aXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
