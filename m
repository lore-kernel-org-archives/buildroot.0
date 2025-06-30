Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF69DC83030
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 20:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F99A41B7E;
	Mon, 30 Jun 2025 20:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzAR31IrjQgy; Mon, 30 Jun 2025 20:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C2A41A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C2A41A4F;
	Mon, 30 Jun 2025 20:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4770223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA20B81361
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvzBRoZP-zCV for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 20:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8971F812C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8971F812C7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8971F812C7
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:37:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E42395FF88;
 Mon, 30 Jun 2025 22:37:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 22:37:01 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 22:37:01 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250629200944.889177-1-thomas.perale@mind.be>
References: <20250629200944.889177-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <e3e98609294d7246780c2e2af520d1b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751315823;
 bh=WoI5bumYBYY4ssu2+Yc9d1bBvv7/mBkrJLQ/C4A0KOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jD9+7ns05Kgpze/W3XWGJSJqgtn4J5AMc5QPR2Wc8D1bG3E8jcOcLtgRmJhnPqujo
 nV24A4u+hMCgMqAdbrCC2z+5IUMeiBvm7TGC+8jF8qcvyw2cMrIrSkPjygxoGyRtjK
 yhuZMSvhs4La5WQNTAJknSvr4FkWHkaulUjKcv/z83f+QRWBTaCZoAhCaWhKbu4gVC
 PllY2GeRPTGndbSKRuw05YrxGShUKRm9jkVAWzFHuEbg4k+cViFNxkIz9vo2m36sBR
 pVX3hoPFG3vZWvDS4NBn3WZSHK5r+d24GP45T32sk6i9D+SH6ca6ghdMrul8lDTcwe
 n0GO/rnbn16dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jD9+7ns0
Subject: Re: [Buildroot] [PATCH 1/1] package/kvmtool: fix build failure w/
 musl
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

T24gMjkvMDYvMjAyNSAyMjowOSwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzIG9uIHRoZSBhdXRvYnVpbGRlciBmb3IgYnVpbGRz
IHdpdGggbXVzbAo+IGxpYmMuCj4gCj4gYGBgCj4gICBDQyAgICAgICB1dGlsL2JpdG1hcC5vCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvYml0bWFwLmg6NywKPiAgICAgICAg
ICAgICAgICAgIGZyb20gdXRpbC9iaXRtYXAuYzo5Ogo+IGluY2x1ZGUvbGludXgvYml0b3BzLmg6
NDoxMDogZmF0YWwgZXJyb3I6IGJpdHMvd29yZHNpemUuaDogTm8gc3VjaCBmaWxlIAo+IG9yIGRp
cmVjdG9yeQo+ICAgICA0IHwgI2luY2x1ZGUgPGJpdHMvd29yZHNpemUuaD4KPiAgICAgICB8ICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4gYGBgCj4gCj4gVGhlIGVycm9yIG9jY3VycyBiZWNh
dXNlIGJpdHMvd29yZHNpemUuaCBpcyBzcGVjaWZpYyB0byBnbGliYy4KPiAKPiBUaGlzIHBhdGNo
IGFwcGxpZXMgYW4gdXBzdHJlYW0gZml4IHRoYXQgcmVwbGFjZXMgdGhlIHVzZSBvZiBfX1dPUkRT
SVpFCj4gd2l0aCBhbiBpbnRlcm5hbCBtYWNybywgbWFraW5nIHRoZSBjb2RlIHBvcnRhYmxlIGFj
cm9zcyBkaWZmZXJlbnQgbGliYy4KPiAKPiBGaXhlczogCj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzMwZC8zMGQ2ZTQwN2U2YTBmYzdkODUwNjJjMmQ1NjAwODc1NWM3
MGNhNzMzL2J1aWxkLWVuZC5sb2cKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9t
YXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKV2hpbGUgdGVz
dGluZyB0aGlzIHBhdGNoLCBJIG5vdGljZWQgaXQgZml4ZWQgdGhlIHJlcG9ydGVkIGlzc3VlCmlu
IGEgZ2NjMTMgYW5kIG11c2wgbGliYyBjb25maWd1cmF0aW9uLCBidXQgc3dpdGNoaW5nIHRvIGdj
YzE0CmZhaWxzLgoKSXQgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aDoKCiAgICAgY2F0ID4uY29uZmln
IDw8RU9GCiAgICAgQlIyX2FhcmNoNjQ9eQogICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQog
ICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CiAgICAgQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9CT09UTElOX0FBUkNINjRfTVVTTF9CTEVFRElOR19FREdFPXkKICAgICBCUjJfUEFD
S0FHRV9LVk1UT09MPXkKICAgICBFT0YKICAgICBtYWtlIG9sZGRlZmNvbmZpZwogICAgIG1ha2Ug
a3ZtdG9vbAoKQ29tcGlsYXRpb24gZmFpbHMgd2l0aCBtZXNzYWdlOgoKICAgICB2ZmlvL2NvcmUu
YzogSW4gZnVuY3Rpb24g4oCYdmZpb19ncm91cF9nZXRfZm9yX2RlduKAmToKICAgICB2ZmlvL2Nv
cmUuYzo1Mzc6MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAK4oCY
YmFzZW5hbWXigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgICAgICA1Mzcg
fCAgICAgICAgIGdyb3VwX25hbWUgPSBiYXNlbmFtZShncm91cF9wYXRoKTsKICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CiAgICAgdmZpby9jb3JlLmM6NTM3OjIyOiB3
YXJuaW5nOiBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGJhc2VuYW1l4oCZIApbLVdu
ZXN0ZWQtZXh0ZXJuc10KICAgICB2ZmlvL2NvcmUuYzo1Mzc6MjA6IGVycm9yOiBhc3NpZ25tZW50
IHRvIOKAmGNoYXIgKuKAmSBmcm9tIOKAmGludOKAmSBtYWtlcyAKcG9pbnRlciBmcm9tIGludGVn
ZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCiAgICAgICA1MzcgfCAgICAgICAg
IGdyb3VwX25hbWUgPSBiYXNlbmFtZShncm91cF9wYXRoKTsKICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICBeCgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KCkJlc3QgcmVnYXJk
cywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
