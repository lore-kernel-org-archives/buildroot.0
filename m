Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C8CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 00:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C2B429E4;
	Sat,  8 Jan 2022 00:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUkJ5-lP-36E; Sat,  8 Jan 2022 00:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9B7428B3;
	Sat,  8 Jan 2022 00:07:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDC111C1189
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 00:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E8B82ACD
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 00:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=fastmail.com header.b="eWYD4e0h";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="Hi5n02VQ"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnkQSdMp5z_J for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 00:07:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D791E813FB
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 00:07:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2578F3200E60;
 Fri,  7 Jan 2022 19:07:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 07 Jan 2022 19:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 message-id:subject:from:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 RgrP/lsDmRC76iaCwBs4rUVB1gTKfTuk/ENwa8ruFgs=; b=eWYD4e0hB+3lcXmJ
 ZZSCD5Wmsra48LmMkMMsGNs6a44krTiyBl32YEMFH6nbZihe0/383X8zynyTbv7+
 iG1xtxAw/Rshs/Lr29u05gQntBXfTufinbpUZINyjqY6BcDbqk7dTC5kGIpui0l8
 q2kx+gZ69zziQNmAOfmOK7tmFehJaoTATG8VcPU+xH0YgiV3hd2o1iP3O7keydgN
 dH09Y4lqe3paPoK/CF29+ZqmilR6feLkhsGtvHqTreR+UMYMXtUk8AyCfxT6+P3w
 O1gwNeV2KsC/ajkJHzo0lbxeQeZ895XcOfIqMWzZ3ZBBriJAzHj5wbJUdAe5NqdO
 38Ciuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RgrP/lsDmRC76iaCwBs4rUVB1gTKfTuk/ENwa8ruF
 gs=; b=Hi5n02VQ6++cRt3Rl6KrSjHfXofhsAC7znX/vjbg7pT8+4AR5C0vvs1Lt
 nSoG16X9zO8krOoktVRD31IBqhWi4LCLRC6s1hU0I+ZdF4+gHtto9X3RR9sqDupI
 0q7narBmB/VfYkIHf72kCeLRrYICZ6JE2tdxKyGg+xbQ4VOP+zaB0TaYsLKnUFKQ
 mbbUfjrq8nHAQfvIy/ase1FMeIDMWHH/PsAcoR3pkuypUMxWhN1dfG+WfflYkJmi
 1bO/AKYYVnYuj++mbCb4wOwRKtwmfh7jqfyFSDGnRkFsOXBcDivkTfgWmPD03zg8
 LRbkWJKGP9eYPc0bHsifMNbJ9JHyg==
X-ME-Sender: <xms:sNXYYbjDXhrymN0ETcFMM_flPl8bsppi-_T6V61PnepyOMUffm1VIQ>
 <xme:sNXYYYDBxqPLTLAVTv7MDyj8kbfSZqEcjNXuZNuguSQ8c7odynjMWtLkzIjnp62fu
 boF6KlJuKQ2KroAHPE>
X-ME-Received: <xmr:sNXYYbG72aa95LaZoIiyUdVCnnGDtleJdJT7BNleo4Hk1Ql152ZPwAKE1nN3mrUBTFaq9PAJUAMkkL8Nbr-czmFIFJOmnL5sPD3-T4DO2Ar_5aPbZxg5KgkS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegfedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomheplfgvshhs
 vgcuofhilhhlfihoohguuceojhgvshhsvggpuggvvhesfhgrshhtmhgrihhlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeehjeeihfduuefhffdugeevhfekjedtteehkeelkeelleef
 fedvheeitdetvdeggeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghsshgvpggu
 vghvsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:sNXYYYRcZXM3FBk9KL1VeBgjypkzC2I-mJuE4DBxzMfB3pdAjYbpuA>
 <xmx:sNXYYYzAOjFNm2Qp2X4tW6e0AvHAoW2SKvx05P7ouEz5sviNL7qKkA>
 <xmx:sNXYYe5f-ChNyQOXPwHFupQcaAtNAlQvcq_LeUkFFtIlvN3ULcUcng>
 <xmx:sNXYYeY9hvVyf_C_Obbjo9GxcdemsXmhX7MBcSo3zdU3A25XspO5wA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jan 2022 19:07:12 -0500 (EST)
Message-ID: <99fefbe8119003202a02e7696a98711c71bd30c7.camel@fastmail.com>
From: Jesse Millwood <jesse_dev@fastmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Fri, 07 Jan 2022 19:07:11 -0500
In-Reply-To: <4d73992c-3189-1989-525c-4506495c90ac@mind.be>
References: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
 <09340549-99c9-b79c-17db-3967b1ab6335@mind.be>
 <fff7dc06ab8c676e28709d3782e57e90ae121095.camel@fastmail.com>
 <4d73992c-3189-1989-525c-4506495c90ac@mind.be>
User-Agent: Evolution 3.42.2 (flatpak git) 
MIME-Version: 1.0
Subject: Re: [Buildroot] Overriding Kconfig Values from external br2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDE4OjA5ICswMTAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3
cm90ZToKPiAKPiAKPiBPbiAwNi8wMS8yMDIyIDE2OjM3LCBKZXNzZSBNaWxsd29vZCB3cm90ZToK
PiA+IE9uIFRodSwgMjAyMi0wMS0wNiBhdCAxMDo0NSArMDEwMCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgd3JvdGU6Cj4gPiA+IAo+ID4gPiAKPiA+ID4gT24gMDUvMDEvMjAyMiAyMDowMywgSmVzc2Ug
TWlsbHdvb2Qgd3JvdGU6Cj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gCj4gPiA+ID4gSSBoYXZlIGFu
IGV4dGVybmFsIEMvQysrIHRvb2xjaGFpbiB0aGF0IEkndmUgcHV0IHRvZ2V0aGVyIHRoYXQKPiA+
ID4gPiB1c2VzCj4gPiA+ID4gTVVTTC4gSSd2ZQo+ID4gPiA+IGFsc28gYnVpbHQgYW4gZXh0ZXJu
YWwgUnVzdCB0b29sY2hhaW4gdGhhdCB1c2VzIG15IE1VU0wKPiA+ID4gPiB0b29sY2hhaW4uCj4g
PiA+ID4gCj4gPiA+ID4gTXkgaXNzdWUgaXMgdGhhdCB0aGVyZSBpcyBhIFJ1c3QgS2NvbmZpZyB2
YXJpYWJsZSB0aGF0Cj4gPiA+ID4gc3BlY2lmaWVzIGlmCj4gPiA+ID4gYSBzcGVjaWZpYwo+ID4g
PiA+IGFyY2hpdGVjdHVyZSBzdXBwb3J0cyBSdXN0Lgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBLY29u
ZmlnIHZhcmlhYmxlIGluIHF1ZXN0aW9uIGlzCj4gPiA+ID4gQlIyX1BBQ0tBR0VfSE9TVF9SVVNU
Q19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ID4gPiA+IGluIHBhY2thZ2UvcnVzdGMvQ29uZmlnLmlu
Lmhvc3QuCj4gPiA+IAo+ID4gPiBbc25pcF0KPiA+ID4gCj4gPiA+ID4gWW91IG1heSBub3RpY2Ug
dGhhdCBJIGNoYW5nZWQgdGhlIGxpYmMgZGVwZW5kcyBsaW5lIHRvIGJlIG9yJ2QKPiA+ID4gPiB3
aXRoCj4gPiA+ID4gQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wuIEl0IHNlZW1zIHRoYXQgdGhpcyBk
b2VzIG5vdCBnZXQKPiA+ID4gPiBjb25zaWRlcmVkCj4gPiA+ID4gd2hlbiBJCj4gPiA+ID4gY2hv
b3NlIG15IGV4dGVybmFsIG11c2wgdG9vbGNoYWluIG9wdGlvbi4gSW4gdGhlIG1lbnVjb25maWcK
PiA+ID4gPiB3aGVuIEkKPiA+ID4gPiBzZWFyY2ggZm9yCj4gPiA+ID4gdGhlIEJSMl9QQUNLQUdF
X0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMgdmFyaWFibGUgd2l0aAo+ID4gPiA+IHRo
ZQo+ID4gPiA+ICIvIiBrZXkgaXQKPiA+ID4gPiBsb29rcyBsaWtlIGl0IGlzIG9ubHkgZ2V0dGlu
ZyBpdCBmcm9tIHRoZSBvcmlnaW5hbCBmaWxlLiBEb2VzCj4gPiA+ID4gYnVpbGRyb290IGhhdmUg
YQo+ID4gPiA+IG1lY2hhbmlzbSBmb3Igb3ZlcndyaXRpbmcgdGhpcyBraW5kIG9mIHNldHRpbmcg
YW5kIGlmIG5vdCwgZG9lcwo+ID4gPiA+IGFueW9uZSBoYXZlIGFuCj4gPiA+ID4gaWRlYSBvZiBo
b3cgSSB3b3VsZCBhY2NvbXBsaXNoIHdoYXQgSSBhbSB0cnlpbmcgdG8gZG8gKG1ha2UKPiA+ID4g
PiBidWlsZHJvb3QgaG9ub3IgbXkKPiA+ID4gPiBleHRlcm5hbCBydXN0IHRvb2xjaGFpbik/Cj4g
PiA+IAo+ID4gPiDCoMKgIE5vLCB0aGVyZSdzIG5vIHdheSB0byBvdmVycmlkZSB0aGUgZGVwZW5k
ZW5jaWVzIG9mIGFuIGV4aXN0aW5nCj4gPiA+IENvbmZpZy5pbgo+ID4gPiBzeW1ib2wgaW4gYW4g
ZXh0ZXJuYWwuCj4gPiA+IAo+ID4gPiDCoMKgIEhvd2V2ZXIsIHRoaXMgd2FzIGNvcnJlY3RlZCBp
biB1cHN0cmVhbSBCdWlsZHJvb3QgaW4gY29tbWl0Cj4gPiA+IGQ2OWQ0MGMwMjlkYzdkODE5OWI3
NDVlYWVlNzU5ZDkyYjY2YzVkMTcuIFNvIHlvdSBjYW4gdHJ5IHRvCj4gPiA+IGJhY2twb3J0Cj4g
PiA+IHRoYXQgY29tbWl0Cj4gPiA+IGluc3RlYWQsIG9yIGp1c3QgdXBkYXRlIEJ1aWxkcm9vdCB0
byBzb21ldGhpbmcgbW9yZSByZWNlbnQuCj4gPiAKPiA+IEFybm91dCwgdGhhbmtzIGZvciB0aGUg
cG9pbnRlciB0byB0aGUgY29tbWl0LiBUaGF0IGlzIGEgbG9naWNhbCB3YXkKPiA+IHRvCj4gPiBz
dXBwb3J0IG90aGVyIHBsYXRmb3Jtcy4gSG93ZXZlciwgSSBoYXZlIGEgcG93ZXJwYyBtdXNsIHJ1
c3QKPiA+IHRvb2xjaGFpbgo+ID4gdGhhdCBJJ3ZlIGJ1aWx0IGV4dGVybmFsbHkuCj4gPiAKPiA+
IFdpdGggdGhlIGNoYW5nZXMgaW4gdGhhdCBjb21taXQgY2FuIEkgc2V0Cj4gPiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTIHRvICJ5IiBpbiBteSBleHRlcm5hbAo+
ID4gbm93Cj4gCj4gwqAgQWgsIG5vLCB5b3UncmUgcmlnaHQsIHBvd2VycGMtdW5rbm93bi1saW51
eC1tdXNsIGlzIGEgVGllciAzCj4gcGxhdGZvcm0gYW5kIHRoYXQgCj4gcGF0Y2ggb25seSBhZGRz
IFRpZXIgMSBhbmQgMi4gV2UgY291bGQgYWRkIGEgVGllciAzIG9wdGlvbiBhcyB3ZWxsCj4gKGFu
ZCBkaXNhYmxlIAo+IHRoZSBydXN0LWJpbiBvcHRpb24gaW4gdGhhdCBjYXNlKS4KPiAKPiDCoCBO
b3RlIGhvd2V2ZXIgdGhhdCB0aGUgc3RkbGliIHN0YXR1cyBmb3IgdGhpcyB0YXJnZXQgaXMgbWFy
a2VkIGFzCj4gIj8iIG9uIFsxXSwgCj4gc28gSSdtIG5vdCBzdXJlIGl0J3MgZXZlciBnb2luZyB0
byB3b3JrLi4uCj4gCkkgaGF2ZSBpdCB3b3JraW5nIGFjdHVhbGx5LiBJIGhhZCB0byBwYXRjaCBt
eSBjcm9zc3Rvb2wtbmcgdG9vbGNoYWluIHRvCmFkZCBhbiBleHRyYSBkZWZhdWx0IG1hY3JvIHNv
IHRoYXQgbGlidW53aW5kIGJ1aWxkcy4gCgo+IAo+ID4gdGhhdCB0aGVyZSBpcyBubyBkZXBlbmRz
IGV4cHJlc3Npb25zIGFuZCBpdCBpcyBhbGwgZGVmYXVsdCBsb2dpYz8KPiA+IE9yCj4gPiB3b3Vs
ZCBJIGhhdmUgdG8gc3RpbGwgYWRkIGFub3RoZXIgZXhwcmVzc2lvbiB0aGF0IG1heWJlIGRlZmF1
bHRzIHRvCj4gPiAieSIKPiA+IGlmIGEgbmV3IHZhcmlhYmxlIGlzIHRydWUgbGlrZQo+ID4gIkJS
Ml9FWFRFUk5BTF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyIgdGhhdCBpcyBkZWZpbmVkIGlu
IG15Cj4gPiBleHRlcm5hbD8KPiAKPiDCoCBObywgdGhhdCdzIG5vdCBnb2luZyB0byB3b3JrLgo+
IAo+IMKgIEkgdGhpbmsgeW91IGNhbiBtYWtlIGEgaGFjazogYWRkICJzZWxlY3QgCj4gQlIyX1BB
Q0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyIgdG8geW91ciAKPiBCUjJfVE9P
TENIQUlOX0VYVEVSTkFMX01ZX01VU0wgZGVmaW5pdGlvbi4gSSB0aGluayB0aGF0IHdvcmtzLgo+
IAo+IMKgIFJlZ2FyZHMsCj4gwqAgQXJub3V0Cj4gCgpUaGFua3MhIEkgaGFkIHRvIHVwZGF0ZSBz
b21lIG5hbWVzIG9mIHNvbWUgdGhpbmdzIGJ1dCBJIHVwZGF0ZWQgbXkKYnVpbGRyb290IHJlcG8g
YW5kIHdhcyBhYmxlIHRvIHVzZSB0aGUgc2VsZWN0IG1ldGhvZCB0byBlbmFibGUKQlIyX1BBQ0tB
R0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUy4gCgo+IAo+ID4gCj4gPiBUaGFua3Ms
Cj4gPiBKZXNzZQo+ID4gCj4gPiA+IAo+ID4gPiDCoMKgIFJlZ2FyZHMsCj4gPiA+IMKgwqAgQXJu
b3V0Cj4gPiA+IAo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gSmVzc2UK
PiA+ID4gPiAKPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
