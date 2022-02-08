Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC941C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B82813AC;
	Tue,  8 Feb 2022 20:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lt55YhV7whtF; Tue,  8 Feb 2022 20:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AEFF81400;
	Tue,  8 Feb 2022 20:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3933A1BF8C7
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27C464086D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ys2yZpW6QLrJ for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE764024E
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:01:36 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HWgAnbVtfkz4hHWgAny2PX; Tue, 08 Feb 2022 21:01:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644350494; bh=yKXxld4N23mX1tNnaVWLHyHU4lOPWW7il2uBq3gyF5Y=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=n2Lra3/c4XDMlos/WMonI5sWm9aFTac8yr44BlSGLFmhgTPDRuselIawuN/2OBVVh
 Ex8Y1pxN2jFUUOW58mCHYrmKm0iYx2HKbc6h3awVWdGs705dLJ0u82dOEVA/S7PYWW
 9DALWGbXp4PS4h7oZtfoa68TO4M2Y/sqi4dMZbDSRIhq6Yyx1a8rWSJDc7h0KXjDd4
 u05Rq9epA0WUm3z/9hTk57cc73qPnxTMeIOfN53H7pIJyHFSY1lktcYtE2kGUD5zp1
 HCTtLQFzgzNdOpnsMHdlOZAQ8ZZSq4PVU8qfazmWFll34dRcOVlgXkIUGfgi5UlSSN
 t8jsqaYOB3/cw==
Message-ID: <0a4cafd3-cbe0-16b7-cc3e-668e14240f0e@benettiengineering.com>
Date: Tue, 8 Feb 2022 21:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
 <34C01EB2-BB12-4DE4-BC53-0141B5DF491D@benettiengineering.com>
 <f1d2404e-a93d-c0e9-6c1d-a33a011fa1d4@benettiengineering.com>
 <41eaa6a2-6053-7671-1ff7-b8dd191263ba@benettiengineering.com>
In-Reply-To: <41eaa6a2-6053-7671-1ff7-b8dd191263ba@benettiengineering.com>
X-CMAE-Envelope: MS4wfMCk/09QxIMZp5StVrXRT0WXSXqmyULvZm195vMQQZAuflWanH+Ey6LIfyTr6936IjGyEe6aY+qV3AV/AckF/lXSWXaVKIopxl9mGVHx83fPgspjUp1V
 7aMGcKSxvWiNAKAFIsRFemgIPRI3JMKhrB55bxZyj5gKQ8v3TkB71t/arAnGKZl7ml2BKVQBkmQq7+XN8RlzPtFAlos1PuIk/f2jnttrS0++KUCPEO4QKHHX
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDgvMDIvMjIgMjE6MDAsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIEFybm91dCwKPiAK
PiBPbiAwNS8wMi8yMiAxODo0MCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEhpIGFnYWluIEFy
bm91dCwKPj4KPj4gT24gMDUvMDIvMjIgMTY6MzYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+Pj4g
SGkgQXJub3V0LAo+Pj4KPj4+PiBJbCBnaW9ybm8gNSBmZWIgMjAyMiwgYWxsZSBvcmUgMTU6MTEs
IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gaGEgc2NyaXR0bzoKPj4+Pgo+
Pj4+IO+7vyBIaSBHaXVsaW8sCj4+Pj4KPj4+Pj4gT24gMDQvMDIvMjAyMiAwMTo1NiwgR2l1bGlv
IEJlbmV0dGkgd3JvdGU6Cj4+Pj4+IEFjdHVhbGx5IGdlbmltYWdlIGZhaWxzIHRvIGNyZWF0ZSBm
aW5hbCBpbWFnZSB3aXRoOgo+Pj4+PiBgYGAKPj4+Pj4gRVJST1I6IGhkaW1hZ2UoZGlzay5pbWcp
OiBwYXJ0aXRpb24gW01CUl0gKG9mZnNldCAweDFiOCwgc2l6ZSAweDQ4KSBvdmVybGFwcyBwcmV2
aW91cyBwYXJ0aXRpb24gYm9vdCAob2Zmc2V0IDB4MCwgc2l6ZSAweDIwMCkKPj4+Pj4gRVJST1I6
IGhkaW1hZ2UoZGlzay5pbWcpOiBib290bG9hZGVycywgZXRjLiB0aGF0IG92ZXJsYXAgd2l0aCB0
aGUgcGFydGl0aW9uIHRhYmxlIG11c3QgZGVjbGFyZSB0aGUgb3ZlcmxhcHBpbmcgYXJlYSBhcyBh
IGhvbGUuCj4+Pj4+IGBgYAo+Pj4+PiBUaGlzIGlzIGJlY2F1c2UgZ2VuaW1hZ2UgMTUgaXMgbGVz
cyBwZXJtaXNzaXZlIHRoYW4gYmVmb3JlLCBzbyBsZXQncyBhZGQKPj4+Pj4gaG9sZXMgPSB7Iig0
NDA7IDUxMikifSB0byBsZWF2ZSByb29tIHRvIE1CUi4KPj4+Pj4gRml4ZXM6Cj4+Pj4+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTg2NTkzNTI0OQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBib2FyZC9wYy9nZW5pbWFnZS1i
aW9zLmNmZyB8IDEgKwo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+
Pj4+IGRpZmYgLS1naXQgYS9ib2FyZC9wYy9nZW5pbWFnZS1iaW9zLmNmZyBiL2JvYXJkL3BjL2dl
bmltYWdlLWJpb3MuY2ZnCj4+Pj4+IGluZGV4IDI2ZDEyZDlhYjMuLjU0MDI2ZjY1MjcgMTAwNjQ0
Cj4+Pj4+IC0tLSBhL2JvYXJkL3BjL2dlbmltYWdlLWJpb3MuY2ZnCj4+Pj4+ICsrKyBiL2JvYXJk
L3BjL2dlbmltYWdlLWJpb3MuY2ZnCj4+Pj4+IEBAIC03LDYgKzcsNyBAQCBpbWFnZSBkaXNrLmlt
ZyB7Cj4+Pj4+ICAgICAgICAgICAgIGltYWdlID0gImJvb3QuaW1nIgo+Pj4+PiAgICAgICAgICAg
ICBvZmZzZXQgPSAwCj4+Pj4+ICAgICAgICAgICAgIHNpemUgPSA1MTIKPj4+Pj4gKyAgICAgICAg
aG9sZXMgPSB7Iig0NDA7IDUxMikifQo+Pj4+Cj4+Pj4gSGF2ZSB5b3UgdGVzdGVkIHRoaXMgY2hh
bmdlIG9uIGFuIGFjdHVhbCBib2FyZCAoaS5lLiBhIFBDIDotKT8KPj4+Cj4+PiBJ4oCZdmUgdGVz
dGVkIGl0IHdpdGggcWVtdSBhbmQgaXQgYm9vdHMgdGhlIGtlcm5lbCBjb3JyZWN0bHkodGhhdCBp
cyBpbiByb290ZnMpLCBvbmx5IHRoaW5nIGlzIHRoYXQgaXQgY2Fu4oCZdCBtb3VudCB0aGUgcm9v
dGZzIGFuZCBJIGRvbuKAmXQgdW5kZXJzdGFuZCB3aHkuCj4+PiBJIHdhbnRlZCB0byBhc2sgYWJv
dXQgdGhpcyBidXQgSeKAmXZlIGdvdCBsb3N0IGFtb25nIGFsbCB0aGUgb3RoZXIgcGF0Y2hlcyA6
LSkKPj4KPj4gSSd2ZSBjb21wYXJlZCB0aGUgMiBkaXNrLmltZyBmaWxlcywgb25lIGdlbmVyYXRl
ZCB3aXRoIGdlbmltYWdlIDE0Cj4+IHdpdGhvdXQgImhvbGVzLi4uIiBhbmQgdGhlIG90aGVyIGdl
bmVyYXRlZCB3aXRoIGdlbmltYWdlIDE1IGFuZCB0aGV5IGFyZQo+PiB0aGUgc2FtZS4KPj4KPj4g
VGhlIHByb2JsZW0gaGVyZSBpcyBub3QgdGhhdCBpdCBjYW4ndCBtb3VudCB1c2luZyBxZW11LCBi
dXQgaXQgZG9lc24ndAo+PiBzaG93IHRoZSBzaGVsbC4KPj4KPj4gSGVyZSBpcyB0aGUgcWVtdSBj
b21tYW5kOgo+PiBxZW11LXN5c3RlbS14ODZfNjQgLU0gcGMgLWRyaXZlCj4+IGZpbGU9aW1hZ2Vz
L2Rpc2suaW1nLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1uZXQgbmljLG1vZGVsPXZpcnRpbyAtbmV0
IHVzZXIKPj4KPj4gYW5kIHRoaXMgaXMgdGhlIG91dHB1dDoKPj4gaHR0cHM6Ly9pbWd1ci5jb20v
YS9mZlpCbEpSCj4+Cj4+IFNvIGl0IHNlZW1zIGxpa2UgYSBidXN5Ym94L2luaXQgc3lzdGVtIGlz
c3VlIHdpdGggdHR5MS4gSSdtIGRpZ2dpbmcuCj4gCj4gSSd2ZSBmb3VuZCB0aGUgcHJvYmxlbS4g
VXNpbmcgdGhlIGdydWIuY2ZnIGFzIGl0IGlzKHJvb3Q9L2Rldi9zZGExKQo+IHdvcmtzIG9ubHkg
d2l0aCBWaXJ0dWFsYm94IGJ1dCBub3Qgd2l0aCBRZW11IHRoYXQgbmVlZHMgcy9zZGExL3ZkYTEu
Cj4gCj4gQnV0IGl0J3Mgbm90IHNvIHdlbGwgZXhwbGFpbmVkIGluIHJlYWRtZS50eHQsIHNvIEkn
bSBnb2luZyB0byBzZW5kIGEKPiBwYXRjaCBmb3IgdGhhdC4KClBhcmRvbiwgSSd2ZSBvbmx5IG1p
c3JlYWQuIHJlYWRtZS50eHQgaXMgY29ycmVjdC4KCj4gU28gSSBjYW4gZ2l2ZSBhOgo+IFRlc3Rl
ZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+Cj4gW0dpdWxpbzogdGVzdGVkIHN1Y2Nlc3NmdWxseSB3aXRoIFFlbXUgYW5kIFZpcnR1YWxi
b3hdCj4gCj4gQmVzdCByZWdhcmRzCgotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVl
cmluZyBzYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
