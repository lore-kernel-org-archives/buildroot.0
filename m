Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519A3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474CF60F38
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 474CF60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E02754037E;
	Sun, 10 Oct 2021 13:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OvTPMeERBVS; Sun, 10 Oct 2021 13:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D0C840368;
	Sun, 10 Oct 2021 13:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74FC91BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE39400FD
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7I-vW5OevRL for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 13:44:01 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id E957B400DE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 13:44:00 +0000 (UTC)
Received: from smtpclient.apple ([151.18.149.226])
 by Aruba Outgoing Smtp  with ESMTPA
 id ZZ0YmZDicXvvIZZ0Zmte0l; Sun, 10 Oct 2021 15:36:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633873016; bh=TQVVq2L5pM9zMJOMncpZxEGn1V3ywu85lIJp+MkEsiQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=WN7skD9YAeKrI6tXlYkD9lAWPUEhQfYZ5ZOFiNyqL6ofrHcebOaNMjJN8TwzVhjAV
 1a2bym3xbQMxyeA60V0bMQQTbJQlApv4oOkSa9MXtKjjBxF/l1Ih1LCH+uuvdp2wUF
 6gWl6uuRfgUsX+b6qwqHOV1yonu0WLOHxNxB4uwU97K9oSk0aUu03y6PFBB5okV5tr
 qFhATxOrGzk618Vny9Zd3jycoYJ2R2vOvdgoIUR3V1/M/HQEz9GNUPWXSV81yx6xXr
 +UIXLXj5MWrWJf+OWbbimKBFh5tDu5Ry7os66wJg+jLJZFVTDckV5SikLVt8OsBNmv
 GLOf1fRc6iyMQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 10 Oct 2021 15:36:54 +0200
Message-Id: <E97B49F2-2E0E-4151-8B69-8E1415E0212D@benettiengineering.com>
References: <87bl3xs2z8.fsf@dell.be.48ers.dk>
In-Reply-To: <87bl3xs2z8.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfJFWn7/1jYbMsDPP3IHtYrzGiWIMRqu7AVFEBPJJC3f6MtgkmVSosFqMU2MOPeRubh80+NcxnHOGzWJOv5wl9uKd5bG/mZ2l6vouoyznjvr7YDyGU37U
 kpZ/kPNOaCWE1gc8OhU4EtSO2rNSG1i64oEP46bGf9EAC8onWS4lxTsm3h58FyNhQ/LfIMOFWX+ejw7Jwla3ntQllVnWHKqVXSpPmV5cffIludkpDW0afeUf
 8XhTSuDhZgHWUOA0KQukAf5h/0vnoPNW0gLYmB3T1ME4xf+HIk1rLkT9l2wEDq2K9KGdIZ+SZEISUofo+j0jScyG0d9RlkDV6zYlH0TQGCWsWs/C089ByfGx
 3UAQ/2H37S7FqYBEvEogy6kF98H5UNw31NetZI2SagAiGHKrmqBzGBdJVqsM06BvGAaBEjIB
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: disable package if
 affected from gcc bug 43744
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgo+IElsIGdpb3JubyAxMCBvdHQgMjAyMSwgYWxsZSBvcmUgMTA6MjMsIFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu78K
Pj4gCj4+Pj4+PiAiR2l1bGlvIiA9PSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGlzIHBhY2thZ2UgaXMgYWZmZWN0
ZWQgYnkgZ2NjIGJ1ZyA0Mzc0NCBhbmQgSSBoYXZlIG5vdCBmb3VuZCBhIHdvcmsKPj4gYXJvdW5k
IGZvciBpdChpLmUuIHRoZSBjb21tb24gLU8wIHdlIHVzZSBvciBvdGhlciksIHNvIGxldCdzIGRp
c2FibGUgaXQgaWYKPj4gZ2NjIGhhcyBzdWNoIGJ1Zy4KPiAKPj4gRml4ZXM6Cj4+IGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzFkYi8xZGI2YzU5Yzk4ZTNjMDlmYTEzMjc3
MDc2ZWUyZmJlNzk2N2YxZjZiLwo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAKPiBXaGF0IGFib3V0IHRo
ZSByZXZlcnNlIGRlcGVuZGVuY2llcywgRS5HLiBncXJ4PwoKU29ycnksIGV2ZXJ5IHRpbWUgSSBm
b3JnZXQgYWJvdXQgcmV2ZXJzZSBkZXBlbmRlbmN5LiBUb25pZ2h0IEnigJltIGdvaW5nIHRvIGZp
eCBpdAoKQmVzdCByZWdhcmRzCgpHaXVsaW8KCj4gCj4gcGFja2FnZS9ncXJ4L0NvbmZpZy5pbjog
c2VsZWN0IEJSMl9QQUNLQUdFX0dOVVJBRElPCj4gCj4gLS0gCj4gQnllLCBQZXRlciBLb3JzZ2Fh
cmQKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
