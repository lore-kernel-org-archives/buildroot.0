Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C631BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F546113E
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35F546113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0E8040804;
	Wed,  6 Oct 2021 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0gqcVrpARsI; Wed,  6 Oct 2021 20:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292F6407FD;
	Wed,  6 Oct 2021 20:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 536C81BF335
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CEF40920
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iv-RRWuprEs4 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:16:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id C172040917
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:16:10 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id YDKhmUcmOFA2gYDKimzx5X; Wed, 06 Oct 2021 22:16:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633551368; bh=ew2ngSWbtwV12NOH024eAqQKkJg5oo1VA20kAFesRXQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=jX5C51AFihfPjrhliluj/0WB+NO42FbOm/SFJU+KI1A/Uk2aXzIBmY5ICTV+buhF2
 9N8OSOLKkm8pmHdViJCAtLUrQA8i1kfUxg/zMkcUrmCudLdKohQo1x1sFqcJOo2mgH
 4Gd9y2j9TBN7OchD/dNdsZAaVk1KWRk2Z/AydmI4lletJgEOPYFCMon/rOmWp5bqXg
 /AOqKtFe7vZJqEeLt9s6IsxOJUUN9cb0cSWKq3G23IjIa3bpB3afNY+oiYMvQPIzPk
 YajUEl7hWLj+XYuZZHf+huQoO/AxKtbYCAAuaC5uwItbbW0d1LbbJCgfVS8Rsu0ORV
 K48VpYSVm2wpw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 6 Oct 2021 22:16:07 +0200
Message-Id: <33BD2142-1698-4B7F-938A-7318E433618E@benettiengineering.com>
References: <9ed998e3-8918-0236-0824-1cdc2f7eec69@mind.be>
In-Reply-To: <9ed998e3-8918-0236-0824-1cdc2f7eec69@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfAMA7mYKbLZ8+wUlUiCxBC0tYsMk9RAsZ4bNSH867qzFkdouTMwrYBKpNviu1kqYETBfEvq9VR2uBaIhyY2MguzAiPEm+w13QxMauJtaB99NFTd79Wu5
 H9TP8pw8F5rYVlWcKlXTwB596ak+xIav68mNhM8n8EeTnSOGA+XVRfBNHS4121ydXCsOj1p1s878LvihVEFl7sNOcYBNBLIw0ZlBKkHcmxNrvBlcl0ek71TV
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to python-uvloop
 package
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

SGkgQXJub3V0LAoKPiBJbCBnaW9ybm8gNiBvdHQgMjAyMSwgYWxsZSBvcmUgMjE6MjYsIEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gaGEgc2NyaXR0bzoKPiAKPiDvu78gSGkg
R2l1bGlvLAo+IAo+IEkgcHJlZmVyIHRoZSBzdWJqZWN0IGxpbmUgdG8gcmVhZDoKPiAKPiBERVZF
TE9QRVJTOiBhZGQgR2l1bGlvIEJlbmV0dGkgdG8gcHl0aG9uLXV2bG9vcCBwYWNrYWdlCj4gCj4g
b3RoZXJ3aXNlLCBpZiB5b3UgZG8gYGdpdCBsb2cgLS1vbmVsaW5lIERFVkVMT1BFUlNgIHlvdSBz
ZWUgYSBsb25nIGxpc3Qgb2YgImFkZCBteXNlbGYiIGZyb20gZGlmZmVyZW50IHBlb3BsZSwgd2hp
Y2ggaXMgcXVpdGUgbWVhbmluZ2xlc3MuCgpZb3XigJlyZSB0b3RhbGx5IHJpZ2h0LCBpbiB0aGUg
bmVhciBwYXN0IEnigJl2ZSBkb25lIHRoYXQgd2F5LCBJIGRvbuKAmXQgZXZlbiBrbm93IHdoeSBJ
4oCZdmUgZG9uZSBpdCB0aGlzIHdheS4KClRoYW5rIHlvdQpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJl
bmV0dGkKCj4gCj4+IE9uIDIzLzA5LzIwMjEgMTg6NDgsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+
PiBBZGQgbXlzZWxmIHRvIHB5dGhvbi11dmxvb3AgcGFja2FnZS4KPiAKPiBObyBuZWVkIHRvIHJl
cGVhdCB3aGF0IGlzIGFscmVhZHkgaW4gdGhlIHN1YmplY3QuCj4gCj4gCj4gQXBwbGllZCBzZXJp
ZXMgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gUmVnYXJkcywKPiBBcm5vdXQKPiAKPiAKPj4gU2ln
bmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+Cj4+IC0tLQo+PiAgREVWRUxPUEVSUyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+
PiBpbmRleCA5MjZjNmEyN2Q3Li41ODFiNWNkN2Q0IDEwMDY0NAo+PiAtLS0gYS9ERVZFTE9QRVJT
Cj4+ICsrKyBiL0RFVkVMT1BFUlMKPj4gQEAgLTEwNjMsNiArMTA2Myw3IEBAIEY6ICAgIHBhY2th
Z2UvbGlibnNwci8KPj4gIEY6ICAgIHBhY2thZ2UvbGlibnNzLwo+PiAgRjogICAgcGFja2FnZS9t
aW5pY29tLwo+PiAgRjogICAgcGFja2FnZS9uZnMtdXRpbHMvCj4+ICtGOiAgICBwYWNrYWdlL3B5
dGhvbi11dmxvb3AvCj4+ICBGOiAgICBwYWNrYWdlL3N1bnhpLW1hbGktbWFpbmxpbmUvCj4+ICBG
OiAgICBwYWNrYWdlL3N1bnhpLW1hbGktbWFpbmxpbmUtZHJpdmVyLwo+PiAgRjogICAgcGFja2Fn
ZS90cmFjZS1jbWQvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
