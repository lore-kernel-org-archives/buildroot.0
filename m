Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E8C7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71B040E9A;
	Sun, 22 Jun 2025 11:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qc2aaXPITaS9; Sun, 22 Jun 2025 11:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C105440D4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C105440D4F;
	Sun, 22 Jun 2025 11:48:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E377112C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA60140290
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQwkqw4n2Tnb for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F03A1400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F03A1400F1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F03A1400F1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:48:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D5B692003E8;
 Sun, 22 Jun 2025 13:48:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 13:48:36 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 13:48:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250618142825.758131-5-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
 <20250618142825.758131-5-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <55ec2afc5946aa86700d5465ca8b46c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750592920;
 bh=ZI0PGzs1hFBYDgs9iFipXkrkN8JzPJsruvzgIbjsous=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BYgGRUotJOVfUM2A5gTZkWyYEAJr/tzdClX5elDD81A9G4iOaXzDP0pOlYxn4fJYN
 2nq/jiKEpI/4OtbjentZ/nJ3KgDbH2qZnhQlkMpiZmiSIL5CGkcohe4+0UiR9ruVru
 HmKWZfMZgn+xJXnKKtbOC5+AKUqlIQsLBRjwrv1LzblunGgj417lUidN5cgNJN6Izj
 YH6+lxQ18Xha68mrSM1jn/XAsOrJBvqG2G4vCqUaD3i9iL2K5Mkw+X1vrw8Nn4oOiP
 F6N9Mk6yDpMiEiZJdOx/cps6LJJHn/ofDcyC2wUd7/wlQDCF3WY6uIQhC94ZKW9KW4
 mgyD2Gz1wct3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BYgGRUot
Subject: Re: [Buildroot] [PATCH v7 4/4] support/testing: add test for vkmark
 package
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

SGkgQWxleCwKCk9uIDE4LzA2LzIwMjUgMTY6MjgsIEFsZXggQmVubsOpZSB3cm90ZToKPiBUbyB0
ZXN0IHZrbWFyayB3ZSBuZWVkIGEgaGVhZGxlc3MgV2VzdG9uIGNvbXBvc2l0b3Igc28gd2UgY2Fu
IHJ1biB0aGUKPiB0ZXN0IHdpdGhvdXQgbWVzc2luZyBhcm91bmQgd2l0aCBhY3R1YWwgZGlzcGxh
eXMuIEJlY2F1c2UgdG8gcnVuIHByb3Blcgo+IGFjY2VsZXJhdGVkIFZ1bGthbiBwYXNzLXRocm91
Z2ggeW91IG5lZWQgYSBtb2Rlcm4gUUVNVSB3ZSBhbHNvIGVuYWJsZWQKPiB0aGUgVlVMS0FOX0RS
SVZFUl9TV1JBU1QgZHJpdmVyLiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gcnVuIHZrbWFyawo+IHVu
ZGVyIENJIGFuZCBvdGhlciBwbGFjZXMgd2hlcmUgd2UgZG9uJ3QgaGF2ZSBhIHZlcnkgbW9kZXJu
IGhvc3QKPiBzeXN0ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJl
bm5lZUBsaW5hcm8ub3JnPgoKTXkgY29tbWVudHMgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gZnJv
bSBbMV0gYXJlIHN0aWxsIGFwcGx5aW5nCnRvIHRoaXMgdmVyc2lvbi4KCkNvdWxkIHlvdSBpc29s
YXRlIGVtdWxhdG9yLnB5IGluIGEgc2VwYXJhdGUgcGF0Y2g/CgpSdW5uaW5nIHRoZSB0ZXN0IGFz
IGlzIG9uIGEgaGVhZGxlc3Mgc2VydmVyIChhbmQgZml4aW5nIHRoZQp2ay54bWwgaXNzdWUpIGZh
aWxzIHdpdGggb3V0cHV0OgoKICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKICAgICAg
ICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCiAgICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF92
a21hcmsKCiAgICAgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgogICAgICAgRmls
ZSAiL2J1aWxkcm9vdC9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5w
eSIsIApsaW5lIDY4LCBpbiB0ZXN0X3J1bgogICAgICAgICBzZWxmLmxvZ2luKCkKICAgICAgIEZp
bGUgIi9idWlsZHJvb3Qvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92a21hcmsu
cHkiLCAKbGluZSA1NSwgaW4gbG9naW4KICAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9
ImFhcmNoNjQiLAogICAgICAgRmlsZSAiL2J1aWxkcm9vdC9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEv
ZW11bGF0b3IucHkiLCBsaW5lIDEyNiwgaW4gCmJvb3QKICAgICAgICAgIkRJU1BMQVkiOiBvcy5l
bnZpcm9uWyJESVNQTEFZIl19CiAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fl5eXl5eXl5e
Xl5eCiAgICAgICBGaWxlICI8ZnJvemVuIG9zPiIsIGxpbmUgNjc5LCBpbiBfX2dldGl0ZW1fXwog
ICAgIEtleUVycm9yOiAnRElTUExBWScKCllvdSBzaG91bGQgbWFrZSBzdXJlIHRoZSB0ZXN0IHN1
Y2NlZWQgaW4gdGhlIEJ1aWxkcm9vdCByZWZlcmVuY2UKZG9ja2VyIGltYWdlLCB3aGVuIGV4ZWN1
dGVkIHdpdGg6CgogICAgIHV0aWxzL2RvY2tlci1ydW4gc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0
cyBcCiAgICAgICAgIC1rIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgdGVzdHMucGFja2FnZS50ZXN0
X3ZrbWFyawoKQ291bGQgeW91IGFsc28gY29uc2lkZXIgbW92aW5nIHRoaXMgdnVsa2FuIHN3cmFz
dCB0ZXN0IHRvIAp0ZXN0X21lc2EzZC5weT8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KClsxXSAK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzgyMTE3YjFhOWUzZDg3YzI5NDNkOGQ2
ZTAyYTQ4YmUzQGZyZWUuZnIvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
