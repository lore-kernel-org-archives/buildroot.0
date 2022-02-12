Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C47C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED109410E0;
	Sat, 12 Feb 2022 11:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 329rL0gJ0v4Q; Sat, 12 Feb 2022 11:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A3FF410D3;
	Sat, 12 Feb 2022 11:42:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60EB1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D515160ACB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tF00Dhh-mRL8 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:41:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43ABD6064D
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:41:59 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id IqmrnMgfhroAhIqmrnH6ri; Sat, 12 Feb 2022 12:41:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644666117; bh=JtGVttA0zEwD4TGWkaB2C8LEsOPNhVjI4bhFn6np6Sc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=kla1+ysW119sG1nO8NitMzCCFumzGHL63PkUfRNGuX2OJubnszm0u0rUcbQJl4vOs
 iGsqeje3uekH+AaHhv50bdK0l7o3QQAIgaJ57ldlrsBqO0/CdlfSRX5JsesorYjBWU
 kOfn7G9kA1GlsGYGksMjpFboKkZ4Ex8hUTm+jVCZWZb9MFurSZVKMmbMAGF47RbMso
 uiXjiunMlBgNL+KMwEpFC9RkDsnxTh4r0vgwA6+6Wq5ZEpAf+tNa7CgGlKPz5PPmRx
 24wOv2LS1bT5EZHF2PxWqtArnX52bPzJ0UGna9prUlJYS3LRypCcqYpiMlprlFoqmd
 DgeBcid0Qw7SA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 12 Feb 2022 12:41:56 +0100
Message-Id: <26185F3A-7ADE-4AEB-8769-01C07430ECD7@benettiengineering.com>
References: <CAOf5uwnxfXC5HoJcsgJGzLaO5hGoTvT0aAs61Ct9+=+CFZAn=g@mail.gmail.com>
In-Reply-To: <CAOf5uwnxfXC5HoJcsgJGzLaO5hGoTvT0aAs61Ct9+=+CFZAn=g@mail.gmail.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfPVCzG7o+j/8e9qdf39obEGyPrulzrpthyl9y0ebelh2O9jSMJONmr/S5HTZ6oV8/bL99YVaeUjar389bENzSYKk0/pWmKObi7y/ApLIfWaei4YlCkXH
 gtHilUFZ6tlFqCsnbrIvIf1wTFwvGtZl0DmwLgsPKR5faHjJ4Z8VjvF9XRtg57LFH67OG9cDfQMOUSMIcDOq391B0tj8ywt83pyTxP+1D11JVA+oIiy3Xra8
 qJWOyzwbCX3zAbEU1/rdHNu5rY5GeVgorgtuhXOlAAqMK4A50gAQl5VskWnKolsu/LQmt4lCqyvUPKx3EzzvaOoEwYroBBe0DSva3XX5j5dDM+BPx8bMRKcs
 bnf+CpJXk64Z78WG3lljKFldNwDqZLp3KiCxuSl2vfFvtFO5GLA=
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
 PRO
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCj4gSWwgZ2lvcm5vIDEyIGZlYiAyMDIyLCBhbGxlIG9yZSAxMToxMiwgTWlj
aGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiBo
YSBzY3JpdHRvOgo+IAo+IO+7v0hpIGFsbAo+IAo+IFNob3VsZCBJIG5lZWQgdG8gcmVzZW5kPyBh
bnl0aGluZyBpcyBtaXNzaW5nIG5vdz8KCk5vLCBvbmx5IG5lZWQgdG8gd2FpdCB1bnRpbCBtYWlu
dGFpbmVycyBzdWJtaXQgaXQgb3IgZmluZCBzb21ldGhpbmcgSSBoYXZlbuKAmXQgZm91bmQoaG9w
ZSBub3QpLgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBNaWNoYWVsCj4gCj4+IE9uIE1vbiwg
SmFuIDMxLCAyMDIyIGF0IDU6MjAgUE0gQXJpZWwgRCdBbGVzc2FuZHJvCj4+IDxhcmllbC5kYWxl
c3NhbmRyb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4gCj4+IEhpIE1pY2hhZWwsIGFsbCwKPj4g
Cj4+PiBPbiAxLzMxLzIyIDExOjU1LCBNaWNoYWVsIFRyaW1hcmNoaSB3cm90ZToKPj4+IEFkZCBp
bml0aWFsIHN1cHBvcnQgZm9yIGlNWDhNTiBCU0ggU01NIFMyIFBSTyBib2FyZDoKPj4+IAo+Pj4g
LSBMaW51eDogdjUuMTctcmMxCj4+PiAtIFVib290IDIwMjItMDEtcmMxIChyZWZlcmVuY2UgdHJl
ZSkKPj4+IC0gRGVmYXVsdCBwYWNrYWdlcyBmcm9tIGJ1aWxkcm9vdAo+Pj4gCj4+PiBodHRwczov
L3d3dy5hcGVydGlzLm9yZy9yZWZlcmVuY2VfaGFyZHdhcmUvaW14OG1uX2JzaF9zbW1fczJwcm9f
c2V0dXAvCj4+PiAKPj4+IEFkZCBBcmllbCBEJ0FsZXNzYW5kcm8gYXMgY28tbWFpbnRhaW5lciwg
d2Ugd29yayB0b2dldGhlciBvbgo+Pj4gcGxhdGZvcm0gbWFpbmxpbmUKPj4+IAo+Pj4gQnVpbGQg
YW5kIHRlc3RlZCB1c2luZzoKPj4+IGRvY2tlciBwdWxsIHJlZ2lzdHJ5LmdpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvYmFzZToyMDIyMDEwNS4yMzE0Cj4+PiAKPj4+IENjOiBBcmll
bCBEJ0FsZXNzYW5kcm8gPGFyaWVsLmRhbGVzc2FuZHJvQGNvbGxhYm9yYS5jb20+Cj4+PiBDYzog
SmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+PiBDYzogSGVpa28gVGhp
ZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+Pj4gQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gU2ln
bmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Cj4+IAo+PiBUZXN0ZWQtYnk6IEFyaWVsIEQnQWxlc3NhbmRybyA8YXJpZWwuZGFsZXNzYW5k
cm9AY29sbGFib3JhLmNvbT4KPiAKPiAKPiAKPiAtLSAKPiBNaWNoYWVsIE5henphcmVubyBUcmlt
YXJjaGkKPiBDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKPiBNLiArMzkgMzQ3
IDkxMyAyMTcwCj4gbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiAKPiBBbWFydWxhIFNvbHV0aW9ucyBCVgo+IEpvb3AgR2Vl
c2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKPiBULiArMzEgKDApODUgMTExIDkx
NzIKPiBpbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
