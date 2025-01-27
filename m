Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E9C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 23:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2811A4039A;
	Mon, 27 Jan 2025 23:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Blt3CNLQUIOY; Mon, 27 Jan 2025 23:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BF884039D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF884039D;
	Mon, 27 Jan 2025 23:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C71AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A31AD403D5
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52i6J6htoxGH for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 23:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5700A40270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5700A40270
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5700A40270
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:26:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 380F25FFAA;
 Tue, 28 Jan 2025 00:26:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33180])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 00:26:56 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 00:26:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250127220326.23261-1-vincent.stehle@laposte.net>
References: <20250127220326.23261-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <1b635c40881731b53a6f98e7060dd4ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738020417;
 bh=1m2iL5d+aIOfq0JMjxKJpaMdrDXvB/swj+ZybtFM108=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cH+t/jvkeGTCfMrhzzC1z4/83dV4IuxpfFdP2ffClATyTTm5BDycPNA/9YxlMKd9e
 7zeww9dMEjkyZA6HzqeQCjmSXnNTL7wPMWitP1g3YbqbRH4Gm+bwfg+0xGY2Axwjay
 gl4TobJ+/aG0gIVlDkzPxrWnnJcgSZxdfnXHnsBdBkqyzqD49KuP1vPwTIruODOLhS
 CsGzfxOyNu7oZY0OH1AdW+GkASnYHHCNXNIfd8hvvoFTqH9xMVglUglG8JxOCvybXJ
 urQI9/gttrwowyhWZh27E0k4n+WXv9pwSbSljJiBXE4zhA3bUv5OpShLxVnhQNlNmb
 Il72P9A5V/Wqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cH+t/jvk
Subject: Re: [Buildroot] [PATCH v3] support/testing: test_xen: repair and
 leverage xen tools
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjcvMDEvMjAyNSAyMzowMywgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ3VycmVudCB0ZXN0IHJ1bnMgYSBYZW4gaHlwZXJ2aXNvciBhbmQgYSBMaW51eCBkb20wLCBm
cm9tIHdoaWNoIHdlIGNhbgo+IGRldGVjdCB0aGF0IHdlIHJ1biB1bmRlciBYZW4gYnV0IG5vdCBt
dWNoIG1vcmUuIEluZGVlZCwgd2l0aCBjdXJyZW50Cj4gdGVzdCdzIHNldHVwIHRoZSBYZW4gdG9v
bHMgYXJlIG5vdCBmdW5jdGlvbmFsLgo+IAo+IFdlIGFkZCBiYWNrIG5ldHdvcmtpbmcgdG8gb3Vy
IHN0cmlwcGVkLWRvd24ga2VybmVsIGNvbmZpZyB0byByZXBhaXIgWGVuCj4gdG9vbHMuCj4gCj4g
V2l0aCBYZW4gdG9vbHMgZnVuY3Rpb25hbHMsIHdlIGNhbiBlbmhhbmNlIHRoZSB0ZXN0IHdpdGgg
dGhlIGNyZWF0aW9uIAo+IG9mCj4gYSBWTS4gVG8gYmUgYWJsZSB0byB1c2UgdGhlIHJvb3RmcyB0
aGF0IHdlIGJ1aWxkIGluIGJvdGggdGhlIGRvbTAgYW5kIAo+IGluCj4gdGhpcyBuZXcgZG9tMSwg
d2Ugc3dpdGNoIHRvIGFuIGluaXRyYW1mczsgbm8gbW9yZSByb290ZnMgcGFydGl0aW9uIGluCj4g
dGhlIGltYWdlLiBBZnRlciBzdHJpcHBpbmcgdGhlIHJhbWRpc2sgYSBiaXQgd2UgY2FuIGV2ZW4g
cmVkdWNlIFFlbXUncwo+IG1lbW9yeSB0byAxIEdCLgo+IAo+IFN1Z2dlc3RlZC1ieTogSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
