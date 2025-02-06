Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01856C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 22:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC468499F;
	Thu,  6 Feb 2025 22:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cx5SDdLLPzk; Thu,  6 Feb 2025 22:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9BBF84994
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9BBF84994;
	Thu,  6 Feb 2025 22:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFB8AC5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EAC4416E5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhKG4dbdIF0Z for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 22:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=dave.peckham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2698E4170E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2698E4170E
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2698E4170E
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 22:31:23 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6dd43aa1558so11704156d6.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 14:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738881083; x=1739485883;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1D9FFv7XG4x9bF4eDk0+hOhe8uRJJXtB7ONSGHmF1SY=;
 b=mX3MDpc/XX/qz7PDlbBuZNIDiAcBueJQ95Ev9UfnFH3SfbKZ0NPne6hBbq8dwNjwbM
 xuhsru+JKw7IkPfahUda5DBEnuthrKLBZuLRTWN2ue2LxekKpqCBoewQYAKulp3Gps7O
 VA72Ah9ybmGqx1l8Hnc2t9YxnsTX5ceWgk83JmQJ+ngtyPCOSvQThB58+bqmKLNS4UPQ
 yAD0VyEE3WuW1/QKoTZzvkO7a6CQVQZC+BMMrDBiKoxpzDCaL93kMbtC8fotQAT6C1oF
 pSCxPQ6zTylMSUiK5i/zOdPvixgPpVNUOJyEypUQ13mnkk6V/jkZ6G94x6r/yuDnfa1w
 K/JQ==
X-Gm-Message-State: AOJu0YzUp3jodSUmiBUpDunkAVWOcpC/WVlvP9j+jmE2nUiL/ZBLASvz
 uxI62zJBeaOajWWevv4ktuiamBcTi8sosshshnL/IeFPRjDhhu8c
X-Gm-Gg: ASbGnculDeq0UsnFQxevgZeSbZHW2HQSy6Y3OrJ6HWY3tU4QzgLvVFpNtQ56lw8xkyX
 6sCSszU/TWy2wHUjA18oFjNMlgrCU77oBahsE2F4n1DGruCSIYxYI8IlPsffL5DD5mq5+YITG7p
 Ra0+795lcYAtBsrkuH5mLT4069zkd18x9yGFheIMAZ1NjeN/N7dq4cawNfz7T+Yooa4YvxrVnsW
 CjIlakhRK14x5RZNS/37vBrocZ+evWOwHnel6N8P8W5abfpskxli/c010ALenL8a4gyzCNRVgb5
 5IRIjNJV0GqR92oMULFDolaHp2IJs50NOmWODGK+RavbXB7QAZZH96mWzi/KcMIYQSe67dnsjVF
 JSw==
X-Google-Smtp-Source: AGHT+IEfBuwFd38L/TVNJ+otXOhgMMtitSgimY2nr8C5B1tBufxpgJ2Uo9rGHcfG3uIGCPF9f+zFWw==
X-Received: by 2002:a05:6214:2241:b0:6e4:41b3:4968 with SMTP id
 6a1803df08f44-6e44576ca4dmr8388366d6.45.1738881082712; 
 Thu, 06 Feb 2025 14:31:22 -0800 (PST)
Received: from smtpclient.apple (pool-74-97-23-56.prvdri.fios.verizon.net.
 [74.97.23.56]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e43baaced6sm10140896d6.83.2025.02.06.14.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 14:31:22 -0800 (PST)
From: Dave Peckham <dave.peckham@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 6 Feb 2025 17:31:11 -0500
Message-Id: <6DCCB998-8509-48E3-B25B-C1D6FF1BBD43@gmail.com>
References: <5818ad77-5f99-40ef-bd55-3997f8537b4e@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <5818ad77-5f99-40ef-bd55-3997f8537b4e@gmx.de>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailer: iPhone Mail (22D63)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738881083; x=1739485883; darn=buildroot.org;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1D9FFv7XG4x9bF4eDk0+hOhe8uRJJXtB7ONSGHmF1SY=;
 b=BGEE4ZwE7ul92016FFGxZtLGWH4SZIvfmSniz6JdRhEuTmiVaQYjN8nNWpV6jUVP29
 T7CA3y8V8NqFmZXKPdZeppnIrJaYMljUQzOzldAkcsUqTmQKD1e5unwiefwD2aKKwe5t
 X49JFfyQVdfVqCmrpvW+BXnadm0tefTkgu/rWQYSvF+H6fZt0Q026OVzMGl1aw/LrqHa
 KsDmhSqKCQSyLMdn/pcWiL00BH3gw73/kpeSKbqjfl6aTk0yDaYqi0kq7o9q6z6Vg82X
 FcogKssMxGoWHeS8YeKE6bk7tcw+rK6UVYV3d3d/7fQJEPrQJ3uYHBv2ycyLgtcOl6KW
 rizg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BGEE4ZwE
Subject: Re: [Buildroot] github broken?
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

T2ggZ29vZG5lc3MuIFRoYXTigJlzIHdoYXQgSSBnZXQgZm9yIHNlbmRpbmcgdGhpcyB3aGVuIHRp
cmVkLiBJIGNhdWdodCB0aGUg4oCcduKAnSBhZnRlciBJIHNlbnQgaXQsIGJ1dCBob3cgZGlkIEkg
bWlzcyB0aGUgRk9PIGluIGFsbCBjYXBzPz8/IFNpbGx5IG1lLiAKClRoYW5rcyBGaW9uYSA6LSkK
CkRhdmUKClNlbnQgZnJvbSBteSBpUGhvbmUKCj4gT24gRmViIDYsIDIwMjUsIGF0IDU6MjHigK9Q
TSwgRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4gd3JvdGU6Cj4gCj4g77u/SGkgRGF2
ZSEKPiAKPj4gQW0gMDYuMDIuMjUgdW0gMjI6NTYgc2NocmllYiBEYXZlIFBlY2toYW06Cj4+IEhp
LAo+PiAKPj4gSSBmb3VuZCBtYWlsIGRpc2N1c3Npb25zIHVwIHRvIDEwIHllYXJzIG9sZCB0aGF0
IHRoaXMgaGFzIGJlZW4gYW4KPj4gb25nb2luZyBpc3N1ZS4gSSBhbSB1c2luZyBidWlsZHJvb3Qt
MjAyNC4wMi4xMCBhbmQgZ2V0dGluZyB0aGUKPj4gZm9sbG93aW5nIGVycm9yIGZyb20gbXkgLm1r
IGZpbGUuCj4+IAo+PiBDdXJyZW50IEFQSSBkb2NzIHN1Z2dlc3QgYSBkaWZmZXJlbnQgVVJMIGZv
ciB0aGUgYXJjaGl2ZS4KPj4gCj4+IGh0dHBzOi8vZG9jcy5naXRodWIuY29tL2VuL3Jlc3QvcmVw
b3MvY29udGVudHM/YXBpVmVyc2lvbj0yMDIyLTExLTI4I2Rvd25sb2FkLWEtcmVwb3NpdG9yeS1h
cmNoaXZlLXRhcgo+PiAKPj4gQW0gSSBkb2luZyBzb21ldGhpbmcgaW5jb3JyZWN0bHk/IE9yIGRv
ZXMgdGhpcyBuZWVkIHRvIGJlIGZpeGVkIGFnYWluPwo+PiBTaG91bGQgSSBzdWJtaXQgYSBQUiB3
aXRoIGEgZml4PyBUaGVpciBBUEkgZG9lcyBsZXQgbWUgZ2V0IGEgdGFyYmFsbAo+PiBvZiB0aGlz
IHBhcnRpY3VsYXIgcmVwby4KPj4gCj4+IEkgbm90aWNlZCBzZWNvbmQgYXR0ZW1wdHMgdG8gY29u
bmVjdCB0byBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQuIEFtIEkKPj4gbWVhbnQgdG8gc3VibWl0IHBh
Y2thZ2VzIHRvIGJlIGhvc3RlZCBvbiB0aGF0IGFyY2hpdmU/Cj4+IAo+PiBCUgo+PiBEYXZlCj4+
IAo+PiAqKioqKioqKgo+PiBHT19TREwyX1ZFUlNJT04gPSAwLjMuMAo+PiBHT19TREwyX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLHZlYW5kY28sZ28tc2RsMiwkKEZPT19WRVJTSU9OKSkKPiBUd28gcHJv
YmxlbXM6Cj4gCj4gYSkgVGhlcmUgaXMgbm8gIjAuMy4wIiB0YWcgaW4gdGhlIHJlcG9zaXRvcnks
ICJ2MC4zLjAiIGV4aXN0czoKPiBodHRwczovL2dpdGh1Yi5jb20vdmVhbmRjby9nby1zZGwyL3Jl
bGVhc2VzL3RhZy92MC4zLjAKPiBUaGUgbGFzdCBwYXJhbWV0ZXIgaW4gdGhlICJnaXRodWIiIGNh
bGwgbXVzdCBiZSB0aGUgdGFnIG9yIGNvbW1pdC4KPiAKPiBiKSBGT09fVkVSU0lPTiBpcyBub3Qg
ZGVmaW5lZCAodGhhdCdzIHdoZXJlIHRoZSAiLy8iIGNvbWVzIGZyb20pLCB5b3UKPiBuZWVkIHRv
IHVzZSBHT19TREwyX1ZFUlNJT04uCj4gCj4gVHJ5Ogo+IEdPX1NETDJfU0lURSA9ICQoY2FsbCBn
aXRodWIsdmVhbmRjbyxnby1zZGwyLHYkKEdPX1NETDJfVkVSU0lPTikpCj4gCj4gVGhhdCBzYWlk
LCB0aGVyZSBhcmUgYSAqbG90KiBvZiBuZXdlciB0YWdzLCB0aGUgbGF0ZXN0IG5vbi1iZXRhIHNl
ZW1zIHRvCj4gYmUgdjAuNC40MCBmcm9tIGxhc3QgTWF5LiBJJ20gbm90IGZhbWlsaWFyIHdpdGgg
dGhlIHBhY2thZ2UsIGJ1dAo+IHBhY2thZ2luZyBhIGN1cnJlbnQgdmVyc2lvbiBtaWdodCBtYWtl
IHNlbnNlLiA6LSkKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
