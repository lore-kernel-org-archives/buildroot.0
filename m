Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F6BCCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65522811A3;
	Tue, 21 Oct 2025 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXanpRWcSBbf; Tue, 21 Oct 2025 17:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A403F80A6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A403F80A6F;
	Tue, 21 Oct 2025 17:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4286843F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29501810DD
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Jj8CY24qLKv for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 17:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98928810DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98928810DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98928810DC
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C0E8113F880;
 Tue, 21 Oct 2025 19:16:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 19:16:42 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 19:16:42 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20251021162746.121353-1-ju.o@free.fr>
References: <20251021162746.121353-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <8e3f535bf0b3d59eef8743d105b67af1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761067004;
 bh=bsZ8SIEDq8G6cRorJa//R8idVVUsMfV+pPyUFNTqKvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m8dGJhWAXzbwu0MtMwMwq486ebDsga3T+e1glf6yHQ/JufmzFeCkV8equM1HOzuax
 alJpt7KN4zKaaVi+FUrcfQxp/qLnyESwRvGtXPgicm7LPutgNAjvHnWBA5APLheQgO
 CR9vqFHV/j2BNfYZEB+9YOrxynupzhz+KFF2DdvpkUZuir7cFBxS7Mzc28H7aJCyiF
 TNcNAJ8bR/29yT6B6x+rIfocKYMOEsA22b4stEANhu8rYcyho/bIHu1+gmijsH2YEb
 TL6tapZ8bbMc2AgIctjlJ5UWjrFknY41OkMGRpIpfJha5iFWZa1ZfarcCSokKM357G
 g/rsDI8e1D3vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m8dGJhWA
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: python-scp: fix test
 sample script
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

T24gMjEvMTAvMjAyNSAxODoyNywgSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBXaGVuIHRoZSB0ZXN0IHdhcyBpbnRyb2R1Y2VkIGluIFsxXSwgYSBjb21wYXJpc29uIG9mIHRo
ZSBzb3VyY2UgYW5kCj4gdGhlIGRlc3RpbmF0aW9uIGZpbGUgd2FzIGFkZGVkLCB3aXRoIGEgdHlw
byAodGhlIG1ldGhvZCAiLmNtcCIgbmFtZSBpcwo+IG1pc3NpbmcpLgo+IAo+IFRoZSB0ZXN0IGlz
IGZhaWxpbmcgd2l0aCBlcnJvciBzdWNoIGFzIGluIFsyXToKPiAKPiAgICAgVHJhY2ViYWNrICht
b3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+ICAgICAgIEZpbGUgIi9yb290L3NhbXBsZV9weXRob25f
c2NwLnB5IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KPiAgICAgICAgIGFzc2VydCBmaWxlY21wKCIv
ZXRjL2hvc3RuYW1lIiwgIi90bXAvaG9zdG5hbWUiKQo+ICAgICAgICAgICAgICAgIH5+fn5+fn5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gICAgIFR5cGVFcnJvcjogJ21vZHVs
ZScgb2JqZWN0IGlzIG5vdCBjYWxsYWJsZQo+IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRoYXQuCj4g
Cj4gWzFdIAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Nv
bW1pdC83NDcwNTg3Y2ZhOWEyNGQzYzQ5YWRjMGZiNmNjNjA1MTI5MDdmMzFhCj4gWzJdIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTE3ODEzNzg1MTAK
PiAKPiBDYzogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKQXBwbGllZCB0byBt
YXN0ZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
