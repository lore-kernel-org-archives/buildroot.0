Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB6FC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 11:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 909D8846F3;
	Sun, 16 Feb 2025 11:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCd5riR5Mi_X; Sun, 16 Feb 2025 11:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9133E8472B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9133E8472B;
	Sun, 16 Feb 2025 11:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAFE472
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA2A60D61
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvb1cCDBuXLg for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 11:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E57E60635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E57E60635
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E57E60635
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 11:01:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A1809B0055E;
 Sun, 16 Feb 2025 12:01:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 12:01:26 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 12:01:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4_=D0=AE=D1=80=D1=8C?=
 =?UTF-8?Q?=D0=B5=D0=B2_=28Leonid_Yuriev=29?= <leo@yuriev.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250214183242.2297637-1-leo@yuriev.ru>
References: <20250214183242.2297637-1-leo@yuriev.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <548d2bd51af6db64df9f397cdb5d351c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739703687;
 bh=sYfHM+ktyuqUUkwM25UtBH4ISYji490TSy0pH+7eVYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WsV6xIwB3V70z5wm/TId0aRkofXIuHI8Wv3FvhNrEvUDIIC+16zX8Rd/fqZonOjDT
 kLwE3yYwMcwYUgBoVxc2FSAjGj6HgtQq4fscXOLCnIPiJBb/y9r5hc16EzuxS3y56z
 LIqHhevOdab1alVpgLKi/NtSec8mSPrrf7Mnc/XEstwF5rlupxHxSvMidq2Kha3DA2
 kEzedrIykE2ZbVu6XC645kmX3rCHb8VhBwja809DhvHGuw/j8PPimyWjP6/KdBnH5j
 cBhdhuBr2jrUcsfbYzQvZZVRme7XzLsssU2Tu0PqVri9DPjF9XIhwMiDC7eRFTuinc
 fZFwJdf2hgpvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WsV6xIwB
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.4
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

SGkgTGVvbmlkLAoKT24gMTQvMDIvMjAyNSAxOTozMiwg0JvQtdC+0L3QuNC0INCu0YDRjNC10LIg
d3JvdGU6Cj4gVGhpcyBpcyBzdGFibGUgcmVsZWFzZSAiU2lnbWEgQm95IiBvZiBmcm9udHdhcmQg
bGlibWRieCBicmFuY2ggd2l0aCBuZXcgCj4gc3VwZXJpb3IgZmVhdHVyZXMuCj4gCj4gU2luY2Ug
MC4xMy54IGxpYm1kYnggaXMgbGljZW5zZWQgdW5kZXIgdGhlIEFwYWNoZSAyLjAgTGljZW5zZS4K
PiBGb3Igbm90ZXMgYWJvdXQgdGhlIGxpY2Vuc2UgY2hhbmdlLCBjcmVkaXRzIGFuZCBhY2tub3ds
ZWRnbWVudHMsCj4gcGxlYXNlIHJlZmVyIHRvIHRoZSBDT1BZUklHSFQgZmlsZSB3aXRoaW4gb3Jp
Z2luYWwgbGlibWRieCBzb3VyY2UgY29kZQo+IHJlcG9zaXRvcnkgaHR0cHM6Ly9naXRmbGljLnJ1
L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4Cj4gCj4gUGxlYXNlIHZpc2l0IGh0dHBzOi8vbGlibWRi
eC5kcWRrZmEucnUgZm9yIG1vcmUgaW5mb3JtYXRpb24sIGNoYW5nZWxvZywKPiBkb2N1bWVudGF0
aW9uLCBDKysgQVBJIGRlc2NyaXB0aW9uIGFuZCBsaW5rcyB0byB0aGUgb3JpZ2luYWwgZ2l0IHJl
cG8KPiB3aXRoIHRoZSBzb3VyY2UgY29kZS4gUXVlc3Rpb25zLCBmZWVkYmFjayBhbmQgc3VnZ2Vz
dGlvbnMgYXJlIHdlbGNvbWUKPiB0byB0aGUgVGVsZWdyYW0nIGdyb3VwIGh0dHBzOi8vdC5tZS9s
aWJtZGJ4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9u
aWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KCkkgYXBwbGllZCB0aGUgcGF0Y2ggdG8gbWFzdGVy
LiBGb3IgaW5mbywgSSByZW1vdmVkCl9SRURJU1RSSUJVVEUgPSBZRVMgdG8gZml4IGEgIm1ha2Ug
Y2hlY2stcGFja2FnZSIgZXJyb3IuClNpbmNlICJZRVMiIGlzIHRoZSBkZWZhdWx0IHZhbHVlLCBp
dCBpcyBub3QgbmVlZGVkLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
