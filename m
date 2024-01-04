Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98789C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E39A61B32;
	Thu,  4 Jan 2024 21:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E39A61B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZcF2DKjitUy; Thu,  4 Jan 2024 21:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D4AD61AED;
	Thu,  4 Jan 2024 21:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D4AD61AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8051BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4638D428AC
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4638D428AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFSwRT7XEygt for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:43:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E9CF42864
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E9CF42864
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAD631BF206;
 Thu,  4 Jan 2024 21:43:33 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:43:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104224333.163266ac@windsurf>
In-Reply-To: <20240104171447.10551-1-fontaine.fabrice@gmail.com>
References: <20240104171447.10551-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704404613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/5VnloxQ+tzsIaCcbxTZ3S8euebQelOkwJE6+7U+FQ=;
 b=iqGKV4JIjgWMPzt946wROJ5rrx2VivPnKTEXtCVIQzYtwQreRMDDgAi0G14qAITaQH5d3F
 xflEhERmOBzZFNt67X7kxkhgK62mcwTNQxoM5QnHkV23mfbH8v/HW4H9mOlq4O/6gumwr9
 ABkZPGt1qrNPSZm7llt3PPtqQxYht75slwjZtkhFsiLbP9ZIOkDNnfR9u+7zvN3wCTB/cb
 FkbfB3HSOXah2BHEqdSvtc3MwyoMFC+Nqau33MVYuYHMzoBQjYP7QPvF5uOUbJOb0aIfUS
 oO6tSfxjLlUidc1Rihk+zPWm/BzbKDh7xiRxu3DidSpYpOs45VsoHlISt/fUhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iqGKV4JI
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: fix build with
 linux >= 6.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgNCBKYW4gMjAyNCAxODoxNDo0NyArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgd2l0aCBsaW51eCA+PSA2LjQ6Cj4gCj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWls
ZC9pbnN0YW5jZS0xNS9vdXRwdXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMy8uL2lvY3Rs
LmM6MTI0OToxODogZXJyb3I6IOKAmHN0cnVjdCBjdGxfdGFibGXigJkgaGFzIG5vIG1lbWJlciBu
YW1lZCDigJhjaGlsZOKAmQo+ICAxMjQ5IHwgICAgICAgICAgICAgICAgIC5jaGlsZCAgICAgICAg
ICA9IHZlcmJvc2l0eV9jdGxfZGlyLAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fgo+
IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2Vj
YmY0MjZmNmIwZmY5MjBhNTFjMTY3NGIwODBjMzVlZGY1ZGI4NTkKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAg
Li4uMDEtemVyby1jb3B5LUZpeC1idWlsZC1mb3ItTGludXgtNi00LnBhdGNoIHwgMzcgKysrKysr
KysrKysrKysrKwo+ICAuLi5ldl92ZXJib3NpdHktRml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0
Y2ggfCA0NCArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcnlwdG9kZXYtbGludXgvMDAw
MS16ZXJvLWNvcHktRml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0Y2gKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvY3J5cHRvZGV2LWxpbnV4LzAwMDItY3J5cHRvZGV2X3ZlcmJvc2l0eS1G
aXgtYnVpbGQtZm9yLUxpbnV4LTYtNC5wYXRjaAoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
