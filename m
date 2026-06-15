Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D4ACD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7142F418A9;
	Mon, 15 Jun 2026 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7gJ4Aak1uE8; Mon, 15 Jun 2026 19:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A82418A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781551032;
	bh=GG8I+SbpHF0Y8+IEOPV+ftkiJ9P8eiYEZmWmP/bvJic=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVGzqVJrBEY4pNtptwruCM0OVIpCGw2IEr16ADH5EDg/HlSmR5OmPTAhuLValG+qQ
	 anjOnFyL4BotNqE9G9MgXm2loJ5NnDU+JhqtRiUGEB7kZBqQ3w+lCix4FL/u7vUoFL
	 VPT3sfVaN3HnM9Fr8p8HbOxtq4HDCrXJnfszjQZSXSDqQ7+RE0NWxCSOGbBQWx7IiC
	 wOSvO7vUmmChO8C6jF1vOCmzka5XsuySjtGoq4ET+qq2ai1VFCCt672oCEJ5F5ZdPk
	 41bs+6+/UrYb+/NRNpNyxs53VG8BqNgFVguNpkk5OkgpVGZny8tQt6xSG2N7iwtJh9
	 7dUTM1au5LMKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A82418A4;
	Mon, 15 Jun 2026 19:17:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB172169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD776148C
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cfOnQYje3QS for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C12B060B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12B060B6C
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C12B060B6C
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:17:07 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id ZCnww2VhoiOfFZCnwwsDyv; Mon, 15 Jun 2026 21:17:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 15 Jun 2026 21:17:04 +0200
Message-Id: <693F01AA-53D9-41C3-BA83-F60917EBA4C4@benettiengineering.com>
References: <157852b6-7396-404b-8153-5df134e899e3@bubu1.eu>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
In-Reply-To: <157852b6-7396-404b-8153-5df134e899e3@bubu1.eu>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailer: iPhone Mail (23F77)
X-CMAE-Envelope: MS4xfE9kdAA0k1aN9Hr+C5Q01unAD+C7xqnsgU7cbnnHxUp0nA045FAwVWe6khBDPxDeTeuuCSPUepKJ+Fi7XWmMVmw1l8XQU1K2puLj4JLHdl5ppGurKC7P
 0IO2fvb5UzJ2W120l9QHG0CqBZ8qn3ZRIPr4r8zdAXpXWP1TPjEK8ETQ6crlqzsqkZN5GmHTW1XiYReRr/pJRIZJWBvgjMYAUDmR8xiqfA5dn2/EFgBZSvw+
 xFL3k85/1NzP0V9zbgMANRgwHbBnuCyqoacKp5PmEQd1X4wDpbY9CKiIqA0OOAPb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781551024; bh=t3LgA74luDysKrwoOKXJU8BlP0rUInN8UNsF1dtKk1k=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=X9feIZvxmwDw0MXeNLR0UGZSJFU5m/xBv9E0yy00IX4AxHx8sY9wN0nUHfFD3ghwe
 efhUxXLio6wr27jYvcKb8fTrj0w4O0CZ6TEV0h904/lopQhmksrcxiaq4afwWghb/A
 QXITS/16qTpBjnDW2ENxaK3ALD7shGfM7aFteOxT5GbM3hyrUHgsb6CbtR7P2u4F+N
 r3XKUgjpvUciXJ/OazpyV5WufWiP8ADYcQ3hcSPBRNXAhOHAmeixd7Vsk+x7n8zO/f
 09PbHuwm2CIlifRQChZeldkHM0OempnywMuIuhTYQpTD7oc2pftu3jlokydvpikGs9
 596gaHXNzMmSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=X9feIZvx
Subject: Re: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzLAoKPiBJbCBnaW9ybm8gMTUgZ2l1IDIwMjYsIGFsbGUgb3JlIDIwOjI2LCBNYXJj
dXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4gaGEgc2NyaXR0bzoKPiAKPiDvu79IaSBH
aXVsaW8sCj4gCj4+IE9uIDYvMTUvMjYgMTg6MTgsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBS
ZWxlYXNlIE5vdGVzOgo+PiBodHRwczovL2dpdGh1Yi5jb20vZGF2aXNwL2ppZmZ5L3JlbGVhc2Vz
L3RhZy8yLjAuMQo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4gV2UgdXN1YWxseSB3YW50IG5ldyBw
YXRjaGVzIHRvIG5vdCBkZXBlbmQgb24gYWxyZWFkeSBwZW5kaW5nIHBhdGNoZXMgaW4gcGF0Y2h3
b3JrLCBzbyB0aGUgInByb3BlciIgd2F5IHdvdWxkIGhhdmUgYmVlbiB0byBzZW5kIHRoaXMgYnVt
cCBzcXVhc2hlZCB0b2dldGhlciB3aXRoIHRoZSBwcmV2aW91cyAyLjAuMCBvbmUgYW5kIG1hcmsg
dGhlIG90aGVyIG9uIGFzIHN1cGVyc2VkZWQgaW4gcGF0Y2h3b3JrLgoKTXkgYmFkIEkgaGF2ZW7i
gJl0IGNoZWNrZWQgcGF0Y2h3b3JrLgoKVGhhbmtzIGZvciB0YWtpbmcgY2FyZS4KCkJlc3QgcmVn
YXJkcwpHaXVsaW8KCj4gCj4gQW55d2F5LCBJIGFwcGxpZWQgYm90aCB0aGlzIGFuZCB0aGUgMi4w
LjAgYnVtcCB0byBtYXN0ZXIsIHRoYW5rcyEKPiBNYXJjdXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
