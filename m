Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88602C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 13:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E47040690;
	Sat, 19 Apr 2025 13:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mn35hm7P8vnh; Sat, 19 Apr 2025 13:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837C7406A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837C7406A7;
	Sat, 19 Apr 2025 13:34:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D03422F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ECD140116
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Az7_jJOSaKfx for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 13:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2169400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2169400EC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2169400EC
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:34:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6163913F8C8;
 Sat, 19 Apr 2025 15:34:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Apr 2025 15:34:38 +0200
MIME-Version: 1.0
Date: Sat, 19 Apr 2025 15:34:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250418-ffmpt-v1-1-5540e2621486@gmx.net>
References: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
 <20250418-ffmpt-v1-1-5540e2621486@gmx.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <7804e9e47c5b45f9ad741a4835c7a930@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745069681;
 bh=YX5fpfmWyXfUJZRg2Es4XS16IjWO29+ACgEpxYawfMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b7j8Ha2BW0JiOo7Ut2uFbWXLHYQO+gfoHSdgSAo/oPjBoYSAiyRouyUcIlXhJF0jk
 Et8tpLGlexEjZn3qoxUhVGu+21+tYZQF40BY2Lzdp8MrgAtzVqGEIYcydqGfISaU73
 rd/4Ekd/OWMNCoXuMqVDU/00AovGCFhp2fjxCq66TfywwT9hRorFi9cE0C8kuIuH95
 QNBXRtE1tcc4Sy/rQhGWZEYFn2TPbc9YjfbN56B+XnDg3tF4TajYs65a/uy6pj9sQk
 +e6HzBYsmM7Cj0QGvp3Z4meEgWYRI5svX2NoOYvjzo42sAMGx9bKMiS0JQRkqK0spR
 XD9vAkDOanLYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b7j8Ha2B
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenmpt: install to staging
 to fix pkg-config
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

T24gMTgvMDQvMjAyNSAxMDowMywgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBXaXRob3V0IHRoaXMsIGZmbXBlZyBpcyBub3QgYWJsZSB0byBmaW5kIHRoZSBsaWJvcGVubXB0
IGRlcGVuZGVuY3ksCj4gYXQgbGVhc3Qgd2l0aCBCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMg
ZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZl
ckBnbXgubmV0PgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJIHNsaWdodGx5
IHJld29yZGVkIHRoZSBjb21taXQgbG9nIGlmIHRoaXMgZmlyc3QgcGF0Y2gsCmFzIHRoaXMgbWlz
c2luZyBfSU5TVEFMTF9TVEFHSU5HIGlzIHVucmVsYXRlZCB0byB0aGUKcGVyLXBhY2thZ2UtZGly
ZWN0b3JpZXMgb3B0aW9uLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
