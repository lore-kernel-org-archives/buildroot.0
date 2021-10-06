Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6809C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:06:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBF961152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EBF961152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 405F084143;
	Wed,  6 Oct 2021 20:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4POP1JDM6q83; Wed,  6 Oct 2021 20:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905FA84144;
	Wed,  6 Oct 2021 20:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DED011BF335
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1AF40796
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEjiwbuqa1l4 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:06:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A0BA402DF
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633550756;
 bh=bBLsvLLVMYHaTzfKVbCkKJrr0HqXZwb1l0gW+lYj3LQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LCMckBnrKsSUGKj1a6b3Gw2NmoW4caHziqnAZCQNRVahe7G54oqRqHRCkjwzodgqH
 jX8rPHQtw44awzCPjgFxnQaCMeuXTbw3FnO0ydESReuJtjSlis1685tOEQfejftLFU
 GvpGPjnCKYCW7lagvYeobQt50c94HVCTl/uGk8lY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1nFpeD3Sx0-00ilaR; Wed, 06
 Oct 2021 22:05:55 +0200
Date: Wed, 6 Oct 2021 22:05:54 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211006220554.52f21e5e@gmx.net>
In-Reply-To: <16c55b45-955a-ef8f-9346-e5590c8b5a66@mind.be>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
 <20210921223932.5d85a71d@gmx.net>
 <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
 <d61b3361-d5da-d2b5-13af-0b9bec3eb806@xes-inc.com>
 <20210930215402.0badb3ec@gmx.net>
 <16c55b45-955a-ef8f-9346-e5590c8b5a66@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MdMnTkQFnXOo6Glhdqfq43ohSvdl5NMta2wMdlqgo15hISqOWJf
 P0VUae8GwQ+j2xGhOxDHvhl/WmyaUs5QjKy6aJBxYYVqB5gD5WRYa5h3nns042XnQQ6DKT1
 eUditlFpAyqz3cfFKB24HDsgjfpdUzB1bGsQnd5ag3xpz0dkk06eqD+Dskl8IGSXMpVJev9
 eJESk4h+In9ii1/N5O38w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P/QLPGOmNXI=:Yo2EXzhvVHfCXzv6yuJ/wG
 c3X/KC4v7BvI6pEXczpONfx/v73AmckZkGeq6/scpJzWTVm8GQs0KIL3lRLOmqkGRiGk3PNpQ
 PpH5u9TQEfDFLSn92Q8Bent7au1nwDJ9f6FEgbVX9EmMt8gWxCIe/HKcnhjFvrJ8XUiC4Vcv7
 15GY4V6S04OdAJ2v5LoLbSmaoNqf7A8O5dbQ44xeMh/Jwg6vuG1LFgY8jzA99X6bBWSHXW/FZ
 He7iVosAH1AhxSHQoIRb8MCrTPGQs3upocDIbm/jiMuZacXchd3LVa3R6PcSNehhPbDG0lESE
 tmypbcBoCvRYiCCq8IBnoezXBD8++l6Q2UVp7+E4+JD0EsMn7bVi4c/ButEWzHC3oX6lBZ83i
 SWzfqAC2nH5XpFSRC9qqam5kTumQlYG1wac0EsDj8pG1208ajFuCUjuQ1NDKtrCeb+hp7Qm7K
 y4Bg9V14RqqcGm6VsSuDFzd29KdncvkENbJ1V1Nzq6vPVx/cXD0gnrIsZgjxVR4PcxdgMkfIq
 VkOqSSbzbZ+gG6SvMv3Kx5ZI2oGZNrVVYYINv4vPdFxdOqzhDtUmRzdDxDbRPCOqZrKYKRQiU
 P11MFKCUu3Xqh9NHjq+N1Vpx6WIZws61qjXQ/1ozXPsy/esDxPgAQ04t30wK+kYYph02y7KLJ
 rqNIrfnBEUl1MWaOH5cjO1EXQzMSJ9pYcJZLljk+DsZNTg6G5oo0z2DbdFL62QHQwsIoANTbk
 TcpMj1yunj8cgVW4Jr013uTsPm3gPFex/KMJlRXdOJBU4AuMOFv0bZd5xVx8mS+15NSfFfV2/
 iaQPvBkqrEAuPNm3Oz/r8DQTjZW5UXSkzjkH2+6yrNS+qB292KDRmgkIP7Zz/yAOmPsVExs+H
 9rp28lfSM1FWSN/oXM2xbJ1okjrPEQisRbM0RMSE+XA25pRJqyQK5dNWjb95glBBAffMu2g/d
 0pcyj4RzX+3bzViJ0KCl1qFDoR2Kl45eEaFmOo/e0sR1jv7VVY6D3HjmUmn0FStv3+bxnlJXz
 gihuFyeMgBH/IjGXgrJG2X9qq3wM3y8MZhk6uFOKd7R2PadQz7eUFV0fEzs/oSvvfq2h+8b1p
 36V2N5hzug0668=
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gV2VkLCA2IE9jdCAyMDIxIDIwOjI0OjQ0ICswMjAwLCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiBPbiAzMC8wOS8yMDIxIDIx
OjU0LCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiA+IEhlbGxvIFZpbmNlbnQsIGFsbCwKPiA+IAo+
ID4gT24gVGh1LCAzMCBTZXAgMjAyMSAxNDoxOTowMyAtMDUwMCwgVmluY2VudCBGYXppbyA8dmZh
emlvQHhlcy1pbmMuY29tPiB3cm90ZToKPiA+ICAgCj4gPj4gUGV0ZXIsIGFsbCwKPiA+Pgo+ID4+
IE9uIDkvMjMvMjEgODo1OCBBTSwgVmluY2VudCBGYXppbyB3cm90ZTogIAo+ID4+PiBBbGwsCj4g
Pj4+Cj4gPj4+IE9uIDkvMjEvMjEgMzozOSBQTSwgUGV0ZXIgU2VpZGVyZXIgd3JvdGU6ICAKPiA+
Pj4+IEhlbGxvIFZpbmNlbnQsIGFsbCwKPiA+Pj4+Cj4gPj4+PiBPbiBUdWUsIDIxIFNlcCAyMDIx
IDA4OjA4OjEwIC0wNTAwLCBWaW5jZW50IEZhemlvCj4gPj4+PiA8dmZhemlvQHhlcy1pbmMuY29t
PiB3cm90ZToKPiA+Pj4+ICAgICAKPiA+Pj4+PiBQZXRlciwgYWxsLAo+ID4+Pj4+Cj4gPj4+Pj4g
T24gOS8yMC8yMSA0OjQxIFBNLCBQZXRlciBTZWlkZXJlciB3cm90ZTogIAo+ID4+Pj4+PiBIZWxs
byBWaW5jZW50LAo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiBNb24sIDIwIFNlcCAyMDIxIDE2OjE5OjU3
IC0wNTAwLCBWaW5jZW50IEZhemlvCj4gPj4+Pj4+IDx2ZmF6aW9AeGVzLWluYy5jb20+IHdyb3Rl
Ogo+ID4+Pj4+Pgo+ID4+Pj4+PiBUaGFua3MgZm9yIHRoZSBpbmZvLCBvbmx5IGRpZCBhIHF1aWNr
IHJlYWQgb2YgdGhlIFBSIDE2MTksIHRoZSBwcm9ibGVtCj4gPj4+Pj4+IHNlZW1zIFUtYm9vdCBz
cGVjaWZpYyAobm90IHRoZSBidWlsZHJvb3QgZGVmYXVsdCBjYXNlKSBhbmQgdGhlcmUgaXMKPiA+
Pj4+Pj4gYWxyZWFkeSBhIHN1Z2dlc3RlZCBVLWJvb3QgZml4IChzdWJtaXR0ZWQgYnkgeW91KT8g
IAo+ID4+Pj4+IFllcywgc29ycnkgSSB3YXMgbm90IHZlcnkgY2xlYXIgaW4gbXkgZW1haWwgeWVz
dGVyZGF5IChJIHdhcyBzZW5kaW5nIGl0Cj4gPj4+Pj4gb24gbXkgd2F5IG91dCB0aGUgZG9vciku
ICAKPiA+Pj4+IE5vIHByb2JsZW0gOy0pLCB0aGUgaGludCB3YXMvaXMgdmVyeSB2YWx1YWJsZSEg
IAo+ID4+Cj4gPj4gVGhpcyBtYXkgbm8gbG9uZ2VyIGJlIGFuIGlzc3VlIG90aGVyIHBhY2thZ2Vz
IGhhdmUgdG8gZGVhbCB3aXRoIFsxXQo+ID4+ICAKPiA+IAo+ID4gVGhhbmtzIGZvciB1cGRhdGUg
KGFuZCB5b3VyIGRlYnVnZ2luZyBlZmZvcnRzIDstKSApLCB3aWxsIHVwZGF0ZSBteQo+ID4gcGF0
Y2hzZXQgdGhlIG5leHQgZGF5cy4uLiAgCj4gCj4gICBJIHdhcyBnb2luZyB0byBhcHBseSB0aGlz
IHNlcmllcyBhbmQgdGhlbiBJIHNhdyB0aGlzIGNvbW1lbnQuLi4gQXJlIHlvdSBzdGlsbCAKPiBn
b2luZyB0byB1cGRhdGUgdGhlIHBhdGNoc2V0IG9yIHNob3VsZCB3ZSBhcHBseSBhcy1pcz8KClN0
aWxsIHBsYW5pbmcgdG8gdXBkYXRlIChidXQgbmVlZCB0byBmaW5kIGEgbGFyZ2UgZW5vdWdoIHRp
bWUgc2xvdCBmb3IgdGVzdGluZywKYnV0IHdpbGwgZmluaXNoIGhvcGVmdWxseSB1bnRpbCBlbmQg
b2YgdGhlIHdlZWspLi4uCgpSZWdhcmRzLApQZXRlcgoKPiAKPiAgIFJlZ2FyZHMsCj4gICBBcm5v
dXQKPiAKPiA+IAo+ID4gUmVnYXJkcywKPiA+IFBldGVyCj4gPiAgIAo+ID4+Pj4gICAgIAo+ID4+
Pj4+IFllcywgdS1ib290IGlzIGFmZmVjdGVkLCB0aG91Z2ggSSB0aGluayBlZGsyIG1heSBhbHNv
IGJlIGFmZmVjdGVkLiBUaGUKPiA+Pj4+PiB1LWJvb3QgcGF0Y2ggaGFzIG5vdCB5ZXQgYmVlbiBy
ZXZpZXdlZCBhbmQgbWF5IG5vdCBtYWtlIGl0IGZvciAyMDIxLjEwCj4gPj4+Pj4KPiA+Pj4+PiBJ
IGp1c3Qgd2FudGVkIHRvIGdpdmUgYSBoZWFkcyB1cCB0aGF0IGJ1bXBpbmcgdGhpcyBwYWNrYWdl
IGNvdWxkIGhhdmUKPiA+Pj4+PiBjb25zZXF1ZW5jZXMgZm9yIHNvbWUgY29uZmlndXJhdGlvbnMu
ICAKPiA+Pj4+IFNvIHRoZXJlIGFyZSB0aGUgZm9sbG93aW5nIHBvc3NpYmlsaXRpZXM6Cj4gPj4+
Pgo+ID4+Pj4gLSBuZXZlciB1cGRhdGUgcnBpLWZpcm13YXJlIHRvIG5vdCBicmVhayBsZWdhY3kg
dS1ib290IChhbmQgbWF5YmUKPiA+Pj4+IGVkazIgYW5kCj4gPj4+PiAgwqDCoCBtYXliZSBsaW51
eC1tYWlubGluZSBhbmQgbWF5YmUgLi4uKSBzZXR1cHMgIAo+ID4+PiBEZWZpbml0ZWx5IG5vdCBy
ZWNvbW1lbmRpbmcgdGhpcy4gIAo+ID4+Pj4gLSBkZWxheSB0aGUgcnBpLWZpcm13YXJlIHVwZGF0
ZSB1bnRpbCB1cC10by1kYXRlIHUtYm9vdCAoYW5kIGVkazIgYW5kCj4gPj4+PiAuLi4pCj4gPj4+
PiAgwqDCoCBhcmUgYXZhaWxhYmxlIChhcyB0aGlzIGJ1bXAgc2VlbXMgdG8gZml4IHNvbWUgb3Ro
ZXIgcmVncmVzc2lvbnMgZS5nCj4gPj4+PiAgwqDCoCAna2VybmVsOiBTZWNvbmQgYXR0ZW1wdCB0
byBmaXggdGhlIENQVSBzdGFydHVwIGZhaWx1cmUnIFsxXQo+ID4+Pj4KPiA+Pj4+IC0gYXBwbHkg
dGhlIHJwaS1maXJtd2FyZSB1cGRhdGUgbm93IGFuZCBob3BlIHRoYXQgdGhpcyBlbWFpbCB0aHJl
YWQgaXMKPiA+Pj4+ICDCoMKgIGZvdW5kIGJ5IGFsbCBwZW9wbGUgYWZmZWN0ZWQgYnkgdGhlIHUt
Ym9vdCAoYW5kIC4uLikgZGVmZWN0LCBidXQKPiA+Pj4+ICDCoMKgIGtlZXBzIHRoZSBkZWZhdWx0
IGJ1aWxkcm9vdC9ycGkgdXNlcnMgdXAtdG8tZGF0ZSA7LSkgIAo+ID4+Pgo+ID4+PiBQcm9iYWJs
eSBubyByZWFzb24gdG8gZGVsYXkgaXQgaWYgdGhlcmUgYXJlIG5vIGRlZmF1bHQgY29uZmlndXJh
dGlvbnMKPiA+Pj4gdGhhdCB1dGlsaXplIHRoZSBhZmZlY3RlZCBwYWNrYWdlcywgYnV0IG5vdCBz
dXJlIGlmIGl0IGRlc2VydmVzIGEKPiA+Pj4gbWVudGlvbiBzb21ld2hlcmUgbGlrZQo+ID4+PiBo
dHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfa25vd25f
aXNzdWVzIHNvCj4gPj4+IHRoZSBpc3N1ZSBpcyBtb3JlIGNsZWFybHkgYWR2ZXJ0aXNlZCB1bnRp
bCB0aGVyZSBhcmUgcGF0Y2hlcyB0byBmaXgKPiA+Pj4gdGhlIGFmZmVjdGVkIHBhY2thZ2VzLgo+
ID4+Pgo+ID4+PiBJJ2xsIGxldCB0aGUgbWFpbnRhaW5lcnMgZGVjaWRlIHdoYXQgdG8gZG8uIEFn
YWluLCBJIGp1c3Qgd2FudGVkIHRvCj4gPj4+IG1ha2UgcGVvcGxlIGF3YXJlLgo+ID4+PiAgICAg
Cj4gPj4+PiBSZWdhcmRzLAo+ID4+Pj4gUGV0ZXIKPiA+Pj4+Cj4gPj4+PiBbMV0KPiA+Pj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9maXJtd2FyZS9jb21taXQvOWY5NzA4MTk5Zjg4
MDllY2YxNjExOWQwNzE2Mzc1YmVlN2I3ZDhkNAo+ID4+Pj4gICAgIAo+ID4+Pj4+PiBSZWdhcmRz
LAo+ID4+Pj4+PiBQZXRlcgo+ID4+Pj4+Pgo+ID4+Pj4+PiAgICAgCj4gPj4gWzFdCj4gPj4gaHR0
cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zpcm13YXJlL2NvbW1pdC9iNTI1N2RhNThjMGU2
NTI2MzM1OTJjNmZjZTA5YTdmM2IxMDBhMmViCj4gPj4gIAo+ID4gCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gICAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
