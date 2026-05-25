Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D9CD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 12:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8BE60F9D;
	Mon, 25 May 2026 12:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mgu20T95jct9; Mon, 25 May 2026 12:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD0060F8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779712561;
	bh=Or3tLhOBJ5gcu5jhuKpd4Q0nn3QZg8AZHFb8t/1Bf9Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1qOXP1fJfjSmyiWGN1Exzq25dI9KXP5n33XgWzp5mJKXbUuicjXlX6L3BO+WMmxX
	 2lO3/ojKlr4d76gWOJ4YZLlTHE0QZzAGL2Hz7cyRWTgbyd59G9mz8nQzzQ+XeDIqKl
	 k9fjhwf0+qffo062EqjrP61u2rqeAO1F4ryqFD6mulSExn55WrkQ9tskJyD2n2Rhx6
	 so5qPdf6/+Qwf7xTRA3t18HFLTTfr5L2mvakf2Y3hOGlUAOT0oTisrU4UiNoWBqzt/
	 zd2P9vo3Igc4pzpuQCB9NTwdUOAzpbCrcRed7PqnVupfe5M/Shzk4mKhO12r92amuN
	 qQhWdpzYjmWHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD0060F8F;
	Mon, 25 May 2026 12:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D0AF21F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E90B81E3B
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPuBw6vOTKc9 for <buildroot@buildroot.org>;
 Mon, 25 May 2026 12:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6000A81DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6000A81DF4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6000A81DF4
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:35:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 724BE13F8A7;
 Mon, 25 May 2026 14:35:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 May 2026 14:35:55 +0200
MIME-Version: 1.0
Date: Mon, 25 May 2026 14:35:55 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
References: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <756cd9fedba04ceaca7ab15bd4d37f14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779712556;
 bh=MezUdZHJe4OZ4o2N13f01xLQElQWIFEuSwxgRiLPf/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M/bLQEeRvZjWyOWZlxutpR7L1tDZh3Y4T6x5L3vAGAXOmNP1RDUJk/gTRykBg0V2w
 ApqSFelu+wyVv0RSw8jhBeClZWIt6EPnPgI6sWiNAbDVZbrV7dI6ufsfUlmdatGnrP
 pukBLGlWxhlQ0T3q8RBNkiI8hucOrS8SQZBLaXWP0cj42EoDwHmg2utz4BFPDyOaxp
 Zj5zIi+/Y61wtbf2GkZ43VpvZ1iuF2oDlGq8eCWKWx0JbxU1u0WJhHuHRk6xkkE77T
 L96ExzRStRSKuOGSNCkzRNfj5gVn8CZGl2LHY5/ynUJKdyemqAF/Nid40P4cAubBZ5
 GKyojWZU2LJpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M/bLQEeR
Subject: Re: [Buildroot] [PATCH for next] package/uclibc: bump to 1.0.58
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

T24gMjUvMDUvMjAyNiAwODoyNiwgV2FsZGVtYXIgQnJvZGtvcmIgd3JvdGU6Cj4gTmV3IHJlbGVh
c2Ugd2l0aCBmb2xsb3dpbmcgY2hhbmdlczoKPiAKPiBBZGFtIExhY2tvcnp5bnNraSAoMSk6Cj4g
ICAgICAgdGVybWlvcy5oOiBBZGQgSUJTSElGVAo+IAo+IENoYXJsZXMgTWlyYWJpbGUgKDExKToK
PiAgICAgICByaXNjdjogYWRkIGRlZmNvbmZpZ3MKPiAgICAgICByaXNjdjogYWRkIHN1cHBvcnQg
Zm9yIHN0YXRpYyBwaWUgYmluYXJpZXMKPiAgICAgICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIHVj
b250ZXh0IGZ1bmN0aW9ucwo+ICAgICAgIHBpcGU6IGRpcmVjdGx5IGludm9rZSBwaXBlMiBmcm9t
IGtlcm5lbCB3aGVuIAo+ICFVQ0xJQkNfTElOVVhfU1BFQ0lGSUMKPiAgICAgICBGaXgge2csc31l
dHRpbWVvZmRheSB3aGVuICFVQ0xJQkNfSEFTX1JFQUxUSU1FCj4gICAgICAgRml4IGJ1aWxkIHdp
dGggc3RhdGljLXBpZSBidXQgd2l0aG91dCBucHRsIHRocmVhZHMKPiAgICAgICBkbyBub3QgcmVt
b3ZlIGJpdHMvdUNsaWJjX2N0eXBlLmggd2hlbiAhVUNMSUJDX0hBU19DVFlQRV9UQUJMRVMKPiAg
ICAgICBnZXRvcHQtc3VzdjM6IHJlbW92ZSBjYWxsIHRvIGdldHRleHQgYF9gIG1hY3JvCj4gICAg
ICAgcmVhZGRpcnssX3J9OiByZW1vdmUgbG9vcCB0byBza2lwIGZpbGVzIHdpdGggZF9pbm8gPT0g
MAo+ICAgICAgIHNwYXduOiBhbGxvdyBmaWxlIGFjdGlvbnMgb24gbm8tbW11IHRhcmdldHMKPiAg
ICAgICBnZXRvcHQtc3VzdjM6IGFkZCBzdXBwb3J0IGZvciByZXNldGluZyB0aGUgc2NhbiBieSBz
ZXR0aW5nIG9wdGluZCAKPiB0byB6ZXJvCj4gCj4gTWFyY3VzIEhhZWhuZWwgKDEpOgo+ICAgICAg
IGFhcmNoNjQvZnB1X2NvbnRyb2wuaDogRG9uJ3QgdXNlIGdjYy1pbnRlcm5hbCB0eXBlcwo+IAo+
IEphbiBLbMO2dHprZSAoMSk6Cj4gICAgICAgZWxmL2RsLXN1cHBvcnQuYzogcmVtb3ZlIHVubmVj
ZXNzYXJ5IG1lbXNldAo+IAo+IFJhbWluIE1vdXNzYXZpICg5KToKPiAgICAgICBsaWJzYW5pdGl6
ZXI6IGFybS91Y29udGV4dDogZml4IFZGUCBzYXZlL3Jlc3RvcmUgdG8gdXNlIAo+IHVjX3JlZ3Nw
YWNlIGFyZWEKPiAgICAgICBsaWJzYW5pdGl6ZXI6IGFybS91Y29udGV4dC5oOiBhZGQgZ2xpYmMt
c3R5bGUgUkVHX1IwLi5SRUdfUjE1IAo+IGFsaWFzZXMKPiAgICAgICBsaWJzYW5pdGl6ZXI6IGxp
bmsuaC9kbC1pdGVyYXRlLXBoZHI6IGV4cG9zZSBkbF9waGRyX2luZm8gVExTIAo+IGZpZWxkcwo+
ICAgICAgIGxpYnNhbml0aXplcjogbGRzbzogdHJhY2sgX2RsX2xvYWRfYWRkcy9fZGxfbG9hZF9z
dWJzIGNvdW50ZXJzCj4gICAgICAgbGlic2FuaXRpemVyOiBsZHNvOiBpbXBsZW1lbnQgX2RsX3Rs
c19nZXRfYWRkcl9zb2Z0IGZvciAKPiBkbF9waGRyX2luZm86OmRscGlfdGxzX2RhdGEKPiAgICAg
ICBsaWJzYW5pdGl6ZXI6IGRyb3AgX19wYWdlc2l6ZSwgbWFrZSBfZGxfcGFnZXNpemUgdGhlIHNp
bmdsZSAKPiBzb3VyY2Ugb2YgdHJ1dGgKPiAgICAgICBsaWJzYW5pdGl6ZXI6IHN5cy91c2VyLmg6
IHJlbW92ZSBvYnNvbGV0ZSBCRkQgdHJhZC1jb3JlIAo+IE5CUEcvVVBBR0VTIGRlZmluZXMKPiAg
ICAgICBsaWJzYW5pdGl6ZXI6IGZlYXR1cmVzLmg6IGhhcmQtd2lyZSBfRklMRV9PRkZTRVRfQklU
Uz02NCB0byBtYXRjaCAKPiBsaWJyYXJ5J3MgNjQtYml0IG9mZl90L2lub190Cj4gICAgICAgbGli
c2FuaXRpemVyOiBmdHMuaDogZHJvcCB0aGUgYm9ndXMgX0ZJTEVfT0ZGU0VUX0JJVFM9PTY0ICNl
cnJvcgo+IAo+IFdhbGRlbWFyIEJyb2Rrb3JiICg3KToKPiAgICAgICBiaXRzL3N0YXR4Lmg6IGFk
ZCBzb21lIG1pc3NpbmcgZGVmaW5lcwo+ICAgICAgIGJpdHMvc3RhdHguaDogc3luYyBzdHJ1Y3Qg
d2l0aCBnbGliYwo+ICAgICAgIHN5cy9mYW5vdGlmeS5oOiBzeW5jIHdpdGggbXVzbAo+ICAgICAg
IGxpYmljb252OiBmaXggdHlwZWRlZiBvZiBpY29udl90Cj4gICAgICAgbWlzYzogYWRkIHVuaWNv
ZGUgY2hhcmFjdGVyIGZ1bmN0aW9ucyAoYzExKQo+ICAgICAgIG5ldGluZXQvdGNwLmg6IHN5bmMg
d2l0aCBnbGliYwo+ICAgICAgIGJ1bXAgdmVyc2lvbiBmb3IgMS4wLjU4IHJlbGVhc2UKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgoKQXBwbGll
ZCB0byBuZXh0LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
