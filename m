Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C235EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE9340BD4;
	Thu,  3 Nov 2022 22:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE9340BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATmuTvwai-N7; Thu,  3 Nov 2022 22:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7580B40BDA;
	Thu,  3 Nov 2022 22:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7580B40BDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 914931BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5D281E0E
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5D281E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJdpDoRZIVMC for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:45:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5037881BB0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5037881BB0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:45:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2B6531C0007;
 Thu,  3 Nov 2022 22:45:48 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Thu,  3 Nov 2022 23:45:38 +0100
Message-Id: <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667515548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkyscDVsvkMqtHlcKI1Xbbi28EkR7yBjtApeDrM/jrw=;
 b=lNXBRkNix4Tstyeej6uBjwfMswyLcTh5ClOxrjncvgRKVJ6B+RPyrZNTZcFsovNlQs51eC
 //3fMjH5dKeEhafy1GLfjlIt55AA32LQHfQYcqzlnlVWH9NeEvH3K7mrG97JWCW/r8bC8A
 BzVnBWkfLqQJs4rmtcBQmCYGpFzzH0t+qZM8AEud8xPmcOR+LkktCARoPblelYqRi9ZpM+
 hul5Hwk3eMm3chJ8DXWOOykU7k367N+RD14EEAitUPcTUFEIdix0IfOP/lsEyANQDNNRfK
 zQj+g/6eMLugyqIIn2w5iNbAvfmhxi8PD+U5EJlKXQEMsm2Y+n5oD1zB9qM3qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lNXBRkNi
Subject: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q0FSR09fSE9NRSBpcyB3aGVyZSBDYXJnbyBzdG9yZXMgaXRzIGRvd25sb2FkZWQgYXJ0ZWZhY3Rz
LiBTZWUKaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9jYXJnby9yZWZlcmVuY2UvZW52aXJvbm1l
bnQtdmFyaWFibGVzLmh0bWw6CgogIENBUkdPX0hPTUUg4oCUIENhcmdvIG1haW50YWlucyBhIGxv
Y2FsIGNhY2hlIG9mIHRoZSByZWdpc3RyeSBpbmRleCBhbmQKICBvZiBnaXQgY2hlY2tvdXRzIG9m
IGNyYXRlcy4gQnkgZGVmYXVsdCB0aGVzZSBhcmUgc3RvcmVkIHVuZGVyCiAgJEhPTUUvLmNhcmdv
ICglVVNFUlBST0ZJTEUlXC5jYXJnbyBvbiBXaW5kb3dzKSwgYnV0IHRoaXMgdmFyaWFibGUKICBv
dmVycmlkZXMgdGhlIGxvY2F0aW9uIG9mIHRoaXMgZGlyZWN0b3J5LiBPbmNlIGEgY3JhdGUgaXMg
Y2FjaGVkIGl0CiAgaXMgbm90IHJlbW92ZWQgYnkgdGhlIGNsZWFuIGNvbW1hbmQuIEZvciBtb3Jl
IGRldGFpbHMgcmVmZXIgdG8gdGhlCiAgZ3VpZGUuCgpXZSBjdXJyZW50bHkgbWFrZSBpdCBwb2lu
dCB0byAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbywgYnV0IHRoaXMgaGFzIGEKbnVtYmVyIG9mIGRy
YXdiYWNrczoKCiAoMSkgSXQgaXMgbm90IHNoYXJlZCBiZXR3ZWVuIEJ1aWxkcm9vdCBidWlsZHMu
IEVhY2ggQnVpbGRyb290IGJ1aWxkCiAgICAgd2lsbCByZS1kb3dubG9hZCB0aGUgY3JhdGVzIGlu
ZGV4LCBhbmQgdGhlIGNyYXRlcyB0aGVtc2VsdmVzLAogICAgIHVubGVzcyBvZiBjb3Vyc2UgdGhl
IGZpbmFsIHZlbmRvcmVkIHRhcmJhbGwgaXMgYWxyZWFkeSB0aGVyZS4KCiAoMikgV2l0aCBCUjJf
UEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eSwgaXQgaXMgZXZlbiB3b3JzZTogQ0FSR09fSE9NRQog
ICAgIGlzIG5vdCBldmVuIHNoYXJlZCBiZXR3ZWVuIHBhY2thZ2VzLCBhcyAkKEhPU1RfRElSKS9z
aGFyZS9jYXJnbwogICAgIGlzIHBlciBwYWNrYWdlLiBTbyBlYWNoIHBhY2thZ2UgaW4gdGhlIGJ1
aWxkIHRoYXQgbmVlZHMgdmVuZG9yaW5nCiAgICAgb2YgQ2FyZ28gY3JhdGVzIHdpbGwgZG93bmxv
YWQgdGhlIGNyYXRlcyBpbmRleCBhbmQgdGhlIGNyYXRlcyBpbgogICAgIGl0cyBvd24gQ0FSR09f
SE9NRSBsb2NhdGlvbi4KClRvIHNvbHZlIHRoaXMsIHRoaXMgY29tbWl0IG1vdmVzIENBUkdPX0hP
TUUgaW50byAkKERMX0RJUiksIHNvIHRoYXQgaXQKaXMgc2hhcmVkIGJldHdlZW4gYnVpbGRzIGFu
ZCBwYWNrYWdlcy4KCkV2ZW4gdGhvdWdoIG5vdCB0aGUgYmVzdC9tb3N0IGF1dGhvcml0YXRpdmUg
c291cmNlLApodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NhcmdvL2lzc3Vlcy82OTMwIGlu
ZGljYXRlcyB0aGF0IHRoZXJlIGlzCmEgbG9jayB3aGVuIGFjY2Vzc2luZyBDQVJHT19IT01FLCBi
ZWNhdXNlIGEgdXNlciBldmVuIGNvbXBsYWlucyB0aGF0CnRoaXMgbG9jayBoYXMgZXZlbiBiZWNv
bWUgbW9yZSBjb2Fyc2UtZ3JhaW5lZCB0aGFuIGl0IHVzZWQgdG8gYmUKKHdoaWNoIGZvciB1cyBp
cyBmaW5lLCBpdCBqdXN0IG1lYW5zIHRoYXQgdHdvIENhcmdvIGZldGNoIG9wZXJhdGlvbnMKZnJv
bSB0d28gZGlmZmVyZW50IHBhY2thZ2VzIHdpbGwgYmUgc2VyaWFsaXplZCwgbm90IGEgYmlnIGRl
YWwpLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT4KLS0tCiBwYWNrYWdlL3BrZy1jYXJnby5tayB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGtnLWNhcmdvLm1rIGIvcGFja2FnZS9wa2ctY2FyZ28ubWsKaW5kZXggNTkyMzcyNWY1ZS4uYzNk
MWUzNDMwOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctY2FyZ28ubWsKKysrIGIvcGFja2FnZS9w
a2ctY2FyZ28ubWsKQEAgLTIwLDcgKzIwLDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLUJSX0NBUkdPX0hPTUUgPSAkKEhPU1RfRElSKS9zaGFyZS9jYXJnbworQlJfQ0FSR09fSE9N
RSA9ICQoRExfRElSKS8uY2FyZ28KIAogUEtHX0NPTU1PTl9DQVJHT19FTlYgPSBcCiAJQ0FSR09f
SE9NRT0kKEJSX0NBUkdPX0hPTUUpCi0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
