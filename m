Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA55C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD8360F9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CD8360F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BEB605AA;
	Tue, 21 Sep 2021 19:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFWVpUeaN6Bj; Tue, 21 Sep 2021 19:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CB36089E;
	Tue, 21 Sep 2021 19:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1E01BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B074406CE
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1kqEAXs8SUP for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:41:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B33F4035D
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:41:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c0d:ff50:12ec:5b50])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 007FFB004FF;
 Tue, 21 Sep 2021 21:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632253272;
 bh=KPAqiWA7H/x1LZ5KNEIjNBYaQr+r4Pm3VMk8NmEcuiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L04jOxB1iqZHjkBV6kXQxAc/z3jGmY14TLByGKY3zxrylZGrWYj0U2cE0/6cmkyOO
 uBYs/Flodu6FdDeRQNIYkF+cRbYYshSBZC5LfLo9m/6qqOlNmhOlK3fIGTgPXpC904
 O4FCrxGwTf7HEeBqZ6bHEyAOKcdWnID9L5y3JzN5j96BPSJyg34SMmb96UHv7wByL+
 Q1yTfZLuVvI23Bo3xdciKS9zG/UYeu7k+psb7CtKBOf3q18hAVkCUlK3qXKVkMPWs+
 wjjO5RRTb8Nj3Hgf1EDKWsy7+ROHlqmh6pAPDObfjp/cuP0dOQyofgmLCDsxmw2pcr
 wJQRKMnjVEZcQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 21:41:05 +0200
Date: Tue, 21 Sep 2021 21:41:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20210921194105.GA3176@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-2-kory.maincent@bootlin.com>
 <20210921163727.GW1053080@scaer>
 <20210921194944.53b0cacc@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921194944.53b0cacc@kmaincent-XPS-13-7390>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/6] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjEgMTk6NDkgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNw
YWtlIHRodXNseToKPiBPbiBUdWUsIDIxIFNlcCAyMDIxIDE4OjM3OjI3ICswMjAwCj4gIllhbm4g
RS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+
ID4gIEdSVUIyX0NPTkZfT1BUUyA9IFwKPiA+ID4gLQktLXRhcmdldD0kKEdSVUIyX1RBUkdFVCkg
XAo+ID4gPiAtCS0td2l0aC1wbGF0Zm9ybT0kKEdSVUIyX1BMQVRGT1JNKSBcCj4gPiA+ICsJLS1o
b3N0PSQoR05VX1RBUkdFVF9OQU1FKSBcCj4gPiA+ICsJLS1idWlsZD0kKEdOVV9IT1NUX05BTUUp
IFwKPiA+ID4gIAktLXByZWZpeD0vIFwKPiA+ID4gIAktLWV4ZWMtcHJlZml4PS8gXAo+ID4gPiAg
CS0tZGlzYWJsZS1ncnViLW1rZm9udCBcCj4gPiA+IEBAIC0xNDcsMzQgKzE2MCw0OCBAQCBIT1NU
X0dSVUIyX0NPTkZfT1BUUyA9IFwKPiA+ID4gIAktLWVuYWJsZS1saWJ6ZnM9bm8gXAo+ID4gPiAg
CS0tZGlzYWJsZS13ZXJyb3IgIAo+ID4gQXMgVGhvbWFzIHByZXZpb3VzbHkgc3VnZ2VzdGVkLCBJ
IHRoaW5rIHdlIGNhbiBqdXN0IGRyb3AgR1JVQjJfQ09ORl9PUFRTCj4gPiBhbmQganVzdCBwdXQg
dGhlIG9wdGlvbnMsIGV2ZW4gc2hhcmVkICwgZGlyZWN0bHkgaW4gdGhlIGxvb3AgWy4uLl0KPiBI
aXMgc3VnZ2VzdGlvbiB3YXMgdG8gb25seSBrZWVwIG91dCBvZiBHUlVCMl9DT05GX09QVFMgdGhl
IHR3byBwYXJhbWV0ZXJpemVkCj4gb3B0aW9ucyAiLS10YXJnZXQiIGFuZCAiLS13aXRoLXBsYXRm
b3JtIi4gSWYgeW91IHByZWZlciB0byBkcm9wIGFsbCB0aGUKPiBvcHRpb25zIGZyb20gR1JVQjJf
Q09ORl9PUFRTLCBJIGNhbiBkbyB0aGF0LgoKQWgsIHJpZ2h0LCBJIG1pc3JlYWQgd2hhdCBoZSB3
cm90ZS4gQnV0IG9uY2Ugd2UgbW92ZSBzb21lIG9wdGlvbnMgb3V0IG9mCkdSVUIyX0NPTkZfT1BU
UywgYW5kIHNpbmNlIGl0IGlzIHVzZWQgaW4gYSBzaW5nbGUgcGxhY2UsIGRvZXMgaXQgbWFrZQpz
ZW5zZSB0byBrZWVwIGl0IG5vdyB0aGF0IHdlIG5vIGxvbmdlciBhcmUgYW4gYXV0b3Rvb2xzLXBh
Y2thZ2U/Cgo+ID4gPiArCQkkKElOU1RBTEwpIC1EIC1tIDA2NDQgYm9vdC9ncnViMi9ncnViLmNm
Zwo+ID4gPiAkKEdSVUIyX0NGR18kKHR1cGxlKSkgOyBcCj4gPiA+ICsJCSQoaWYgJChmaW5kc3Ry
aW5nICQoR1JVQjJfUExBVEZPUk1fJCh0dXBsZSkpLCBwYyksIFwKPiA+ID4gKwkJCWNhdCAkKEhP
U1RfRElSKS9saWIvZ3J1Yi8kKHR1cGxlKS9jZGJvb3QuaW1nCj4gPiA+ICQoR1JVQjJfSU1BR0Vf
JCh0dXBsZSkpID4gXAo+ID4gPiArCQkJCSQoQklOQVJJRVNfRElSKS9ncnViLWVsdG9yaXRvLmlt
ZyBcCj4gPiA+ICsJCSkgXAo+ID4gPiArCQkkKGlmICQoZmluZHN0cmluZyAkKEdSVUIyX1BMQVRG
T1JNXyQodHVwbGUpKSwgZWZpKSwgXAo+ID4gPiArCQkJZWNobyAkKG5vdGRpciAkKEdSVUIyX0lN
QUdFXyQodHVwbGUpKSkgPiBcCj4gPiA+ICsKPiA+ID4gJChCSU5BUklFU19ESVIpL2VmaS1wYXJ0
L3N0YXJ0dXBfJChHUlVCMl9UQVJHRVRfJCh0dXBsZSkpLm5zaCBcICAKPiA+IAo+ID4gQnV0IHRo
ZSBwcmV2aW91cyBwYXRoICdlZmktcGFydC9zdGFydHVwLm5zaCcgaXMgd2hlcmUgdGhlIHBvc3Qt
YnVpbGQKPiA+IHNjcmlwdHMgYW5kIGdlbmltYWdlIGNvbmZpZyBmaWxlcyBsb29rIGZvcjoKPiA+
IAo+ID4gICAgICQgZ2l0IGdyZXAgLUUgJ1wubnNoJwo+ID4gCj4gPiBTbywgYnkgY2hhbmdpbmcg
dGhlIHBsYWNlIHdoZXJlIHRoZSAubnNoIGlzIHN0b3JlZCwgeW91IGFyZSBicmVha2luZwo+ID4g
dGhvc2UgYm9hcmRzLi4uIFVubGVzcyBJIG1pc3NlZCBzb21ldGhpbmc/Cj4gCj4gWWVzLCBpbmRl
ZWQgaXQgd2lsbCBicmVhayBmZXcgcG9zdC1idWlsZCBzY3JpcHQuCgpUaGVuIHRob3NlIHRoYXQg
YXJlIGJyb2tlbiBtdXN0IGJlIGZpeGVkLgoKPiBCeSBkZWZhdWx0IHRoZSBFRkkgd2lsbCBsb29r
IGF0IGVmaS9ib290L2Jvb3R4NjQuZWZpIG9yIGVmaS9ib290L2Jvb3RpYTMyLmVmaQo+IGlmIHRo
ZSBzdGFydHVwLm5zaCBmaWxlIGlzIG5vdCBwcmVzZW50LiBTbyBib2FyZCBzaG91bGQgYm9vdCB3
aXRob3V0IHRoYXQgZmlsZS4KCkJ1dCB0aGVuLCBpcyBzdGFydHVwX3tpMzg2LHg4Nl82NCxhcm0s
YWFyY2g2NH0ubnNoIGV2ZW4gY29uc3VsdGVkPwoKQXMgSSB1bmRlcnN0YW5kIGl0LCBhbmQgd2l0
aG91dCBhY2Nlc3MgdG8gdGhlIFVFRkkgc3BlY2lmaWNhdGlvbnMsIGl0Cmxvb2tzIGxpa2Ugc3Rh
cnR1cC5uc2ggaXMgdGhlIG9ubHkgZmlsZSB0byBiZSByZWFkIGJ5IGEgKGNvbXBsaWFudD8pClVF
RkkgYmlvcy4KCj4gPiBBbmQgSSBhbSBub3Qgc3VyZSBob3cgdG8gZml4IHRoYXQsIGluIHRoZSBl
bmQuLi4gRXNwZWNpYWxseSB0aGUgc3lzdGVtZAo+ID4gY2FzZSAobWVoKS4KPiBNZSBuZWl0aGVy
LiBNYXliZSB3ZSBjYW4gbGV0IGl0IGxpa2UgdjEsIGFuZCB0aGUgNjQtYml0IEVGSSBjb25maWd1
cmF0aW9uIHdpbGwKPiBiZSB0aGUgb25lIHVzZWQgaWYgYm90aCAzMi1iaXQgRUZJIGFuZCA2NC1i
aXQgRUZJIGFyZSBzZWxlY3RlZC4KCldlbGwsIHRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGhhZXYg
YSBzaW5nbGUgVVNCLXN0aWNrIG9yIENEUk9NIHRoYXQgY2FuCmJvb3Qgb24gYWxsIHRocmVlIHN5
c3RlbXM6CiAgLSBsZWdhY3kgQklPUwogIC0gMzItYml0IFVFRkkKICAtIDY0LWJpdCBVRUZJCgpT
bywgaWYgdGhlIHN0YXJ0dXAubnNoIHNjcmlwdCBpcyB0byBiZSBwcm92aWRlZCwgaXQgc2hvdWxk
IGNvdmVyIHRoZSB0d28KVUVGSSBjYXNlcy4gQSAzMi1iaXQgVUVGSSBiaW9zIGNhbid0IGxvYWQg
YSA2NC1iaXQgcGF5bG9hZCwgYW5kCmNvbnZlcnNlbHksIGEgNjUtYml0IFVFRkkgYmlvcyBjYW4n
dCBsb2FkIGEgMzItYml0IHBheWxvYWQuCgpTbywgaWYgc3RhcnR1cC5uc2ggaXMgbWFuZGF0b3J5
LCB3ZSBoYXZlIGFuIGltcG9zc2libGUgc2l0dWF0aW9uLi4uCgpTbywgSSB3b25kZXIgaWYgc3Rh
cnR1cC5uc2ggaXMgZXZlbiBuZWVkZWQgYXQgYWxsLCBhbmQgaWYgd2Ugc2hvdWxkIG5vdApqdXN0
IGRyb3AgaXQgYWx0b2dldGhlciwgYW5kIGp1c3QgcmVseSwgcyB5b3UgZXhwbGFpbmVkIGVhcmxp
ZXIsIG9uIHRoZQphY3R1YWwgbmFtaW5nIG9mIHRoZSBwYXlsb2FkOiBlZmkvYm9vdC9ib290aWEz
Mi5lZmkgb24gMzItYml0IFVFRkksIG9yCmVmaS9ib290L2Jvb3R4NjQuZWZpIG9uIDY0LWJpdCBV
RUZJLgoKQW5kIGRyb3AgdGhlIGNyZWF0aW9uIG9mIHN0YXJ0dXAubnNoIGluIGd1bW1pYm9vdCBh
bmQgc3lzdGVtZC4KCkFuZCBmaXh1cCB0aGUgcG9zdC1idWlsZCBzY3JpcHRzIGFjY29yZGluZ2x5
Li4uCgpCdXQgYXMgSSBzYWlkIGVhcmxpZXI6IEkgZG8gbm90IGhhdmUgYWNjZXNzIHRvIHRoZSBV
RUZJIHNwZWNpZmljYXRpb25zCih0aGV5IGFyZSBmcmVlLWFzLWluLWJlZXIgdG8gZG93bmxvYWQg
YW5kIHJlYWQsIG5vdCBpbXBsZW1lbnQgb3IgdXNlLApzbyBieSBkb3dubG9hZGluZyB0aGVtLCBJ
IHdvdWxkIGhhdmUgdG8gc3RvcCByZXZpZXdpbmcgdGhpcyBzZXJpZXMgYXMKdGhhdCB3b3VsZCBj
b3VudCBhcyBhIHVzZSBvZiB0aGUgc3BlY3MuLi4pCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
LS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
