Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DFCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 19:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EE861528
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 19:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57EE861528
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE944033A;
	Thu, 30 Sep 2021 19:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8uY2shQTPHz; Thu, 30 Sep 2021 19:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBC84037E;
	Thu, 30 Sep 2021 19:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74FCA1BF9B6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D32606E9
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 19:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnHh2aI2z21H for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 19:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDB6F605A1
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633031643;
 bh=NlALunR7bfC3V/lNPj+FxzhjhItdwSsIclGssvqiUYA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SpARImPjPybQ9w4Ue8pHVyQyPbWdCufGO8MNLqsiQv+OWiuZLJlE2LO3LAf0xo6Qo
 WM1mWXS57FD1V+4okkiKc8ec3Efrbq8w4WQVSwDil1cG+M06rnQ7a7w7LnuXSss//8
 0rL6Uo2ML9Mru0Y4S0luub2H13rfd7MgawcKWFog=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.251]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6qM-1nFJ2t2MUW-00lZ60; Thu, 30
 Sep 2021 21:54:03 +0200
Date: Thu, 30 Sep 2021 21:54:02 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20210930215402.0badb3ec@gmx.net>
In-Reply-To: <d61b3361-d5da-d2b5-13af-0b9bec3eb806@xes-inc.com>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
 <20210921223932.5d85a71d@gmx.net>
 <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
 <d61b3361-d5da-d2b5-13af-0b9bec3eb806@xes-inc.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:1jpqkX/jRwdooEexMywR9FHzQQ5J5Gy7w3WC673y4OnpIt4bVBD
 pwY+SWGj6/ca1uZpwciWqS5VjkCin7/wNt15tqbbcX+xs8KI6MWb8jIqf73FUENgmDNvYZa
 rZaGG4XRpYrJZt68opxDf1cLYx71M2qeK1Q+fNdCyPz7s97cDrUh20r0oeqHuPBSyl/h+FU
 gvZoUlOEpQjUnUxsrhPEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w/9gF2FqgfM=:5EXU6Xz89UR75gFp1YBqsp
 uh+t9Lp4ysR8x5m2c+s5VCmY61YVNX8jP5XF0Eq55w+OX9NLoMjHTiztE18/vi+Ui+8J2wjam
 7vhwz4QkixwqQ9hy8wZsyV8mnLbr/wnFeKKZlb77LQzC5LPrDRyYzUbLDbkFOLMIsa0dahPd7
 mcabd6KCSXM/82qQS1axZZSaTr9hWa3ayH0mY1MpLRpGmg+MXqeR9nEFnbSw8ftYYKX6345ZO
 trodHZutxwYi8nfiUwKzQsV0YOmbcIAjgknaGFe7w0XSDbiC0iyFb4iBo42uSjjUpKIzYy7lf
 ybBTLCm9h78a5De5hAHI+YrAhL0Ow1sj13C02QKUMKFMTkWLPHCvdjtPdUF5prBC3IHSw0Vmt
 PWH7ptsF8fPoyj0F0egQtYD7j53/OAsC2ra4ed5K5j7vtp3wKCdHL3/j2sT2yAUH704KwL8Ey
 OQteLN2X8XPxhlSUPS27vTd5Wa4qGQzpcHw80xWxd8ELL8escCg0n5kRaffQ9XWEqkCOpLcSh
 ew5neqrhlBQWAGYNaDBuTNUVp4AnPqCqS98JfRfxprE6OmOFZ4zsgerW0AaMTE10dXHbynWIq
 KNNLXDhiPkBWPhgiyiMzAsdsOXKBMr6omFlBYiVo//4/jUKjfQZLHMj894gdcp7x3Y5Z9g9xK
 VASeDDZBxtf3UC/BfLVAIgBOFwjh/eA+6W2RrS0S3Yo3DHi6yVdzz6h93rVtcwzA2O0kXivYH
 RYTscujWY036cakdrpQJauvIdwdQguF3scRFT7rGE6FnUuJnruX07PM171NvOsHQqY7iGDsE8
 cUQ6jHAAj3Ie4Rdx0xtS+6GiGaxs68uajjVqpgbfoJG1tf70pO7Idjml6h12UdCW0GKjOV1EQ
 2ZEeVKPguIFNumF3s4dLbouTBThE+skjn/gX3mdbB+weSV4wlrLHt4//gO7YoFkBTOHOmiqgD
 jyt5LsqfFUua+lP+wRCFvUOTRYzXE4YXL0QxZvdJvw1KbxXBIXspOpl1aFNpXu5HrJcG5tSkB
 BEsMQJ5w1K+YLxK2xnp6jVyCCUibvMiCBbIqQI+ZeRT4vAietyZqxVRZkiWMqzh4d1ITW4W1V
 Eww1zCsidMvQhQ=
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmluY2VudCwgYWxsLAoKT24gVGh1LCAzMCBTZXAgMjAyMSAxNDoxOTowMyAtMDUwMCwg
VmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPiB3cm90ZToKCj4gUGV0ZXIsIGFsbCwK
PiAKPiBPbiA5LzIzLzIxIDg6NTggQU0sIFZpbmNlbnQgRmF6aW8gd3JvdGU6Cj4gPiBBbGwsCj4g
Pgo+ID4gT24gOS8yMS8yMSAzOjM5IFBNLCBQZXRlciBTZWlkZXJlciB3cm90ZTogIAo+ID4+IEhl
bGxvIFZpbmNlbnQsIGFsbCwKPiA+Pgo+ID4+IE9uIFR1ZSwgMjEgU2VwIDIwMjEgMDg6MDg6MTAg
LTA1MDAsIFZpbmNlbnQgRmF6aW8gCj4gPj4gPHZmYXppb0B4ZXMtaW5jLmNvbT4gd3JvdGU6Cj4g
Pj4gIAo+ID4+PiBQZXRlciwgYWxsLAo+ID4+Pgo+ID4+PiBPbiA5LzIwLzIxIDQ6NDEgUE0sIFBl
dGVyIFNlaWRlcmVyIHdyb3RlOiAgCj4gPj4+PiBIZWxsbyBWaW5jZW50LAo+ID4+Pj4KPiA+Pj4+
IE9uIE1vbiwgMjAgU2VwIDIwMjEgMTY6MTk6NTcgLTA1MDAsIFZpbmNlbnQgRmF6aW8gCj4gPj4+
PiA8dmZhemlvQHhlcy1pbmMuY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBUaGFua3MgZm9yIHRo
ZSBpbmZvLCBvbmx5IGRpZCBhIHF1aWNrIHJlYWQgb2YgdGhlIFBSIDE2MTksIHRoZSBwcm9ibGVt
Cj4gPj4+PiBzZWVtcyBVLWJvb3Qgc3BlY2lmaWMgKG5vdCB0aGUgYnVpbGRyb290IGRlZmF1bHQg
Y2FzZSkgYW5kIHRoZXJlIGlzCj4gPj4+PiBhbHJlYWR5IGEgc3VnZ2VzdGVkIFUtYm9vdCBmaXgg
KHN1Ym1pdHRlZCBieSB5b3UpPyAgCj4gPj4+IFllcywgc29ycnkgSSB3YXMgbm90IHZlcnkgY2xl
YXIgaW4gbXkgZW1haWwgeWVzdGVyZGF5IChJIHdhcyBzZW5kaW5nIGl0Cj4gPj4+IG9uIG15IHdh
eSBvdXQgdGhlIGRvb3IpLiAgCj4gPj4gTm8gcHJvYmxlbSA7LSksIHRoZSBoaW50IHdhcy9pcyB2
ZXJ5IHZhbHVhYmxlISAgCj4KPiBUaGlzIG1heSBubyBsb25nZXIgYmUgYW4gaXNzdWUgb3RoZXIg
cGFja2FnZXMgaGF2ZSB0byBkZWFsIHdpdGggWzFdCj4KClRoYW5rcyBmb3IgdXBkYXRlIChhbmQg
eW91ciBkZWJ1Z2dpbmcgZWZmb3J0cyA7LSkgKSwgd2lsbCB1cGRhdGUgbXkKcGF0Y2hzZXQgdGhl
IG5leHQgZGF5cy4uLgoKUmVnYXJkcywKUGV0ZXIKCj4gPj4gIAo+ID4+PiBZZXMsIHUtYm9vdCBp
cyBhZmZlY3RlZCwgdGhvdWdoIEkgdGhpbmsgZWRrMiBtYXkgYWxzbyBiZSBhZmZlY3RlZC4gVGhl
Cj4gPj4+IHUtYm9vdCBwYXRjaCBoYXMgbm90IHlldCBiZWVuIHJldmlld2VkIGFuZCBtYXkgbm90
IG1ha2UgaXQgZm9yIDIwMjEuMTAKPiA+Pj4KPiA+Pj4gSSBqdXN0IHdhbnRlZCB0byBnaXZlIGEg
aGVhZHMgdXAgdGhhdCBidW1waW5nIHRoaXMgcGFja2FnZSBjb3VsZCBoYXZlCj4gPj4+IGNvbnNl
cXVlbmNlcyBmb3Igc29tZSBjb25maWd1cmF0aW9ucy4gIAo+ID4+IFNvIHRoZXJlIGFyZSB0aGUg
Zm9sbG93aW5nIHBvc3NpYmlsaXRpZXM6Cj4gPj4KPiA+PiAtIG5ldmVyIHVwZGF0ZSBycGktZmly
bXdhcmUgdG8gbm90IGJyZWFrIGxlZ2FjeSB1LWJvb3QgKGFuZCBtYXliZSAKPiA+PiBlZGsyIGFu
ZAo+ID4+IMKgwqAgbWF5YmUgbGludXgtbWFpbmxpbmUgYW5kIG1heWJlIC4uLikgc2V0dXBzICAK
PiA+IERlZmluaXRlbHkgbm90IHJlY29tbWVuZGluZyB0aGlzLiAgCj4gPj4gLSBkZWxheSB0aGUg
cnBpLWZpcm13YXJlIHVwZGF0ZSB1bnRpbCB1cC10by1kYXRlIHUtYm9vdCAoYW5kIGVkazIgYW5k
IAo+ID4+IC4uLikKPiA+PiDCoMKgIGFyZSBhdmFpbGFibGUgKGFzIHRoaXMgYnVtcCBzZWVtcyB0
byBmaXggc29tZSBvdGhlciByZWdyZXNzaW9ucyBlLmcKPiA+PiDCoMKgICdrZXJuZWw6IFNlY29u
ZCBhdHRlbXB0IHRvIGZpeCB0aGUgQ1BVIHN0YXJ0dXAgZmFpbHVyZScgWzFdCj4gPj4KPiA+PiAt
IGFwcGx5IHRoZSBycGktZmlybXdhcmUgdXBkYXRlIG5vdyBhbmQgaG9wZSB0aGF0IHRoaXMgZW1h
aWwgdGhyZWFkIGlzCj4gPj4gwqDCoCBmb3VuZCBieSBhbGwgcGVvcGxlIGFmZmVjdGVkIGJ5IHRo
ZSB1LWJvb3QgKGFuZCAuLi4pIGRlZmVjdCwgYnV0Cj4gPj4gwqDCoCBrZWVwcyB0aGUgZGVmYXVs
dCBidWlsZHJvb3QvcnBpIHVzZXJzIHVwLXRvLWRhdGUgOy0pICAKPiA+Cj4gPiBQcm9iYWJseSBu
byByZWFzb24gdG8gZGVsYXkgaXQgaWYgdGhlcmUgYXJlIG5vIGRlZmF1bHQgY29uZmlndXJhdGlv
bnMgCj4gPiB0aGF0IHV0aWxpemUgdGhlIGFmZmVjdGVkIHBhY2thZ2VzLCBidXQgbm90IHN1cmUg
aWYgaXQgZGVzZXJ2ZXMgYSAKPiA+IG1lbnRpb24gc29tZXdoZXJlIGxpa2UgCj4gPiBodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfa25vd25faXNzdWVz
IHNvIAo+ID4gdGhlIGlzc3VlIGlzIG1vcmUgY2xlYXJseSBhZHZlcnRpc2VkIHVudGlsIHRoZXJl
IGFyZSBwYXRjaGVzIHRvIGZpeCAKPiA+IHRoZSBhZmZlY3RlZCBwYWNrYWdlcy4KPiA+Cj4gPiBJ
J2xsIGxldCB0aGUgbWFpbnRhaW5lcnMgZGVjaWRlIHdoYXQgdG8gZG8uIEFnYWluLCBJIGp1c3Qg
d2FudGVkIHRvIAo+ID4gbWFrZSBwZW9wbGUgYXdhcmUuCj4gPiAgCj4gPj4gUmVnYXJkcywKPiA+
PiBQZXRlcgo+ID4+Cj4gPj4gWzFdIAo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlw
aS9maXJtd2FyZS9jb21taXQvOWY5NzA4MTk5Zjg4MDllY2YxNjExOWQwNzE2Mzc1YmVlN2I3ZDhk
NAo+ID4+ICAKPiA+Pj4+IFJlZ2FyZHMsCj4gPj4+PiBQZXRlcgo+ID4+Pj4KPiA+Pj4+ICAKPiBb
MV0gCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zpcm13YXJlL2NvbW1pdC9iNTI1
N2RhNThjMGU2NTI2MzM1OTJjNmZjZTA5YTdmM2IxMDBhMmViCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
