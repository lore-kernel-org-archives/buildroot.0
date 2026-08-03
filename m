Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C387BC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 20:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A5C340650;
	Mon,  3 Aug 2026 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFCm7UMlqgEv; Mon,  3 Aug 2026 20:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7859640612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785789599;
	bh=gJlxJtrXY9PVvyvXW6g0Z638Vy/XMtCoYhW2tWj8jMg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZJxXKXnBPB9C0nmPXGp2y9R2mHujI7m74a1shaayc43/vAOahAmN7OFewyCwSa+Wx
	 ry3dbU7Ec254zGy5TGNK1oxpwCvEGGWVNq9HglkApVBTrYRyaCt9fByRgUsHb2PsO8
	 HK6N+5ILOVCqFZSIgpWGq3mOuir64f/nEFa55Q70DLCegMsZdur6xeoG8cw38+IWGA
	 zkezI/Wl2YutkRzqnJHXajqjZIBaT7RDHU2yaMaXSDr2xbkU9H2yeqg8VMd2mo3QRW
	 GUB8s9VghHSG7vzEaKc3PLmm5tjHTKb5dGrT6mMdGbh2egbXxfegLUDac9DyHyIrZe
	 +bQ6sba9aosIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7859640612;
	Mon,  3 Aug 2026 20:39:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C83528F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6282A60648
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8JXoOQXMlf4 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 20:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F2D16061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2D16061D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2D16061D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 20:39:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 74A5FB00573;
 Mon,  3 Aug 2026 22:39:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Aug 2026 22:39:50 +0200
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 22:39:50 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260803-libxmslxec-bump-v2-1-7b668ecb24e8@bootlin.com>
References: <20260803-libxmslxec-bump-v2-1-7b668ecb24e8@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <28c0e5601fb35857e0a47cd748be2325@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785789593;
 bh=0zkJmCmX1ljadGroldmsF1PYHHgtxIsIeC9Pbxciem0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QNBzBRD3c80HKneWzWXdJm1aVq3sP/aO2vJ5RxBj559cT7uw39jnvLBrUKJkXawoJ
 oLxxYUYMQRMiAB0PDFRj03aNeaw2905s0097vadMw2V00RxmJeopCPvzhEddUlGbAi
 AwU/FtB45daqHQDLrV5UNTZKbWIVwex+Q/gSPdoDA/vQhKOD2HIkt3+oe6r3PRvr7C
 cB9ijG+mptHALBS/FdxFOLZq9YxzoRtCKdxJR4CqiqFMuisDX7PLWtiiYo9jWUTy9Q
 ke4OhMSoMS9Av9E4HX5MmpbNkbg1KFZfyEPj9KS+EHTou15VmDKn4TXkZZS1vq+vn5
 2+n73lP4TpI1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QNBzBRD3
Subject: Re: [Buildroot] [PATCH v2] package/libxmlsec1: bump version to
 1.3.12
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

T24gMDMvMDgvMjAyNiAxNjoxNiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gVXBkYXRlIGxpYnhtbHNlYyBmcm9tIDEuMy45IHRvIDEuMy4xMi4gVGhlIHBhY2thZ2UgdGhl
biBuZWVkcyBhIGZldwo+IGFkanVzdG1lbnRzOgo+IC0gdGhlcmUgYXJlIHVuZGVmaW5lZCByZWZl
cmVuY2VzIHRvIHhtbERlYnVnRHVtcERvY3VtZW50IChbMV0pOgo+IAo+ICAgdW5pdF90ZXN0cy90
cmFuc2Zvcm1faGVscGVyc191bml0X3Rlc3RzLmM6MjkxOjk6IGVycm9yOiBpbXBsaWNpdAo+ICAg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYeG1sRGVidWdEdW1wRG9jdW1lbnTigJkKPiAgIFst
V2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+IAo+IFRoaXMgaXMgZHVlIHRvIHhtbHNl
YzEgdW5pdCB0ZXN0cyBiZWluZyBidWlsdCBzeXN0ZW1hdGljYWxseSwgYW5kCj4gZGVwZW5kaW5n
IG9uIGxpYnhtbDIgYmVpbmcgYnVpbHQgd2l0aCAtLXdpdGgtZGVidWcsIHNvIHBhdGNoCj4gYXBw
cy9NYWtlZmlsZS5hbSBhY2NvcmRpbmdseSBhdCBidWlsZCB0aW1lIHRvIGRpc2FibGUgdW5pdCB0
ZXN0cyBidWlsZC4KPiAKPiAtIHRoZSBidWlsZCBjYW4gZmFpbCB3aXRoIG9sZGVyIEdDQyB2ZXJz
aW9ucyBkdWUgdG8gYW4gdW5pbXBsZW1lbnRlZAo+ICAgcGFyYW1ldGVyIChbMl0pOgo+IAo+ICAg
YWFyY2g2NC1saW51eC1nY2MuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxp
bmUgb3B0aW9uIFwKPiAgIOKAmC1XZm9ybWF0LW92ZXJmbG93PTLigJk7IGRpZCB5b3UgbWVhbiDi
gJgtV3N0cmljdC1vdmVyZmxvdz3igJk/Cj4gCj4gVGhpcyBmb3JtYXQtb3ZlcmZsb3cgcGFyYW1l
dGVyIGhhcyBiZWVuIGltcGxlbWVudGVkIGluIEdDQyA3LCBzbyBtYWtlCj4gdGhlIHBhY2thZ2Ug
ZGVwZW5kIG9uIEdDQyA+PSA3LiBBbm90aGVyIHNvbHV0aW9uIGNvdWxkIGhhdmUgYmVlbiB0bwo+
IHBhc3MgLS1kaXNhYmxlLXBlZGFudGljIHRvIHRoZSBwYWNrYWdlJ3MgY29uZmlndXJlLCBidXQg
dGhhdCBzb3VuZHMgYQo+IGJpdCBzdHJvbmcganVzdCB0byBkaXNhYmxlIGEgcGFyYW1ldGVyIHRo
YXQgaGFzIGJlZW4gZXhpc2l0aW5nIGZvcgo+IGFsbW9zdCAxMCB5ZWFycy4KPiAKPiAtIHRoZSBi
dWlsZCBjYW4gZmFpbCBvbiBtaXNzaW5nIGF0b21pY3MgKFszXSk6Cj4gCj4gICAKPiBbLi4uXS9i
b290bGluLW02OGstNTIwOC11Y2xpYmMvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9tNjhrLWJ1aWxk
cm9vdC11Y2xpbnV4LXVjbGliYy9iaW4vbGQucmVhbDoKPiAgIAo+IFsuLi5dL2Jvb3RsaW4tbTY4
ay01MjA4LXVjbGliYy9ob3N0L2Jpbi8uLi9tNjhrLWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliYy9z
eXNyb290L3Vzci9saWIvbGliY3J5cHRvLmEobGliY3J5cHRvLWxpYi10aHJlYWRzX3B0aHJlYWQu
byk6Cj4gICBpbiBmdW5jdGlvbiBgQ1JZUFRPX2F0b21pY19zdG9yZSc6IHRocmVhZHNfcHRocmVh
ZC5jOigudGV4dCsweGNkMik6Cj4gICB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2F0b21pY19p
c19sb2NrX2ZyZWUnCj4gCj4gU28gbWFrZSB0aGUgcGFja2FnZSBkZXBlbmQgb24gbGliYXRvbWlj
Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGlu
ZXMvMjUyNzUyNzAzNAo+IFsyXSBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290
Ly0vam9icy8xNDQ0OTY4MTYxNQo+IFszXSBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVp
bGRyb290Ly0vam9icy8xNDQ0OTY4MTYyMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+Cj4gQ28tRGV2ZWxvcGVkLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFs
ZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIG1hc3Rlci4gRm9yIGlu
Zm8sIEkgZml4ZWQgdGhlIGxpY2Vuc2UgaGFzaC4gU2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZmVmOWNhZDFmZTg0YjQzNjZlNzA1YWRiMDM0
NzBlMTIxOTlmZmQyNQoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
