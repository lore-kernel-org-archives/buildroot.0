Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1771EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAA3404A5;
	Mon, 10 Jul 2023 19:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BAA3404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLc-ytqWcAlS; Mon, 10 Jul 2023 19:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7768E40B7B;
	Mon, 10 Jul 2023 19:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7768E40B7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3C8D1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A2A240162
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2A240162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2vHNzHIxf-p for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:49:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14F1400D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14F1400D7
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:49:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6136:4573:86f4:937d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 544CC2003DC;
 Mon, 10 Jul 2023 21:49:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jul 2023 21:49:02 +0200
Date: Mon, 10 Jul 2023 21:49:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230710194902.GA188780@scaer>
References: <20230620170726.3644-1-ckhardin@gmail.com>
 <20230710204704.6eba9c3f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710204704.6eba9c3f@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689018545;
 bh=id5PD7fmqnzbg6hNWgr+QoLAIGmworEZMZqrTmYFoFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FTI7OJz/PIC8nQoUhzRMB32KkJPTSw5W+7oJ7MpZ3QlPQamVopVeM4dqMrd3/wL8I
 cTPipzW9U/3Jrgl8TMN2J4fUjX5f9sPVDG5sVwQRTO1v3QLb0nhkYxzO2nxSGwNheN
 yFsjvwhBl1MA90brjoiDLoOZll7ov/1J3Q/ITef/Ay7vcu7sgOt/A35BAik/6vwQYP
 d+VQkfxFsqgG7ib1y1IOh9bpWLmUcwezRaEghuzD+sedSuETJD6z+8tPQWY/kfG2Vh
 boTUmovMw95Jc6+K6seufwQBVBMSRkUaSF3ykWl9egf+vv24T5CSbgDT2Iv5L9mtff
 +iFwYdGBiNS/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FTI7OJz/
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix dhcp symlink in
 target/var/lib/dhcp
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
Cc: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBDaHJsZXMsIEFsLAoKT24gMjAyMy0wNy0xMCAyMDo0NyArMDIwMCwgVGhvbWFzIFBl
dGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4gK1lhbm4gaW4gQ2MuIEkgd2lsbCBhc2sgYSBmZXcgcXVl
c3Rpb25zIGJlbG93LCBidXQgaG9uZXN0bHkgSSdtIG5vdAo+IHN1cGVyIGZhbWlsaWFyIHdpdGgg
dGhpcyBwYXJ0IG9mIHRoZSBjb2RlIGJhc2UsIHNvIEkgbWlnaHQgYmUgYXNraW5nCj4gc29tZSBz
dHVwaWQgcXVlc3Rpb25zLgoKVGhlcmUgYXJlIG5vIHN0dXBpZCBxdWVzdGlvbnMsIG9ubHkgc3R1
cGlkIGFuc3dlcnMgKHdoaWNoIGlzIGN1c3RvbWFyeQpmb3IgbWUgdG8gcHJvdmlkZSkuCgo+IE9u
IFR1ZSwgMjAgSnVuIDIwMjMgMTA6MDc6MjYgLTA3MDAKPiBDaGFybGVzIEhhcmRpbiA8Y2toYXJk
aW5AZ21haWwuY29tPiB3cm90ZToKPiA+IHRoZSB2YXIgZGlyZWN0b3JpZXMgdG8gdGhlIHVzci9z
aGFyZS9mYWN0b3J5IGFuZCB0aGUgcnVuIGEgY29tbWFuZAo+ID4gbGlrZSB0aGlzOgo+ID4gCj4g
PiAgICBtdiAkKFRBUkdFVF9ESVIpL3ZhciAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9mYWN0b3J5
L3Zhcgo+ID4gICAgbWtkaXIgLXAgJChUQVJHRVRfRElSKS92YXIKPiA+ICAgIGZvciBpIGluICQo
VEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyLyogXAo+ID4gICAgICAgICAgICAgJChU
QVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIvbGliLyogXAo+ID4gICAgICAgICAgICAg
JChUQVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIvbGliL3N5c3RlbWQvKjsgZG8KPiA+
IAo+ID4gSWYgdGhlIHN5bWxpbmsgaXMgdG8gdGhlIC90bXAgZGlyZWN0b3J5IHRoZSBnbG9iIGNv
bXBhcmUgb24gdGhlCj4gPiBkaGNwIGxpbmsgd2lsbCBldmFsdWF0ZSBhbmQgcmVzdWx0IGluIGFu
IGluY29ycmVjdCBlbnRyeSBiZWluZwo+ID4gY3JlYXRlZCBpbiB0aGUgcmVzdWx0aW5nIHRtcGZz
IG1vdW50IG9uIHZhci4KPiBJJ20gbm90IGFibGUgdG8gcGFyc2UgeW91ciBleHBsYW5hdGlvbiBo
ZXJlLiBXaGljaCBnbG9iIGNvbXBhcmU/IFdoaWNoCj4gZXZhbHVhdGlvbj8KPiA+IAo+ID4gICAg
IEwrISAvdmFyL2xpYi9kaGNwIC0gLSAtIC0gLi4vdXNyL3NoYXJlL2ZhY3RvcnkvL3Zhci9saWIv
ZGhjcAo+IE5vdCBvYnZpb3VzIHRvIG1lIHdoYXQgaXMgaW52YWxpZCBpbiB0aGlzIGVudHJ5LCBi
dXQgYWRtaXR0ZWRseSBJIGhhdmUKPiBub3QgZG9uZSBhIHRlc3QgYnVpbGQvdGVzdCBydW4gdG8g
aW52ZXN0aWdhdGUgbW9yZS4KClRoaXMgbGluZSBpcyBpbmRlZWQgaW5jb3JyZWN0OiBpdCBtZWFu
cyB0byBjcmVhdGUgL3Zhci9saWIvZGhjcCBhcyBhCnN5bWxpbmsgdG8gLi4vdXNyL3NoYXJlL2Zh
Y3RvcnkvL3Zhci9saWIvZGhjcCwgaS5lLiB0bwovdmFyL2xpYi8uLi91c3Ivc2hhcmUvZmFjdG9y
eS8vdmFyL2xpYi9kaGNwLCB3aGljaCBpbiB0dXJuIGlzIG1hZGUKY2Fubm9uaWNhbCBhcyAvdmFy
L3Vzci9zaGFyZS9mYWN0b3J5Ly92YXIvbGliL2RoY3AsIHdoaWNoIGluZGVlZCBkb2VzCm5vdCBl
eGlzdC4KCj4gUGVyaGFwcyB5b3UgY2FuIGdpdmUgYSBsaXR0bGUgYml0IG1vcmUgZGV0YWlscyB0
byBtYWtlIHRoZSBpc3N1ZQo+IG9idmlvdXMgdG8gdGhlIHJldmlld2VyLCBhbmQgdGhlcmVmb3Jl
IGhlbHAgeW91ciBwYXRjaCB0byBiZSBtZXJnZWQ/CgpJIHRoaW5rIGEgYmV0dGVyIHNvbHV0aW9u
IGlzIHRvIGFjdHVhbGx5IGZpeCB0aGUgZmFjdG9yeToKCiAgIDQxIMK7ICAgZm9yIGkgaW4gJChU
QVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIvKiBcCiAgIDQyIMK7ICAgwrsgICAgJChU
QVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIvbGliLyogXAogICA0MyDCuyAgIMK7ICAg
ICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyL2xpYi9zeXN0ZW1kLyo7IGRvIFwK
ICAgNDQgwrsgICDCuyAgIFsgLWUgIiQke2l9IiBdIHx8IGNvbnRpbnVlOyBcCiAgIDQ1IMK7ICAg
wrsgICBqPSIkJHtpIyQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3Rvcnl9IjsgXAogICA0NiDC
uyAgIMK7ICAgaWYgWyAtTCAiJCR7aX0iIF07IHRoZW4gXAogICA0NyDCuyAgIMK7ICAgwrsgICBw
cmludGYgIkwrISAlcyAtIC0gLSAtICVzXG4iIFwKICAgNDggwrsgICDCuyAgIMK7ICAgwrsgICAi
JCR7an0iICIuLi91c3Ivc2hhcmUvZmFjdG9yeS8kJHtqfSIgXAoKVGhlIC4uLyBoZXJlIHNob3Vs
ZCBiZSByZXBsYWNlZCB3aXRoIGFzLW1hbnkgLi4vIGFzIHRoZSBmaWVsIGlzIGRlZXAKcmVsYXRp
dmUgdG8gL3Vzci9zaGFyZS9mYWN0b3J5L3Zhci8KCmkuZS4gcHJvYmFibHkgc29tZXRoaW5nICh1
bnRlc3RlZCkgbGlrZToKCiAgICAgICBmb3IgaSBpbiAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9m
YWN0b3J5L3Zhci8qIFwKICAgICAgICAgICAgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9y
eS92YXIvbGliLyogXAogICAgICAgICAgICAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9mYWN0b3J5
L3Zhci9saWIvc3lzdGVtZC8qOyBkbyBcCiAgICAgICAgICAgWyAtZSAiJCR7aX0iIF0gfHwgY29u
dGludWU7IFwKICAgICAgICAgICBqPSIkJHtpIyQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3Rv
cnl9IjsgXAogICAgICAgICAgIGlmIFsgLUwgIiQke2l9IiBdOyB0aGVuIFwKICAgICAgICAgICAg
ICAgZD0iJCQoc2VkIC1yIC1lICdzLChbXi4vXSsvKSwuLi8sZycgPDw8JCR7aiUvKn0vKSIgXAog
ICAgICAgICAgICAgICBwcmludGYgIkwrISAlcyAtIC0gLSAtICVzXG4iIFwKICAgICAgICAgICAg
ICAgICAgICIkJHtqfSIgIiR7ZH0vdXNyL3NoYXJlL2ZhY3RvcnkvJCR7an0iIFwKClRoaXMgd2F5
LCB0aGF0IHNob3VsZCBmaXggYWxsIGFic29sdXRlIHN5bmxpbmtzIHRoYXQgYXJlIGluIGFuIGFy
Yml0cmFyeQpkZXB0aCBpbiB0aGUgZmFjdG9yeS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
IFRoYW5rcyEKPiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
