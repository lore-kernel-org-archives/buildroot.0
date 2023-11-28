Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36EFC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 15:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D2E6058B;
	Tue, 28 Nov 2023 15:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D2E6058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zW0kTc2uVrQo; Tue, 28 Nov 2023 15:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCA261074;
	Tue, 28 Nov 2023 15:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CCA261074
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A34921BF470
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 15:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6420040447
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 15:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6420040447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCn8mfaZ2cji for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 15:49:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA290400D8
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 15:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA290400D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAAC460005;
 Tue, 28 Nov 2023 15:49:21 +0000 (UTC)
Date: Tue, 28 Nov 2023 16:49:20 +0100
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20231128164920.75ac695e@bootlin.com>
In-Reply-To: <20231127224139.35969-1-brandon.maier@collins.com>
References: <20231127224139.35969-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701186562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwR6oVdxYGxHhbG6b/n1Reu2VspMHFKyiGguQIpP1LM=;
 b=mWIoidD4rKQWPZaTQEd007LZAbAFTWg8Wg1pKrqnqTrxBZXR/z6TJPxgXBrCfgoMqP1ebZ
 tp0qnYAa0APVWOg+KwwQ5b0apYYeW9b5N+S79I1RVe8xDpcPJfaHyQ2NoAkD7RM83cAKAW
 4hFTyq5O6P3BC7G3AhLfeKt4f8hlHoFkzY6uoSM+siMjhDaFDze+p0fr4Ga/ev31uDZNb2
 3rBTStn2jCj1uH/CJ45bTQ6eroZcFDKPB6IACAHXmcgSQIuLDw69369T5HvKobq6qiCJhe
 UlzH3rUOSYvBrTrtVy0erBcuyitIw3cU/+OPQhXhOoYM21pA47npI8bHaivHSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mWIoidD4
Subject: Re: [Buildroot] [PATCH 1/1] ppd-merge: speed up per-package-rsync
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJhbmRvbiwKCk9uIE1vbiwgMjcgTm92IDIwMjMgMjI6NDE6MzkgKzAwMDAKQnJhbmRvbiBN
YWllciA8YnJhbmRvbi5tYWllckBjb2xsaW5zLmNvbT4gd3JvdGU6CgpbLi4uXQoKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IGluZGV4
IDA1OWU4NmFlMGEuLjM5NjhjYWJlYmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMu
bWsKPiArKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IEBAIC0yMTYsMTkgKzIxNiw5IEBAIGlm
ZXEgKCQoQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTKSx5KQo+ICAjICQzOiBkZXN0aW5hdGlv
biBkaXJlY3RvcnkKPiAgIyAkNDogbGl0ZXJhbCAiY29weSIgb3IgImhhcmRsaW5rIiB0byBjb3B5
IG9yIGhhcmRsaW5rIGZpbGVzIGZyb20gc3JjIHRvIGRlc3QKPiAgZGVmaW5lIHBlci1wYWNrYWdl
LXJzeW5jCj4gLQlta2RpciAtcCAkKDMpCgpTaG91bGRuJ3QgdGhlIG1rZGlyIGJlIGtlcHQgaGVy
ZSA/Cgo+IC0JJChmb3JlYWNoIHBrZywkKDEpLFwKPiAtCQlyc3luYyAtYSBcCj4gLQkJCS0taGFy
ZC1saW5rcyBcCj4gLQkJCSQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSksIFwKPiAtCQkJCS0t
bGluay1kZXN0PSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8sIFwKPiAtCQkJCSQoaWYg
JChmaWx0ZXIgY29weSwkKDQpKSwgXAo+IC0JCQkJCSQoZW1wdHkpLCBcCj4gLQkJCQkJJChlcnJv
ciBwZXItcGFja2FnZS1yc3luYyBjYW4gb25seSAiY29weSIgb3IgImhhcmRsaW5rIiwgbm90ICIk
KDQpIikgXAo+IC0JCQkJKSBcCj4gLQkJCSkgXAo+IC0JCQkkKFBFUl9QQUNLQUdFX0RJUikvJChw
a2cpLyQoMikvIFwKPiAtCQkJJCgzKSQoc2VwKSkKPiArCVBFUl9QQUNLQUdFX0RJUj0kKFBFUl9Q
QUNLQUdFX0RJUikgXAo+ICsJCSQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvcHBkLW1lcmdlLnNo
IFwKPiArCQkkKDIpICQoMykgJCg0KSAkKDEpCgpXaGF0IGRvIHlvdSB0aGluayBhYm91dCBwYXNz
aW5nIHRoZSBQRVJfUEFDS0FHRV9ESVIgYnkgcGFyYW1ldGVyIGluc3RlYWQgb2YKbWl4aW5nIGVu
dmlyb25tZW50IHZhbHVlcyBhbmQgcGFyYW1ldGVycyA/Cgo+ICBlbmRlZgo+ICAKPiAgIyBwcmVw
YXJlcyB0aGUgcGVyLXBhY2thZ2UgSE9TVF9ESVIgYW5kIFRBUkdFVF9ESVIgb2YgdGhlIGN1cnJl
bnQKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL3BwZC1tZXJnZS5zaCBiL3N1cHBvcnQv
c2NyaXB0cy9wcGQtbWVyZ2Uuc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+IGluZGV4IDAwMDAw
MDAwMDAuLmViMWNhZjllNTIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC9zY3JpcHRz
L3BwZC1tZXJnZS5zaApbLi4uXQoKCkJlc3QgcmVnYXJkcywKSGVydsOpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
