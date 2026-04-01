Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC6D3517D
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 12:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E7261187;
	Wed,  1 Apr 2026 12:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH9Ra9Te2w0j; Wed,  1 Apr 2026 12:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3CF60FDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775047450;
	bh=3pJbmGICRNpj6rdLnMgMH/uEB++JL+YQmvBdGGEuO2M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GCrjdrpk9wNNMt2MIMkUZRTEDPc/NA/o02yrhTEDyzAfz3+VJ+DjByuCq549G6uAe
	 WFiR6TSth6wjZfMUoyqXszD7FcEbl+ZC25+4D2Kp/pRRCvuhfXWrS907txmsoyQHbT
	 DXao37n31F/cN6Isc+Zuks+vnErjcCmlYQMBuHxeyKYvln0fodFZnJlmdjZM3VGCPm
	 R48oaJ9fGfPY9J5KWQ//S6iSDbOl/FDNmyLq7Ia9UAtTYUobZTQlVGd97Tuuj3XXpe
	 nS6l8Bwfhq3yGE+wvyTbmuc0HgGHKoenuvmDVy42czhZ/NuwDQfemCP4tfWpSZMOZZ
	 GwTh3cWsU+2xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3CF60FDF;
	Wed,  1 Apr 2026 12:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0DC2A2
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 12:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFBED60FDF
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 12:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHLeHvNaq4Zl for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 12:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F138D6068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F138D6068B
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F138D6068B
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 12:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 986EB5A0002;
 Wed, 01 Apr 2026 14:43:58 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z63XtxSKiyjF; Wed,  1 Apr 2026 14:43:56 +0200 (CEST)
Received: from [10.6.32.201] (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 48D765A0003;
 Wed, 01 Apr 2026 14:43:56 +0200 (CEST)
Message-ID: <b195db8b73619949850e3d99f2282c3b4f69165f.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Wed, 01 Apr 2026 14:43:56 +0200
In-Reply-To: <20260325145817.387805-1-thomas.perale@mind.be>
References: <20260325133343.1008245-4-martin@strongswan.org>
 <20260325145817.387805-1-thomas.perale@mind.be>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775047436;
 bh=aBJzwbYjhGXDgf6OGTmJz9+quhITNF3Df/hdlvD6p30=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LKE5a7Me5kkNA/02Pj+viyTPDl9Q0CTBB/E5sy6cJoQUYCw37jDlv/4I9Iin1O6LC
 2GghLh+bZm1K2HkZh8fjkw5BU70nh5LYBzg+u91+LAQDZuRDFCZP1xSzzh/wD3bKXy
 tOgx6zIJRNVVEeG/sJKp5eWu7Nhe6Xq3d/kUios/V3AAcqYq6Z4y7LeOwhkIo+q0n2
 JCYwLgEfm06AYfUgSPS9+iDrlUrBHAynJquqRghR13JfgrIKqlEH6K81vUHt2ebfxl
 eFsChPhXenAd/AvX5Hmr0RlF5y4lY8j1n9p33dmMJEGyy4GHacV+2/Ne0AFBi2bIw2
 51dOjM4rMPBtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=LKE5a7Me
Subject: Re: [Buildroot] [PATCH v3 3/5] utils/generate-cyclonedx: generate
 externalReferences with source-distribution
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCj4gPiBJZiBhIGh0dHAgb3IgaHR0
cHMgc291cmNlIGRvd25sb2FkIFVSSSBpcyBhdmFpbGFibGUgZnJvbSBzaG93LWluZm8sCj4gPiBl
eHRyYWN0IGl0IGFuZCBpbmNsdWRlIGl0IGFzIGFuIGV4dGVybmFsUmVmZXJlbmNlIG9mIHR5cGUK
PiA+ICJzb3VyY2UtZGlzdHJpYnV0aW9uIiBpbiB0aGUgQ3ljbG9uZURYIG91dHB1dC4KCj4gV2hh
dCBhYm91dCAnZ2l0JyByZXBvcyA/IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgVVJJIHN1Y2gg
YXM6Cj4gCj4gYGBgCj4gZ2l0K2h0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2FhcmR2YXJr
LWRucwo+IGBgYAo+IAo+IFdvbid0IGJlIHBhcnQgb2YgdGhlICdzb3VyY2UtZGlzdHJpYnV0aW9u
Jy4gV2hpY2ggbG9va3MgdG8gbWFrZSBzZW5zZQo+IGluIHJlZ2FyZCBvZiB0aGUgQ0RYIHNwZWMu
IENvdWxkIHdlIHVzZSBtYXliZSB0aGUgImRpc3RyaWJ1dGlvbiIKPiBwcm9wZXJ0eSBmb3IgdGhv
c2UgPyBEb2VzIGl0IG1ha2Ugc2Vuc2UgPwo+IAo+IGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy91c2Ut
Y2FzZXMvZXh0ZXJuYWwtcmVzb3VyY2UtbGlua3MvCgpJdCBtYWtlcyBzZW5zZSwgeWVzLCBidXQg
dGhlcmUgYXJlIHNvbWUgcXVlc3Rpb25zIHRoYXQgYXJpc2U6CgogKiBUaGVyZSBpcyBhbHNvIGEg
InZjcyIgdHlwZSwgd291bGQgdGhhdCBtYXRjaCBiZXR0ZXIgdGhhbgogICAiZGlzdHJpYnV0aW9u
Ij8KICogVGhlcmUgYXJlIChhIGZldykgb3RoZXIgVkNTIHR5cGVzIGluIHVzZSwgc28gd2UgcHJv
YmFibHkgc2hvdWxkIGRvCiAgIHRoaXMgZm9yIHN2bi9jdnMvaGcvYnpyIGFzIHdlbGw/CiAqIE1v
c3QgZ2l0IFNJVEVzIHVzZSBodHRwczovL8KgVVJMcy4gRnJvbSB0aGUgVVJMIGFsb25lLCBpdCBt
YXkgbm90IGJlCiAgIG9idmlvdXMgdGhhdCB0aGlzIGlzIGFuIFVSTCBmb3IgYSBnaXQgcmVwb3Np
dG9yeS4gU2hhbGwgd2UgYWRkIGEKICAgImNvbW1lbnQiPwogKiBBZGRpbmcgaGFzaGVzIGZyb20g
Lmhhc2ggZmlsZXMgcHJvYmFibHkgZG9lcyBub3QgbWFrZSBzZW5zZSwgYXMgaXQKICAgaXMgZm9y
IGEgbG9jYWxseSBjb21wdXRlZCB0YXJiYWxsLCBub3QgYSBnaXQgcmVmZXJlbmNlIG9yIHNvbWV0
aGluZy4KICAgV2UgcHJvYmFibHkgc2hvdWxkIGp1c3Qgbm90IGFkZCBoYXNoZXMgZm9yIHJlcG9z
aXRvcnkgcmVmZXJlbmNlcz8KCkJlc3QgUmVnYXJkcwpNYXJ0aW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
