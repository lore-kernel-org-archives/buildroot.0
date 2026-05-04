Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E9CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 18:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96A861598;
	Mon,  4 May 2026 18:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZDhsvBc2jrE; Mon,  4 May 2026 18:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FEB26150B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777920260;
	bh=r47T/RtEd1tn306+cyy7COCe6tg4RU3fO1J9D9wyXNQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gfAADhuSklMfCVAvCApqwS+jkcRgCbxS3Ls+h3f4y8WvWFZ55j0MENpqclPiU6yQP
	 i85OeJPZkFXvxgdrEaZXN4Ei/4t3cpRrPhn0uDVrcG8om1wXmxLtBEc79j2LJFARRI
	 a3difQIbHu6T/n0lG8Ke2KB/matBscFdB05i8yqhrQ42mrFK2UJNBxIk+yl4YRhbYc
	 tecSn4HrVDjAbFyUxnlCDyvtafL0N4ydPiof+cqacaiv8EHEqSJDjW443M+zM+uAxt
	 y3O9a5G1vQspY+bzWiCBLzaT8GZR39yausF1D8ClsjFmz8QeUm61tGLV6X9ru1f3w7
	 XgwvJQ+zFSbqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FEB26150B;
	Mon,  4 May 2026 18:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3ED6190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 893C6415E2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wp2SzAZOT5Br for <buildroot@buildroot.org>;
 Mon,  4 May 2026 18:44:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8450140CA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8450140CA9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8450140CA9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:44:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 596F419F5A5;
 Mon,  4 May 2026 20:44:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 May 2026 20:44:12 +0200
MIME-Version: 1.0
Date: Mon, 04 May 2026 20:44:12 +0200
To: =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260430121512.1020041-1-sairon@sairon.cz>
References: <20260430121512.1020041-1-sairon@sairon.cz>
User-Agent: Webmail Free/1.6.14
Message-ID: <cacb0075caa0108f525f4e36d6c7bc11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777920254;
 bh=rcfEX+y3H4pQrnpGBdbuhWmCgrW3k9RayTxFSqMNuFo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DkyN6nXsmlTE3eYarSTKLtzEYGLdfeP6kjxCsnVCPcuJcfVkme0FcT64GRLjvwwzz
 w4g/f8oHcixSk0Q7bmXHKiLLUb49rB1FLuvzIXneOYKVxUErVNOg8v3c+X259WEOvF
 g/gfmIRKQgmm+xLGzBL8EAvEQa9NqDUrFRNOheqYK7WuPKSSsxiJAg0zN1OoPjE4vx
 GbDb8egL62vCBsYtbuvR5Vo4YRU6M7puwR7qkVgAZSdqp5dWxBy+2fx6dohDBIAHkf
 XLNeF3DpQ8BqFxtoTvwDbsVFR2uKgQp8wlTweI8vvrdTyZn84JuhIdgTfa8UPYEUuh
 7pIJ/WWdSJsXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DkyN6nXs
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add RTL8125D rev.b
 firmware
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

T24gMzAvMDQvMjAyNiAxNDoxNSwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IEFkZCBmaXJtd2FyZSBm
b3IgUlRMODEyNUQgcmV2LmIgYWRkZWQgaW4gWzFdLiBUaGUgcjgxNjkgZHJpdmVyIAo+IGN1cnJl
bnRseQo+IHN1cHBvcnRzIHRoaXMgY2FyZCBzaW5jZSBMaW51eCA2LjE0LiBUaGUgZmlybXdhcmUg
d2FzIGFkZGVkIGluIFsyXSAKPiBpbmNsdWRlZCBpbgo+IGxpbnV4LWZpcm13YXJlIHNpbmNlIHZl
cnNpb24gMjAyNTAxMDkuCj4gCj4gWzFdIAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD1iMzU5M2RmMjZh
YjE5ZjExNGQ2MTM2OTNmYThhOTJhYjIwMjgwM2QwCj4gWzJdIAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdp
dC9jb21taXQvP2lkPTE2MzI5NjUyM2NkNGNjZWJiYmQ5MDI2YTc2OWM3NjkwMWMzYThlODMKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+CgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
