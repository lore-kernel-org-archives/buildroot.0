Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D9F1061B22
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE24B4080F;
	Mon, 30 Mar 2026 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyBxw1HO8O9E; Mon, 30 Mar 2026 20:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307E2401B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774903225;
	bh=1cGXfdNXH22RRS4/5aE9CcowCH55FZyozcxwL0ZRBSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rtT4tBWAMQimOM/Zq1wMoBxYMwuyiNRCO4EWWdRWCDL0tCevSTdf9tHzoAcGJSydu
	 ItrsYhIj5kGBJ8ZtQ6DOZqrDnUztRTo9eL13QA08qx86yL+uACNjYuhNhUhQQUTUe/
	 ljH9rA0ntItvbx1clT+jQ5W0JEM5ddv9yDJiJbPOMsv/YJqBDsGAWTIGVNKIQ4FDEO
	 ZzAIwC7GMYz2dDcdP5rS9kvDVdmbHkaqw2+zt5jk9j6Z7DM+nAbQKO3EW3xwF85Cf0
	 hYavkUXRB4Sx128KInGZYyGxxUUMMqjSdxY6g508qZ1MaSNtr9fsFbX/8Ko0tlvtpp
	 I1OHdz8RncU0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307E2401B5;
	Mon, 30 Mar 2026 20:40:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E494D2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BB78401C8
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2s7qOcBOLci for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 20:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C78E24002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78E24002A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C78E24002A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:40:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DAADD2003D0;
 Mon, 30 Mar 2026 22:40:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Mar 2026 22:40:17 +0200
MIME-Version: 1.0
Date: Mon, 30 Mar 2026 22:40:17 +0200
To: =?UTF-8?Q?Daniel_Br=C3=A1t?= <danek.brat@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260330111505.3162298-1-danek.brat@gmail.com>
References: <20260330111505.3162298-1-danek.brat@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <3866ce76b29e2aaf36c88aa75659c303@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774903220;
 bh=h1oUHFFQMErTTe44cmpuCOy6xYgkWm43h37wDP6Yqd8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R4DcfP6kmEwnpLLpbTulSBt7Tx1030dPm8pew7dbGZL5XiY4zbRPxg7rd+PLhWO8+
 zkqIN3HQEIlGUHk7XLrOG9jrsczp5+iARHRO35q3fyJ7BfW1xyuZm2PRC2c3EbzLuN
 tzau4J45fZjl8SlCoFUP07A/nRLFqFGBiQmhpy/UZWMSxuoUfDHfbKwKa74ysMN2zN
 cqYIHORnc6oCBxAjsfjixuWsQ686dJxhduh2WOyiUjzVNFeuN22Dffb1vTEztFJCn6
 unhfDVisW4BrF75yGRScbNMecCcoQcu6SxnzhGaXTTDItJCUamnBSn+h931nQnJX0d
 GzEU5i8By64uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R4DcfP6k
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.2.6
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

T24gMzAvMDMvMjAyNiAxMzoxNSwgRGFuaWVsIEJyw6F0IHdyb3RlOgo+IFRoaXMgdXBzdHJlYW0g
cmVsYXNlIGluY2x1ZGVzIGZpeCBmb3IgdGhlIENWRS0yMDI1LTI2NTE5IGFuZCBzZXZlcmFsIAo+
IG90aGVyCj4gaXNzdWVzIGJ1aWxkcm9vdCBwcmV2aW91c2x5IG5lZWRlZCB0byBhcHBseSBpdHMg
b3duIHBhdGNoZXMgZm9yLgo+IFNoYTI1NiBvZiB0aGUgQ09QWVJJR0hUIGZpbGUgaGFzIGNoYW5n
ZWQgZHVlIHRvIGEgY29udHJpYnV0b3IgbmFtZSAKPiBjaGFuZ2UsCj4gbGljZW5jZSByZW1haW5z
IG90aGVyd2lzZSB0aGUgc2FtZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQnLDoXQgPGRh
bmVrLmJyYXRAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gRm9yIGluZm8g
SSBhZGRlZCBsaW5rcyBpbiB0aGUgY29tbWl0IGxvZzoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzkwMTg0MDJjMmMwYmQ5MmJlMDY2NGRmODJkOTQz
ZTExZmU3ODJhNmIKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
