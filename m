Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C75C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94AC0400B9;
	Wed, 17 Jul 2024 21:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELbtwAljcWqS; Wed, 17 Jul 2024 21:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6575040C56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6575040C56;
	Wed, 17 Jul 2024 21:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83461BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A43A3406C3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rODeOJy2fHD for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 303354060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303354060E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 303354060E
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:53:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6250AFF802;
 Wed, 17 Jul 2024 21:53:23 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:53:22 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240717235322.5f90b271@windsurf>
In-Reply-To: <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721253203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZYE+kGFNgaA5yy2/2LrX7ZBSzYKAouVs7lqY9YRiOE=;
 b=MXV5Q1gH2kMfSDja2EiP1vb83DV6D2SToWet3W+G6k6+M2Dp4F7aV8y8Rbde/imNYkBYJX
 vr+FB3J8k2LlGVedr9A4EFV3sdebwf0ZFJhz6F8dsMgbDSg/mfcAWr98gK1L5bVHigltut
 kqsNqNDh/thXgR83bea/Xs/Ft+Rsr56ex6eXGtpHDMfQjS8MdttxjaHiXY6H3+YMzFE4I5
 0v1knRrgl8o1kErTLSxQcG8j6aQBRC4cNLPHBMGl7Q+5IvX1BoU7iNXM6GvdOMKBsZ7oLl
 cLAZywt7EfQ3UkgHHSmS4wTultBowv/SVjVqkBXSm92KOkCt1dGR+LMwSviArg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MXV5Q1gH
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri,
 Murali via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmxvcmlhbiwKCk9uIFdlZCwgMTcgSnVsIDIwMjQgMTQ6MzM6MDMgLTA3MDAKRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGlzIGxvb2tzIHNp
bWlsYXIgdG8gd2hhdCBJIGVuY291bnRlcmVkIGEgZmV3IGRheXMgYWdvLCB0aGUgYWN0dWFsIAo+
IGlzc3VlIHdhcyB0aGF0IGxpYnNhbml0aXplciB3YXMgcmVmZXJlbmNpbmcgc2NzaS9zY3NpLmgg
KHNvcnJ5IGFib3V0IHRoZSAKPiBtZXNzYWdlIGJlaW5nIGluIEZyZW5jaCwgaGUgaGUpOgoKSSB0
aGluayBJIHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgRnJlbmNoIDopCgo+IC4uLy4uLy4uLy4uL2xp
YnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nhbml0aXplcl9wbGF0Zm9ybV9saW1pdHNfcG9z
aXguY3BwOjEyODoxMDogCj4gZXJyZXVyIGZhdGFsZTogc2NzaS9zY3NpLmjCoDogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQo+ICAgIDEyOCB8ICNpbmNsdWRlIDxzY3NpL3Njc2kuaD4KPiAgICAg
ICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gY29tcGlsYXRpb24gdGVybWluw6llLgoKSSBh
bSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBzYW1lIGlzc3VlLiBJbmRlZWQsIEkgZG9uJ3Qgc2VlIHdo
eSB0aGlzCm1pc3NpbmcgPHNjc2kvc2NzaS5oPiB3b3VsZCBiZSBjYXVzZWQgYnkgQlIyX1RJTUVf
QklUU182ND15LgoKSG93ZXZlciwgSSBzZWUgc29tZSBob3N0LWdjYy1maW5hbCBmYWlsdXJlcyBp
biBvdXIgYXV0b2J1aWxkZXJzIHRoYXQKc2VlbSByZWxhdGVkIHRvIEJSMl9USU1FX0JJVFNfNjQs
IHN1Y2gKYXMgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZmYyL2ZmMmRi
ZmRhYmYwYmI2YTBkODJlYThhODAxMjJhYjk3ZmQ3NWJkM2YvYnVpbGQtZW5kLmxvZzoKCi9ob21l
L2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L2k2ODYtYnVpbGRy
b290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLXRpbWU2NC5oOjI2OjU6
IGVycm9yOiAjZXJyb3IgIl9USU1FX0JJVFM9NjQgaXMgYWxsb3dlZCBvbmx5IHdpdGggX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQiCgpJIGRvbid0IGZpbmQgeW91ciA8c2NzaS9zY3NpLmg+IGlzc3VlIGlu
IG91ciBhdXRvYnVpbGRlcnMgdGhvdWdoLiBEbwp5b3UgaGF2ZSBhIGRlZmNvbmZpZyB0aGF0IHJl
cHJvZHVjZXMgdGhlIGlzc3VlPyA8c2NzaS9zY3NpLmg+IGlzCnN1cHBvc2VkIHRvIGJlIGluc3Rh
bGxlZCBieSBnbGliYy4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
