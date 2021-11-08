Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC575C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4011861052
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4011861052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6CD4015B;
	Mon,  8 Nov 2021 16:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GT4gmQML_Sd; Mon,  8 Nov 2021 16:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DA5400E5;
	Mon,  8 Nov 2021 16:17:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D32E1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49D2E60816
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4VZpliMN0Na for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:17:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCF1605E5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:17:48 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id k7L8mLzAeFf01k7L8mBlPA; Mon, 08 Nov 2021 17:17:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636388267; bh=zlAerh8fXkXUgu+OnJ+RR3rPm0o37fE0Uit29vzzmWg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=eQanEzdRIlsSEw8OhP7kXfBCIYkScB71UPWO9Pke5CcDumlVK3QqUs7fKVCYHtag7
 EYOUn0bbTVIrtwCnfBINJUxulUscpvmUNej2rXk9hBvnGM+MoldQgrvC2Xkg6QM9Fp
 ScGPLPZ9VzkgLwnJXqqQO5KexmuvjlXM3fybwqkWpRI6ksHargcbO6Lplfi3lIFCOh
 g7PmBaeuu4Mpf2x9kjunGku3j6gVcTN/LSrAHfp9Q21GZQuRK+j0FnP8ratslpLpNL
 49gWZ9D9kDjmRml11q6zeqlrCg9HXYDnC2opu8ReK7Bs8FxKdYS1MG3pqzfewhxfUq
 lxgFPymoFDecA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 8 Nov 2021 17:17:45 +0100
Message-Id: <74C49C6C-413F-4ED9-B9E4-CDDD6C7CB77B@benettiengineering.com>
References: <20211108162404.58ebbd3c@windsurf>
In-Reply-To: <20211108162404.58ebbd3c@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfJhft7xqJ5fCJVRFiEqk8TumLLH0XkdE9JSFzEN1JQRPTEcbwQ/kz3/2AuIqerKAPpbtpM2qDeffxcuxwshriDrciFtojzvFDZsPF3l8tTikdIZv+JRB
 GhK+BZzFfv13w+9G4HSY2izIX+Q5Y0Lhr2vYjGX/tFhKpz4iX4N4CpAHYfOlCMfav01BSWcSW9EGOyBJeHonlTIALdTxKSH3DZaUaB9UQCeuQ8c7xHif+vNL
 1vgNeO/SGK2swKCNDimv5bv/k0KMHhCoj3j1bSllJssCAd94wuJ6D9Em+fTUiIVg
Subject: Re: [Buildroot] [PATCH 000/102] Standardize/beautify genimage .cfg
 files for all boards
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBZYW5uLCBBbGwsCgo+IElsIGdpb3JubyA4IG5vdiAyMDIxLCBhbGxlIG9y
ZSAxNjoyNCwgVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4g
aGEgc2NyaXR0bzoKPiAKPiDvu79IZWxsbywKPiAKPj4gT24gTW9uLCA4IE5vdiAyMDIxIDE2OjA3
OjMxICswMTAwCj4+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
b3RlOgo+PiAKPj4gSSBrbm93IHRoaXMgYXMgYmVlbiBkaXNjdXNzZWQgb24gYW5vdGhlciB0aHJl
YWQgd2l0aCBQZXRlciwgYWJvdXQgdXNpbmcKPj4gSy9NIGluc3RlYWQgb2YgYmFyZSBudW1iZXJz
LCBhbmQgaXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBpZiBhCj4+IGNoYW5nZSB3ZXJlIHRv
IGJlIG1hZGUsIGl0IHdvdWxkIGJlIHJlc3RyaWN0ZWQgdG8ganVzdCB0aGF0Lgo+PiAKPj4gSG93
ZXZlciwgSSBxdWVzdGlvbiB0aGUgcmVsZXZhbmNlIG9mIHRoaXMgKmh1Z2UqIHBhdGNoc2V0IGp1
c3QgZm9yIGEKPj4gbWFrZW92ZXIuCj4+IAo+PiBZZXMsIHVzdWFsbHksIEkgbGlrZSBjb25zaXN0
ZW5jeSwgYnV0IGhlcmUgd2UgaGF2ZSBhIHR3by1lZGdlIGlzc3VlOgo+PiAKPj4gIC0gdGhlIHNl
cmllcyBpcyBodWdlLCBhbmQgY2F1c2VzIGEgbG90IG9mIGNodXJuIG1ha2luZyBwZW5kaW5nIHBh
dGNoZXMKPj4gICAgbW9yZSBkaWZmaWN1bHQgdG8gYXBwbHksCj4gCj4gSSB3b3VsZCBhZ3JlZSBp
biBnZW5lcmFsLCBidXQgaGVyZSBJIGRvdWJ0IGl0IGlzIHJlYWxseSBnb2luZyB0byBjYXVzZQo+
IG11Y2ggY29uZmxpY3Qgd2l0aCBvdGhlciBwZW5kaW5nIHBhdGNoZXMuCj4gCj4+ICAtIHRoZSBn
ZW5pbWFnZSBmb3JtYXQgaXMgbm90IHdlbGwgZGVmaW5lZCwgYW5kIHRoZXJlIGlzIG5vIGxpbnRl
ciwgc28KPj4gICAgdGhlIGV4aXN0aW5nIGZpbGVzICp3aWxsKiBkaXZlcmdlIGFnYWluLCBhbmQg
d2Ugd29uJ3Qgbm90aWNlIHRoYXQKPj4gICAgbmV3IGZpbGVzIHdvbid0IGJlIGNvbXBsaWFudC4K
PiAKPiBSaWdodCwgYnV0IHRoYXQncyBub3QgcmVhbGx5IGEgcmVhc29uIHRvIG5vdCB0YWtlIHRo
aXMgcGF0Y2ggc2VyaWVzLgo+IAo+IE9uIG15IHNpZGUsIEkgd291bGQgc2ltcGx5IGFwcGx5IHRo
ZSB3aG9sZSB0aGluZy4gSXQgbWFrZXMgdGhpbmdzCj4gb3ZlcmFsbCBiZXR0ZXIgKHBlcmhhcHMg
bm90IHBlcmZlY3QsIGJ1dCBiZXR0ZXIgYW5kIG1vcmUgY29uc2lzdGVudCkuCj4gCj4+IEkgdXN1
YWxseSBszLZvzLbMtmHMtnTMtmjMtiBkzLZlzLZzzLZwzLZpzLZzzLZlzLYgaMy2Ycy2dMy2Zcy2
IGRvIG5vdCBsaWtlIFRBQnMuLi4gVGhlIHdpZHRoIG9mIGEgVEFCCj4+IHZhcmllcyBkZXBlbmRp
bmcgb24gb25lJ3MgZW52aXJvbm1lbnQgYW5kIGNvZGluZyBwcmFjdGljZXM7IHRoZSB1c3VhbAo+
PiA4LXNwYWNlIHdpZHRoIG1ha2VzIGZvciB2ZXJ5IGxvbmcsIHVnbHkgbGluZXM7IFRBQiBicmVh
ayBjYXJlZnVsbAo+PiBpbmRlbnRhdGlvbi4KPiAKPiBBIG1hdHRlciBvZiB0YXN0ZSBpbmRlZWQs
IGJ1dCBpbiAibWFrZSIgKHlvdSBrbm93IHRoaXMgbGFuZ3VhZ2Ugd2UKPiBoZWF2aWx5IGFidXNl
IGluIEJ1aWxkcm9vdCksIFRBQnMgYXJlIGtpbmchIFNvIGl0IHdvdWxkIGJlIGtpbmQgb2YKPiBp
cm9uaWNhbCBub3QgdG8gYWxsb3cgVEFCcyBpbiBhIG1ha2UtYmFzZWQgcHJvamVjdCA6LSkKPiAK
Pj4gQW5kIHRoZW4gdGhpcyBnYXZlIGEgMTA3LXBhdGNoIHNlcmllcy4gQW5kIHRoZSBjb21taXRz
IGFsbCBoYXZlIHRoZSBzYW1lCj4+IHR5cG86ICdiZWF0aWZ5JyBpbnN0ZWFkIG9mICdiZWF1dGlm
eScuIEFsdGhvdWdoIEkgY2FuIGZvcmdpdmUgYSB0eXBvCj4+ICh3aG8gd291bGQgSSBiZSBub3Qg
dG8/KSwgYW5kIHRoaXMgb25lIHdhcyBmdW5ueSBvbmUsIGZpeGluZyBhbGwgdGhvc2UKPj4gbWFu
dWFsbHkgd2hlbiBhcHBseWluZyB3aWxsIGJlIGEgdGVkaW91cyB0YXNrLCB0aG91Z2gsIHNvIHlv
dSB3b3VsZCBoYXZlCj4+IHRvIGRvIHRoYXQgb24geW91ciBzaWRlIGFuZCByZXNwaW4uCj4gCj4g
SSBkb24ndCBrbm93IGlmIHRoYXQgdHlwbyBpcyB3b3J0aCBhIGh1Z2UgcmVzcGluLgoKSWYgaXTi
gJlzIG5lZWRlZCBJIGNhbiwgYXQgbGVhc3QgSeKAmXZlIGZvdW5kIGhvdyBub3QgYmVjb21lIGEg
c3BhbW1lciBub3chCgo+IAo+PiBCdXQgYmVmb3JlIHlvdSBkbyBzbywgcGxlYXNlIHdhaXQgYSBi
aXQgZm9yIG90aGVycyB0byBzcGVhayB1cCwgaWYgdGhpcwo+PiBzZXJpZXMgaXMgcmVhbGx5IG1l
YW5pbmdmdWwuCj4gCj4gSSBoYXZlbid0IHJldmlld2VkIGl0IGluIGl0cyBlbnRpcmV0eSwgYnV0
IG92ZXJhbGwsIEkgdGhpbmsgd2Ugc2hvdWxkCj4ganVzdCBhcHBseSwgYW5kIG1vdmUgb24uIEku
ZSwgYmUgcHJhZ21hdGljLgoKSWYgc29tZSBwcm9ibGVtIGR1ZSB0byB0aGlzIGFyaXNlIEnigJlt
IGF2YWlsYWJsZShib290IHByb2JsZW1zIGV0Yy4pLgoKSSBkb27igJl0IGtub3cgaWYgaXTigJlz
IHdvcnRoIGkgYmVjb21lIE1haW50YWluZXIgZm9yICouY2ZnIGZpbGVzPyBGb3Igd2hhdCBpcyB3
b3J0aCBJIGNvdWxkIGJlIHRoZSBvbmUgd2hvIGRlYWxzIHdpdGggdGhpcyBraW5kIG9mIHByb2Js
ZW0uCgpJIGNhbiBrZWVwIG15IGV5ZXMgb3BlbiBvbiBNYWlsaW5nIExpc3QgZm9yIHRoaXMsIGFs
c28gSSB0aGluayB0aGF0IGxvdCBvZiBwZW9wbGUgaGF2ZSBub3RpY2VkIHRoaXMgYm9tYiBwYXRj
aHNldCBhbmQgc28gaWYgc29tZSBwcm9ibGVtIGFyaXNlcyBtYXliZSBvdGhlciBwZW9wbGUg4oCc
a25vd+KAnSB0aGlzIGlzIHRoZSByZWFzb24uCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkK
QmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gCj4gVGhvbWFzCj4gLS0gCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
