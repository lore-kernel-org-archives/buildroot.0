Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AC6C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 19:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968984029C;
	Wed, 17 Apr 2024 19:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mhz36KOzsKNY; Wed, 17 Apr 2024 19:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD0E40242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD0E40242;
	Wed, 17 Apr 2024 19:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4866B1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35B1580C15
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udyXfl8iEWEs for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 19:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.188.205;
 helo=sonic311-24.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14D4F80BD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D4F80BD2
Received: from sonic311-24.consmr.mail.ne1.yahoo.com
 (sonic311-24.consmr.mail.ne1.yahoo.com [66.163.188.205])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14D4F80BD2
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 19:29:00 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713382139; bh=CS9npAFodn1R33kImdBZhSNMEflwN+tmzsiRTJAcIRG=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=jIiC7ND8x5rp5JF3rdN4/L/En/MUpTil/EY1uxds4NRQCUxUUbXpMGchQOOD1xjxY2hdY9J1ak1qeGVxAJk/cDDwz2sgjDfGG8jgzfF65ZhbPCqEE9g4hq1u7+wI0RdUgXzC58qWMk33oQ0HGG6IQMnHFdsBMDnJso1ylodp3WImvXxYhrP8Ey2Kz80iZNeDAW/GzaAQiZ682reOyJyxUwubaX5/wQNVCD0oZke2zitXvgnDFrPwhkZ0r6vIE7dr2IbH4JAoxLDqjzLXra91WmWHzps94FKVL9bWFRlEuCziMX73nTnNytwf4Ut/fQcJ8/9ehvhY+0i2h1gj+B89nA==
X-YMail-OSG: xEBASn0VM1l42mKfn_vWysndyDsskwp6XcejNgKb8teOIyvqX8GrfgSNtofYxW2
 13P6nrHJREphnfPB7OPfpyW.IOc__gp_SB70lLqT5NDSKqmHfF1F85UIpuvGvuTHFMRS7IPYFAr7
 OCk2XHTACC3AHzfJdyqoIFA.GWT3WKhmok75vxP29.f5IvMM7tjF.e_M_4usFk6kmB0wJLmZAEx0
 PQixwIJHQDxQUuUxiN7HaoGKllsfR7JaZ49A.tCrzwk7jJIvLNgKxhrrZmusOalGXi0oo2enDh_z
 ZI3OwdMdS1Nv8LQnmmpxqxO7ubkB4TkoY3qCreGbQLmINqOUD2L0SUr36pOLXiaMCMX4acg8gjEa
 MPGeifSc_3w53NKFAUpYHiqWGwD9Q7gAb6Ack.NX7Ruw.cH8S7phOEppzK.lZ96OevxpDo7ecMAF
 zC.GWJeptIxGr3FVB4.Vv24deLkCP2zqkzYcPuYwfhJdLKpBp3AM_qOdhKvSoVQkoB8aW9hYI9.6
 OBR6eY60BnrUQlIGDQEy8IydO0zEpPhkibwVxSgC3xqfuyxABcLvgIBJ9Csb6dWg7y4r8hvdHAld
 PgknBR68JXK1Nvyp9nZjCLHciOK8jDmOneY9Tl.PoLE0UccnrD4pDfkuxg9_rNAjLMAqAfwpmjYT
 iqTMNFC.rfDLTFD3dqYlm8MrocHyyxQ_qUFsWTOmrJcpddAtI0AqFJQrYnomytoI.lPWKZhUWBMQ
 zPVo2rzFkL0FEwmqxMLhMrCJDe28DyIRLJdoZwAmrPaUX_krzKJwoxUe7Uk1dzuMROxI0h5mUNx8
 bIaG49TSpjAR8P3Mxu5j..9M96vCIuy1bvc.X330m_hciAM_WgE9EOGOQNzlwsZohbH5NXNjcBFi
 YMoMPNNXh4_xSSeHCLy9ClYyDY5aaNNwN0wEtpuThVReIDX6PYlSf3NkiLQ0OT0ReCqOkwNxv0d0
 mJECZB63tZHzkQCBaaKfPIu3Ftpxu.5PVzkoDgnP4nTlFP5bD4VqcijZQfLlnI3ZlqMnli_6jB7b
 NUZ0oPzqWImYRd4eK8uHRqYisbde5OS4QNCME26CR265y7KQm7hj2EvXOcK5LI1ZV2iiNEh0KZLt
 cny1EZAd3zGSq1plOa74GI4EaZRro2dlCYceXfVv5_KXjrAUnMLWCDZkVCE1U4n1MGIBHVp_0kXt
 UH4yhujSWt_kc_yteX1DKxVoB8y2DYtENUB5cEMlp9I0mtysUdn6DmJQcJT8Ox3bpD530aKVtdXz
 iRs6p8bFg96ILj_IRoWZT0DCkC45BKGSQ4ZZDkBeZmSbAFgL1Hfzq1vjQpJ1OTUE_LnHXok2Zdc8
 sY0e_dOR_tsk5yCtufj2imYgWPQe577tmtB7h.EHbxfeqdFbXBY2IyRBf2yDnT7PlKq1CgnKCJgG
 dugnoMzU4CoUgmLCRvKcXAXrBq26Mf3ydmbzWIvkXvw9xh.z51I1_GHdX5m16AQFEaFsjKzmyGPP
 oTGMRQ8wkiHxm56uOqHnCxIRESfHw1nyJbYKAVR4KzEddMEM4DxouFcwafEnEoewJBgDNiAIw3HB
 D3fK5XKT_8giVqKrxgQhbRzp35MXzEjVokc4BLQz.iAAXgoAxJ72tn4v2RlT5HaMsSfepcqx1lwC
 Bl6XMwvLOVBSqYE1qb4YpLus3O48GF0bv2BJA1zY9cKLhRk1iy0opdkQoL2RfLeuM044pDuh0Hj6
 vYwiMGzUWcQb7ZkSS4wbnwJQqnjGJEEE6McuqHU0B5_Ep.lp34Hs2qOYP3BqNNdtO1jts2jPERCt
 ZlSvuLRUiix8FjmYRnEOPbEwGV1lZ5HOKH1De1vE88ZQ7L.3HcNOe8_lfDapPrN8yEq0yBPuyFy0
 YYkFofLfYJBKY381bxVBKCeauv_oWZB1v.u4di44A24QqVmL_poLL5SpZ1HzD4LGL9DeUh1xeMvp
 ChJYd1_O8vBNNALo.0mbQWciurCpivn1hY74hK_pP0FIXeGMqe7_CjS_lX6pGIikCgESQfhlwRq_
 o2EdyPkYaE2vRkRLQs.GydCCkTTmWzs7N5xuCEUSNHkgQbrnKqpzOuly_GjYX4jJSjz9uvrZl98d
 3g25_AtGWTFgtzNzO7OtlROjPROXo1umshokqsRVmc9bfuhlzKBo7ynRf6xSpjLio_RTNfGMIkFj
 Bb76wVlC7BNmQXQv68Yb6bh29IKrD_CJk_Q4njR9EhxrWFR3Y3eA1vofSUlNsjzoIDyO0db.0.I0
 1IA5mLa6v8HGDBmdRKenWa02pr2vJEKtiHXbR.YbinFtUh0dFqRIsP5uh4oGmqQwdbgfUlz_Ub19
 _VOl8ZRxq.KpSMbH3qPQMYu3zo9_U
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 74c6e402-6592-42a6-b059-fe029596431a
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 19:28:59 +0000
Received: by hermes--production-bf1-5cc9fc94c8-qql8s (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ce4ca0e23e264d534ed1610c3b2f1d68; 
 Wed, 17 Apr 2024 19:28:53 +0000 (UTC)
Message-ID: <fc9d4069-9bbd-4f1b-8b40-939f16147f93@yahoo.com>
Date: Wed, 17 Apr 2024 14:28:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
 <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
 <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
 <71a73a03-5b7c-425c-959c-8eb516ca565e@yahoo.com>
 <CAOf5uw=yTRm+A0SvtgtOcHu=BgYK2MtLX=WOxbUz0OM11JUwcA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOf5uw=yTRm+A0SvtgtOcHu=BgYK2MtLX=WOxbUz0OM11JUwcA@mail.gmail.com>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713382139;
 bh=wzTVw5iJVKnZHydFpREQLAi2937+hZ9e0uIYCbS6Nxk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=eXjNLTYvxv15DisA8aaBVTBMhvtLHN5aRp3VOIx82heN+WkboohYmanF/B1lUBIFMgQg+WtQro174Uyn3LHB1NqCDWSBiafYRrNdS7vmAgL5eQDNyQMIe6PajYO7nbt9XTOQLhIlvN8dND8t1nP1B9O5zYJNRAwXN8Ur/+RyQV2G3IKYumaKQgWbdtP8K1aPbhlbF/sJLJWhMTywLwqNeX+dEytK+8mC1RLvyWU593NX/qpH9ko/PFOhl0JAYbgNrCmT4K52I+jXh8QSN7K9JrqGRjqYdwTiwRKJAo/UDwdRW5JdBpz3pVPXPAaXNMixqZyrfTQB/H0Umwjx/3M9/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=eXjNLTYv
Subject: Re: [Buildroot] Problem with device tree
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
From: DTrustee via buildroot <buildroot@buildroot.org>
Reply-To: DTrustee <dterry_engineer@yahoo.com>
Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TXkgYXBvbG9naWVzLCBJIHRyaWVkIHVzaW5nIG9tYXAycGx1c19kZWZjb25maWcgYXMgdGhlIHR1
dG9yaWFsIApzdWdnZXN0ZWQgYnV0IGdvdCBlcnJvcnMgc28gSSBjaGFuZ2VkIGFuZCB0aGUgb3V0
cHV0IEkgcHV0IGluIHBhc3RlYmluIAppcyB1c2luZyBiZWFnbGVib2FyZF9kZWZjb25maWcuIEkg
c3RpbGwgZ2V0IGVycm9ycyB0aG91Z2guCgpIYXZlIGEgQmxlc3NlZCBkYXkhCgpEb24KCk9uIDQv
MTcvMjQgMjowNiBQTSwgTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIHdyb3RlOgo+IEhpCj4K
PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA4OjU54oCvUE0gRFRydXN0ZWUgPGR0ZXJyeV9lbmdp
bmVlckB5YWhvby5jb20+IHdyb3RlOgo+PiBJIHdhcyBmb2xsb3dpbmcgdGhlIHN0ZXBzIGluCj4+
IGh0dHBzOi8vYm9vdGxpbi5jb20vZG9jL3RyYWluaW5nL2J1aWxkcm9vdC9idWlsZHJvb3QtbGFi
cy5wZGYgLCB0aGV5Cj4+IGNoYW5nZWQgdGhlIGRlZmF1bHQgY29uZmlnIHRvIHNob3cgaG93IGl0
IGlzIGRvbmUgcmF0aGVyIHRoYW4gdXNpbmcKPj4gYmVhZ2xlYm9uZV9kZWZjb25maWcuIFNvIEkg
Y2hhbmdlZCBUYXJnZXQgT3B0aW9ucywgVG9vbGNoYWluLCBLZXJuZWwgYW5kCj4+IEJvb3Rsb2Fk
ZXIgbWVudXMgYXMgdGhlIHR1dG9yaWFsIHN1Z2dlc3RlZCBpbiBzZWN0aW9uIENvbmZpZ3VyaW5n
Cj4+IEJ1aWxkcm9vdC4gRGlkIG5vdCBhZGQgYW55IGxvY2FsIC5tayAtIGRvIG5vdCBrbm93IHdo
YXQgdGhhdCBpcywgdGhpcyBpcwo+PiBteSBmaXJzdCBidWlsZCB3aXRoIGJ1aWxkcm9vdC4gTm9y
IGRpZCBJIG92ZXJyaWRlIGFueXRoaW5nLgo+Pgo+IFNvIEkgdGhpbmsgdGhhdCBmaXJzdCBvZiBh
bGwgeW91IHNob3VsZCBzdGFydCB0byBidWlsZCBhcyBpdCBpcy4gVGhlbgo+IHlvdSBoYXZlIGRl
ZmluaXRlbHkgYSBwcm9ibGVtCj4gb24geW91ciBjb25maWd1cmF0aW9uIGFuZCBpdCBicmVha3Mg
dWJvb3QgcHJvYmFibHkuIEkgdGhpbmsgdGhhdCB0aGUKPiBkb2N1bWVudGF0aW9uIGlzIHdlbGwg
ZG9uZSBidXQKPiBtYXliZSB5b3UgZ2V0IGEgd3Jvbmcgc3RlcCBvbiB0aGlzLiBUaG9tYXMgaXMg
dmVyeSBidXN5IGZvciB0aGUKPiBjb25mZXJlbmNlLCBJIGhhdmUgYWRkZWQgaGltIGluIENDCj4g
YnV0IEkgdGhpbmsgdGhhdCB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgbWFpbGluZyBsaXN0IGZvciBk
aXNjdXNzIGFib3V0Cj4gdGhlIHRyYWluaW5nLiBBbnl3YXkgSSdtIHdpbGxpbmcgdG8gaGVscCB5
b3UKPiBzbyB0cnkgdG8gYnVpbGQgdGhlIGRlZmNvbmZpZyBvZiBidWlsZHJvb3QgYW5kIHRyeSB0
byBhcHBseSB0aGUgc3RlcHMKPiBpbiB0aGUgdHJhaW5pbmcgYXMgdGhleSBhcmUgd2VsbCBkZXNj
cmliZWQKPgo+IE1pY2hhZWwKPgo+PiBIYXZlIGEgQmxlc3NlZCBkYXkhCj4+Cj4+IERvbgo+Pgo+
Pgo+PiBPbiA0LzE3LzI0IDE6NDAgUE0sIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90
ZToKPj4+IEhpdGhlCj4+Pgo+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgODozOeKAr1BNIE1p
Y2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo+Pj4gPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5j
b20+IHdyb3RlOgo+Pj4+IEhpCj4+Pj4KPj4+PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA4OjI2
4oCvUE0gRFRydXN0ZWUgPGR0ZXJyeV9lbmdpbmVlckB5YWhvby5jb20+IHdyb3RlOgo+Pj4+PiBJ
IGFtIGJ1aWxkaW5nIGZvciB0aGUgQmVhZ2xlYm9uZSBCbGFjayB3aGljaCBpcyBjb252ZW5pZW50
IGFzIHRoZQo+Pj4+PiBCb290bGluIHRyYWluaW5nIHVzZXMgdGhlIHdpcmVsZXNzIHZlcnNpb24g
b2YgdGhhdCBib2FyZC4gSSBob3BlIEkgYW0KPj4+Pj4gZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5
IGluY2x1ZGluZyBldmVyeW9uZSBvbiB0aGUgYWRkcmVzcyBsaXN0IG9mIHRoaXMKPj4+Pj4gdGhy
ZWFkLCBkb24ndCB3YW50IHRvIGZpbGwgdXAgcGVvcGxlJ3MgaW5ib3ggbmVlZGxlc3NseS4KPj4+
Pj4KPj4+PiBQbGVhc2UgcHJvdmlkZSB0aGUgc3RlcHMgaGVyZQo+Pj4gbWFrZSBiZWFnbGVib25l
X2RlZmNvbmZpZwo+Pj4KPj4+IG1ha2UKPj4+Cj4+PiBSaWdodD8KPj4+PiBNaWNoYWVsCj4+Pj4K
Pj4+Pj4gSGF2ZSBhIEJsZXNzZWQgZGF5IQo+Pj4+Pgo+Pj4+PiBEb24KPj4+Pj4KPj4+Pj4gT24g
NC8xNy8yNCAxMToyOSBBTSwgTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIHdyb3RlOgo+Pj4+
Pj4gSGkKPj4+Pj4+Cj4+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA2OjI14oCvUE0gRFRy
dXN0ZWUgdmlhIGJ1aWxkcm9vdAo+Pj4+Pj4gPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKPj4+Pj4+PiBJIGtub3cgeW91IGFyZSBhbGwgYnVzeSwgZG9uJ3QgbWVhbiB0byBidWcgYW55
b25lIGJ1dCBJIGNhbm5vdCBnZXQKPj4+Pj4+PiBidWlsZHJvb3QgdG8gbWFrZSB3aXRob3V0IGVy
cm9ycy4gSSBoYXZlIG5vIGlkZWEgd2h5ICJvcGVyYXRvciAnPCcgaGFzCj4+Pj4+Pj4gbm8gbGVm
dCBvcGVyYW5kIiBpcyBnZW5lcmF0ZWQgb3Igd2hpY2ggaW5jbHVkZSBmaWxlIGlzIHRoZSBjYXVz
ZS4gSQo+Pj4+Pj4+IHRydWx5IGFwcHJlY2lhdGUgeW91ciBoZWxwLiBJcyB0aGVyZSBkb2N1bWVu
dGF0aW9uIHRoYXQgd2Fsa3MgdGhyb3VnaAo+Pj4+Pj4+IHRoZSBidWlsZCBwcm9jZXNzPyBJIGhh
dmUgbG9va2VkIGF0IHRoZSBCb290bGluIHRyYWluaW5nIGJ1dCBpdCBpcwo+Pj4+Pj4+IHNldmVy
YWwgeWVhcnMgb2xkIG5vdyBhbmQgb3V0IG9mIGRhdGUuCj4+Pj4+PiBZb3UgYXJlIHRyeWluZyB0
byBidWlsZCBhIHVib290IGJvYXJkIHRoYXQgaGFzIG5vdCBpbmNsdWRlIG9mIHRoZQo+Pj4+Pj4g
S2NvbmZpZyBvZiBpdC4gIEkgdGhpbmsgdGhhdCB5b3UKPj4+Pj4+IGhhdmUganVzdCBhIGJyb2tl
biB1Ym9vdC4gV2hhdCBjb25maWd1cmF0aW9uIG9yIGJvYXJkIGFyZSB5b3UgYnVpbGRpbmc/Cj4+
Pj4+Pgo+Pj4+Pj4gTWljaGFlbAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gQnVpbGRsb2cgaXMKPj4+
Pj4+Pgo+Pj4+Pj4+IGh0dHBzOi8vcGFzdGViaW4uY29tL0VxdDZ6aTlhCj4+Pj4+Pj4KPj4+Pj4+
PiBjb25maWcgaXMKPj4+Pj4+Pgo+Pj4+Pj4+IGh0dHBzOi8vcGFzdGViaW4uY29tLzhQMmhCOXVZ
Cj4+Pj4+Pj4KPj4+Pj4+PiBidWlsZHJvb3QgMjAyNC4wMi4xCj4+Pj4+Pj4KPj4+Pj4+PiBIYXZl
IGEgQmxlc3NlZCBkYXkhCj4+Pj4+Pj4KPj4+Pj4+PiBEb24KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+
Pj4KPj4+Pj4+PiBPbiA0LzkvMjQgNDo1OSBQTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+Pj4+
Pj4+IEhpIERvbiwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMDkvMDQvMjQgMjM6MjMsIERvbiB2aWEg
YnVpbGRyb290IHdyb3RlOgo+Pj4+Pj4+Pj4gVGhpcyBpcyBteSBmaXJzdCB0aW1lIHVzaW5nIGJ1
aWxkcm9vdC4gRm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbnMgb2YKPj4+Pj4+Pj4+IGJvb3RsaW4u
Y29tL2RvYy90cmFpbmluZy9idWlsZHJvb3QvYnVpbGRyb290LWxhYnMucGRmLCBidWlsZGluZyBm
b3IKPj4+Pj4+Pj4+IEJlYWdsZWJvbmUgQmxhY2sgdGhvdWdoIG5vdCB0aGUgd2lyZWxlc3Mgb2Yg
dGhlIHRyYWluaW5nIHBkZi4gVW5kZXIKPj4+Pj4+Pj4+IEtlcm5lbCAtIHNlbGVjdGVkIGRldmlj
ZSB0cmVlIGJsb2IgYW5kIGluLXRyZWUgZGV2aWNlIHRyZWUgbmFtZSBJIHB1dAo+Pj4+Pj4+Pj4g
YW0zMzV4LWJvbmVibGFjay4gSG93ZXZlciBJIGdldAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IERldmlj
ZSBUcmVlIFNvdXJjZSAoYXJjaC9hcm0vZHRzL2FtMzM1eC0uZHRiKSBpcyBub3QgY29ycmVjdGx5
Cj4+Pj4+Pj4+PiBzcGVjaWZpZWQuCj4+Pj4+Pj4+PiBQbGVhc2UgZGVmaW5lICdDT05GSUdfREVG
QVVMVF9ERVZJQ0VfVFJFRScKPj4+Pj4+Pj4+IG9yIGJ1aWxkIHdpdGggJ0RFVklDRV9UUkVFPTxk
ZXZpY2VfdHJlZT4nIGFyZ3VtZW50Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2hhdCBkb2VzIGl0IHdh
bnQ/IFNvbWV0aGluZyBpcyBtaXNzaW5nIGJ1dCBJIGRvbid0IGtub3cgd2hhdC4KPj4+Pj4+Pj4g
U3RhcnRpbmcgZnJvbSAgTGludXggdmVyc2lvbiA2LjVbMF0geW91IGhhdmUgdG8gc3BlY2lmeSB0
aGUKPj4+Pj4+Pj4gbWFudWZhY3R1cmVyIGZvbGRlciB0b28gY29tcGFyZWQgdG8gcHJldmlvdXMg
dmVyc2lvbnMoaS5lLiA2LjRbMV0pLiBTbwo+Pj4+Pj4+PiBpZiB5b3UncmUgdXNpbmcgYSBrZXJu
ZWwgbmV3ZXIgdGhhbiA2LjUgeW91IGhhdmUgdG8gc3BlY2lmeSBzb21ldGhpbmcKPj4+Pj4+Pj4g
bGlrZToKPj4+Pj4+Pj4gYXJjaC9hcm0vZHRzL3RpL29tYXAvYW0zMzV4LS5kdGIKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gSG9wZSB0aGlzIGhlbHBzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBbMF06IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUtcmMxL3NvdXJjZS9hcmNoL2FybS9ib290L2R0
cwo+Pj4+Pj4+PiBbMV06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQuMTYv
c291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+
Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4+Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4+Pj4KPj4+PiAtLQo+Pj4+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo+
Pj4+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+Pj4+IE0uICszOSAzNDcg
OTEzIDIxNzAKPj4+PiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Cj4+Pj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYK
Pj4+PiBKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4+Pj4gVC4g
KzMxICgwKTg1IDExMSA5MTcyCj4+Pj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+Pj4+IHd3
dy5hbWFydWxhc29sdXRpb25zLmNvbQo+Pj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
