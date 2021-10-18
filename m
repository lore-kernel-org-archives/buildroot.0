Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670BBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:59:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74F86108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B74F86108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 860E740164;
	Mon, 18 Oct 2021 19:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVlgV7h6xOua; Mon, 18 Oct 2021 19:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 880D44046F;
	Mon, 18 Oct 2021 19:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F84B1BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08FCC60654
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqAror9dRDs8 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:59:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4948605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:59:43 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id cYnNm3c3UXRKtcYnOmoqEt; Mon, 18 Oct 2021 21:59:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634587182; bh=Q29O716Qv4fpAF99rzSZJMKufWkEFmx66xrGKHWGaoQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=EvxEGftim4PmfSD7mbr1mEYOppjy+tTtjOugPVt1d6b3iySLXpjfIkBHD+0SLFW00
 /RxILGNMBOjn63ApWCRhCQlBws3VHMCYdvWzloWi82liIAosGhfv0a3ejKCCQr2cZz
 Z9Y0M44hmQuw62BlcvlnYWSL3qBI883Xpx6ZPdSk+/VMU5RRjjTudlUzPDkqwmx1en
 ShOZguE5JJYjTcC6mKSKBJeU9HOqS7EpLqBB6N4pQf6fUf3RziqWY7A895w9F8cT13
 i2I33m3Vuqo5v7zc5SKcIKylVwHz0VpeQGUDDdJRA/Wg2WIFwdBbiK1j1xTUVr6zgm
 4KK6/ai0X+vZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 18 Oct 2021 21:59:41 +0200
Message-Id: <41CC9CB4-4706-4071-B3A4-3268638ADFC8@benettiengineering.com>
References: <20211018214535.5743fd67@windsurf>
In-Reply-To: <20211018214535.5743fd67@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfOTAbD0WiAI3X5xCeb3f7Uzvha8cMDkP+XKE8c2uhx5X2Du4JGpwujaMqvvTYBFLAq2g9Peb6zWeWwtbvpPTrICXoLAVBVTsi1JM33jX8AaMDNEMZOfa
 DjEYBwxSSEh/1fTdF7R9JDQ+TmdBm6iUi94Vxk/AfkUNl1apRL/8DHXwmYt/7pWO7N8MPCnc46WpPoVEVwTdgO++yRPduzpBh6lTeW2J2pDrc5m8piU2nJoO
 S3R3TKA1fUZN/XGrCjlBSI3Rsc7ZA5NRb9nN7lNilzdJSEPHjAYq1Z22hgMyzD6f
Subject: Re: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino: fix mali
 not working because Linux version >= 4.20
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKPiBJbCBnaW9ybm8gMTggb3R0IDIwMjEsIGFsbGUgb3JlIDIxOjQ1LCBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v09uIEZyaSwgMTUgT2N0IDIwMjEgMTA6MTU6MTQgKzAyMDAKPiBHaXVsaW8gQmVuZXR0
aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gCj4+IFNp
bmNlIG9uIG9saW51eGlub19saW1lL2xpbWUyIHdlIGhhdmUgYSBMaW51eCB2ZXJzaW9uID49IDQu
MjAgd2UgbmVlZCB0bwo+PiBwYXNzIGRybV9rbXNfaGVscGVyLmRybV9sZWFrX2ZiZGV2X3NtZW09
MSB0byBrZXJuZWwgY29tbWFuZC1saW5lIHRoYXQKPj4gcmVhbGx5IGVuYWJsZXMgRFJNX0ZCREVW
X0xFQUtfUEhZU19TTUVNLiBDT05GSUdfRFJNX0ZCREVWX0xFQUtfUEhZU19TTUVNCj4+IG9ubHkg
YWRkcyB0aGUgY29kZSBmb3IgdGhpcywgYnV0IGRybV9sZWFrX2ZiZGV2X3NtZW0gaXMgMCBieSBk
ZWZhdWx0LCBzbyB3ZQo+PiBuZWVkIHRvIG92ZXJyaWRlIGl0IHdpdGggMS4gU2FtZSBnb2VzIGZv
ciBkcm1fZmJkZXZfb3ZlcmFsbG9jIHRoYXQKPj4gbXVzdCBiZSBhdCBsZWFzdCAyMDAgZm9yIGhh
dmluZyBhIGRvdWJsZSBidWZmZXIgdGhhdCBpcyByZXF1aXJlZCBieQo+PiBNYWxpLiBUaGlzIGZp
eGVzIGJvdGggb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZSBhbmQgbGltZTIgdGhhdCB1c2UKPj4g
ZXh0bGludXguY29uZi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IAo+IEkgYXBwcmVjaWF0ZSB0aGUg
aWRlYSwgYnV0IEknbSBub3Qgc3VyZSBpZiB3ZSB3YW50IHRoaXMuIEluZGVlZCwgdGhlCj4gQTIw
IE9saW51eGlubyBkZWZjb25maWdzIGFyZSBtZWFudCB0byBiZSBtaW5pbWFsLCBhbmQgdGhlcmUn
cyBub3RoaW5nCj4gdGhhdCBmb3JjZXMgYW55b25lIHRvIHVzZSB0aGUgcHJvcHJpZXRhcnkgTWFs
aSBkcml2ZXIrYmxvYiwgdGhleSBjYW4KPiBhbHNvIHVzZSBtZXNhM2QgaW5zdGVhZCwgd2hpY2gg
bWlnaHQgaGF2ZSBkaWZmZXJlbnQgcmVxdWlyZW1lbnRzLgoKVGhleSBpbnN0ZWFkIGVuYWJsZSBz
cGVjaWZpY2FsbHkgc3VueGktbWFsaS1tYWlubGluZSogaW4gbGltZSBhbmQgbGltZTIgZGVmY29u
Zmlncy4KU28gYXQgdGhlIG1vbWVudCBzdW54aS1tYWxpLW1haW5saW5lIGlzIGJ1aWx0IGJ1dCBp
dCBjYW7igJl0IHdvcmsgYW5kIGl0IGRvZXNu4oCZdCBtYWtlIHNlbnNlLgpBbHNvIHVwIHRvIExp
bnV4IDQuMjAgdGhpcyBuZWl0aGVyIHdvcmtlZCBiZWNhdXNlIG9mIGxhY2sgb2YgZG91YmxlIGJ1
ZmZlci4gU28gYmFzaWNhbGx5IGhlcmUgc3VueGktbWFsaS1tYWlubGluZSBJ4oCZbSBwcmV0dHkg
c3VyZSBuZXZlciB3b3JrZWQuCgpMaW1lIGFuZCBMaW1lMiBib3RoIHVzZSB0aGlzIGV4dGxpbnV4
LmNvbmYgYW5kIHRoZXkgYXJlIHRoZSBvbmx5IG9uZXMuCgpUaGUgb3RoZXIgd2F5IGlzIHRvIHJl
bW92ZSBzdW54aS1tYWxpLW1haW5saW5lIGZyb20gTGltZSBhbmQgTGltZTIgdGhhdCBpcyBhIHBv
c3NpYmxlIGlkZWEuCkxldCBtZSBrbm93IHdoYXQgeW91IHByZWZlci4KCktpbmQgcmVnYXJkcwpH
aXVsaW8gQmVuZXR0aQoKPiAKPiBTbyBJJ20gcmF0aGVyIGtlZW4gb24gZW5hYmxpbmcgeW91ciBw
YXRjaCBvbgo+IHN1bnhpLW1hbGktbWFpbmxpbmUtZHJpdmVyL0NvbmZpZy5pbiwgYnV0IG5vdCB0
aGlzIG9uZSBJJ20gYWZyYWlkLgo+IAo+IE9mIGNvdXJzZSwgaWYgb3RoZXJzIGRpc2FncmVlLCBJ
IGNhbiBjaGFuZ2UgbXkgbWluZCA6KQo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKPiAtLSAKPiBU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4u
Y29tCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
