Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3656EC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D1A4107D;
	Mon, 28 Jul 2025 22:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLthF4agHKmI; Mon, 28 Jul 2025 22:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3962040B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3962040B97;
	Mon, 28 Jul 2025 22:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE44432
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 318B840B97
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xetBSzhQ4hkw for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3351940B30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3351940B30
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3351940B30
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 11F7220039E;
 Tue, 29 Jul 2025 00:28:52 +0200 (CEST)
Received: from [192.214.236.6:41552] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:28:52 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:28:52 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, "Alvaro G . M" <alvaro.gamez@hazent.com>
In-Reply-To: <20250725120743.3705187-1-yegorslists@googlemail.com>
References: <20250725120743.3705187-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ce27a85329a6537f145b88911910506e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753741735;
 bh=4v3xJ7Utc68rEAUoqY/Jyq/pJMd/5tUMDh8mrq4dQQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zcd+XlB7UuU94wXh5845f1GN1+dolg3eG2ZAJFFgx7MSV0eAAfoyvociU9MLV4YgP
 lMbDPZMRAwWEt/ZRRKPRDTdLETF3NgcOr770Hx6G0D2rbyxaCquv2zVFu+dBU8d/W0
 JMkSSIQF6oeYQZifgym5JpGQ8cJLVa4sKdFaAoEjY2dRA/DqSXnkO+++zzrEDPJfXx
 ZwuvqV1jiNE7cnGJmYztsr7c6ymy03ZygH8BBUwjQJ20s5et4WqMntQMekNJ6aYfXp
 imKH5mRnIMQSpTppjKaUZ0nbGA4IASNazGXtYm5SIXa46gEqmbcCMNe2NMogCl/xQ9
 JMTcA0Mh/eWlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zcd+XlB7
Subject: Re: [Buildroot] [PATCH v2] package/libxmlrpc: fix boolean
 definitions
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjUvMDcvMjAyNSAxNDowNywgeWVnb3JzbGlzdHMtLS0gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gCj4g
RG9uJ3QgZGVmaW5lIGJvb2xlYW4gbWFjcm9zIGZvciBDMjMgc3RhbmRhcmQgYXMgdGhleSBhcmUg
aW1wbGVtZW50ZWQKPiBhcyBrZXl3b3Jkcy4KPiAKPiBGaXhlcyB0aGUgZm9sbG93aW5nIGVycm9y
Ogo+IAo+IG1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeQo+ICcvaG9tZS91c2VyL0RvY3VtZW50
cy92ZXJzaW9uZWQvb3NzL3htbHJwYy1jL2xpYi91dGlsJwo+IGdjYyAtYyAtRE5ERUJVRyAtcHRo
cmVhZCAtV2FsbCAtVyAtV25vLXVuaW5pdGlhbGl6ZWQgLVd1bmRlZgo+IC1Xbm8tdW5rbm93bi1w
cmFnbWFzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVdzdHJpY3QtcHJvdG90eXBlcwo+IC1XbWlz
c2luZy1wcm90b3R5cGVzIC1XaW1wbGljaXQgLWZuby1jb21tb24gLWcgLU8zCj4gLUlzcmNkaXIv
bGliL3V0aWwvaW5jbHVkZQo+IC1JL2hvbWUvdXNlci9Eb2N1bWVudHMvdmVyc2lvbmVkL29zcy94
bWxycGMtYyAgIGNhc3ByaW50Zi5jCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGNhc3ByaW50Zi5j
Ojk6Cj4gc3JjZGlyL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oOjEzOjU6IGVycm9yOiBjYW5ub3Qg
dXNlIGtleXdvcmQg4oCYZmFsc2XigJkKPiBhcyBlbnVtZXJhdGlvbiBjb25zdGFudAo+ICAgIDEz
IHwgICAgIGZhbHNlID0gMCwKPiAgICAgICB8ICAgICBefn5+fgo+IHNyY2Rpci9saWIvdXRpbC9p
bmNsdWRlL2Jvb2wuaDoxMzo1OiBub3RlOiDigJhmYWxzZeKAmSBpcyBhIGtleXdvcmQgd2l0aAo+
IOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiBzcmNkaXIvbGliL3V0aWwvaW5jbHVkZS9ib29sLmg6
MTU6MzogZXJyb3I6IGV4cGVjdGVkIOKAmDvigJksIGlkZW50aWZpZXIKPiBvciDigJgo4oCZIGJl
Zm9yZSDigJhib29s4oCZCj4gICAgMTUgfCB9IGJvb2w7Cj4gICAgICAgfCAgIF5+fn4KPiBzcmNk
aXIvbGliL3V0aWwvaW5jbHVkZS9ib29sLmg6MTU6Mzogd2FybmluZzogdXNlbGVzcyB0eXBlIG5h
bWUgaW4KPiBlbXB0eSBkZWNsYXJhdGlvbgo+IAo+IFVwc3RyZWFtOiBodHRwczovL3NvdXJjZWZv
cmdlLm5ldC9wL3htbHJwYy1jL2NvZGUvMzMxOC8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZ
ZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
