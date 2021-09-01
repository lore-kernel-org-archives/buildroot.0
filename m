Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9EAC432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 16:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8E861027
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 16:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D8E861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103AE80E2E;
	Wed,  1 Sep 2021 16:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOgOR8Oz6r5X; Wed,  1 Sep 2021 16:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2DC80E34;
	Wed,  1 Sep 2021 16:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B430A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 16:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3CAB605BC
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 16:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=fastmail.com header.b="mWonRGJs";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="mIVGAa87"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SgyDsgljcTn for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 16:04:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80B56600CA
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 16:04:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C1F0D5C01EE;
 Wed,  1 Sep 2021 12:04:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Sep 2021 12:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=R
 ylTVWLfLzGxLJCxRdNw7SksFAP+LSrjuGateKlmPOY=; b=mWonRGJsvS9iyxIev
 i5AfUNsIpNNHbg3ZaSjqbIdF2cRKCdyiaI88/7kEQztan9ZJDN5bSgADJEuHKNEm
 /86fFXcz03kX1pEGb2QFdzzsuTkcZzAQRBVGrLNuMkeHPJDu+l4SdsBDD1+61BF0
 2XGe+NAK8PHNOIm34WukR29iN2UkRAQSa1cRjUTn2dsscwo2WjN2yeHhjj/+jNo8
 CMYKPq0oy88LXZZGpSWyBWFbjZIR9rzBq0K4PaBAkZzc7bzjERKe8eZNknnpv9G/
 ddbSVFLc/+SenWhEOILHwW14IeHCjKPMVOR0umS8itOxya9Ujn78Sc4Of9M9bE4W
 AKTPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=RylTVWLfLzGxLJCxRdNw7SksFAP+LSrjuGateKlmP
 OY=; b=mIVGAa87+q2DJu85sbbq9EvZHOTBRta1mF135h+gc+P++Fit3eXuZVTgl
 nf4L0+jUNuzFexQybbnydiHQ8FblSxsrWtUDADn3bhJqtyy6v1lr/1OQg6v1tpYO
 mq7yqV3uf/xNKsLKR/oAKccBScR6A0h5oDLkdh9OJnIwpF3n50OiJiFwazO8zw7c
 Vwp3SUL4flciUufs4Br3qNEIn4ttKD09nEiBskV4Q7ZAibwiDsj6ZfP7RSVGUmkx
 Z/GnDsNCvrLAnx71SMPtl3mXn0W7ulKSoUf1aqa5mcjbN5+LrGqI91C+hQWubLrW
 LJ0WFpqvd2cZxo6NMPSN8BuUEEvHA==
X-ME-Sender: <xms:o6QvYb0o91DD37jzrSr3f5FSetvugFc8Xu04rcA6goTN7aJ95jvMow>
 <xme:o6QvYaFCCETkFM0DpFGK26P7Bz30chJQ8nOatHTI8eyACYIa-L8SQr0eUn4OuCThK
 wJkkEBQpMgW0PhD6aM>
X-ME-Received: <xmr:o6QvYb5cLWVQ4TMIneXkD4EmOwTf5igWXp5dZWviktYTmfcO3yyXIvZyuvkg_zPvuNW->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepmfhriiih
 shiithhofhcumfgrnhgrshcuoehkkhgrnhgrshesfhgrshhtmhgrihhlrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeffkeektddtjeeigeeltdfgvdejffdvueelvdeuleefleekffdu
 hfethfegvdfhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehkkhgrnhgrshesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:o6QvYQ2drl2WxwHNW3hs3EoMZFrAwED9ObeSxuHWTSXkxSktZYyZrA>
 <xmx:o6QvYeFQsg41Hgva3nG_jeYEHE2JmTEVaE85FPJhXls1pFnWazeFcA>
 <xmx:o6QvYR8y6aRvDn71KU7kptXfuk6DT9Ox8rvESLCtC_TQ1VvogsWOIw>
 <xmx:pKQvYQNdRWinpAvPLaZvPstUS3ydZAWJRte_1kaXgOL-hbKr3Nurzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 12:04:50 -0400 (EDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210830201308.143849-1-kkanas@fastmail.com>
 <57f575c2-ba73-a1b1-6074-88b772d1207e@mind.be>
 <61d12e5e-db00-fc4f-4135-72d4aa926a68@fastmail.com>
 <81d1492a-d3ce-fc45-4227-4b05c0aeb4a0@mind.be>
From: Krzysztof Kanas <kkanas@fastmail.com>
Message-ID: <fe5d4301-e57d-5cf9-7860-841639c59f86@fastmail.com>
Date: Wed, 1 Sep 2021 18:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <81d1492a-d3ce-fc45-4227-4b05c0aeb4a0@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwMS8wOS8yMDIxIDE2OjU5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAK
PiBPbiAwMS8wOS8yMDIxIDE2OjQ4LCBLcnp5c3p0b2YgS2FuYXMgd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDAxLzA5LzIwMjEgMTU6MjYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pj4KPj4+Cj4+
PiBPbiAzMC8wOC8yMDIxIDIyOjEzLCBLcnp5c3p0b2YgS2FuYXMgd3JvdGU6Cj4+Pj4gZW52aXJv
bm1lbnQtc2V0dXAgdXNlZCBCQVNIX1NPVVJDRSB3aGljaCBpcyBiYXNoIHNwZWNpZmljIGFuZCBl
bXB0eQo+Pj4+IHZhcmlhYmxlIGZvciB6c2ggKGFuZCBvdGhlciBzaGVsbCdzKS4KPj4+PiBVc2Ug
JDAgd2hpY2ggc2hvdWxkIGJlIHdvcmsgYWNyb3NzIG11bHRpcGxlIHNoZWxscyh0Y3NoLCBkYXNo
LCB6c2gpCj4+Pj4gSXQgd29uJ3Qgd29yayBpZiBvdGhlciBzY3JpcHQgaXMgc291cmNpbmcgZW52
aXJvbm1lbnQtc2V0dXAuCj4+Pgo+Pj4gIMKgIFRoZSBlbnZpcm9ubWVudC1zZXR1cCBpcyBzdXBw
b3NlZCB0byBiZSBzb3VyY2UnZCwgc28gaG93IGlzIHRoaXMgZXZlciBnb2luZyB0bwo+Pj4gd29y
az8KPj4gVGhpcyBzY3JpcHQgd2lsbCB3b3JrIHdoZW4gc291cmNlZCBpbnRlcmFjdGl2ZWx5IGZy
b20gYmFzaCBzaGVsbCBkdWUgdGhlIHRlc3QKPj4gZm9yICR7QkFTSF9TT1VSQ0V9IHNvIHRoaXMg
YmVoYXZpb3IgaXMgbm90IGNoYW5nZWQuCj4+Cj4+IFdoYXQgSSBtZWFudCBieSB0aGlzIHBhcmFn
cmFwaCB3YXMgaG93IGRpZmZlcmVudCBzaGVsbCdzIHNldCAkMCBhdWdtZW50IHdoZXRoZXIKPj4g
c2NyaXB0IGlzIHNvdXJjZWQgaW50ZXJhY3RpdmVseSBvciBzb3VyY2VkIGZyb20gYW5vdGhlciBz
Y3JpcHQsIGUuZzoKPj4gY2F0ID4gZm9vLnNoCj4+IHNvdXJjZSBlbnZpcm9ubWVudC1zZXR1cAo+
PiBeRAo+Pgo+PiBCdXQgSSBtaXNzZWQgY2FzZSB3aGVuIGVudmlyb25tZW50LXNldHVwIGlzIHNv
dXJjZWQgZnJvbSBhbm90aGVyIGRpcmVjdG9yeSwKPj4gbHVja3kgdGhpcyB3b3JrcyBpbiB6c2gg
Y2FzZSwgYnV0IG5vdCBpbiBjYXNlIG9mIGRhc2gsIGtzaC4KPj4gU28gdGhlIGZpeCB3b3VsZCBi
ZSBhcHBsaWNhYmxlIHRvIHpzaCBvbmx5IChhY3R1YWxseSBteSBtYWluIHB1cnBvc2UgZm9yIHRo
ZQo+PiBwYXRjaCkuCj4+Cj4+Pgo+Pj4gIMKgIEkgdGhpbmsgdGhlIG9ubHkgdmlhYmxlIHNvbHV0
aW9uIGlzIHRvIHJlcXVpcmUgYW4gYXJndW1lbnQgaWYgc2hlbGwgaXMgbm90Cj4+PiBiYXNoLgo+
PiBTbyB5b3UgYXJlIHRoaW5raW5nIG9mCj4+IGlmIFsgJFNIRUxMICE9IGJhc2ggXSA7IHRoZW4g
Pwo+IAo+ICAgSSB3YXMgdGhpbmtpbmcgb2YgeW91ciBpZiBbIHgiJHtCQVNIX1NPVVJDRX0iICE9
IHgiIiBdCgpTbyB3aGF0IGFib3V0OgoKaWYgWyB4IiRCQVNIX1ZFUlNJT04iICE9IHgiIiBdIDsg
dGhlbgogICAgICAgICBTREtfUEFUSD0kKGRpcm5hbWUgJChyZWFscGF0aCAiJHtCQVNIX1NPVVJD
RVswXX0iKSkKZWxpZiBbIHgiJFpTSF9WRVJTSU9OIiAhPSB4IiIgXSA7IHRoZW4KICAgICAgICAg
U0RLX1BBVEg9JChkaXJuYW1lICQocmVhbHBhdGggJDApKQplbHNlCiAgICAgICAgIGVjaG8gJ3Vu
c3Vwb3J0ZWQgc2hlbGwKZmkKClRoaXMgc2hvdWxkIHdvcmsgZm9yIGJhc2ggYXMgcHJldmlvdXNs
eSBhZGQgenNoIHN1cHBvcnQsIGJ1dCB3b24ndCB3b3JrIApmb3IgZGFzaCAoYXMgaXQgZGlkbid0
IHdvcmsgcHJldmlvdXNseSApLCBidXQgd2lsbCBnaXZlIGNsZWFyZXIgZXJyb3IgCmluZGljYXRp
b24uCgo+IAo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+IAo+PiBJIGRvbid0IGtub3cgaWYgdGhh
dCB3aWxsIGJlIGVhc3kvcG9ydGFibGUgdG8gZG/CoCBiL2MgcnVubmluZywKPj4KPj4genNoCj4+
IGJhc2gKPj4gZW52fGdyZXAgU0hFTEwKPj4gU0hFTEw9L2Jpbi96c2gKPj4gWFRFUk1fU0hFTEw9
L2Jpbi96c2gKPj4KPj4+Cj4+PiAgwqAgUmVnYXJkcywKPj4+ICDCoCBBcm5vdXQKPj4+Cj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS2FuYXMgPGtrYW5hc0BmYXN0bWFpbC5jb20+
Cj4+Pj4gLS0tCj4+Pj4gIMKgIHBhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQt
c2V0dXAgfCA2ICsrKysrLQo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lbnZpcm9ubWVu
dC1zZXR1cC9lbnZpcm9ubWVudC1zZXR1cAo+Pj4+IGIvcGFja2FnZS9lbnZpcm9ubWVudC1zZXR1
cC9lbnZpcm9ubWVudC1zZXR1cAo+Pj4+IGluZGV4IGU5YmMzNmZkZDA5My4uMmI1NGU4OGQ2Njg5
IDEwMDY0NAo+Pj4+IC0tLSBhL3BhY2thZ2UvZW52aXJvbm1lbnQtc2V0dXAvZW52aXJvbm1lbnQt
c2V0dXAKPj4+PiArKysgYi9wYWNrYWdlL2Vudmlyb25tZW50LXNldHVwL2Vudmlyb25tZW50LXNl
dHVwCj4+Pj4gQEAgLTE2LDQgKzE2LDggQEAgU29tZSB0aXBzOgo+Pj4+ICDCoCAqIFRvIGJ1aWxk
IENNYWtlLWJhc2VkIHByb2plY3RzLCB1c2UgdGhlICJjbWFrZSIgYWxpYXMKPj4+PiAgwqAgwqAg
RU9GCj4+Pj4gLVNES19QQVRIPSQoZGlybmFtZSAkKHJlYWxwYXRoICIke0JBU0hfU09VUkNFWzBd
fSIpKQo+Pj4+ICtpZiBbIHgiJHtCQVNIX1NPVVJDRX0iICE9IHgiIiBdOyB0aGVuCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIFNES19QQVRIPSQoZGlybmFtZSAkKHJlYWxwYXRoICIke0JBU0hfU09VUkNF
WzBdfSIpKQo+Pj4+ICtlbHNlCj4+Pj4gK8KgwqDCoCBTREtfUEFUSD0kKGRpcm5hbWUgJChyZWFs
cGF0aCAkMCkpCj4+Pj4gK2ZpCj4+Pj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
