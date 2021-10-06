Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86928C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:37:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44B5610A5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E44B5610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4D3401FA;
	Wed,  6 Oct 2021 15:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smK1tYsmw6fH; Wed,  6 Oct 2021 15:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C815A4011C;
	Wed,  6 Oct 2021 15:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2221BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 178E34011C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vvw8S0WfrsHb for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:37:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A00400C1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:37:20 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id Y8yrm3wPvXRKtY8yrmcjOj; Wed, 06 Oct 2021 17:37:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633534638; bh=d3MPQKuHihjBr0yUZIUxn4KHolHHm2cg26lk1W9ImT4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=kQll+eoLDlU/XAPjTZIlhxIoXVAjOy2ctPdCzFGYt8LIaurbt3W95Cj4GWCATHKyg
 A4Y2WECudFEywFU7dY660fi4NCGugucjfkp9TVATKsCe8+tQPozynlzUigNk7sgDIS
 XNUK2u9pre/cOIhEMZIIoeG7ZfBTcOt7bDAwJ81l6+syxEBiSJ3VwzJj8GZgLKiwWY
 S+AHyukmkIE10tSc+fgX8/Q4+X2CZKoBBSge7LamexT1BpMchLwjg862g8f16V0up2
 FDnMIJCStmqUxALbf+rliqm/8/9OpDkK7Kow34uiwkDpDXuIblXVFGtnePxaRg+CtU
 2m/+56DflE1YQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 6 Oct 2021 17:37:17 +0200
Message-Id: <B953BF6A-091B-4F2C-9786-C25870BA7497@benettiengineering.com>
References: <87y27641j1.fsf@dell.be.48ers.dk>
In-Reply-To: <87y27641j1.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfBirFCxSodgtI+Wq7JSJKpDUQXHvL7RtxUYWCgd29OtATgNPrzZm18LDZMpax/dJ2/+eo2nSZmA+jvU8tBS8e7fWOBndfl/204NIK0udSvZ8oe/hsZcN
 /LGQSLRaiDu/i1pbYzkXFbzCHJCm7jtfBcLBsYvMx9yUDq04HElXhsj9v0/mVWcyaGvENO6viSjlPIWKl/W0vWz7BHZ48Axyv5RMPpjc6snJ/HVDJ63jKW9Q
 bJ84LQZMTH1ozmKMzxM5blIV/mbdtwZkBxDaR+rEjQDZi+4sxq4XGsxs/kpHpYpbWm5RejSx53jRhZT5R+o9gg==
Subject: Re: [Buildroot] [PATCH 2/2] package/udisks: bump version to 2.9.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDYgb3R0IDIwMjEsIGFsbGUgb3JlIDE3OjI3LCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/Cj4+IAo+Pj4+Pj4gIkdp
dWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+IHdyaXRlczoKPiAKPj4gUmVsZWFzZSBOb3RlczoKPj4gYGBgCj4+IFRoaXMgcmVsZWFz
ZSB3YXMgZm9jdXNlZCBvbiBzdGFiaWxpdHkgYW5kIGhhcmRlbmluZywgbm90YWJseSBmaXhpbmcg
c29tZQo+PiBsb25nLXN0YW5kaW5nIHJhY2UgY29uZGl0aW9ucyBhbmQgbWVtb3J5IGxlYWtzLiBE
ZWZhdWx0IG1vdW50IG9wdGlvbnMgZ290Cj4+IHR3ZWFrZWQgdG93YXJkcyBkYXRhIHNhZmV0eS4K
PiAKPj4gQWxsIHVzZXJzIGFyZSBzdHJvbmdseSBhZHZpc2VkIHRvIHVwZ3JhZGUuCj4+IGBgYAo+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4KPiAKPiBJIHRha2UgaXQgdGhpcyBkb2Vzbid0IGRlcGVuZCBvbiB0
aGUgbGlibnNzIGJ1bXAgZXZlbiB0aG91Z2ggeW91IHNlbnQKPiB0aGVtIGluIHRoZSBzYW1lIHNl
cmllcz8KClllcyBpdOKAmXMgY29ycmVjdCwgSSBoYWQgdG8gc2VuZCB0aGVtIHNlcGFyYXRlbHkg
YW5kIG5vdCBhcyBzZXJpZXMuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkKCj4gCj4gQ29t
bWl0dGVkIHRvIDIwMjEuMDgueCwgdGhhbmtzLgo+IAo+IC0tIAo+IEJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
