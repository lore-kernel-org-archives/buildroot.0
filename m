Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90185CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45085415DC;
	Wed,  3 Apr 2024 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnURJq94Dfuv; Wed,  3 Apr 2024 20:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB70415E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB70415E0;
	Wed,  3 Apr 2024 20:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC9A41BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B5582262
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SO8OhCDJxG_c for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADC558223C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC558223C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADC558223C
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 20:57:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 69AAD13F89A;
 Wed,  3 Apr 2024 22:57:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:57:27 +0200
Date: Wed, 3 Apr 2024 22:57:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zg3Ct67Am5lo_rh-@landeda>
References: <20240403085424.1650628-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403085424.1650628-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712177851;
 bh=q5RlI7c68SJL4MtElGa5feMzbmQlJ/s4jmFkG3ifNZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHke3NYG9DQ/25S3sOGWXmxr8kYM3hIysljXu+y0b7mqhP8N3KYoWBhJcAjZJgcxm
 6bEZveLzuIhl2mDqti9Wruvw3TB32cpT/kORaWxQIAr0niglmxGbJbkPSrXlaJg/vN
 Y0OM1XMn8ak4yqu4+85w+uNujqh/fNw/4WDIOzKVi3K4VUeHT2mUVC1bNpiaxyDsE0
 vThGB7pa90zzqXli9RQarCuJwce/YOLkKKSHTr4ZwNWuG6GLkATDV3js4uQhleLifJ
 nabJ0fLmQJNAneOIPjSUuqy/0p4iuT0uPHbmM8q2Ly70RAh8SYv2xXva79fJH2wxBk
 VdC+hq/Pvwqyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WHke3NYG
Subject: Re: [Buildroot] [PATCH 1/3] package/lmdb: new package
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
Cc: buildroot@busybox.net, i Mauro Condarelli <mc5686@mclink.it>,
 Emile Cormier <emile.cormier.jr@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgorTWF1cm8gZm9yIHB5aG9uLWxtZGIKK0VtaWxlIGZvciBweXRob24t
emxtZGIKCk9uIDIwMjQtMDQtMDMgMTA6NTQgKzAyMDAsIEZyYW5jb2lzIFBlcnJhZCBzcGFrZSB0
aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRA
Z2Fkei5vcmc+ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbWRiL0NvbmZpZy5p
biBiL3BhY2thZ2UvbG1kYi9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmY0YWU5ZjMxMDMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9s
bWRiL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTMgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xN
REIKPiArCWJvb2wgImxtZGIiCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMKPiArCWhlbHAKPiArCSAgT3BlbkxEQVAgTGlnaHRuaW5nIE1lbW9yeS1NYXBwZWQgRGF0YWJh
c2UKPiArCj4gKwkgIExNREIgaXMgY29tcGFjdCwgZmFzdCwgcG93ZXJmdWwsIGFuZCByb2J1c3Qg
YW5kIGltcGxlbWVudHMKPiArCSAgYSBzaW1wbGlmaWVkIHZhcmlhbnQgb2YgdGhlIEJlcmtlbGV5
REIgKEJEQikgQVBJLgo+ICsKPiArCSAgaHR0cHM6Ly9zeW1hcy5jb20vbG1kYi8KPiArCj4gK2Nv
bW1lbnQgImxtZGIgbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcyIKPiArCWRlcGVuZHMgb24g
IUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKCk1hdXJvLCBFbWlsZTogcHl0aG9uLWxtZGIgYnVu
ZGxlcyBhIGNvcHkgb2YgbG1kYiwgYnV0IGl0IGlzIHBvc3NpYmxlIHRvCmNvbmZpZ3VyZSBpdCB0
byB1c2UgdGhlIHN5c3RlbS1wcm92aWRlZCBsaWJyYXJ5IGluc3RlYWQgWzBdLiBEbyB5b3Uga25v
dwppZiB0aGVyZSB3b3VsZCBiZSBhZHZlcnNlIGVmZmVjdHMgdG8gZG8gc28gaW4gQnVpbGRyb290
PyBJbmRlZWQsIHdlCnByZWZlciB0byBjb25maWd1cmUgcGFja2FnZXMgdG8gdXNlIHN5c3RlbSBs
aWJyYXJpZXMgcmF0aGVyIHRoYW4gdXNlCnRoZXJlIGJ1bmRsZWQgY29weSB3aGVuZXZlciBwb3Nz
aWJsZS4uLgoKWzBdIGh0dHBzOi8vbG1kYi5yZWFkdGhlZG9jcy5pby9lbi9yZWxlYXNlLyNpbnN0
YWxsYXRpb24tdW5peAoKSSBoYXZlbid0IGxvb2tlZCBhdCBweXRob24temxtZGIsIHRob3VnaC4u
LgoKWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xtZGIvbG1kYi5tayBiL3BhY2th
Z2UvbG1kYi9sbWRiLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li41ZTJhZDJkMDVhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbG1kYi9sbWRiLm1r
Cj4gQEAgLTAsMCArMSwzNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMg
bG1kYgo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMTURCX1ZFUlNJT04g
PSAwLjkuMzEKPiArTE1EQl9TSVRFID0gJChjYWxsIGdpdGh1YixMTURCLGxtZGIsTE1EQl8kKExN
REJfVkVSU0lPTikpCj4gK0xNREJfTElDRU5TRSA9IE9wZW5MREFQIFB1YmxpYyBMaWNlbnNlCgpJ
IHRoaW5rIHdlIHdhbnQgdG8gdXNlIHRoZSBTUERYIHNob3J0IHRhZyBoZXJlOiBPTERBUC0yLjgu
IEluY2lkZW50YWxseSwKdGhpcyBpcyBhbHNvIHdoYXQgaXMgYWxyZWFkeSB1c2VkIGZvciBweXRo
b24tbG1kYi4KCj4gK0xNREJfTElDRU5TRV9GSUxFUyA9IGxpYnJhcmllcy9saWJsbWRiL0xJQ0VO
U0UKPiArTE1EQl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArCj4gK2RlZmluZSBMTURCX0JVSUxE
X0NNRFMKPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpL2xpYnJhcmllcy9s
aWJsbWRiIFwKPiArCQlDQz0iJChUQVJHRVRfQ0MpIiBcCj4gKwkJWENGTEFHUz0iJChUQVJHRVRf
Q0ZMQUdTKSIgXAo+ICsJCUFSPSIkKFRBUkdFVF9DUk9TUylhciIgXAoKV2h5IG5vdCB1c2UgJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpIGFuZCBqdXN0IGFkZCB0aGUgc3BlY2lhbCBYQ0ZMQUdTPwoK
PiArCQlhbGwKCidhbGwnIGlzIHVzdWFsbHkgdGhlIGRlZmF1bHQgdGFyZ2V0LCBmb3IgYmVpbmcg
dGhlIGZpcnN0IGluIHRoZQpNYWtlZmlsZSwgd2hpY2ggaXMgYWxzbyB0aGUgY2FlIGhlcmUsIHNv
IHRoZXJlIGlzIG5vIHJlYXNvbiB0byBzcGVjaWZ5Cml0LgoKPiArZW5kZWYKPiArCj4gK2RlZmlu
ZSBMTURCX0lOU1RBTExfU1RBR0lOR19DTURTCj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtF
KSAtQyAkKEBEKS9saWJyYXJpZXMvbGlibG1kYiBcCj4gKwkJREVTVERJUj0iJChTVEFHSU5HX0RJ
UikiIFwKPiArCQlwcmVmaXg9L3VzciBcCj4gKwkJaW5zdGFsbAo+ICtlbmRlZgo+ICsKPiArZGVm
aW5lIExNREJfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICsJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFL
RSkgLUMgJChARCkvbGlicmFyaWVzL2xpYmxtZGIgXAo+ICsJCURFU1RESVI9IiQoVEFSR0VUX0RJ
UikiIFwKPiArCQlwcmVmaXg9L3VzciBcCj4gKwkJaW5zdGFsbAo+ICtlbmRlZgo+ICsKPiArJChl
dmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiAtLSAKPiAyLjM5LjIKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
