Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9D0C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BBA660D9C;
	Tue, 20 Feb 2024 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kt5gtluRSaOi; Tue, 20 Feb 2024 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC14B60DFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC14B60DFA;
	Tue, 20 Feb 2024 21:00:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78CE41BF955
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5D1414D0
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2hfEnokyeEr for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65E7440210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E7440210
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E7440210
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:00:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6326113F846;
 Tue, 20 Feb 2024 22:00:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:00:12 +0100
Date: Tue, 20 Feb 2024 22:00:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZdUS3A0uxtb9pQCa@landeda>
References: <20240220180224.42576-1-bernd@kuhls.net>
 <20240220180224.42576-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220180224.42576-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708462814;
 bh=+X5kkT36p429Qk2xiiMEpItxt2kuQY9ZB+Vy3+KCahE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzn3FoRn2/U6wD5dVZFMGKeMjXiWt6dFk9pxCoHk4dGtpxRP/m9qSKOxfzceAmjwp
 GYUbl866d2iKgzb7Rf9luhDbQljuleqb4tMbAoUqRYO6Q8/os5EDH6aRl771py8GKA
 oPrieK9hsVpszloE5yJFa2VZsk04t3FbSQtzNAUNEJCIR+i3FC6BNuDOZBQI2q+1Ce
 l5j18RsG+y9sb3UIayjsgvKn18BSmHxsXsa8fra5cBbkprDkzzfqWcEJi2575AhZtq
 9MmabtutHJvC2MdUxq5o6ZQHzt7uHOZbizPmkR2f/2OaFrM77oBRH3UUXo/KGo6rIn
 tgG8F4+2KUMXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hzn3FoRn
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls to dnsmasq
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCk9uIDIwMjQtMDItMjAgMTk6MDIgKzAxMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoK
VGhhbmsgeW91IGZvciBhZG9wdGluZyBpdCEg8J+RjQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBERVZFTE9QRVJTIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9Q
RVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGJhMThkODMwZDIuLmI5Y2E3ZWI2NDcgMTAwNjQ0Cj4g
LS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMzUwLDYgKzM1MCw3IEBA
IEY6CXBhY2thZ2UvYml0Y29pbi8KPiAgRjoJcGFja2FnZS9jbGFtYXYvCj4gIEY6CXBhY2thZ2Uv
ZGF2MWQvCj4gIEY6CXBhY2thZ2UvZGh0Lwo+ICtGOglwYWNrYWdlL2Ruc21hc3EvCj4gIEY6CXBh
Y2thZ2UvZG92ZWNvdC8KPiAgRjoJcGFja2FnZS9kb3ZlY290LXBpZ2VvbmhvbGUvCj4gIEY6CXBh
Y2thZ2UvZHR2LXNjYW4tdGFibGVzLwo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
