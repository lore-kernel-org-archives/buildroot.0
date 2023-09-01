Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C6DCA0FE1
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 06:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B810541FAD;
	Fri,  1 Sep 2023 06:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B810541FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4L0rfCRbiwH; Fri,  1 Sep 2023 06:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE87E41FAE;
	Fri,  1 Sep 2023 06:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE87E41FAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196341BF294
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 06:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2EFA4038B
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 06:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EFA4038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kF7nUpmh75Qz for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 06:47:27 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9CD54025D
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 06:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9CD54025D
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52bca2e8563so2041261a12.2
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 23:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693550845; x=1694155645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zt7WWIU4tiiPplDX8BfyDOBjazMjtPdFo7K0O8XMLbU=;
 b=DG5J5SSgTrcxwJYPyEkOQH8cxjuwvaVyEz/ivT5dzv1zNn3nf7Qg86KUtawmbWVZfj
 zHBmQ1rPHrWXe+v7aopXX3Ll9+URh+YeqGnP5TOT/PZE2HConYDHT0uM++KaIgzj6sYe
 f+PkE5fs95+RGGH3CpfS2I5ATQLQmh7pFvKwLlKQtFGE/xU7rzxoaVlOBbyLirlaLASY
 qJgLXOOgb6H3PNFpYRW0NEVMSnb2Hr6YMgYWWPGxzE2bVimDM9fffKTLi4iEyII1gY5Y
 JFivaw90ILLaTrlJ7GFmTU2Y2bLh2IKaETtwP3cOAbPTAXQIMWcq1pxWaG2MvjFtDoHV
 xDrQ==
X-Gm-Message-State: AOJu0Yz7ldomoXeE1QC9/6ymaAn6xlPDIGtTDK4SgyYu0Dw2If5UEQrh
 qaxsvzCnB5N2BPhwzJARtH9Q/w==
X-Google-Smtp-Source: AGHT+IEzOIeIT+hEjY0EIUtv3k9RbCn3UqwFqneIoeHGXwBXJQ/gk6CS5WYkISAOcpt+cbz/y1SMOw==
X-Received: by 2002:a05:6402:382:b0:525:7e46:940 with SMTP id
 o2-20020a056402038200b005257e460940mr1382375edv.24.1693550844727; 
 Thu, 31 Aug 2023 23:47:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa7c0c4000000b005232e637c24sm1664484edp.84.2023.08.31.23.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 23:47:24 -0700 (PDT)
Message-ID: <ecf9ebe5-28cd-43bd-70ca-bce5cc748864@mind.be>
Date: Fri, 1 Sep 2023 08:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-3-dalang@gmx.at>
 <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
 <00d15b88-0d94-491e-800c-c36f4a3ddbe7@gmx.at>
In-Reply-To: <00d15b88-0d94-491e-800c-c36f4a3ddbe7@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693550845; x=1694155645; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zt7WWIU4tiiPplDX8BfyDOBjazMjtPdFo7K0O8XMLbU=;
 b=STHHlXu09dJBVD/fQjN1qTKjD0Tvv+jxrnrw2xh7tCinTSc5IpFIeT2qjtuGzsG5Ic
 P7NnNXhe9NrakchWa/Y5j6UrsTUiX4FQqUmr3apkbv4oQgTwZAvRYLPXICTI4SlakLcg
 ZyUuDsA2wgkn7eGFgbFUR6z47VeR1O9GJqFv0Meh05bWnmDuUStHgNi2MOrF+echQIlh
 smshT9g608UbZpRqAgUwB+Gek3IlfPwX3vilEwfslJxwS6qF3hU07woMurjmOJ+MSk9L
 OMBJPpbqQ691sP2mxp8pvCGaYIexjottZTUNvvfupb07Y3cQFWEkWJC049FeeXqQ0Jlk
 mCNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=STHHlXu0
Subject: Re: [Buildroot] [PATCH v3 3/8] support/scripts/pkg-stats: check all
 files for warnings
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMS8wOC8yMDIzIDIxOjUyLCBEYW5pZWwgTGFuZyB3cm90ZToKPiBIZWxsbyBBcm5vdXQs
Cj4gCj4gT24gMzAuMDguMjMgMjI6MzYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMi8wOC8yMDIzIDIxOjI4LCBEYW5pZWwgTGFuZyB3cm90ZToKPj4+IEluc3RlYWQg
b2Ygb25seSBjaGVja2luZyAubWsgYW5kIENvbmZpZy5pbnssLmhvc3R9LCBjaGVjawo+Pj4gYWxs
IGZpbGVzIGluIGEgcGFja2FnZSBkaXJlY3RvcnkuCj4+Cj4+ICDCoCgiY2hlY2tpbmciIGhlcmUg
bWVhbnMgInJ1biBjaGVjay1wYWNrYWdlIikuCj4gCj4gQ29ycmVjdC4KPiAKPj4KPj4gIMKgSSB0
aGluayB3ZSBzaG91bGQgaW5zdGVhZCByZW1vdmUgdGhlIC53YXJuaW5ncyBhbmQgLnN0YXR1c1sn
cGtnLWNoZWNrJ10gZmllbGRzIGVudGlyZWx5LiBJdCBtYWRlIHNlbnNlIGJhY2sgaW4gdGhlIGRh
eXMsIGJlY2F1c2Ugd2Ugd2VyZW4ndCBydW5uaW5nIGNoZWNrLXBhY2thZ2UgaW4gQ0kuIE5vdywg
aG93ZXZlciwgd2UgZG8sIHNvIHRoZXJlJ3MgbGl0dGxlIHBvaW50IHRvIHJ1biBjaGVjay1wYWNr
YWdlIGFzIHBhcnQgb2YgcGtnLXN0YXRzIGFzIHdlbGwuIE9uIGEuYi5vIHRoZSB3YXJuaW5ncyBj
b2x1bW4gd2lsbCAoYWxtb3N0KSBhbHdheXMgYmUgYWxsIDAuCj4gCj4gSXQgd2lsbCBhbHdheXMg
YmUgMCBpZiAuY2hlY2twYWNrYWdlaWdub3JlIGlzIGNvbnNpZGVyZWQgd2hpY2ggaXNuJ3QgdGhl
IGNhc2UKPiBoZXJlLiBUaGVyZWZvcmUgdGhlIHdhcm5pbmcgY29sdW1uIHdvdWxkIHNob3cgdGhl
IG51bWJlciBvZiB3YXJuaW5ncyBpbmNsdWRpbmcKPiB0aG9zZSBpZ25vcmVkLgoKICBPaCwgdmVy
eSBnb29kIHBvaW50LCBJIGRpZG4ndCB0aGluayBvZiB0aGF0Li4uCgogIE9uIHRoZSBzaG9ydCB0
ZXJtOiB0aGUgcmVhc29uIHdlIGludHJvZHVjZWQgLmNoZWNrcGFja2FnZWlnbm9yZSB0byBiZWdp
biB3aXRoIAppcyB0aGF0IHRoZXJlIGFyZSB0b28gbWFueSBlcnJvcnMsIHNvIG1hbnkgdGhhdCB3
ZSdyZSBuZXZlciBnb2luZyB0byBmaXggdGhlbSAKYWxsLiBJbiBwYXJ0aWN1bGFyIG9sZCBwYXRj
aGVzIGZvciBzZW1pLWRlYWQgcHJvamVjdHMuIEJ1dCBhbHNvIHRoZSAxNTQgCnNoZWxsY2hlY2sg
ZXJyb3JzIGFyZSBwcm9iYWJseSBuZXZlciBnb2luZyB0byBiZSBmaXhlZC4KCiAgVGhhdCBzYWlk
LCBJIGRvIHNlZSB0aGUgdmFsdWUgaW4gc2VlaW5nIHRoZSBudW1iZXIgb2Ygd2FybmluZ3MgZm9y
IGEgcGFja2FnZS4gClJpZ2h0IG5vdywgaWYgeW91J3JlIGxvb2tpbmcgYXQgdGhlIHBrZy1zdGF0
cyBvdXRwdXQgYW5kIGRlY2lkZSB0byBlLmcuIAp2ZXJzaW9uLWJ1bXAgYSBwYWNrYWdlLCB5b3Un
bGwgcHJvYmFibHkgbm90IGNvbnNpZGVyIHRvIGFsc28gZml4IHRoZSBzaGVsbGNoZWNrIAp3YXJu
aW5ncyBpbiB0aGUgaW5pdCBzY3JpcHQuIEhvd2V2ZXIsIGlmIHlvdSBhbHNvIHNlZSB0aGF0IHRo
ZXJlJ3Mgb25lIHdhcm5pbmcsIAp0aGF0IG1heSB0cmlnZ2VyIHlvdSB0byB1cGRhdGUgdGhlIGlu
aXQgc2NyaXB0IHNvIHlvdSdyZSBwYWNrYWdlIGJlY29tZXMgZnVsbHkgCmdyZWVuLgoKICBJbiBv
dGhlciB3b3JkcywgSSdtIHJldHJhY3RpbmcgbXkgZWFybGllciBzdWdnZXN0aW9uIG9mIHJlbW92
aW5nIHRoZSBXYXJuaW5ncyAKZW50aXJlbHkuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IFRoZSBx
dWVzdGlvbiBvZiB3aGV0aGVyIG9yIG5vdCB0aGlzIGluZm9ybWF0aW9uIGlzIG5lZWRlZCBpcyBz
dGlsbCByZWxldmFudC4KPiBJIGp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGF0IGluIG15IHRl
c3RpbmcgdGhlIHZhbHVlIHdhc24ndCAwIGZvciBhbGwgcGFja2FnZXMuCj4gCj4+Cj4+ICDCoFRo
ZXJlIGlzIHRoZSBwb2ludCBvZiBwZW9wbGUgdXNpbmcgcGtnLXN0YXRzIGZvciB0aGVpciBicjIt
ZXh0ZXJuYWwsIGJ1dDoKPj4KPj4gMS4gcGtnLXN0YXRzIGlzIHByZXR0eSBmcmFnaWxlIHNvIHVz
ZXJzIHNob3VsZG4ndCBiZSB0b28gc3VycHJpc2VkIGIgc29tZSBicmVha2FnZTsKPj4gMi4gaXQn
cyB2ZXJ5IGVhc3kgZm9yIHRob3NlIHVzZXJzIHRvIHJ1biAnbWFrZSBjaGVjay1wYWNrYWdlJyBp
bnN0ZWFkLgo+Pgo+Pgo+PiAgwqBEbyBvdGhlciBtYWludGFpbmVycyBoYXZlIHRoZSBzYW1lIG9w
aW5pb24/Cj4gCj4gU2VlaW5nIGFzIFRob21hcyBhbHJlYWR5IGFncmVlZCwgSSB3aWxsIHByZXBh
cmUgdGhlIHJlbW92YWwsIHVubGVzcyBvdGhlciBvcGluaW9ucwo+IGFyZSByYWlzZWQuCj4gCj4+
Cj4+Cj4+ICDCoFJlZ2FyZHMsCj4+ICDCoEFybm91dAo+IAo+IFJlZ2FyZHMsCj4gRGFuaWVsCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
