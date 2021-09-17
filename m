Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D5DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:53:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C0660F6E
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69C0660F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 396CA61C09;
	Fri, 17 Sep 2021 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUTjLfVOUu5n; Fri, 17 Sep 2021 19:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C4261C01;
	Fri, 17 Sep 2021 19:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FE621BF350
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9018361C0B
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBdvjwSS_zvE for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 19:53:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77D8F61BEC
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 19:53:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CD27F5FF96;
 Fri, 17 Sep 2021 21:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631908385;
 bh=zKXsSwpzVPlF+Gm7FKpnLMoeNT+SciCjuKysATbNMqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e+S5lVniBQc4TjXcnrMMvt41f/insgVKzwpZA7ns6bor9KURN0d5z1sq+7xrP4gY3
 0uk9jTNesDHrFMj7eRtNODnGhcx927A4NWzHhAEtIa/Ulpslhed9u8PptHXyytEK0G
 VV4uOW3s3qYt76agYH1nTotEqcd+1tUZPTOFD+Y6llPGbQ1b7c8VMmwKL+nusaRTAS
 XJ3G+17LQ19XL8cneX/NMLkO4l7zFdn4J8eEu3sAQ/0jC/HrUeGkxjR/Yd3XqIOGE6
 bwlIEgHSqB6g8NCA1u7Aq9CFybiCpdUHw52tHUmnNl/uWC6b8Fhtz0amVWFO91fQff
 +HY6xCQOS6Yjw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 21:52:58 +0200
Date: Fri, 17 Sep 2021 21:52:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210917195258.GW1053080@scaer>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-3-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914093457.1389174-3-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/8] package/xorriso: build host variant
 with zlib support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMTQgMTE6MzQgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IFdlIHdpbGwgc29vbiB1c2UgeG9ycmlzbyBpbiB0aGUgSVNPOTY2MCBpbWFn
ZSBnZW5lcmF0aW9uIHN1cHBvcnQsIGFuZAo+IHRoaXMgcmVxdWlyZXMgaGF2aW5nIHpsaWIgc3Vw
cG9ydCBpbiBob3N0LXhvcnJpc28uCj4gCj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8
a29yeS5tYWluY2VudEBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS94b3JyaXNvL3hvcnJpc28u
bWsgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hvcnJpc28veG9ycmlzby5tayBiL3BhY2th
Z2UveG9ycmlzby94b3JyaXNvLm1rCj4gaW5kZXggN2IzOGYyNjhiYi4uZmYzNDE0ZmQ4YSAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL3hvcnJpc28veG9ycmlzby5tawo+ICsrKyBiL3BhY2thZ2UveG9y
cmlzby94b3JyaXNvLm1rCj4gQEAgLTEyLDE0ICsxMiwxNiBAQCBYT1JSSVNPX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HIENPUFlSSUdIVAo+ICAjIERpc2FibGUgZXZlcnl0aGluZyB1bnRpbCB3ZSBh
Y3R1YWxseSBuZWVkIHRob3NlIGZlYXR1cmVzLCBhbmQgYWRkIHRoZSBjb3JyZWN0Cj4gICMgaG9z
dCBsaWJyYXJpZXMKPiAgSE9TVF9YT1JSSVNPX0NPTkZfT1BUUyA9IFwKPiArCS0tZW5hYmxlLXps
aWIgXAo+ICAJLS1kaXNhYmxlLXhhdHRyLWgtcHJlZi1hdHRyIFwKPiAtCS0tZGlzYWJsZS16bGli
IFwKPiAgCS0tZGlzYWJsZS1saWJiejIgXAo+ICAJLS1kaXNhYmxlLWxpYmNkaW8gXAo+ICAJLS1k
aXNhYmxlLWxpYnJlYWRsaW5lIFwKPiAgCS0tZGlzYWJsZS1saWJlZGl0IFwKPiAgCS0tZGlzYWJs
ZS1saWJhY2wKPiAgCj4gK0hPU1RfWE9SUklTT19ERVBFTkRFTkNJRVMgPSBob3N0LXpsaWIKPiAr
Cj4gICMgbGliY2RpbyBkb2Vzbid0IG1ha2Ugc2Vuc2UgZm9yIExpbnV4Cj4gICMgaHR0cDovL2xp
c3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2J1Zy14b3JyaXNvLzIwMTctMDQvbXNnMDAwMDQuaHRt
bAo+ICBYT1JSSVNPX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS1saWJjZGlvCj4gLS0gCj4gMi4yNS4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBs
aXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
