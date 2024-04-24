Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD11C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 07:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE9BA40462;
	Wed, 24 Apr 2024 07:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3X6cRdsQ0ty0; Wed, 24 Apr 2024 07:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB3B8402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB3B8402BC;
	Wed, 24 Apr 2024 07:51:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 391BA1BF334
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 07:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 245E281E03
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 07:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFqfpm1pmcE9 for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 07:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 840C381A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 840C381A92
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 840C381A92
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 07:50:59 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so7592091a12.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 00:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713945057; x=1714549857;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTzC0Wx2LvyMkqgLt1lEkjIau69KnN+i6jGMDoGIQX4=;
 b=Z6QVngWMh/a4bHBaxdLPW6cRm49jxn/g/h+vAe23cQCCsMJ1dI47WiE4hZYlSB/S+v
 q0Xs1B3gNuod3JDd1+fIvcPacLsIJSufrP1bPlxBRtiN9sohc7fnY5kcXkpn9MICZ6bU
 Lfzp+YsvBbe7VW/7dGtXmYu+VKpWCkUdhLYdoNvOvQSLXstdBZf1NcTDteTwzgWGm1WZ
 mQyAoeajvaj0/+1wsMob/BEcmmz71wTbm0DPkviRUrwGb1J+xdK3GpgRraZsy8SYqmXV
 H2iuaooilryL4Sjwxh11W5TdO81Euk6h+m3n/8ikpC7iKTvVY/WX9dpaxwmWgOjirdEO
 x/vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FnJQGEDwcW4iKGqthWnw2W0p6hTOE8FYPiTrnKbxbm6rvwNnxQBJraYxw5+NJrM26nitS+NRkHxe+bEez/5XIARGbZFKtQ==
X-Gm-Message-State: AOJu0Yy1b2fHv9MQFEgw6LgTAC2QqX3RHojVvWUKBAtHaqXoNUpTCfTZ
 D/9dq4nkb0TF+NgG4bPoPxfhVt+e6RgR0zPUx94SRtmyC65+gEwIIcweQs/eu4HoZ05x4vhq97C
 ZVylvqCOPNRSF79YJUudfDyN8ij71FdbC6zv3+5ZpSKJn/8J0
X-Google-Smtp-Source: AGHT+IF7Op6wMc5b+/nbzi8KS9c9WF0ydZMYiHU9RBnsVHWhoNAodrZt3BofwQhJJj128hGFX7ifmA==
X-Received: by 2002:a17:906:617:b0:a58:8392:15e9 with SMTP id
 s23-20020a170906061700b00a58839215e9mr968925ejb.70.1713945057133; 
 Wed, 24 Apr 2024 00:50:57 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:e0f:cb9c:950e:c8ec])
 by smtp.gmail.com with ESMTPSA id
 bl18-20020a170906c25200b00a52295e014bsm8031632ejb.92.2024.04.24.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 00:50:56 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:50:55 +0200
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20240424075055.GA1370614@theia>
Mail-Followup-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240423113313.GB527510@theia>
 <57d8570c-8825-41a3-8763-64d9589af492@theobroma-systems.com>
MIME-Version: 1.0
In-Reply-To: <57d8570c-8825-41a3-8763-64d9589af492@theobroma-systems.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1713945057; x=1714549857; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rTzC0Wx2LvyMkqgLt1lEkjIau69KnN+i6jGMDoGIQX4=;
 b=pa6b2ixRAz40gsWJFwrJCvRkxIaZIM9NnHru6XZBCf6M9vNxEAfmo9MqhxW5n5tZ8v
 Y3vahCeHLXurobQORr5QVRPa6WjrxmLRLssC0WqgTHeFsQT9woRiXhuZrTl88UNU/XrH
 7iQ+CQ9lyCHCA6HD44W9xNVGaMexgJoLDsWLDErAV9tOsA+yOVda2HVtqjcrH3nNDT4q
 OTUPBVwygCmL5WYE0nTnvf+LS2E1nJ+41Zil72z3ZNMVaRvMgVYV4BLCmA/cgPM88JMh
 Wy2zXQC2EUjzxe77Fbu254Z41hc7H8LWQfJ5pqgxSfJxIzcTdeLoRHXQZIUL1hsXDDDU
 +QHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=pa6b2ixR
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUXVlbnRpbiwKCk9uIFR1ZSwgQXByIDIzLCAyMDI0IGF0IDAyOjU1OjU3UE0gKzAyMDAsIFF1
ZW50aW4gU2NodWx6IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gSGkgR2VybywKPiAKPiBPbiA0LzIz
LzI0IDEzOjMzLCBHZXJvIFNjaHfDpHJpY2tlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBIaSBE
YXJpbywKPiA+IAo+ID4gSSB0cmllZCB5b3VyIHBhdGNoLCBidXQgaXQgZGlkbid0IHdvcmsgZm9y
IG1lLiBibWFwdG9vbCBmYWlsZWQgd2l0aCBhbgo+ID4gZXJyb3IuIFRoZSBpc3N1ZSB3YXMgdGhh
dCBteSBob21lIGRpcmVjdG9yeSBpcyBlbmNyeXB0ZWQgdXNpbmcgZWNyeXB0ZnMuCj4gPiBUaGlz
IGRvZXMgbm90IGltcGxlbWVudCBhbGwgaW9jdGwgb3B0aW9ucyB0aGF0IGFyZSBuZWVkZWQgZm9y
IGJtYXB0b29sCj4gPiB0byByZWFkIHRoZSBibG9jayBhbGxvY2F0aW9uIG9mIHRoZSBpbWFnZSBm
aWxlLiBUaGVyZSBhbHNvIHNlZW0gdG8gYmUKPiA+IGlzc3VlcyB3aXRoIFpGUywgc28gSSB3b3Vs
ZCByZWNvbW1lbmQgdG8gbm90IGVuYWJsZSB0aGlzIGJ5IGRlZmF1bHQgZm9yCj4gPiBkZWZjb25m
aWdzLgo+ID4gCj4gCj4gSXMgdGhpcyBzb21ldGhpbmcgeW91IGNvdWxkIHJlcG9ydCB0byB0aGUg
dXBzdHJlYW0gcHJvamVjdD8KPiAKPiBodHRwczovL2dpdGh1Yi5jb20veW9jdG9wcm9qZWN0L2Jt
YXB0b29sLwoKSSByZXBvcnRlZCBteSBmaW5kaW5nIHVwc3RyZWFtIGluCgpodHRwczovL2dpdGh1
Yi5jb20veW9jdG9wcm9qZWN0L2JtYXB0b29sL2lzc3Vlcy8yMgoKdGhvdWdoIEkgZG9uJ3QgZXhw
ZWN0IGEgZml4LiBJaXVjIHRoZSBpc3N1ZSBpcyB0aGF0IGVjcnlwdGZzIGRvZXMgbm90CnN1cHBv
cnQgdGhlIGlvY3RsIEZJRU1BUCwgd2hpY2ggYm1hcHRvb2wgbmVlZHMgdG8gZmluZCB0aGUgaG9s
ZXMgaW4KYSBmaWxlLiBTbyBpdCB3b3VsZCByZXF1aXJlIGltcGxlbWVudGluZyB0aGlzIGZvciB0
aGUgZWNyeXB0ZnMga2VybmVsCm1vZHVsZSAoaWYgZXZlbiBwb3NzaWJsZSkgYW5kIHRoZW4gaXQn
bGwgdGFrZSBhIHdoaWxlIGZvciB0aGF0IHRvIGhpdAp0aGUgbWF5b3IgTGludXggZGlzdHJpYnV0
aW9ucy4gQnV0IG1heWJlIGEgbmV3IGNvbW1hbmQgdG8gYm1hcHRvb2wKY291bGQgaGVscCBpbiB0
aGUgbWlkdGVybSwgbGlrZSBgYm1hcHRvb2wgdmVyaWZ5IC0tY2hlY2stZnNgLCBzbyB0aGlzCmNh
c2UgY291bGQgYmUgZGV0ZWN0ZWQgYW5kIGhhbmRsZWQgZ3JhY2VmdWxseSBpbiBzY3JpcHRzLgoK
PiAKPiBUaGUgWkZTIGlzc3VlIHNlZW1zIHRvIGJlIGRvY3VtZW50ZWQsIGMuZi4KPiBodHRwczov
L2dpdGh1Yi5jb20veW9jdG9wcm9qZWN0L2JtYXB0b29sLz90YWI9cmVhZG1lLW92LWZpbGUja25v
d24taXNzdWVzCgpZZXMsIGFuZCBpdCdzIGZpeGFibGUgZm9yIFpGUy4gQnV0IEkgZXhwZWN0IG1h
aWx0cmFmZmljIG1pZ2h0IGluY3JlYXNlCmlmIGJtYXB0b29sIHdvdWxkIGJlIHVzZWQgYnkgZGVm
YXVsdCBpbiBidWlsZHJvb3QuIFRoYXQncyB3aHkgSSB3b3VsZApyZWNvbW1lbmQgbm90IHRvIGFw
cGx5IHRoaXMgdG8gYnVpbGRyb290IHByb3ZpZGVkIGRlZmNvbmZpZ3MKKFBBVENIIDIvMikuIEJ1
dCBJJ20gbXVjaCBpbiBmYXZvciBvZiBzdXBwb3J0aW5nIGJtYXB0b29sIGluIGdlbmVyYWwKKFBB
VENIIDEvMikuCgpCZXN0LApHZXJvCgo+IAo+IENoZWVycywKPiBRdWVudGluCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAoKCgrigJPigJPigJMKCgpncmFu
ZGNlbnRyaXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFuecKgwrfCoEhvbHptYXJrdCAxwqDCt8Kg
NTA2NzYgCipDb2xvZ25lKsKgfMKgUGhvZW5peHNlZXN0cmFzc2UgMTjCoMK3wqA0NDI2MyAqRG9y
dG11bmQqwqDCt8KgR2VybWFueQp8wqBpbiAKPGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21w
YW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIyMS02NzctODYwLTAgCnzCoGVtYWlsOiBo
ZWxsb0BncmFuZGNlbnRyaXgubmV0IDxtYWlsdG86aGVsbG9AZ3JhbmRjZW50cml4Lm5ldD4KCgpn
cmFuZGNlbnRyaXggY2FyZXMgYWJvdXTCoHByaXZhY3kgCjxodHRwczovL2dyYW5kY2VudHJpeC5u
ZXQvZGUvcGFnZXMvcHJpdmFjeW1haWwvPgoKQW10c2dlcmljaHQgS8O2bG4gfCBIUkIgwqAKNzAx
MTkgfCBHZXNjaMOkZnRzZsO8aHJlcjogTS4gS3LDtm1lcizCoCBSLiBIw6RuZWwgfCBVU3QuLUlk
TnIuOiBERTI2NjMzMzk2OQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
