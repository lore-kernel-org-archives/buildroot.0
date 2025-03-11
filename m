Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCFC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 22:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AE94121E;
	Tue, 11 Mar 2025 22:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPvgo9PXfm-o; Tue, 11 Mar 2025 22:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4810F41224
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4810F41224;
	Tue, 11 Mar 2025 22:33:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3AEB1C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9343B60D8E
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKIZjlIeqjWE for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 22:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45C4A60D6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C4A60D6F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45C4A60D6F
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:33:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6C8CAB00548;
 Tue, 11 Mar 2025 23:33:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 23:33:01 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 23:33:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
In-Reply-To: <f638ed96-aa7b-46af-8c5a-1ca9763e41f7@smile.fr>
References: <20250209112915.401359-1-bernd@kuhls.net>
 <f638ed96-aa7b-46af-8c5a-1ca9763e41f7@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <2e1bbd252d983f93614a0b623953b9b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741732383;
 bh=eiSjaamHzR3GUYF2/AReVZIOjVqeBRIzF/Cfr1C7VQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VHCBB3TIUHsp2sDVE9Rp4U4kfUx0itprv4lbmFgjVNESsCPDgg2fUKiyM8IzYcBX2
 cXLwVHClbi4BuvRDzDFTWxHO3IkqbeBbGzoPUKymlTR7EFsFuWt3gKgPvQ4p86B7wq
 yq+JoFCuZ9iiE4K1IgtxQrZpsxGSD9IawFELtEms1Ug4rMh8jgtToGQHyvPagWsP8I
 a0B1VUkYvoKIbFMDj1GmEDe4JYxt203X3/QSc8x0zDbB8IR3dO0YxbGvXenFosRR52
 Wook6M8tdbVd8LEJfE0hFLQautPp+L2FdAkJV07hJLz0jQzft5ob3/8imvsYIC4HGT
 lyKlkwgPiAjOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VHCBB3TI
Subject: Re: [Buildroot] [PATCH 1/1] package/libcdio: needs host-pkgconf
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

SGkgUm9tYWluLCBCZXJuZCwKCk9uIDEwLzAyLzIwMjUgMjM6MzIsIFJvbWFpbiBOYW91ciB2aWEg
YnVpbGRyb290IHdyb3RlOgo+IEhlbGxvIEJlcm5kLAo+IAo+IExlIDA5LzAyLzIwMjUgw6AgMTI6
MjksIEJlcm5kIEt1aGxzIGEgw6ljcml0wqA6Cj4+IFdpdGggY29tbWl0Cj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9saWJjZGlvL2xpYmNkaW8vY29tbWl0LzFmOTQ2NjRmNzY2ZWY2NmI5OTJlMWM1M2E1
ZTgxN2EzNzk4OGQ4OTQKPj4gdXBzdHJlYW0gYWRkZWQgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeSB0
byBwa2djb25mIGluIHZlcnNpb24gMi4xLjEuCj4gCj4gQWN0dWFsbHksIGhvc3QtcGtnY29uZiBz
ZWVtcyBtaXNzaW5nIHNpbmNlIGl0IHdhcyBhZGRlZCBpbnRvIEJ1aWxkcm9vdC4KPiAKPiBodHRw
czovL2dpdGh1Yi5jb20vbGliY2Rpby9saWJjZGlvL2NvbW1pdC8xNDZiYmE5ZTFlZmMwMmZlYzJj
ZGVjNjhmYWIzYjAzM2FkYjU5MGQxCj4gCj4gaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcv
cnBtcy9saWJjZGlvL2Jsb2IvcmF3aGlkZS9mL2xpYmNkaW8uc3BlYyNfMjAKPiAKPiBodHRwczov
L3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL2xpYmNkaW8vYmxvYi81ZThiMjFhZjIzMWYyMjM3
ZTZmNjY3NTk1NTZlYmU4ZTNlODE0OTNiL2YvbGliY2Rpby5zcGVjI18xNAo+IAo+PiAKPj4gQnVp
bGRyb290IGJ1bXBlZCBsaWJjZGlvIHdpdGggCj4+IDkyMGY0NWJkMjQ0MTY2Yzg0MDFkZDA1ZTA1
NGZjODk0ZWJhMTQzYmYsCj4+IGEgYmFja3BvcnQgaXMgbm90IG5lZWRlZC4KPiAKPiBTbyBhIGJh
Y2twb3J0IHNlZW1zIHJlcXVpcmVkIGluc3RlYWQuCgpJIGZpbmFsbHkgYXBwbGllZCB0aGlzIHBh
dGNoIG9uIG1hc3RlciBpbiBpdHMgb3JpZ2luYWwgZm9ybQoodGhhdCBpcywgd2l0aCB0aGUgY29t
bWVudCBzYXlpbmcgdGhhdCBhIGJhY2twb3J0IGlzIF9ub3RfIG5lZWRlZCkuCgpJIHRlc3RlZCBp
biBsdHMgYnJhbmNoZXMgYW5kIHRoZSBpc3N1ZSBpcyBub3QgaGFwcGVuaW5nLgpFdmVuIGlmIGxp
YmNkaW8gYWx3YXlzIGdlbmVyYXRlZCBhIHBrZ2NvbmZpZyAucGMgZmlsZSAodG8gYmUKdXNlZCBi
eSBvdGhlciBwYWNrYWdlcyB3aXRoIHBrZ2NvbmZpZyksIGl0cyB1c2Ugb2YgcGtnY29uZmlnCmF0
IGNvbmZpZ3VyZSB0aW1lIHdhcyBpbnRyb2R1Y2VkIGluIDIuMS4xLgoKPiBCZXN0IHJlZ2FyZHMs
Cj4gUm9tYWluCj4gCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
