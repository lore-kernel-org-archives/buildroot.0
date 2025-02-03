Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60160C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2232C60B6A;
	Mon,  3 Feb 2025 14:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMLboiJjJCSn; Mon,  3 Feb 2025 14:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED7260BDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED7260BDC;
	Mon,  3 Feb 2025 14:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8779B12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C0341392
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQyOTv9i24Ox for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80AB440688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80AB440688
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80AB440688
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:13:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so44884995e9.2
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 06:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738592030; x=1739196830;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyryB6NsHCNjAQZPAG8f++R88zHeALCw7jtl0BtrvmE=;
 b=PkIvo0sKbMIJ92PuDt2jzRDBaUaO3PUVWwVq6VtdvhoK2f4ePBx9BBs8UzQDNea2YQ
 BeG/bhK4xIrb87U5RFeRQBbjmyaks/YWaq/rM/E9D3tqC5SMQzjgKfz+100MmFjCW2Pg
 0w0A1/us1M8g5KovjQ7hwgZjn8c9Gz+3EGipKNc++43x5h+8KN8oHv6kFPooeZet0lmN
 qd3NuQXITovER8mYL3RVOCEfSCQ6wXH5rIbzEDVO7BQFSUZ0YZc7clanAXcc/zIskNZC
 +O6YXANtrg/IN7Jx6gh50Nl77lVqLncCB0gGgfvJCBBOdoR3kz9vLu2j0I2QoxLhPWcm
 w+Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK5zrkbMbGb048rYv0ZLMGrDX/KLlotgfBmgLJ1JCyKhcOGJTqi5HULJ+anR2HwCrQ93r21P/RsUw=@buildroot.org
X-Gm-Message-State: AOJu0YwXPBDgTTY/iWgeUJXAhbh7UtTg8UzDTCSn1R/4KdZ7GVasSA08
 dg+ldi/aqwRtidoc74DZU+dGhxOZOplTb3Nd8D81MBp7WI7XGeQn2+5MPGUFCTSqhUAWVUFA376
 O
X-Gm-Gg: ASbGncuCfBwVG+T8gKsQ1EsH4PBYM1wIq7XFXJ1gQaAlqXsLUgM33KAUtIDBrkDahGy
 mwUk+hirK7JYvQUF0RZWwZYhO1ika09YpBjCSZDCmww74bhikhEmbu0tPVlYcyqy8cXVKSXsnxv
 h/Fu+jLnmXwdAwGW5t3JUn6tDLJDyUFBoiClPwuN7v+O7VNWRiPeCJwVO4BDITicIN5EZfp07zL
 C6/e1C0nDRZ92ocOSIRalRl4QwtzlbRkQn4X6lhqBpCSYw5GRW7cy32WCe0HeNLvDBo+1hFp1H6
 gR6GAlVScYL7vna0ldKsGKrXUhfAf+71UEJyFUU0NPIBTJE=
X-Google-Smtp-Source: AGHT+IFFzql5MhBhjNXIHzzE/7nPkWPqyCR0exIXAkmg39vUa5PbDinJRpEFI9HLYa2DpUQZ4NP67A==
X-Received: by 2002:a05:6000:1842:b0:38c:5e03:5d9 with SMTP id
 ffacd0b85a97d-38c5e0309bcmr13655311f8f.16.1738592029874; 
 Mon, 03 Feb 2025 06:13:49 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122707sm13089331f8f.50.2025.02.03.06.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:13:49 -0800 (PST)
Message-ID: <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
Date: Mon, 3 Feb 2025 15:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
Content-Language: en-GB
In-Reply-To: <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738592030; x=1739196830; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZyryB6NsHCNjAQZPAG8f++R88zHeALCw7jtl0BtrvmE=;
 b=icJowOxqonIuTKfZ3F+3y8JxTEcqS4WeElxBnrJQgtULqMn/UvCFr4KRd3ZRkAPcBp
 /X5enX1aWKOnxPUVxVP6JfHNth80vu1a4qk8eMZSszBivdE8DjsaooyhaHlrGmj8N6hg
 lNvf5GHf8Jq89YomZ1H0waPx0fYFQzJDgonfz6yArQ5cSn2PP+LcQTL7pmAZSj82zBbs
 HejcokgPaP2crLbvJVog+gZspSvYduLtjvIPgJA5McZO1rV9f+gVtvXkUXVj8CcucxFY
 Clwt8EKMpbOQFk9LxPTQII1nIzUPw59/VxZfr8D4DBhgKeCYl/OW9/cg/W3UvQV8xdGw
 Bfig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=icJowOxq
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wMi8yMDI1IDE0OjA0LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBIaSBBcm5vdXQhCj4g
Cj4gQW0gMDMuMDIuMjUgdW0gMTM6NDggc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPj4g
wqDCoEhpIEZpb25hLAo+Pgo+PiBPbiAwMy8wMi8yMDI1IDEzOjAxLCBGaW9uYSBLbHV0ZSB3cm90
ZToKPj4+IEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+
Pgo+Pj4gR28gZm9yY2VzIHRoZSBHT0xEIGxpbmtlciB3aGVuIGR5bmFtaWNhbGx5IGxpbmtpbmcg
R28gY29kZSwgYmVjYXVzZQo+Pj4gb2xkIHZlcnNpb25zIG9mIEJGRCBjYXVzZWQgZXJyb3JzLiBU
aGUgaXNzdWUgaGFzIGJlZW4gZml4ZWQgaW4KPj4+IEJpbnV0aWxzIHNpbmNlIGF0IGxlYXN0IDIu
NDEgYWNjb3JkaW5nIHRvIHRoZSB1cHN0cmVhbSBkZXNjcmlwdGlvbiBvZgo+Pj4gdGhlIHBhdGNo
IGFkZGVkIHdpdGggdGhpcyBjb21taXQgWzFdLCBhbmQgbm93IGZvcmNpbmcgR09MRCBjYXVzZXMK
Pj4+IGxpbmtpbmcgZmFpbHVyZSBpZiBsZC5nb2xkIGlzIG5vdCBhdmFpbGFibGUuIFRoZSBhc3Nv
Y2lhdGVkIEdvbGFuZwo+Pj4gaXNzdWUgWzJdIGlzIHN0aWxsIG9wZW4uCj4+Pgo+Pj4gSW1wb3J0
IHRoZSBwYXRjaCB0byBzdG9wIGZvcmNpbmcgR09MRC4KPj4KPj4gwqDCoFRoaXMgZml4ZXMgdGhl
IGlzc3VlIGZvciBnby1zcmMsIGJ1dCBub3QgZm9yIGdvLWJpbiB1bmZvcnR1bmF0ZWx5Li4uCj4+
IEFuZCBnby1iaW4gaXMgdGhlIGRlZmF1bHQuLi4KPiAKPiBJJ20gYWZyYWlkIEkgY2FuJ3QgcGF0
Y2ggdGhlIEdvIGJpbmFyaWVzLCBhdCBsZWFzdCBub3Qgd2l0aCByZWFzb25hYmxlCj4gZWZmb3J0
LgoKICBPaCBjb21lIG9uLCBob3cgaGFyZCBjYW4gaXQgYmUgOi0pCgoKPj4gwqDCoE9uIHRoZSBv
dGhlciBoYW5kLCB3ZSBkb24ndCBoYXZlIGFueSBhdXRvYnVpbGRlciBmYWlsdXJlcyB5ZXQsIHNv
Cj4+IG1heWJlIGl0J3MgYSBjb3JuZXIgY2FzZSBwcm9ibGVtIGFuZCB3ZSBjYW4gbGl2ZSB3aXRo
IGl0IHVudGlsIGdvLWJpbgo+PiBnZXRzIGJ1bXBlZCB0byAxLjIzLjYgKGFzc3VtaW5nIHVwc3Ry
ZWFtIGFwcGxpZXMgdGhlIGZpeCB0byB0aGVpciBzdGFibGUKPj4gYnJhbmNoIG9mIGNvdXJzZSku
Cj4gCj4gQXMgSSB1bmRlcnN0YW5kIHRoZSBjb2RlLCB0aGUgZm9yY2VkIG9wdGlvbiBpcyBvbmx5
IGFwcGxpZWQgd2hlbgo+IGJ1aWxkaW5nIGEgZHluYW1pY2FsbHkgbGlua2VkIGxpYnJhcnksIHdo
aWNoIGlzIHByb2JhYmx5IG5vdCB2ZXJ5IGNvbW1vbgo+IHdpdGggR28uIEkgaGF2ZW4ndCBsb29r
ZWQgbW9yZSBkZWVwbHkgaW50byBpdCwgYnV0IG15IGN1cnJlbnQgYXNzdW1wdGlvbgo+IGlzIHRo
YXQgY29udGFpbmVyZCBzdGFydGVkIGRvaW5nIHRoYXQgd2l0aCB0aGUgMi4wIHJlbGVhc2UsIGJl
Y2F1c2UKPiB0aGVyZSBoYXZlbid0IGJlZW4gYW55IHJlY2VudCBjaGFuZ2VzIHRvIHBhY2thZ2Uv
YmludXRpbHMgKGFuZAo+IGRlZmluaXRlbHkgbm9uZSBkaXNhYmxpbmcgR29sZCkuIE90aGVyd2lz
ZSB0aGUgZXJyb3Igc2hvdWxkJ3ZlIHNob3duIHVwCj4gZWFybGllci4KCiAgR3JlYXQhIEluIHRo
YXQgY2FzZSwgd2UgY2FuIGVpdGhlciBwYXRjaCBjb250YWluZXJkIHRvIG5vdCBkbyB0aGF0LCBv
ciAKKHRlbXBvcmFyaWx5KSBtYWtlIGNvbnRhaW5lcmQgZGVwZW5kIG9uIGhvc3QtZ28tc3JjICh3
aXRoIGEgYmlnIGNvbW1lbnQgCmV4cGxhaW5pbmcgd2h5KS4KCiAgSG93ZXZlciwgSSB0aGluayBp
dCdzIGJlc3QgdG8gYXBwbHkgdGhpcyBwYXRjaCBhbmQgbGVhdmUgY29udGFpbmVyZCArIGdvLWJp
biAKYXMgYnJva2VuIGZvciBhIHdoaWxlLiBJZiB0aGVyZSB3aWxsIGJlIGEgR28gMS4yMy42IHRo
YXQgZml4ZXMgdGhlIGlzc3VlLCB0aGVuIApqdXN0IGJ1bXBpbmcgR28gKGJvdGggYmluIGFuZCBz
cmMpIGlzIGEgbXVjaCBlYXNpZXIgcGF0aCBmb3J3YXJkLgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPiAKPj4gwqDCoFJlZ2FyZHMsCj4+IMKgwqBBcm5v
dXQKPj4KPj4+Cj4+PiBbMV0gaHR0cHM6Ly9nby1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2dv
LysvMzkxMTE1Cj4+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMjIw
NDAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRl
QGdteC5kZT4KPj4+IC0tLQo+Pj4gwqAgLi4uLWJpbnV0aWxzLWdvbGQtZGVwZW5kZW5jeS1vbi1h
YXJjaDY0LnBhdGNoIHwgNzAgKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDcwIGluc2VydGlvbnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dv
L2dvLXNyYy8wMDAzLWNtZC1saW5rLXN0b3AtZm9yY2luZy0KPj4+IGJpbnV0aWxzLWdvbGQtZGVw
ZW5kZW5jeS1vbi1hYXJjaDY0LnBhdGNoCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28v
Z28tc3JjLzAwMDMtY21kLWxpbmstc3RvcC1mb3JjaW5nLWJpbnV0aWxzLQo+Pj4gZ29sZC1kZXBl
bmRlbmN5LW9uLWFhcmNoNjQucGF0Y2ggYi9wYWNrYWdlL2dvL2dvLXNyYy8wMDAzLWNtZC1saW5r
LQo+Pj4gc3RvcC1mb3JjaW5nLWJpbnV0aWxzLWdvbGQtZGVwZW5kZW5jeS1vbi1hYXJjaDY0LnBh
dGNoCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uMWJhMzFi
NjU3Nwo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvcGFja2FnZS9nby9nby1zcmMvMDAwMy1j
bWQtbGluay1zdG9wLWZvcmNpbmctYmludXRpbHMtZ29sZC0KPj4+IGRlcGVuZGVuY3ktb24tYWFy
Y2g2NC5wYXRjaAo+Pj4gQEAgLTAsMCArMSw3MCBAQAo+Pj4gK0Zyb20gNmQyNjViMDA4ZTNkMTA2
YjI3MDY2NDVlNWE4OGNkOGUyZmI5ODk1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4+ICtG
cm9tOiBEaXJrIE3DvGxsZXIgPGRpcmtAZG1sbHIuZGU+Cj4+PiArRGF0ZTogV2VkLCAwOSBNYXIg
MjAyMiAxNzo0NzoyMyArMDEwMAo+Pj4gK1N1YmplY3Q6IFtQQVRDSF0gY21kL2xpbms6IHN0b3Ag
Zm9yY2luZyBiaW51dGlscy1nb2xkIGRlcGVuZGVuY3kgb24KPj4+IGFhcmNoNjQKPj4+ICsKPj4+
ICtUaGUgYmZkIGxpbmtlciBhcHBlYXJzIHRvIGJlIHdvcmtpbmcganVzdCBmaW5lIGF0IGxlYXN0
IGluIHZlcnNpb24KPj4+ICsyLjQxIG9yIGFib3ZlLiBSZWplY3QgdGhlIGtub3duIGJyb2tlbiBv
bmUgaW5zdGVhZCwgd2hpY2gKPj4+ICthdm9pZHMgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGxp
bmtlciBkZXBlbmRlbmN5IHRoYXQKPj4+ICtpcyBjdW1iZXJzb21lIGZvciBkaXN0cmlidXRpb25z
Lgo+Pj4gKwo+Pj4gK0ZpeGVzICMyMjA0MC4KPj4+ICsKPj4+ICtDaGFuZ2UtSWQ6IEk5ZjM3N2U0
N2MyMmVmMjA0OTc0NzljMDk3OGMwNTNlZDVkZTQ2YTM4Cj4+PiArVXBzdHJlYW06IGh0dHBzOi8v
Z28tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9nby8rLzM5MTExNQo+Pj4gK1NpZ25lZC1vZmYt
Ynk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Pj4gKy0tLQo+Pj4g
Kwo+Pj4gK2RpZmYgLS1naXQgYS9zcmMvY21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvIGIvc3Jj
L2NtZC9saW5rL2ludGVybmFsLwo+Pj4gbGQvbGliLmdvCj4+PiAraW5kZXggMmQ4Zjk2NC4uZmNm
MGJjNyAxMDA2NDQKPj4+ICstLS0gYS9zcmMvY21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvCj4+
PiArKysrIGIvc3JjL2NtZC9saW5rL2ludGVybmFsL2xkL2xpYi5nbwo+Pj4gK0BAIC0xNjcwLDI3
ICsxNjcwLDYgQEAKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gVXNlIGxsZCB0byBh
dm9pZCBlcnJvcnMgZnJvbSBkZWZhdWx0IGxpbmtlciAoaXNzdWUKPj4+ICMzODgzOCkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWx0TGlua2VyID0gImxsZCIKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgIH0KPj4+ICstCj4+PiArLcKgwqDCoMKgwqDCoMKgIGlmIGN0eHQuQXJjaC5JbkZhbWls
eShzeXMuQVJNNjQpICYmIGJ1aWxkY2ZnLkdPT1MgPT0gImxpbnV4IiB7Cj4+PiArLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLy8gT24gQVJNNjQsIHRoZSBHTlUgbGlua2VyIHdpbGwgZmFpbCB3aXRo
Cj4+PiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gLXpub2NvcHlyZWxvYyBpZiBpdCB0aGlu
a3MgYSBDT1BZIHJlbG9jYXRpb24gaXMKPj4+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBy
ZXF1aXJlZC4gU3dpdGNoIHRvIGdvbGQuCj4+PiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8g
aHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTk5NjIKPj4+
ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBodHRwczovL2dvLmRldi9pc3N1ZS8yMjA0MAo+
Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFsdExpbmtlciA9ICJnb2xkIgo+Pj4gKy0KPj4+
ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBJZiBnb2xkIGlzIG5vdCBpbnN0YWxsZWQsIGdj
YyB3aWxsIHNpbGVudGx5IHN3aXRjaAo+Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGJh
Y2sgdG8gbGQuYmZkLiBTbyB3ZSBwYXJzZSB0aGUgdmVyc2lvbiBpbmZvcm1hdGlvbgo+Pj4gKy3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGFuZCBwcm92aWRlIGEgdXNlZnVsIGVycm9yIGlmIGdv
bGQgaXMgbWlzc2luZy4KPj4+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lLCBhcmdzIDo9
IGZsYWdFeHRsZFswXSwgZmxhZ0V4dGxkWzE6XQo+Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFyZ3MgPSBhcHBlbmQoYXJncywgIi1mdXNlLWxkPWdvbGQiLCAiLVdsLC0tdmVyc2lvbiIpCj4+
PiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kIDo9IGV4ZWMuQ29tbWFuZChuYW1lLCBhcmdz
Li4uKQo+Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIG91dCwgZXJyIDo9IGNtZC5Db21i
aW5lZE91dHB1dCgpOyBlcnIgPT0gbmlsIHsKPj4+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICFieXRlcy5Db250YWlucyhvdXQsIFtdYnl0ZSgiR05VIGdvbGQiKSkgewo+Pj4g
Ky3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2cuRmF0YWxmKCJBUk02
NCBleHRlcm5hbCBsaW5rZXIgbXVzdCBiZSBnb2xkCj4+PiAoaXNzdWUgIzE1Njk2LCAyMjA0MCks
IGJ1dCBpcyBub3Q6ICVzIiwgb3V0KQo+Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICstwqDCoMKgwqDCoMKgwqAg
fQo+Pj4gK8KgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoCBpZiBjdHh0LkFyY2guRmFtaWx5ID09IHN5
cy5BUk02NCAmJiBidWlsZGNmZy5HT09TID09ICJmcmVlYnNkIiB7Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoCAvLyBTd2l0Y2ggdG8gbGQuYmZkIG9uIGZyZWVic2QvYXJtNjQuCj4+PiArZGlmZiAtLWdp
dCBhL3NyYy9tYWtlLmJhc2ggYi9zcmMvbWFrZS5iYXNoCj4+PiAraW5kZXggYjY3YWUxNS4uN2Rm
NDkxMCAxMDA3NTUKPj4+ICstLS0gYS9zcmMvbWFrZS5iYXNoCj4+PiArKysrIGIvc3JjL21ha2Uu
YmFzaAo+Pj4gK0BAIC05NCw2ICs5NCwxNiBAQAo+Pj4gK8KgwqDCoMKgIDs7Cj4+PiArIGVzYWMK
Pj4+ICsKPj4+ICsrIyBUZXN0IGZvciBiYWQgYmZkLmxkCj4+PiArK2lmIHRlc3QgIiQodW5hbWUg
LW0pIiA9ICJhYXJjaDY0IiAmJiBsZCAtdiB8IGdyZXAgLUUgIkdOVSBsZC4qIDJcLgo+Pj4gKFsw
LTNdfDQwKSI7IHRoZW4KPj4+ICsrwqDCoMKgIGVjaG8gJ0VSUk9SOiBZb3VyIHN5c3RlbSB1c2Vz
IGJmZC5MRCAyLjQwIG9yIG9sZGVyIHdoaWNoIGhhcwo+Pj4gaXNzdWVzIHdpdGggZHluYW1pYyBs
aW5raW5nIG9uIGFhcmNoNjQnCj4+PiArK8KgwqDCoCBlY2hvICdDb25zaWRlciB1cGdyYWRpbmcg
b3Igc3dpdGNoaW5nIHRvIGJpbnV0aWxzLWdvbGQuJwo+Pj4gKyvCoMKgwqAgZWNobwo+Pj4gKyvC
oMKgwqAgZWNobyAnU2VlIGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcu
Y2dpP2lkPTMwNDM3Jwo+Pj4gKysKPj4+ICsrwqDCoMKgIGV4aXQgMQo+Pj4gKytmaQo+Pj4gKysK
Pj4+ICsgIyBUZXN0IGZvciBiYWQgbGQuCj4+PiArIGlmIGxkIC0tdmVyc2lvbiAyPiYxIHwgZ3Jl
cCAnZ29sZC4qIDJcLjIwJyA+L2Rldi9udWxsOyB0aGVuCj4+PiArwqDCoMKgwqAgZWNobyAnRVJS
T1I6IFlvdXIgc3lzdGVtIGhhcyBnb2xkIDIuMjAgaW5zdGFsbGVkLicKPj4KPiAKPiAKPiAtLSAK
PiBEaXBsLi1JbmcuIEZpb25hIEtsdXRlCj4gTW9sbHdpdHplciBTdHIuIDIKPiA0NDE0MSBEb3J0
bXVuZAo+IEdlcm1hbnkKPiAKPiBVU3QuLUlEL1ZBVCBudW1iZXI6IERFMzYzNDg4OTQ0CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
