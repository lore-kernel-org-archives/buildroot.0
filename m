Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38373C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 17:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD1C06090A;
	Tue, 21 May 2024 17:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRMZp_NXC1D7; Tue, 21 May 2024 17:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F40C60903
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F40C60903;
	Tue, 21 May 2024 17:07:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73CD11BF283
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FC9981E8D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 17:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8V7beEYOhg4 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 17:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31EF080A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31EF080A7F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31EF080A7F
 for <buildroot@buildroot.org>; Tue, 21 May 2024 17:07:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6B4D913F8C2;
 Tue, 21 May 2024 19:07:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 19:07:32 +0200
Date: Tue, 21 May 2024 19:07:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>
Message-ID: <ZkzU1M_pN0C-zcUr@landeda>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
 <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
 <BN0P110MB1673D23A6CFB29DDA9C61DA5EBEAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN0P110MB1673D23A6CFB29DDA9C61DA5EBEAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716311254;
 bh=tBcAoZ7ULvMwl6oNQEyKUT1EE1c8OOz1UXFEbFg3XVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICoM6QduJeY8rT5pNu2Td7mR/xcxr4VM+Q1kr96tnv5NMh2cxeu/V26VxVNgwvE23
 jqe+pNQs8jq/eDrv34CdfNwyot1ffMWGHaBWmLo1CDUNdf6Fsj815e7U8IUCgkEcff
 blTvrHQVQwS9wFdbb9U7ca41qKrr5btZMna5zhSx/jRhIdi4r3L1vnZHqBrY2u0dhQ
 09kuHlRPWuo1v0fXHFPWeSivtnFCmNr0lPL3ZwoJ4BwtpKlNrQVMGi/2Wcq3w1hCzH
 ZEed81cNRgDzJ4mY+5LXhVaI8ncDEKbz3mRraecuEkLBluwkDja4e+T9blmqaTtOy9
 P9jteSh6/oZUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ICoM6Qdu
Subject: Re: [Buildroot] [External] [PATCH 1/2] support/download: introduce
 curl backend for FTP transfers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJhbmRvbiwgQWxsLAoKT24gMjAyNC0wNS0yMSAxNjoxOSArMDAwMCwgTWFpZXIsIEJyYW5kb24g
TCAgICAgICAgICAgICAgICAgICAgICAgICAgICBDb2xsaW5zIHNwYWtlIHRodXNseToKPiA+IEZy
b206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxm
IE9mIFlhbm4gRS4KPiA+IE1PUklOClstLVNOSVAtLV0KPiA+ICtjb25maWcgQlIyX0NVUkwKPiA+
ICsgICAgIHN0cmluZyAiQ3VybCBjb21tYW5kIgo+ID4gKyAgICAgZGVmYXVsdCAiY3VybCAtcSAt
LWZ0cC1wYXN2IC0tcmV0cnkgMyIKPiAKPiBJbiBteSB0ZXN0aW5nIEkgZm91bmQgd2UgbmVlZCBg
LUxgL2AtLWxvY2F0aW9uYCB3aGljaCBhbGxvd3MgY3VybCB0bwo+IGZvbGxvdyByZWRpcmVjdHMu
IE90aGVyd2lzZSwgc29tZSBVUkxzIGxpa2UgZ2l0aHViIHRhcmJhbGxzIHdpbGwgc2lsZW50bHkK
PiBmYWlsIHRvIGRvd25sb2FkLgo+IAo+IEFsc28gSSdkIHN1Z2dlc3QgYC1mYC9gLS1mYWlsYCB3
aGljaCBhbGxvd3MgY3VybCB0byBkZXRlY3Qgc29tZSBIVFRQIDRYWAo+IGVycm9ycyBhbmQgcHJp
bnQgdGhlbSB0byBzdGRlcnIuCgpUaGUgY3VybCBiYWNrZW5kIGlzIG9ubHkgc3VwcG9zZWQgdG8g
aGFuZGxlIGZ0cCBhbmQgZnRwcyBVUklzLCBub3QgaHR0cApvciBodHRwcy4gU2VlIHRoYXQgcGFy
dCBpbiB0aGUgZG93bmxvYWQgd3JhcHBlcjoKCiAgIDkyICAgICAgICAgY2FzZSAiJHtiYWNrZW5k
fSIgaW4KICAgOTMgICAgICAgICAgICAgZ2l0fHN2bnxjdnN8YnpyfGZpbGV8c2NwfGhnfHNmdHAp
IDs7CiAgIDk0ICAgICAgICAgICAgIGZ0cHxmdHBzKSBiYWNrZW5kPSJjdXJsIiA7OwogICA5NSAg
ICAgICAgICAgICAqKSBiYWNrZW5kPSJ3Z2V0IiA7OwogICA5NiAgICAgICAgIGVzYWMKClNvLCB1
bmxlc3MgSSBib3JrZWQgc29tZXRoaW5nLCBjdXJsIHNob3VsZCBub3QgYmUgdXNlZCBmb3IgaHR0
cCBvcgpodHRwcy4KCklmIHlvdSBoYXZlIGEgcmVwcm9kdWNlciwgSSdtIGFsbCBleWVzIHRvIHRl
c3QgaGVyZSBhbmQgZml4IHRoZQpicmVha2FnZS4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBt
dWNoIGFwcHJlY2lhdGVkISDwn5GNCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
