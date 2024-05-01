Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB874C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA90F81583;
	Wed,  1 May 2024 21:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJgB5RL6ffK5; Wed,  1 May 2024 21:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E6782124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E6782124;
	Wed,  1 May 2024 21:32:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAFE1BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366924040D
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkFb2KN8h9tu for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ED7C4031F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED7C4031F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ED7C4031F
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:32:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07CAC13F8A9;
 Wed,  1 May 2024 23:32:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:32:51 +0200
Date: Wed, 1 May 2024 23:32:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZjK1A_gYjr5Dctp6@landeda>
References: <20240501211300.1590881-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501211300.1590881-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714599174;
 bh=y5IeALS8dn/JUH46eoiaEJ2PLJGCQSIAWXvzebbp4ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OH+LgEpkzbdVHLoshh52xEggagqfQPO/J8Kx4zqUSHVr7u3QjaVM9f25Ly2U1i82Q
 LJa+YJYqWLz4sKleFBdVQkF+XYY7tNGl4Jh8MEKLytEhDVWYDZDl3q17ZWo2ZK1nuI
 MS6qnTBsTNHTK8bA5NxijoxICHdWWlc8RbIjRmStr3V8HVa/EZzUJrKNnzIY834mz7
 3NCvJ2lb/5BgCwJHJKAEPQdFp41OjFOBNYb8N+jbq8lsxn7Opd2W79KYnNbb8ZyKIY
 6SvUXg3+e0wapS5fhqIh7+EezTwf6F5kZSgTlNMVn2ahPH93ZvzWCBO1/SzhLN7JnY
 sF23YKxsrg5JQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OH+LgEpk
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Sebastian Weyer
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI0LTA1LTAxIDIzOjEyICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IFNlYmFzdGlhbiBlbWFpbCBhZGRyZXNzIGF0IFNtaWxlIGlzIGJvdW5jaW5n
LCBzbyBkcm9wIGl0Cj4gZnJvbSB0aGUgREVWRUxPUEVSUyBmaWxlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBERVZFTE9QRVJT
IHwgOCAtLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCAxMWZmZTE3ZjkyLi41ZDE5
ODU2N2Q4IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAg
LTI3NjksMTQgKzI3NjksNiBAQCBGOglzdXBwb3J0L21pc2MvdG9vbGNoYWluZmlsZS5jbWFrZS5p
bgo+ICBOOglTYW0gVm9zcyA8c2FtLnZvc3NAZ21haWwuY29tPgo+ICBGOglwYWNrYWdlL3JpcGdy
ZXAvCj4gIAo+IC1OOglTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4K
PiAtRjogICAgICBwYWNrYWdlL2FtbG9naWMtYm9vdC1maXAvCj4gLUY6CXBhY2thZ2UvbnVzaGVs
bC8KPiAtRjoJcGFja2FnZS9ydXN0LWJpbmRnZW4vCj4gLUY6CXBhY2thZ2Uvc3BpcnYtaGVhZGVy
cy8KPiAtRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX251Lm51Cj4gLUY6
CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbnUucHkKPiAtCj4gIE46CVPDqWJh
c3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAgRjoJ
Ym9hcmQvYXJtYWRldXMvCj4gIEY6CWNvbmZpZ3MvYXJtYWRldXMqCj4gLS0gCj4gMi40NC4wCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
