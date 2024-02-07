Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94E5C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6B381E37;
	Wed,  7 Feb 2024 15:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NapIujot4hV8; Wed,  7 Feb 2024 15:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54BE81E46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54BE81E46;
	Wed,  7 Feb 2024 15:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCE291BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C81E181E37
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJ9cpf81Qqtz for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D62D81E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D62D81E1E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D62D81E1E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:40:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62BF960004;
 Wed,  7 Feb 2024 15:40:08 +0000 (UTC)
Date: Wed, 7 Feb 2024 16:40:07 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240207164007.566c2d6b@windsurf>
In-Reply-To: <23F59953-57A8-48F0-9809-4841CC10CA0F@benettiengineering.com>
References: <CAPi7W83eWKi4o5P8gGnYVUxDU1+u_+aXycSNHNRtkF_medg46g@mail.gmail.com>
 <23F59953-57A8-48F0-9809-4841CC10CA0F@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707320409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14WHCGeZiI1HvtAcWVf0JswWjUEETWOieEocIi2AdFg=;
 b=OKkLA5zPAPm4IDllzJkCYLDqxSi11ecBRkn2H+kuTDjIUsYKq0J7C+EETMICItSdKkXJjw
 0IUl91fjr7dN/may4KdXcW5Pd7U2lcHanA+PxSZaeZFZxnW71zOm/4R642f7DP/247QLSI
 ju+ssABI9d0jR7NuqMx4Zg/Zq0geTlNUUKUyeJjbcrOvCWAOYc0BbjTXKL0CRIp8cvFI0X
 OEcNnpgxRuUh+OvYhNSX8fCG8Mhg8ICJgyJ3bzMayGdNyAEmLDi/T1s0tHw7vn9az91LrO
 TG53k4yM+RUzztvbUeKZL3X6Q3v8TtQX1VSc2hrg8b/UZlZVVH6wyKmAbMu38g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OKkLA5zP
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix musl build
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKT24gRnJpLCAxMiBKYW4gMjAyNCAyMzozOTo1NSArMDEwMApHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+
ID4gU28gYmFzaWNhbGx5LCB3aGVuIEZSRUVCTF9OT19ERVBFTkQgaXMgc2V0IHRvIDEsIGZyZWVi
bCBzaGFsbCBub3QKPiA+IGRlcGVuZCBvbiBQUl9TZXRFcnJvciBhcyB0aGlzIGZ1bmN0aW9uIGlz
IGRlZmluZWQgYnkgbnNwci4KPiA+IAo+IFllcyBidXQgeW91ciBwYXRjaCBvbmx5IGNvbW1lbnQg
b3V0IFBSX1NldEVycm9yKCkgd2hpbGUgaXQgc2hvdWxkCj4gZGVwZW5kIG9uIEZSRUVCTF9OT19E
RVBFTkQgYXQgdGhpcyBwb2ludCBldmVuIGlmIEkgZGlkbuKAmXQgZ28gaW4gZGVwdGgKPiBhZ2Fp
biBhZnRlciAxLzIgeWVhcnMuCj4KPiBCdXQgdGhlIHBvaW50IGlzIHdoeSB0aGlzIG9ubHkgaGFw
cGVucyBvbiBtdXNsIGFuZCBzcGVjaWZpYwo+IGFyY2hpdGVjdHVyZXMuCgpUaGlzIGlzIGluZGVl
ZCB0aGUgcXVlc3Rpb24gdGhhdCB3ZSBuZWVkIHRvIGFuc3dlci4gV2h5IGlzIHRoYXQgbXVzbApv
bmx5PwoKQWNjb3JkaW5nIHRvIEZhYnJpY2UncyBleHBsYW5hdGlvbiwgaXQgc2hvdWxkIGhhcHBl
biBvbiBhbGwgcGxhdGZvcm1zLApyZWdhcmRpbmcgb2YgdGhlIEMgbGlicmFyeS4gU28gdGhlcmUg
aXMgc29tZXRoaW5nICJtb3JlIiB0byBpdCwgdGhhdCB3ZQpkb24ndCB5ZXQgdW5kZXJzdGFuZC4K
CkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
