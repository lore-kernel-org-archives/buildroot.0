Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A27C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23BC78472E;
	Thu, 10 Mar 2022 15:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sePvtfa7G7G; Thu, 10 Mar 2022 15:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315FD8471F;
	Thu, 10 Mar 2022 15:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1CC31BF2BA
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E06A041905
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDRR-pfWLsV5 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 15:21:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57AC9418FC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 15:21:08 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8E8420012;
 Thu, 10 Mar 2022 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646925664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z/r71kUhp+Iw/sMaCCapBZYoy7YCEmnoRQrmYKImeGk=;
 b=MwFpo4TwM2zKtmEl25B6fDXgs4VYSgQeTKh6cq6xqod+v+DxCXt1GAS5h5YA/Pb3XJCja/
 WARB+rn4KmN7meq42n8GG7UvnBYEHo3SdPCjCtPT7Ra3cnvo/H7UTfTpEPxpPFxZGFeTm+
 t5TUxJPsg8TNli3zcKQFjXkkoXWgY/Cme+pITcDxftHui9ToLTJqw7IRsggJL60XE26b+v
 sBjw+Cp8OrHIAW49u71y1YVQhO/TgoKK09dXVb7cZesNytlDXlQtbBHpuzEZ6Brg9usfHh
 6pKtxg428VWrAojfr4aU4Y5X78XCwOssSiKQJkjoRjCel4WkNx2izNX1BP99ZQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 16:20:46 +0100
Message-Id: <20220310152048.633340-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/ragel: new package
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhbiBob3N0LW9ubHkgcGFja2FnZSB0aGF0IGRvZXMgcHJlcHJvY2Vzc2luZyB0byAu
cmwgZmlsZXMgdG8KdHVybiB0aGVtIGludG8gLmMgb3IgLmNwcCBmaWxlcy4KCkluaXRpYWxseSBh
ZGRlZCB0byBzdXBwb3J0IHBhY2thZ2Uvcm9jLgoKU2VlIGh0dHBzOi8vd3d3LmNvbG0ubmV0L29w
ZW4tc291cmNlL3JhZ2VsLyBmb3IgdGhlIHByb2plY3QncyBob21lIHBhZ2U6CgpSYWdlbCBjb21w
aWxlcyBleGVjdXRhYmxlIGZpbml0ZSBzdGF0ZSBtYWNoaW5lcyBmcm9tIHJlZ3VsYXIgbGFuZ3Vh
Z2VzLgpSYWdlbCB0YXJnZXRzIEMsIEMrKyBhbmQgQVNNLiBSYWdlbCBzdGF0ZSBtYWNoaW5lcyBj
YW4gbm90IG9ubHkKcmVjb2duaXplIGJ5dGUgc2VxdWVuY2VzIGFzIHJlZ3VsYXIgZXhwcmVzc2lv
biBtYWNoaW5lcyBkbywgYnV0IGNhbgphbHNvIGV4ZWN1dGUgY29kZSBhdCBhcmJpdHJhcnkgcG9p
bnRzIGluIHRoZSByZWNvZ25pdGlvbiBvZiBhIHJlZ3VsYXIKbGFuZ3VhZ2UuIENvZGUgZW1iZWRk
aW5nIGlzIGRvbmUgdXNpbmcgaW5saW5lIG9wZXJhdG9ycyB0aGF0IGRvIG5vdApkaXNydXB0IHRo
ZSByZWd1bGFyIGxhbmd1YWdlIHN5bnRheC4KClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8
dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9yYWdlbC9yYWdlbC5oYXNoIHwg
IDMgKysrCiBwYWNrYWdlL3JhZ2VsL3JhZ2VsLm1rICAgfCAxOCArKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvcmFnZWwvcmFnZWwuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcmFnZWwv
cmFnZWwubWsKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhZ2VsL3JhZ2VsLmhhc2ggYi9wYWNrYWdl
L3JhZ2VsL3JhZ2VsLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
MzMyZjU4NzQzMgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcmFnZWwvcmFnZWwuaGFzaApA
QCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjb21wdXRlZDoKK3NoYTI1NiAgNWYxNTZlZGI2NWQy
MGI4NTZkNjM4ZGQ5ZWUyZGZiNDMyODU5MTRkOWFhMmI2ZWM3NzlkYWMwMjcwY2Q1NmMzZiAgcmFn
ZWwtNi4xMC50YXIuZ3oKK3NoYTI1NiAgMDVhODc5NzVhY2NiNTM5Mzk5ZDBjOGE0ZjQ0MDJhYzI3
YTY3NjJmYjFlNGYzMWQwNGQ0NTVhOGJlZTNlMzY5MyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9yYWdlbC9yYWdlbC5tayBiL3BhY2thZ2UvcmFnZWwvcmFnZWwubWsKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDc2YWZmNWRhNAotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcmFnZWwvcmFnZWwubWsKQEAgLTAsMCArMSwxOCBAQAorIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKyMKKyMgcmFnZWwKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1JBR0VM
X1ZFUlNJT04gPSA2LjEwCitSQUdFTF9TSVRFID0gaHR0cHM6Ly93d3cuY29sbS5uZXQvZmlsZXMv
cmFnZWwvCitSQUdFTF9MSUNFTlNFID0gR1BMLTIuMAorUkFHRUxfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcKK1JBR0VMX0NPTkZfT1BUUyA9IFwKKwktLWRpc2FibGUtc2lsZW50LXJ1bGVzIFwKKwkt
LWRpc2FibGUtbWFudWFsIFwKKwktLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZworUkFHRUxf
REVQRU5ERU5DSUVTID0KK0hPU1RfUkFHRUxfREVQRU5ERU5DSUVTID0KKworJChldmFsICQoaG9z
dC1hdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
