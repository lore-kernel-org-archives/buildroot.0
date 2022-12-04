Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2783C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6C640934;
	Sun,  4 Dec 2022 14:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6C640934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5oXEZ2GJLxqQ; Sun,  4 Dec 2022 14:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C14409A9;
	Sun,  4 Dec 2022 14:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C14409A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8BE1BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A7660AAA
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A7660AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zqzfe73Sx0R for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:16:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679C060A9B
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch
 [45.157.188.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 679C060A9B
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:16:41 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NQ7lX2VS6zMpnRm;
 Sun,  4 Dec 2022 15:06:48 +0100 (CET)
Received: from localhost.localdomain (unknown [81.221.82.85])
 by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4NQ7lW6Y6kzMppfD;
 Sun,  4 Dec 2022 15:06:47 +0100 (CET)
To: buildroot@buildroot.org,
	yann.morin.1998@free.fr
Date: Sun,  4 Dec 2022 15:06:42 +0100
Message-Id: <20221204140643.893075-1-pge@ik.me>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1670162808; bh=N59zpUu2oz7Vv6QVjxQWinJoYGotgto4E5TaCjkfINM=;
 h=From:To:Cc:Subject:Date:From;
 b=mMNrojFphV5n+rtvls0Tr+uwPtSMO0+/lZNuiLXsiGyaQ/06KZmYqilv0pYhygUXu
 /1lVqSzO/P8Zl02ulvJKDQtRUQR+BioyWA9dq8qtyX9wmx11MMsKbmXKgv0gfSgiXA
 c2vbw8zrZ1G65I1CLbfpj7y5i+fY3m5rBJ0ycnbo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=mMNrojFp
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: enable pkg specific go
 env also for download step
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
From: Patrick Gerber via buildroot <buildroot@buildroot.org>
Reply-To: Patrick Gerber <pge@ik.me>
Cc: Patrick Gerber <pge@ik.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q3VycmVudGx5IHBhY2thZ2Ugc2VjaWZpYyBnbyBlbnYgaXMgdXNlZCBvbmx5IGR1cmluZyBwYWNr
YWdlIGJ1aWxkIHN0ZXAuCgpHbyB2ZW5kZXJpbmcgaXMgZG9uZSBkdXJpbmcgdGhlIGRvd25sb2Fk
IHN0ZXAgYW5kIGl0J3Mgc29tZXRpbWVzIHJlcXVpcmVkCnRvIHNwZWNpZnkgcGFja2FnZSBzZWNp
ZmljIGdvIGVudiBhbHNvIGZvciB0aGlzIHN0ZXAuCgpGb3IgZXhhbXBsZSwgd2hlbiBpbXBvcnRp
bmcgY3VzdG9tIGdvIG1vZHVsZXMgd2hvIGFyZSBob3N0ZWQgb24gYSBwcml2YXRlCmhvc3QsIGl0
4oCZcyByZXF1aXJlZCB0byBzZXQgR09QUklWQVRFIHRvIGF2b2lkIHB1YmxpYyBzdW0gY2hlY2tp
bmcuCgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIEdlcmJlciA8cGdlQGlrLm1lPgotLS0KIHBhY2th
Z2UvcGtnLWdvbGFuZy5tayB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rIGIvcGFj
a2FnZS9wa2ctZ29sYW5nLm1rCmluZGV4IDBiM2RjM2QzMmYuLmNkYzY3YjMyYzAgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcGtnLWdvbGFuZy5taworKysgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKQEAg
LTg3LDcgKzg3LDggQEAgJCgyKV9QT1NUX1BBVENIX0hPT0tTICs9ICQoMilfR0VOX0dPTU9ECiAk
KDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9IGdvCiAkKDIpX0RMX0VOViArPSBcCiAJJCQoSE9T
VF9HT19DT01NT05fRU5WKSBcCi0JR09QUk9YWT1kaXJlY3QKKwlHT1BST1hZPWRpcmVjdCBcCisJ
JCQoJCgyKV9HT19FTlYpCiAKICMgRHVlIHRvIHZlbmRvcmluZywgaXQgaXMgcHJldHR5IGxpa2Vs
eSB0aGF0IG5vdCBhbGwgbGljZW5zZXMgYXJlCiAjIGxpc3RlZCBpbiA8cGtnPl9MSUNFTlNFLgot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
