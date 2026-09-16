Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D47BC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 16:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E6B607E6;
	Wed, 16 Sep 2026 16:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZPPzlURA94v; Wed, 16 Sep 2026 16:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 60944607BE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789577812;
	b=enH1Vxg7+cD+O6grugrR/MTrGTsWkRRxVrLwfDXVeuTDFew3ZG5lhXRBT/kQSnFJPynV
	 81wo93s7N9yMgYsSVwBNyl2spHMmr4PhSPLl2wSKn6hgICx8qbg1o4voDHr/iuxrZSOEb
	 4tc9bzmoHRqLTQLPlyHyeW8YLASmLJ8BtTRl1/HuElV1JML3dXqzXFjRvliDKPpwVX7U2
	 TFhDr9PE7yZ9W8/HIB+v+v7ycayGga8S803d1e+0+Qw05gFUIPA2o8plPUiBaOoWl+lqG
	 p9Ftahx7sAa9I9n7umGrBOUz/FDV8iFYNCT0NrXNffT2tShASg2XCp2TLjpTSgPLyNw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789577812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=t2+DmEHeXr+esYmj4+6lC5COM4MXIXMfA95qrGZUJe0=;
	b=VyNup/RyIItVB7XsbhMx98sF8EvwZDMIudQWIEafb7Td8eC3bFA6YeSWausfHoKu5YiI
	 8XOvlBj6daZ5G++0OuU0p8elAVFdfGrtQN/HIZDPLBxwxOZ+RL2tpUaCvzUxODt1q1JGK
	 6wZa/CN4eY4yqbTh4RyJdSXU4op+VdQ6WGNJ2MxRUJb+CoGrKjOa6pFTtXTR2eICSP6cz
	 l56K1a4ylVLYxQ85IZDpNB3S/gkW5IJW2u+Qui/6+MNqfeM0lrfMbQQCAtEeTlHP5/Xig
	 sMiLt3Ce3Y87x4Nc16H6zWOhStNYfmTKu1h7tsqfdbjKQQJrS9VwC7Glg6mwzY3P2jA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789577812;
	bh=t2+DmEHeXr+esYmj4+6lC5COM4MXIXMfA95qrGZUJe0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZGkP+w7C6GHT846AeazE+XmxrigTrFl7JIlOyVzZdKKtwEmFpt/FG59RxO7K1mNZ
	 gAgB4egrRk9gCnVvWmsVVb74IQdl8RkLVQlNEVYDGsjMcRW2tmMPtDWIdZxIwcdMZw
	 8bT61Le9GxGY41QIuDZUQ/S4s/P2z4JnFDXddEeV9NnSmRIUYJGxU+kNNCI/M/ny2w
	 JnYRnhtXodxkmiZSpSZbwT4jfN6hTbwsKloL5+d9qwh2nFaAO7SpDU820zzex9cuOw
	 2tpZut/v+Lb9n4kwlMb0QVM8KDYqM+OS8tOH8gZ24ki89uz5RYldXk/Ke1Sg9gAg2T
	 ZXJiLRTFq7uZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60944607BE;
	Wed, 16 Sep 2026 16:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0879624D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2A840308
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ-cb9U4iTVT for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 16:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D5841400D2
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:3a::23"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789577810;
 b=ez12+jKPVMPE7Kbsx0EvtFX5IT7V0t1tfhitkVbgAHKCivKeG+/dI9HI0S9dbo8SpNaT
 jHicKN99nw1QKbXm1tNzasDoIVyjt2bAUypPpNDA5a5Ee/VBslP9Pna2qfBAjga3gvyFk
 7tS0G34KAIPU+64aPqOsrlB4EqVwIkLi7cxg/AUzKRqKPUx9QsSV1RAifoRJjDc2P+OUf
 4QXSFFnLf8eARH9UblPJmzoo596E+TZGHGa35XzqaVf7baBHGNAhKIQc4VvVT2ZYS0v/z
 gRTDor1BThpt8+bI6LdJkLq1zOpPsRp2RqdaoIQCQhZOzTRvXx9friy0AEoc35IkfMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789577810;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=nuG/+ag/PZXRkAegvYY17Lbz8gK+rvnMc4xp4V56wgw=;
 b=ezIGFsBWaXv9vFnbBWaXALmmTefaCFZ3d8r3nsboxK1lOZpDCiil4tN9nBAk9wtKYCKa
 PFIzshqOAM/pfK3hGDh8OPBdJngmfqRHddcswqIFVAPy2jw01MTOCO0PkWaPL5CqCWRJx
 pNiQitSRCemgcoxdMlHnuRUW6vB0Yv/VwRVm2B8ewfRJ/OM79Endbq4pssYPMLydbGEtZ
 G4pL7GRczXBMQ0/90J0kL8ih/G29uNFjGyEK7BGnm9epRYG+szx69T3EdHG2TosV6WbYl
 2d3edCrL3+Kmcw1bU1jDXsMmFaTHNi5GBhJ8mq+PSSQurGs71GxZ6/yNlswxnAnMvLw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U8Cf6Pip; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:3a::23"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:3a::23; helo=mail-vs2-x23.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U8Cf6Pip
Received: from mail-vs2-x23.google.com (mail-vs2-x23.google.com
 [IPv6:2a00:1450:4864:3a::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5841400D2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:56:49 +0000 (UTC)
Received: by mail-vs2-x23.google.com with SMTP id
 71dfb90a1353d-5c67e512ee5so441373e0c.2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 09:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789577808; cv=none;
 d=google.com; s=arc-20260327;
 b=VtVR0tG2e/PEwPtIZwYk6MgK7k5SvGdozVXoG9w1bRVtBXZk4oP1FasYaDgLTpQBy4
 HRKp9zP6V3KyLLEXcnGCmjThzgh46KKRugHhlhTYW3KwuTyjx5EKqAwWpO1mlgsKTP9j
 oyg8H9+tjH45NIL0AC0XG705+TANWc31q0PHlG4hNTLp0/V79iED8j0p6FcR4VjKHq9O
 CCBR1omUsHv1iZnr4SJ34+wziD/IrbKuzmN2wIsnhyGNAt1Nqlhh/KHWkxkoJ4kRx2nM
 T/2SPfAzHqplMm5VJFhYzJHAKHs2dtOCItKTUKZrNP6L7L09TbAqvf/J/tnc73cn2QhG
 DprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nuG/+ag/PZXRkAegvYY17Lbz8gK+rvnMc4xp4V56wgw=;
 fh=cbzJwqa1/G06Noe/l78kroKjuU3+xaJA/PkbCFTgy/k=;
 b=hCLil6yck1caEoLaJB7SY/Qya/f02cRUqSZeALHno+P37BGgY5+Hh9SYPp19/dx2Hj
 bWAXD1gFKYlkthI9/oGIryhWqomUbXLpsIwrQXShaoMcvwlrcVXOybP1FCEz/fJmP70b
 i7Vqn9AfdosWHOOo4BTaIwDixXAkwhro/Ig31+Wz3dZZ/xNvuKPG1pHG0jpmU4QU2n5Q
 jRHsC1OcnfT3L4RmDdyifEDt++RfgXrmgsG0yDIV7h2bu1feQLDGWP0w9XjIw5SDcwxO
 T7xPEZ+ShGj03SQEFCMeUUEDbjpE+R0wb/aPl7RdS0+L8/OQBqM+fg81qVs85ortbY0W
 6uCg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789577808; x=1790182608; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nuG/+ag/PZXRkAegvYY17Lbz8gK+rvnMc4xp4V56wgw=;
 b=U8Cf6PipQxAqM1TOYUDWSF6Uyd1+PprV7pXnO3AAGsL4Czj/xbyOhuxX33QxHSnV61
 3Fgfq1G9CXjUCPY9QYJzBiZsZHFIBoNan37cXMP/mKP15X1gQM82BydfJXls1A3LYVOS
 Aj22gRbz/Q/O5tLRkPPuDebHa8Ij29qaPxxVnHHdsK6bq3VSCzSkhTcETbIuANe77Q79
 r+kiSDgIlg4v6KTl4u0o98AxAEgHtV0LrPulBXIMIbWt/cCAZh1+DkCymZvXl6r2VL7W
 awiyXCzvKdDZEJN+oKiohqm0k7Ttlzl/lrrJ0YHnciwvqyw2I36HQshpw1NUM1uouakJ
 RwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577808; x=1790182608;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nuG/+ag/PZXRkAegvYY17Lbz8gK+rvnMc4xp4V56wgw=;
 b=nEwA+LsldccQ2ykNdAH5k8Qb11H8pVwJvxj0DwyLGimlmOujRDU7BTCE40fxbPr9kI
 jdN0/18V8WEautiiPi183fCeA7evAp9vPlzDlt/VnPRWJKi8rOK+MGegFkuC1Fr+3XzT
 cgAMMs0tWeGRfZ735dh2M1o/T0NWsG4qPng86EUhXv2BpYWH3JKUGxTm/hizGT2WCdHS
 Qw5otR2Zp09lWh5e/Ex59W66V0f4zY/6NR6ryueRCXnPNo29fBW/sq3IKwjsu3VZN/cu
 VcSSq3arwbOEhkJJZPY2NMNHV0AnORYQ3JwdfxQ23kJGxEBCDlmafSj2sRTPbl1M7H7E
 hqmQ==
X-Gm-Message-State: AFuF++nEc4Vjh4e5aA3T1r5c5VMKpmdKqFHXtp+X9bul/ZBP7N8SKK8L
 zGL2wydnJTw8GvS5Yu7CVpEvmYcpqUcLnH7SqG1yTJKy8yKUaAlFn3ssPDk1LXNzp9yJO27y2Xa
 COkgs79u4UBGXWK+0vwey5PH/ZTvgBrf4hVvx
X-Gm-Gg: AYBFou385cMsoby4NZuthTg9OwPN31JGfx22RiYWhjmbhWQRTPegnazRtvf6xakOS3I
 D4ttBllV0GQM25daPFm20uIWiK7xnbD76ugMpcMzOfxicUdwuZlqaD/HqjVfQymCzNHUUGXOo+y
 pUmBSuKNqQZRUnkA+C1lRoqlhvGsB/+UFEAimhrd29rZ11yLnGnzR7pW68Mhmuog1CyutGWJgel
 54ytsl73SLjP6Dy1o5nSjNL2020F3b0jZj6QMiWcDoSEiWe3/X3nYmNUKjy+e87Obme9w69DvwQ
 QMJnhaoND4V99V06oFWp/cZA78YTa05GexHbNEmPzENwZXk9P/Ety9/4qp3uN0hNAjmRUdralg5
 xyEVX4yWK4NwEhz8ntWoy3BvC5yTCIxJuV1voaUM1E361NQQ5NpFJ/zs23vnBljjG57ja0BDc/a
 wOJMabXBM19q+4On7ggYQZVPgR9oiui+sjfOZMv8cNPccn
X-Received: by 2002:a05:6122:549:b0:5bd:af82:fd9e with SMTP id
 71dfb90a1353d-5c99ac7f87fmr4559312e0c.8.1789577808033; Wed, 16 Sep 2026
 09:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
 <20260618065137.3987932-2-james.hilliard1@gmail.com>
 <aqhkbaMkRynOxfoT@windsurf>
 <CADvTj4qjk_fMqf4M8Mq4C=w34GuL4e8uYBFsUSx2grCC2Dukdw@mail.gmail.com>
 <aqpraYAviEpbIuPJ@windsurf>
In-Reply-To: <aqpraYAviEpbIuPJ@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 10:56:35 -0600
X-Gm-Features: AcwNN1VktqYxn6uUjZtrYrxS0U_jquFuLiuZ-AilvtI2gnEtAO4L4BXPBJHhZe4
Message-ID: <CADvTj4rPA8urFEnyVqdHwB8ZcfiPoPUG3tcxCmCmGpZxaNTb6w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgNjo0NuKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBUdWUsIFNl
cCAxNSwgMjAyNiBhdCAxMToxNDoxNEFNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPgo+
ID4gPiBJIG11c3Qgc2F5IEkgYW0gbm90IGEgZmFuIG9mIHRoaXMgYXBwcm9hY2guIEl0IGlzIHZl
cnkgInRyaWNreSIgYW5kCj4gPiA+IG5vdCBvYnZpb3VzIHRvIHVuZGVyc3RhbmQgdGhhdCB0aGUg
X1NJVEUgaW5mb3JtYXRpb24gaXMgaW4gc29tZSBjYXNlcwo+ID4gPiBkZXJpdmVkIGZyb20gaW5m
b3JtYXRpb24gaW4gdGhlIC5oYXNoIGZpbGUuIEZvciBtZSB0aGlzIGJyZWFrcyB0aGUKPiA+ID4g
cHJpbmNpcGxlIG9mICJvYnZpb3VzbmVzcyIgdGhhdCBtYWtlcyBCdWlsZHJvb3QgZ2VuZXJhbGx5
IHF1aXRlIG5pY2UKPiA+ID4gdG8gd29yayB3aXRoLiBJIGRvbid0IHJlYWxseSBmaW5kIHRoZSBj
dXJyZW50IHNpdHVhdGlvbiBwcm9ibGVtYXRpYywKPiA+ID4gYW5kIHdoYXQgd2UgaGF2ZSBjdXJy
ZW50bHkgaXMgY29tcGxldGVseSBvYnZpb3VzIHRvIHVzZS91bmRlcnN0YW5kLgo+ID4KPiA+IFll
YWgsIGl0J3MgYSBiaXQgd2VpcmQgZGVyaXZpbmcgZnJvbSBhIG5vbi1tYWtlIGZpbGUsIGFsdGhv
dWdoIGF1dG8gZGVyaXZpbmcKPiA+IF9TSVRFIGluIGdlbmVyYWwgZG9lcyBoYXZlIHByZWNlZGVu
dCBhbmQgaWYgdGhlIGhhc2ggaXMgbWlzc2luZyB0aGVyZQo+ID4gc2hvdWxkIGF0IGxlYXN0IGJl
IGEgY2xlYXIgZXJyb3IgZXhwbGFpbmluZyB0aGUgcmVhc29uOgo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDI2LjA4L3BhY2thZ2UvcGtnLWx1YXJvY2tz
Lm1rI0w3OS1MODUKPgo+IFRoaXMgaXMgbm90IGF0IGFsbCB0aGUgc2FtZSB0aGluZzogdGhpcyBp
cyBhIGNhc2Ugd2hlcmUgd2UgaGF2ZSBhCj4gZGVmYXVsdC4gSWYgbm90aGluZyBpcyBzcGVjaWZp
ZWQsIGEgZGVmYXVsdCBpcyB1c2VkLCBidXQgdGhhdCBkZWZhdWx0Cj4gdmFsdWUgaXMgbm90IG1h
Z2ljYWxseSBpbmZlcnJlZCBmcm9tIHRoZSAuaGFzaCBmaWxlLgo+Cj4gPiA+IE9mIGNvdXJzZSwg
aWYgdGhlIG90aGVyIG1haW50YWluZXJzIGFyZSBoYXBweSB3aXRoIHlvdXIgYXBwcm9hY2gsIEkK
PiA+ID4gd2lsbCBub3Qgb3Bwb3NlLiBCdXQgc2luY2Ugc28gZmFyIG5vYm9keSBwcm92aWRlZCBm
ZWVkYmFjaywgSSB0aG91Z2h0Cj4gPiA+IEkgc2hvdWxkIHNoYXJlIG15IGh1bWJsZSBmZWVkYmFj
ay4KPiA+Cj4gPiBIZXJlJ3Mgc29tZSBiYWNrZ3JvdW5kIG9uIHdoZXJlIHRoZSBzdWdnZXN0aW9u
IGZvciB0aGlzIGNoYW5nZSBjYW1lIGZyb206Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
dWlsZHJvb3QvZmIxODYyNDgtN2RmNC00ZjczLTk0YTItYzliMmViZWZhODQzQGJ1YnUxLmV1Lwo+
Cj4gT0suIEkgc3RpbGwgZmluZCB0aGlzICJtZWgiLiBCdXQgYWdhaW4sIHRoaXMgaXMganVzdCBt
eSBvd24KPiBvcGluaW9uL3ZvaWNlLCBhbmQgSSB3aWxsIG5vdCBvcHBvc2UgdG8gdGhpcyBnZXR0
aW5nIG1lcmdlZC4gSXQncyBqdXN0Cj4gdGhhdCBpdCdzIGJlZW4gc2l0dGluZyBvbiBwYXRjaHdv
cmsgZm9yIGEgYml0IG9mIHRpbWUgd2l0aCBubwo+IGZlZWRiYWNrLCBzbyBJIHRob3VnaHQgdGhh
dCB0byBoZWxwIGdldCB0aGluZ3MgbW92ZSBmb3J3YXJkLCBJIHdvdWxkCj4gc2hhcmUgbXkgZmVl
ZGJhY2suCj4KPiA+ID4gQW5vdGhlciBjb25jZXJuOiBJIGFzc3VtZSB5b3UncmUgYWRkaW5nCj4g
PiA+ICQoQlIyX0NPUkVVVElMU19IT1NUX0RFUEVOREVOQ1kpIHRvIERPV05MT0FEX0RFUEVOREVO
Q0lFUyBzbyB0aGF0Cj4gPiA+ICdhd2snIGlzIGF2YWlsYWJsZT8KPiA+Cj4gPiBJc24ndCBhd2sg
YWxyZWFkeSBtYW5kYXRvcnk/Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWls
ZHJvb3QvYmxvYi8yMDI2LjA4L3N1cHBvcnQvZGVwZW5kZW5jaWVzL2RlcGVuZGVuY2llcy5zaCNM
MTU3Cj4KPiBJbmRlZWQuIEJ1dCB0aGVuIHdoeSBkb2VzIHlvdXIgcGF0Y2ggaGF2ZToKPgo+ICAg
JCgyKV9ET1dOTE9BRF9ERVBFTkRFTkNJRVMgKz0gJChCUjJfQ09SRVVUSUxTX0hPU1RfREVQRU5E
RU5DWSkKClRoYXQgZGVwZW5kZW5jeSBwcm92aWRlcyBiMnN1bSAtbCAyNTYsIHdoaWNoIHN1cHBv
cnQvZG93bmxvYWQvY2hlY2staGFzaAp1c2VzIHRvIHZlcmlmeSB0aGUgZG93bmxvYWRlZCBhcmNo
aXZlLiBJIGFkZGVkIGl0IGZvbGxvd2luZyBZYW5uJ3MKcmV2aWV3IGFib3V0IHN1cHBvcnRpbmcg
aG9zdHMgd2l0aCBvbGRlciBjb3JldXRpbHMuCgo+Cj4gPiA+IEJ1dCB0aGVuIGlmIHdlIHJ1biAi
bWFrZSBzaG93LWluZm8iIHdpdGhvdXQgZG9pbmcKPiA+ID4gYW55IGJ1aWxkLCBpdCBtZWFucyB3
ZSBubyBsb25nZXIgaGF2ZSB0aGUgX1NJVEUgaW5mb3JtYXRpb24/Cj4gPgo+ID4gVGhhdCBzaG91
bGQgc3RpbGwgd29yayBmaW5lLCB3ZSBzdGlsbCBzZXQgX1NJVEUgd2l0aCB0aGlzIGFwcHJvYWNo
LCBpdCBvbmx5Cj4gPiBjaGFuZ2VzIGhvdy93aGVyZSBpdCBnZXRzIHNldC4KPgo+IE5vdCBpZiAk
KEJSMl9DT1JFVVRJTFNfSE9TVF9ERVBFTkRFTkNZKSBtdXN0IGJlIGJ1aWx0IHRvIGNhbGN1bGF0
ZSB0aGUKPiBfU0lURSB2YWx1ZSAoc2VlIGFib3ZlIHF1ZXN0aW9uKS4KClJlc29sdmluZyBfU0lU
RSBvbmx5IHVzZXMgYXdrIHRvIHJlYWQgdGhlIGRpZ2VzdCBhbHJlYWR5IHJlY29yZGVkIGluCi5o
YXNoIGFuZCBmb3JtYXQgaXQgaW50byB0aGUgUHlQSSBVUkwuIEl0IGRvZXMgbm90IGNhbGN1bGF0
ZSBhIGhhc2ggb3IKaW52b2tlIGIyc3VtLCBzbyBpdCBkb2VzIG5vdCByZXF1aXJlIGhvc3QtY29y
ZXV0aWxzIHRvIGJlIGJ1aWx0LgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
